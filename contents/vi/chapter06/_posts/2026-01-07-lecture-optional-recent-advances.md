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

Tensor là đối tượng bất biến về bản chất dưới phép đổi tọa độ; liên kết affine là quy tắc so sánh hai vector đặt tại hai điểm khác nhau; đạo hàm hiệp biến và vận chuyển song song là các hệ quả trực tiếp. Bài tùy chọn này không trình bày lại $$\nabla_XY$$, mà chỉ ra rằng trong học sâu hình học, *gauge* chính là cách gọi khác của bài toán liên kết: tại mỗi điểm (hay mỗi đỉnh, mỗi mặt của lưới) có một không gian đặc trưng riêng, và ta cần một quy tắc vận chuyển đặc trưng đó sang điểm lân cận trước khi tổng hợp chúng lại.

Cohen và cộng sự (2019) đặt nền móng cho mạng tích chập đẳng biến gauge trên bề mặt. Trong giai đoạn 2022–2024, *Equiformer* và *EquiformerV2* (Liao & Smidt; Liao, Smidt và cộng sự) đưa các biểu diễn bất khả quy của $$SE(3)/E(3)$$ — tức các tensor kiểu hài cầu — vào kiến trúc transformer, sử dụng tích tensor và cơ chế chú ý (attention) đẳng biến. Trong các mạng này, vận chuyển song song không còn chỉ là minh họa hình học trên mặt cầu mà được hiện thực hóa trực tiếp qua phép nhân Clebsch–Gordan ở từng lớp mạng.

## Giải thích trực quan

Ta không thể trừ hai mũi tên gắn tại hai điểm khác nhau trên mặt cầu bằng cách dịch chúng trong $$\mathbb{R}^3$$ rồi lấy hiệu, vì cách làm đó phụ thuộc vào phép nhúng chứ không phải tính chất nội tại. Liên kết cung cấp một quy tắc trượt mũi tên dọc theo một đường cong sao cho nó luôn song song theo nghĩa đã định. Trên một lưới đa giác, mỗi đỉnh có một hệ khung cục bộ riêng; một lớp truyền thông điệp (message-passing layer) phải *vận chuyển* đặc trưng từ các đỉnh láng giềng về đỉnh trung tâm trước khi cộng gộp. Nếu bỏ qua bước này, ta đã ngầm đồng nhất mọi không gian tiếp tuyến làm một.

Tính đẳng biến gauge đòi hỏi chặt hơn nữa: dù ta xoay hệ khung cục bộ tại chỗ — tức đổi hệ tọa độ nội tại — mạng vẫn biểu diễn cùng một trường hình học, đúng với tinh thần của tensor. *Equiformer* không tính ký hiệu Christoffel một cách tường minh, mà thay phép tích vô hướng trong cơ chế chú ý bằng các toán tử tôn trọng quy luật kết hợp giữa các thành phần bậc $$l=0,1,2,\dots$$ (vô hướng, vector, tensor). *EquiformerV2* (2023) mở rộng lên các bậc cao hơn, đáp ứng yêu cầu mô phỏng phân tử và vật liệu xúc tác cần các hàm hài cầu tinh hơn.

