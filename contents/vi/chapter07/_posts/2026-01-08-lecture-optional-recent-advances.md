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

Đa tạp Riemann $$(M,g)$$ là nơi mọi thứ của khóa học gặp nhau: độ dài, trắc địa, Levi-Civita, độ cong Riemann, Ricci, vô hướng. Hopf–Rinow, ở mức khái niệm, nối tính đầy đủ metric với tính đầy đủ trắc địa. Bài tùy chọn này không chứng minh lại các định lý ấy. Nó kể chuyện tối ưu hóa trên $$(M,g)$$ — bài toán “Adam phải làm gì nếu tham số không sống trong $$\mathbb{R}^n$$” — và chuyện độ cong Ricci rời rạc trên đồ thị, đã xuất hiện ở Chapter 04, nay được đặt đúng vào ngôn ngữ Ricci của chương này.

Boumal xuất bản *An Introduction to Optimization on Smooth Manifolds* (Cambridge, 2023): một giáo trình hiện đại lấy retractions, gradient Riemann, Newton và trust-region làm trung tâm. Geoopt (Kochurov, Karimov, Kozlukov, 2020) vẫn là thư viện PyTorch mà các bài 2022–2026 dùng để gọi `RiemannianAdam`. Bécigneul & Ganea (ICLR 2019) là bài “Adam trên đa tạp” gốc; dòng dõi ấy, cùng sách của Boumal, định hình cách người ta huấn luyện mạng hyperbolic, mạng trên $$St(p,n)$$, hay trên SPD. Nguyen và cộng sự (ICML 2023) cho thấy Ricci không chỉ là một tensor trong giáo trình: dấu của nó trên đồ thị phân xử hai bệnh kinh điển của GNN.

## Giải thích trực quan

Gradient Euclid chỉ là một danh sách đạo hàm riêng. Trên mặt cầu, nếu bạn cộng gradient ấy vào vector trọng số rồi *không* chiếu lại, bạn đã rời khỏi $$M$$. Tối ưu Riemann làm ba việc bạn vừa học: (1) coi đạo hàm như một covector, (2) nâng nó bằng $$g^{-1}$$ để được vector tiếp xúc, (3) đi một bước bằng retraction — một phiên bản tính toán của hàm mũ, rẻ hơn geodesics thật. Adam Riemann giữ moment bậc một và bậc hai *trong các không gian tiếp tuyến*, rồi vận chuyển chúng khi điểm tham số chạy: lại là liên kết.

Hãy nghĩ metric như địa hình chi phí ở bài 14. RiemannianAdam không bước theo mũi tên giấy, nó bước theo mũi tên đã được hiệu chỉnh bởi địa hình ấy, rồi đáp xuống mặt bằng retraction. Geoopt chỉ là cách viết điều ấy bằng vài dòng Python; toán thì vẫn là $$(M,g,\nabla)$$.

Độ cong Riemann đo sự thất bại của việc hoán vị đạo hàm hiệp biến. Trên đồ thị, Ollivier–Ricci là một bóng rời rạc của vết ấy. Dấu dương: láng giềng quá hòa (over-smoothing). Dấu âm: cổ chai (over-squashing). Ricci flow số, như đã kể, là một thuật toán làm cho $$g$$ — hay bộ cạnh — trở nên “hiền” hơn.

