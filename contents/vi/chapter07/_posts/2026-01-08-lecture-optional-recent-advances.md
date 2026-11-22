---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Đa tạp Riemann, Adam trên đa tạp, và Geoopt"
chapter: "07"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
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
