---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Đa tạp Riemann, Adam trên đa tạp, và Geoopt"
chapter: "07"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

Mỗi khi bạn huấn luyện một mạng nơ-ron bằng thuật toán SGD hay **Adam**, bước cập nhật quen thuộc $$w_{t+1} = w_t - \alpha \nabla L(w_t)$$ ngầm giả định rằng tham số $$w$$ sống trong một không gian Euclid phẳng $$\mathbb{R}^n$$ — nơi phép trừ hai điểm luôn nằm lại trong không gian. Nhưng chuyện gì xảy ra khi tham số của bạn buộc phải là một **ma trận trực giao** (đa tạp Stiefel), một **ma trận hiệp phương sai đối xứng xác định dương (SPD)**, hay một **điểm trong đĩa hyperbolic Poincaré** để biểu diễn cây phân cấp? Nếu cứ trừ thẳng tay theo công thức Euclid, điểm cập nhật lập tức **văng ra khỏi đa tạp**!

Đó là sân chơi sôi động của **tối ưu hóa trên đa tạp Riemann** giai đoạn 2022–2026 — tiêu biểu là cuốn giáo trình chuẩn mực năm 2023 của **Nicolas Boumal** (*An Introduction to Optimization on Smooth Manifolds*), thư viện **Geoopt** trong PyTorch với thuật toán **`RiemannianAdam`** (Bécigneul & Ganea, ICLR 2019; Kochurov et al., 2020), cùng hướng nghiên cứu song song dùng **độ cong Ollivier–Ricci** trên đồ thị (Nguyen et al., ICML 2023) để chẩn đoán tận gốc hai căn bệnh kinh điển của GNN: *over-smoothing* và *over-squashing*!

**Mạch bài học:** Bản đồ kiến thức nền (gradient Riemann, phép co rút retraction, vận chuyển mô-men & độ cong Ricci trên đồ thị) → Trực giác tối ưu trên mặt cong → Định nghĩa hình thức → Ví dụ tính tay cầm tay chỉ việc: thực hiện 1 bước hạ gradient Riemann trên mặt cầu $$S^2$$ bằng retraction chuẩn hóa so với ánh xạ mũ chính xác → Khung giải thích chậm: 3 bước vận hành `RiemannianAdam` và cơ chế độ cong Ollivier–Ricci trong GNN → Ứng dụng, Video & Bài tập.

---

## Bản đồ kiến thức nền: Tối ưu hóa Riemann và Độ cong Đồ thị nghiên cứu gì?

### 1. Gradient Riemann $$\operatorname{grad} f$$ — không phải mọi đạo hàm riêng đều là hướng dốc nhất!
Trên đa tạp Riemann $$(M, g)$$, vi phân $$df$$ là một **covector** (1-form). Muốn biến nó thành một **vector tiếp tuyến** chỉ hướng tăng nhanh nhất theo thước đo $$g$$, ta phải nâng chỉ số bằng metric nghịch đảo: $$(\operatorname{grad} f)^i = g^{ij}\partial_j f$$. Trên một mặt cong nhúng trong $$\mathbb{R}^N$$, $$\operatorname{grad} f$$ chính là hình chiếu trực giao của gradient Euclid lên không gian tiếp tuyến $$T_x M$$!

### 2. Phép co rút (Retraction) — "đường trắc địa tốc hành" cho GPU
Ánh xạ mũ $$\exp_x(v)$$ đi chính xác dọc đường trắc địa, nhưng giải phương trình vi phân đường trắc địa ở mỗi bước huấn luyện quá tốn kém. **Retraction** $$R_x : T_x M \to M$$ là một ánh xạ rẻ hơn nhiều (như phép chia cho chuẩn trên mặt cầu, hay phân tích QR trên đa tạp Stiefel) nhưng khớp với $$\exp_x$$ đến bậc một tại $$0$$ — giữ điểm cập nhật nằm chặt trên $$M$$ mà vẫn bảo toàn tốc độ hội tụ!