![Vận chuyển song song: so sánh vector ở hai điểm.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 1. Hình minh họa quen thuộc: sau khi đi hết một vòng kín, vector không còn trùng hướng ban đầu. Đây là biểu hiện của độ cong, đồng thời cho thấy trước hết ta cần một liên kết để có thể so sánh vector giữa các điểm. Fred the Oyster / Wikimedia Commons.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại.** Một liên kết affine cho phép viết
$$
\nabla_X Y = \bigl(X(Y^k) + \Gamma^k_{ij} X^i Y^j\bigr)\partial_k.
$$
Vận chuyển song song dọc theo đường cong $$\gamma$$ là nghiệm của phương trình $$\nabla_{\dot\gamma}V=0$$.

Trong một mạng đẳng biến, đặc trưng tại điểm $$p$$ thuộc một biểu diễn $$\rho$$ của nhóm cấu trúc $$G$$ (thường là $$SO(3)$$). Một lớp hợp lệ là một ánh xạ
$$
\bigl\{f(q)\bigr\}_{q\sim p} \longmapsto \tilde f(p)
$$
giao hoán với $$\rho$$: khi quay toàn bộ đầu vào, đầu ra cũng quay theo đúng quy luật đó. Tích tensor của hai biểu diễn bất khả quy (irrep), sau đó chiếu lại bằng hệ số Clebsch–Gordan, đóng vai trò tương tự hệ số $$\Gamma$$ — không phải ký hiệu Christoffel sinh từ metric, nhưng cùng chung ý tưởng là quy tắc kết hợp các thành phần khi so sánh.

## Minh họa hình học

![Trường vector tiếp xúc trên torus — cần liên kết để đạo hàm.](https://upload.wikimedia.org/wikipedia/commons/7/75/Torus_vectors_radial.png)
*Hình 2. Một trường vector tiếp tuyến liên tục trên hình xuyến (torus). Để đo mức độ biến thiên của trường khi di chuyển quanh lỗ xuyến, ta cần toán tử $$\nabla$$ chứ không thể chỉ lấy hiệu tọa độ. Tác giả: RokerHRO, Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo / Lee.** Liên kết Levi-Civita, ký hiệu Christoffel và vận chuyển song song.

2. **Cohen, T. S., Weiler, M., Kicanaoglu, B., & Welling, M. (2019).** *Gauge Equivariant Convolutional Networks and the Icosahedral CNN*. ICML 2019. Bài báo đặt nền cho khái niệm gauge trong mạng tích chập (CNN).

3. **Liao, Y.-L., & Smidt, T. (2023).** *Equiformer: Equivariant Graph Attention Transformer for 3D Atomistic Graphs*. ICLR 2023.

4. **Liao, Y.-L., Smidt, T., et al. (2023).** *EquiformerV2: Improved Equivariant Transformer for Scaling to Higher-Degree Representations*. arXiv:2306.12059.

5. **Brehmer et al. (2023)** và **Ruhe et al. (2023).** Xem bài tùy chọn Chương 5: cùng hướng tiếp cận, nhưng nhấn mạnh cấu trúc đại số thay vì biểu diễn bất khả quy.

## 🔗 Ứng dụng và kết nối liên ngành

Trong hóa lượng tử và xúc tác (chẳng hạn bộ dữ liệu OC20), năng lượng phải bất biến dưới phép quay còn lực phải đẳng biến — tương ứng với tensor bậc 0 và bậc 1. Trong thị giác 3D, vector pháp tuyến và tensor ứng suất phải giữ nguyên ý nghĩa hình học khi xoay camera. Trong vật lý, liên kết gauge là ngôn ngữ của điện từ học và các tương tác hạt nhân; các mạng giai đoạn 2019–2024 tiếp thu ý tưởng này ở mức rời rạc, chứ không thay thế lý thuyết trường.

## Video tham khảo

- [Tensor Calculus 18: Covariant Derivative (extrinsic) and Parallel Transport](https://www.youtube.com/watch?v=Af9JUiQtV1k) — eigenchris, tiếng Anh. Xem trước: so sánh vector tại hai điểm đòi hỏi một phép vận chuyển, tương ứng với vai trò của gauge như một liên kết trong học sâu hình học.
- [3DGV Seminar: Michael Bronstein -- Geometric Deep Learning for 3D Shape Analysis and Synthesis](https://www.youtube.com/watch?v=2Z4L2I59AKo) — 3DGV Seminar, tiếng Anh. Trình bày học sâu hình học thông qua các kiến trúc tôn trọng đối xứng của bề mặt và của nhóm — bối cảnh của Equiformer.
- [A Swift Introduction to Geometric Algebra](https://www.youtube.com/watch?v=60z_hpEAtD8) — sudgylacmoe, tiếng Anh. Giải thích cách đa vector các bậc khác nhau biến đổi khác nhau dưới phép quay, cho thấy vì sao một lớp đẳng biến không thể trộn chúng như các kênh vô hướng thông thường.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Xét hai vector tiếp tuyến tại hai điểm gần nhau trên mặt cầu. Hãy mô tả một cách so sánh *không phù hợp* (trừ trực tiếp tọa độ trong $$\mathbb{R}^3$$) và một cách *phù hợp hơn* (vận chuyển song song dọc theo đường trắc địa ngắn nối hai điểm). Một mạng message-passing đang làm theo cách nào nếu nó cộng trực tiếp các vector đặc trưng thô?

**Bài 2.** Giải thích bằng lời sự khác nhau giữa *bất biến* (năng lượng không đổi khi quay phân tử) và *đẳng biến* (vector lực quay cùng phân tử). Mỗi đại lượng tương ứng với tensor bậc mấy?

**Bài 3.** Suy ngẫm: liên kết Levi-Civita được xác định duy nhất từ metric $$g$$, trong khi các mạng đẳng biến xác định quy tắc vận chuyển từ đối xứng nhóm chứ không từ một $$g_{ij}$$ học được. Trong trường hợp nào hai cách tiếp cận này trùng khớp, và khi nào chúng chỉ tương tự nhau về mặt ý tưởng?

---

Định nghĩa liên kết giữ nguyên làm nền tảng. Chương 7 sẽ kết hợp metric, liên kết và độ cong để xây dựng đa tạp Riemann — đồng thời giới thiệu phiên bản thuật toán Adam trên đa tạp.
