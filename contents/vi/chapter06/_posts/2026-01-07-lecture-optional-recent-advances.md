---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Liên kết, gauge, và mạng đẳng biến"
chapter: "06"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Tensor là đối tượng “miễn nhiễm” đổi tọa độ; liên kết affine là cách so sánh hai vector sống ở hai điểm khác nhau; đạo hàm hiệp biến và vận chuyển song song là hệ quả. Bài tùy chọn này không viết lại $$\nabla_XY$$. Nó chỉ ra rằng, trong học sâu hình học, *gauge* chính là tên gọi của vấn đề liên kết: tại mỗi điểm (hay mỗi đỉnh, mỗi mặt của lưới) ta có một không gian đặc trưng, và ta cần một quy tắc để kéo đặc trưng ấy sang điểm bên cạnh trước khi cộng chúng lại.

Cohen và cộng sự (2019) đặt nền cho mạng tích chập đẳng biến gauge trên mặt; các năm 2022–2024, Equiformer và EquiformerV2 (Liao & Smidt; Liao, Smidt và cộng sự) đưa các biểu diễn bất khả quy của $$SE(3)/E(3)$$ — tức các tensor kiểu cầu — vào transformer, dùng tích tensor và chú ý (attention) đẳng biến. Parallel transport, trong các mạng ấy, không còn là một hình vẽ trên mặt cầu: nó là phép nhân Clebsch–Gordan được cài trong từng lớp.

## Giải thích trực quan

Bạn không thể trừ hai mũi tên gắn trên hai điểm của mặt cầu bằng cách dịch chúng trong $$\mathbb{R}^3$$ rồi trừ: phép trừ ấy phụ thuộc cách nhúng, không phải nội tại. Liên kết chọn một cách “trượt” mũi tên dọc theo một đường, giữ nó song song theo nghĩa đã thỏa thuận. Trên một lưới, mỗi đỉnh có một khung; một message-passing layer phải *vận chuyển* đặc trưng từ láng giềng về đỉnh trung tâm trước khi cộng. Nếu quên bước ấy, bạn đang giả vờ rằng mọi không gian tiếp tuyến đã là một.

Gauge equivariance nói mạnh hơn: dù bạn xoay khung tại chỗ — đổi “hệ tọa độ nội tại” — mạng vẫn mô tả cùng một trường. Đó đúng là tính chất tensor. Equiformer không vẽ Christoffel; nó thay thế phép nhân vô hướng của attention bằng các toán tử tôn trọng cách các thành phần $$l=0,1,2,\dots$$ (vô hướng, vector, tensor) trộn với nhau. EquiformerV2 (2023) cho phép lên bậc cao hơn, cần thiết khi phân tử và xúc tác đòi hỏi các hài cầu tinh hơn.

![Vận chuyển song song: so sánh vector ở hai điểm.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 1. Cùng một hình bạn đã gặp: sau một vòng, vector không còn trùng hướng ban đầu. Đó là độ cong, nhưng trước hết đó là bằng chứng rằng ta *cần* một liên kết để so sánh. Fred the Oyster / Wikimedia Commons.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại.** Một liên kết affine cho phép viết
$$
\nabla_X Y = \bigl(X(Y^k) + \Gamma^k_{ij} X^i Y^j\bigr)\partial_k.
$$
Vận chuyển song song dọc $$\gamma$$ là nghiệm của $$\nabla_{\dot\gamma}V=0$$.

Trong một mạng đẳng biến, đặc trưng tại $$p$$ thuộc một biểu diễn $$\rho$$ của nhóm cấu trúc $$G$$ (thường là $$SO(3)$$). Một lớp hợp lệ là một ánh xạ
$$
\bigl\{f(q)\bigr\}_{q\sim p} \longmapsto \tilde f(p)
$$
giao hoán với $$\rho$$: quay mọi đầu vào thì đầu ra quay cùng luật. Tích tensor của hai irrep, rồi chiếu lại bằng hệ số Clebsch–Gordan, chính là “$$\Gamma$$” của họ — không phải Christoffel của metric, nhưng cùng một ý: quy tắc trộn các thành phần khi so sánh.

## Minh họa hình học

![Trường vector tiếp xúc trên torus — cần liên kết để đạo hàm.](https://upload.wikimedia.org/wikipedia/commons/7/75/Torus_vectors_radial.png)
*Hình 2. Một trường vector tiếp xúc liên tục trên torus. Để hỏi trường ấy “đổi bao nhiêu” khi ta đi quanh lỗ, ta cần $$\nabla$$, không chỉ trừ tọa độ. Tác giả: RokerHRO, Wikimedia Commons.*

[Image placeholder: “Hai đỉnh lưới, hai khung; mũi tên vận chuyển đặc trưng l=1 từ q về p trước khi cộng”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo / Lee.** Liên kết Levi-Civita, ký hiệu Christoffel, vận chuyển song song.

2. **Cohen, T. S., Weiler, M., Kicanaoglu, B., & Welling, M. (2019).** *Gauge Equivariant Convolutional Networks and the Icosahedral CNN*. ICML 2019. Bài “mở đường” cho chữ gauge trong CNN.

3. **Liao, Y.-L., & Smidt, T. (2023).** *Equiformer: Equivariant Graph Attention Transformer for 3D Atomistic Graphs*. ICLR 2023.

4. **Liao, Y.-L., Smidt, T., et al. (2023).** *EquiformerV2: Improved Equivariant Transformer for Scaling to Higher-Degree Representations*. arXiv:2306.12059.

5. **Brehmer et al. (2023)** và **Ruhe et al. (2023).** Xem bài tùy chọn Chapter 05: cùng một dòng máu, nhấn mạnh đại số thay vì irrep.

## 🔗 Ứng dụng và kết nối liên ngành

Trong hóa lượng tử và xúc tác (bộ dữ liệu OC20), năng lượng phải bất biến quay, lực phải đẳng biến: đó là tensor kiểu (0) và kiểu (1). Trong thị giác 3D, pháp tuyến và tensor ứng suất không được đổi nghĩa khi ta xoay camera. Trong vật lý, liên kết gauge là ngôn ngữ của điện từ và lực hạt nhân; các mạng 2019–2024 vay ý ấy ở mức rời rạc, không thay thế lý thuyết trường.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Hai vector tiếp xúc tại hai điểm gần nhau trên mặt cầu. Phác một cách *sai* (trừ tọa độ $$\mathbb{R}^3$$) và một cách *đúng hơn* (song song hóa dọc geodesics ngắn). Mạng message-passing đang làm việc nào nếu nó cộng đặc trưng thô?

**Bài 2.** Giải thích bằng lời sự khác nhau giữa *bất biến* (năng lượng không đổi khi quay phân tử) và *đẳng biến* (vector lực quay cùng phân tử). Tensor kiểu nào cho từng thứ?

**Bài 3.** Suy ngẫm: Levi-Civita được metric xác định duy nhất. Các mạng đẳng biến chọn “liên kết” bằng đối xứng nhóm, không bằng một $$g_{ij}$$ học được. Khi nào hai lựa chọn ấy trùng nhau, và khi nào chúng chỉ là họ hàng ẩn dụ?

---

Định nghĩa liên kết không đổi. Chapter 07 sẽ ghép metric, liên kết và độ cong thành đa tạp Riemann — và gặp Adam trên đa tạp.