### 3. Độ cong Ollivier–Ricci — đưa Tensor Ricci xuống đồ thị rời rạc
Trên đa tạp trơn, độ cong Ricci dương làm hai chùm đường trắc địa hội tụ; độ cong âm làm chúng phân kỳ. Trên đồ thị rời rạc, **độ cong Ollivier–Ricci** của cạnh $$(u, v)$$ so sánh khoảng cách vận chuyển tối ưu (Wasserstein-1) giữa hai phân bố láng giềng của $$u$$ và $$v$$ với khoảng cách đồ thị $$d(u, v) = 1$$ — giúp chỉ mặt điểm tên cạnh nào gây **over-smoothing** (cong dương) và cạnh nào là nút thắt cổ chai **over-squashing** (cong âm)!

---

## Tổng quan

Đa tạp Riemann $$(M,g)$$ là nơi hội tụ các khái niệm cốt lõi của khóa học: độ dài, đường trắc địa, liên kết Levi-Civita, tensor độ cong Riemann, tensor Ricci và độ cong vô hướng. Định lý Hopf–Rinow kết nối tính đầy đủ metric với tính đầy đủ trắc địa. Bài tùy chọn này không chứng minh lại các định lý đó, mà giới thiệu hai hướng ứng dụng nổi bật: tối ưu hóa trên $$(M,g)$$ — câu hỏi "thuật toán Adam hoạt động thế nào khi tham số không nằm trong $$\mathbb{R}^n$$" — và độ cong Ricci rời rạc trên đồ thị (đã nhắc ở Chương 4, nay đặt trong ngôn ngữ tensor Ricci của chương này).

Năm 2023, Nicolas Boumal xuất bản *An Introduction to Optimization on Smooth Manifolds* (Cambridge University Press), một giáo trình hiện đại đặt phép co rút (retraction), gradient Riemann, phương pháp Newton và vùng tin cậy (trust-region) làm trọng tâm. Thư viện *Geoopt* (Kochurov, Karimov, Kozlukov, 2020) tiếp tục được nhiều công trình giai đoạn 2022–2026 sử dụng trong PyTorch cho thuật toán `RiemannianAdam`, vốn bắt nguồn từ bài báo của Bécigneul & Ganea (ICLR 2019). Hướng nghiên cứu này cùng sách của Boumal định hình cách huấn luyện mạng nơ-ron hyperbolic, mạng trên đa tạp Stiefel $$St(p,n)$$ và trên không gian ma trận đối xứng xác định dương (SPD). Song song đó, Nguyen và cộng sự (ICML 2023) cho thấy độ cong Ricci trên đồ thị giải thích trực tiếp hai hiện tượng kinh điển của mạng nơ-ron đồ thị (GNN).

## Giải thích trực quan

Gradient Euclid thông thường chỉ là danh sách các đạo hàm riêng. Trên mặt cầu, nếu cộng thẳng bước gradient đó vào vector tham số mà không chiếu trở lại bề mặt, điểm cập nhật sẽ rời khỏi đa tạp $$M$$. Tối ưu hóa Riemann thực hiện ba bước tương ứng với những gì vừa học: (1) xem vi phân hàm mất mát là một covector, (2) nâng chỉ số bằng $$g^{-1}$$ để thu được vector tiếp tuyến (gradient Riemann), và (3) di chuyển theo một *retraction* — xấp xỉ tính toán gọn nhẹ hơn của ánh xạ mũ so với việc tích phân đường trắc địa chính xác. Thuật toán Adam trên đa tạp lưu các mô-men bậc một và bậc hai ngay trong các không gian tiếp tuyến, rồi vận chuyển chúng khi điểm tham số di chuyển — sử dụng trở lại khái niệm liên kết.

Có thể hình dung metric $$g$$ như "địa hình chi phí" ở Bài 14. `RiemannianAdam` không đi theo hướng gradient Euclid phẳng mà đi theo hướng đã hiệu chỉnh bởi metric, rồi hạ cánh trở lại đa tạp thông qua retraction. Geoopt đóng gói các thao tác này trong PyTorch, nhưng nền tảng toán học đằng sau vẫn là bộ ba $$(M,g,\nabla)$$.