![Đường trắc địa trên mặt cầu — quỹ đạo của gradient descent Riemann nếu mất mát là khoảng cách.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Hình 1. Các vòng tròn lớn: vừa là trắc địa, vừa là quỹ đạo của nhiều bước gradient khi $$M=S^n$$. Mathwriter2718 / Wikimedia Commons, 2024.*

## Định nghĩa hình thức và ký hiệu

**Gradient Riemann.** Với $$f:M\to\mathbb{R}$$, $$\operatorname{grad} f$$ được định bởi
$$
g(\operatorname{grad} f, X) = df(X)
$$
với mọi trường $$X$$. Trong tọa độ, $$\operatorname{grad} f = g^{ij}\partial_j f$$.

**Retraction.** Một retraction $$R_x:T_xM\to M$$ thỏa $$R_x(0)=x$$ và $$d(R_x)_0 = \mathrm{id}$$. Hàm mũ là một retraction; nhiều thuật toán dùng QR, chuẩn hóa, hay exp ma trận — rẻ hơn.

**Một bước RiemannianAdam (khẩu hiệu).** Lấy gradient Riemann $$g_t$$, cập nhật moment trong $$T_{x_t}M$$, vận chuyển moment từ bước trước về $$x_t$$, rồi
$$
x_{t+1} = R_{x_t}(-\alpha\, m_t/\sqrt{v_t}).
$$
Chi tiết số học nằm trong Geoopt; ý hình học nằm trong chương này.

## Minh họa hình học

![Vận chuyển moment: song song hóa trước khi cộng.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2. Adam trên đa tạp phải đưa các trung bình động từ $$T_{x_{t-1}}M$$ sang $$T_{x_t}M$$. Đó là vận chuyển song song, dù hiện thực thường chỉ là một phép chiếu rẻ. Wikimedia Commons.*

[Image placeholder: “Mặt cầu trong R^3; một bước Euclid xuyên ra ngoài; một bước retraction đáp xuống mặt”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo / Jost.** Đa tạp Riemann, độ cong, Hopf–Rinow (khái niệm).

2. **Boumal, N. (2023).** *An Introduction to Optimization on Smooth Manifolds*. Cambridge University Press. doi:10.1017/9781009166164.

3. **Kochurov, M., Karimov, R., & Kozlukov, S. (2020).** *Geoopt: Riemannian Optimization in PyTorch*. arXiv:2005.02819. Thư viện `RiemannianAdam` vẫn dùng trong các bài 2022–2026.

4. **Bécigneul, G., & Ganea, O.-E. (2019).** *Riemannian Adaptive Optimization Methods*. ICLR 2019. Bài gốc cho Adam trên đa tạp.

5. **Nguyen et al. (2023).** *Revisiting Over-smoothing and Over-squashing Using Ollivier-Ricci Curvature*. ICML 2023. Ricci của chương này gặp GNN.

## 🔗 Ứng dụng và kết nối liên ngành

Học sâu hyperbolic nhúng phân cấp vào đĩa Poincaré: tham số sống trên $$M$$, không trên $$\mathbb{R}^n$$, nên tối ưu phải là Riemann. Thị giác: ma trận hiệp phương sai (SPD) và subspace (Grassmann) xuất hiện trong tracking. Robot: không gian tư thế là $$SO(3)$$ hoặc $$SE(3)$$ — Chapter 08 sẽ nói kỹ hơn, nhưng gradient đã phải là Riemann từ bây giờ. Hình học thông tin, chạm nhẹ: Fisher–Rao biến không gian mô hình thành $$(M,g)$$, và natural gradient chính là $$\operatorname{grad} L$$.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Trên $$S^2\subset\mathbb{R}^3$$, lấy $$f(x)=x\cdot e_3$$. Mô tả $$\operatorname{grad} f$$ như hình chiếu của $$e_3$$ lên mặt phẳng tiếp tuyến. Một bước Euclid thô sẽ làm gì sai?

**Bài 2.** Giải thích bằng lời sự khác nhau giữa * retraction* và *hàm mũ*. Khi nào xấp xỉ retraction đủ tốt cho học máy, và khi nào hình học trắc địa thật (Hopf–Rinow) lại quan trọng?

**Bài 3.** Suy ngẫm: tensor Ricci là vết của Riemann. Trên đồ thị, Ollivier–Ricci là một số trên mỗi cạnh. Hãy viết một câu nối “vết của holonomy” với “hai quả bóng ngẫu nhiên có chồng nhau không”.

---

Lý thuyết đa tạp Riemann không đổi. Chapter 08 sẽ thêm cấu trúc nhóm; bài tùy chọn bên ấy gặp Equiformer, Theseus, và động học robot.