Về độ cong, tensor Riemann đo sự không giao hoán của đạo hàm hiệp biến, còn trên đồ thị, độ cong Ollivier–Ricci đóng vai trò phiên bản rời rạc của độ cong Ricci. Cạnh có độ cong dương lớn liên quan đến hiện tượng làm trơn quá mức (over-smoothing), còn cạnh có độ cong âm lớn tạo nên nút thắt cổ chai (over-squashing). Dòng Ricci rời rạc điều chỉnh trọng số cạnh hoặc cấu trúc đồ thị để cải thiện tính truyền tin.

![Đường trắc địa trên mặt cầu — quỹ đạo của gradient descent Riemann nếu mất mát là khoảng cách.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Hình 1. Các đường tròn lớn trên mặt cầu: vừa là đường trắc địa, vừa là quỹ đạo của nhiều bước hạ gradient khi $$M=S^n$$. Mathwriter2718 / Wikimedia Commons, 2024.*

## Định nghĩa hình thức và ký hiệu

**Gradient Riemann.** Với hàm trơn $$f:M\to\mathbb{R}$$, vector trường $$\operatorname{grad} f$$ được xác định duy nhất bởi điều kiện
$$
g(\operatorname{grad} f, X) = df(X)
$$
với mọi trường vector $$X$$. Trong tọa độ địa phương, $$(\operatorname{grad} f)^i = g^{ij}\partial_j f$$.

**Phép co rút (Retraction).** Một retraction $$R_x:T_xM\to M$$ là ánh xạ trơn thỏa mãn $$R_x(0)=x$$ và $$d(R_x)_0 = \mathrm{id}$$. Ánh xạ mũ là một retraction; trong thực tế thuật toán thường dùng phân tích QR, phép chuẩn hóa vector hoặc hàm mũ ma trận vì chi phí tính toán thấp hơn.

**Một bước của RiemannianAdam (khái quát).** Tính gradient Riemann $$g_t$$, cập nhật các mô-men trong không gian tiếp tuyến $$T_{x_t}M$$ sau khi vận chuyển mô-men từ bước trước về $$x_t$$, rồi cập nhật tham số:
$$
x_{t+1} = R_{x_t}(-\alpha\, m_t/\sqrt{v_t}).
$$
Các chi tiết cài đặt số nằm trong Geoopt, còn khung khái niệm hình học nằm ở chính chương này.

---

## Ví dụ tính tay cầm tay chỉ việc: Một bước hạ gradient Riemann trên mặt cầu $$S^2$$

Giả sử ta muốn cực tiểu hóa hàm độ cao $$f(x) = x_3$$ trên mặt cầu đơn vị $$S^2 \subset \mathbb{R}^3$$, xuất phát từ một điểm trên Xích đạo $$x_0 = (1, 0, 0)^T$$ với tốc độ học $$\alpha = 0.5$$:

1. **Tính gradient Riemann tại $$x_0$$:** Gradient Euclid là $$\nabla f = (0, 0, 1)^T$$. Chiếu vuông góc xuống mặt phẳng tiếp tuyến $$T_{x_0} S^2$$ (trừ đi thành phần song song $$x_0$$):
   $$
   \operatorname{grad} f(x_0) = \nabla f - (\nabla f \cdot x_0)\,x_0 = (0, 0, 1)^T - 0 = (0, 0, 1)^T.
   $$
2. **Thử bước Euclid ngây thơ:** $$x_{\text{Euc}} = x_0 - 0.5\,\operatorname{grad} f(x_0) = (1, 0, -0.5)^T$$. Kiểm tra chuẩn: $$\Vert x_{\text{Euc}}\Vert = \sqrt{1^2 + (-0.5)^2} = \sqrt{1.25} \approx 1.118 \neq 1$$ — đã **văng ra khỏi mặt cầu**!
3. **Dùng Retraction chuẩn hóa (nhanh, không cần $$\sin/\cos$$):**
   $$
   x_1^{\text{ret}} = R_{x_0}(-0.5\,\operatorname{grad} f) = \frac{(1, 0, -0.5)^T}{\sqrt{1.25}} \approx (0.894,\, 0,\, -0.447)^T \in S^2.
   $$
4. **So với Ánh xạ mũ chính xác (đi dọc kinh tuyến một góc $$0.5$$ rad):**
   $$
   x_1^{\exp} = \exp_{x_0}(-0.5\,\operatorname{grad} f) = (\cos 0.5,\, 0,\, -\sin 0.5)^T \approx (0.878,\, 0,\, -0.479)^T \in S^2.
   $$

Cả hai đều hạ độ cao $$x_3$$ xuống phía Nam Cực và nằm gọn trên mặt cầu $$S^2$$ — trong đó retraction chỉ tốn đúng một phép chia chuẩn thay vì tính lượng giác!

---

### Khung giải thích: Ba trụ cột của Tối ưu hóa Riemann và Độ cong Đồ thị (nên đọc chậm)

#### Bước 1: Tại sao `RiemannianAdam` cần đến "Vận chuyển song song" từ Bài 12?
Adam thông thường cộng trung bình động mô-men $$m_t = \beta_1 m_{t-1} + (1-\beta_1) g_t$$. Trên đa tạp cong, $$m_{t-1}$$ sống trong $$T_{x_{t-1}} M$$ còn $$g_t$$ sống trong $$T_{x_t} M$$ — hai không gian tiếp tuyến khác nhau nên không thể cộng trực tiếp! `RiemannianAdam` phải áp dụng phép **vận chuyển vector** $$\mathcal{T}_{x_{t-1} \to x_t}(m_{t-1})$$ (vận chuyển song song hoặc phép chiếu) đưa $$m_{t-1}$$ về $$T_{x_t} M$$ trước khi cộng!

#### Bước 2: Boumal (2023) & Geoopt — biến hình học vi phân thành thư viện tối ưu
Cuốn sách của Nicolas Boumal hệ thống hóa điều kiện hội tụ của Gradient Descent, Trust-Region và Newton bậc hai trên đa tạp chỉ bằng bốn nguyên liệu: điểm $$x$$, không gian tiếp tuyến $$T_x M$$, metric $$g_x$$ và retraction $$R_x$$. Nhờ kiến trúc mô-đun đó, **Geoopt** cho phép lập trình viên PyTorch khai báo tham số trên `PoincareBall`, `Sphere`, hay `SymmetricPositiveDefinite` và huấn luyện mượt như tensor thường!

#### Bước 3: Độ cong Ollivier–Ricci chẩn đoán hai căn bệnh của GNN (Nguyen et al., ICML 2023)
Trên một cụm dày đặc (clique), láng giềng của hai đỉnh kề nhau trùng lặp gần hết $$\implies$$ độ cong Ollivier–Ricci **dương lớn** $$\implies$$ truyền tin nhiều lớp khiến mọi nút giống hệt nhau (**over-smoothing**). Ngược lại, trên một cạnh "cầu nối" mảnh giữa hai cộng đồng tách biệt, hai đám mây láng giềng cách xa nhau $$\implies$$ độ cong **âm lớn** $$\implies$$ thông tin từ hàng triệu nút phải chui qua đúng 1 cạnh (**over-squashing**)!

Tóm tắt cầu nối hình học Riemann – học sâu hiện đại:

$$
(M, g, \nabla, \mathrm{Ric})
\;\xrightarrow{\text{Retraction + Transport}}\;
\text{RiemannianAdam (Geoopt)}
\quad \& \quad
\text{Ollivier–Ricci} \to \text{Chẩn đoán GNN}.
$$

## Minh họa hình học

![Vận chuyển moment: song song hóa trước khi cộng.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2. Thuật toán Adam trên đa tạp cần đưa các trung bình động từ $$T_{x_{t-1}}M$$ sang $$T_{x_t}M$$ bằng vận chuyển song song (trong cài đặt thực tế thường thay bằng phép vận chuyển vector rẻ hơn như phép chiếu). Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo / Jost.** Đa tạp Riemann, độ cong và Định lý Hopf–Rinow.

2. **Boumal, N. (2023).** *An Introduction to Optimization on Smooth Manifolds*. Cambridge University Press. doi:10.1017/9781009166164.

3. **Kochurov, M., Karimov, R., & Kozlukov, S. (2020).** *Geoopt: Riemannian Optimization in PyTorch*. arXiv:2005.02819. Thư viện cung cấp `RiemannianAdam` được sử dụng rộng rãi trong giai đoạn 2022–2026.

4. **Bécigneul, G., & Ganea, O.-E. (2019).** *Riemannian Adaptive Optimization Methods*. ICLR 2019. Bài báo gốc đề xuất Adam trên đa tạp.

5. **Nguyen et al. (2023).** *Revisiting Over-smoothing and Over-squashing Using Ollivier-Ricci Curvature*. ICML 2023. Kết nối trực tiếp độ cong Ricci với mạng nơ-ron đồ thị.

## 🔗 Ứng dụng và kết nối liên ngành

Trong học sâu hyperbolic, dữ liệu phân cấp được nhúng vào đĩa Poincaré nên tham số nằm trên đa tạp $$M$$ thay vì $$\mathbb{R}^n$$ và cần tối ưu hóa Riemann. Trong thị giác máy tính, ma trận hiệp phương sai (SPD) và không gian con tuyến tính (đa tạp Grassmann) xuất hiện trong bài toán theo dõi đối tượng. Trong kỹ thuật robot, không gian tư thế là $$SO(3)$$ hoặc $$SE(3)$$ (sẽ xét kỹ hơn ở Chương 8), đòi hỏi phép tối ưu tuân theo cấu trúc đa tạp. Trong hình học thông tin, metric Fisher–Rao biến không gian mô hình xác suất thành đa tạp Riemann $$(M,g)$$, và natural gradient chính là $$\operatorname{grad} L$$ theo metric này.

## Video tham khảo

- [Optimization on Manifolds](https://www.youtube.com/watch?v=UjaoZE0GBpg) — Simons Institute for the Theory of Computing, tiếng Anh. Xem trước: trình bày đúng khung nội dung của bài gồm gradient Riemann, retraction thay cho ánh xạ mũ và bước cập nhật gradient descent trên đa tạp.
- [Tensor Calculus 12: The Metric Tensor in Curved Spaces for Measuring Arc Length](https://www.youtube.com/watch?v=SmjbpIgVKFs) — eigenchris, tiếng Anh. Minh họa metric $$g$$ như cấu trúc đo độ dài mà gradient Euclid bỏ qua.
- [Tensor Calculus 16: Geodesic Examples on Plane and Sphere](https://www.youtube.com/watch?v=8sVDceI70HM) — eigenchris, tiếng Anh. Đường tròn lớn trên mặt cầu là đường trắc địa chính xác mà retraction xấp xỉ khi tham số nằm trên $$S^n$$.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Trên mặt cầu $$S^2\subset\mathbb{R}^3$$, xét hàm $$f(x)=x\cdot e_3$$. Mô tả $$\operatorname{grad} f$$ như hình chiếu trực giao của $$e_3$$ lên mặt phẳng tiếp tuyến tại $$x$$. Một bước cập nhật Euclid thông thường sẽ gặp vấn đề gì?

**Bài 2.** Giải thích bằng lời sự khác nhau giữa *retraction* và *ánh xạ mũ*. Khi nào xấp xỉ retraction đủ tốt cho học máy, và trong tình huống nào hình học trắc địa chính xác (Định lý Hopf–Rinow) trở nên thiết yếu?

**Bài 3.** Suy ngẫm: tensor Ricci là phép rút gọn (vết) của tensor Riemann, còn trên đồ thị, độ cong Ollivier–Ricci là một số gắn với mỗi cạnh. Hãy diễn đạt ngắn gọn mối liên hệ trực quan giữa "độ lệch thể tích dọc đường trắc địa" và "mức độ chồng lấn giữa hai phân bố láng giềng trên đồ thị".

---

Lý thuyết đa tạp Riemann giữ nguyên nền tảng. Chương 8 sẽ bổ sung cấu trúc nhóm (Nhóm Lie), còn bài tùy chọn tương ứng sẽ kết nối với Equiformer, Theseus và động học robot.
