---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Liên kết, gauge, và mạng đẳng biến"
chapter: "06"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

Khi một mạng nơ-ron đồ thị (GNN) muốn dự đoán lực tác dụng lên từng nguyên tử trong một chất xúc tác 3D hay ước lượng ứng suất trên bề mặt cong của cánh máy bay, nó đối mặt với chính nút thắt mà Levi-Civita từng gặp năm 1917: *mỗi đỉnh có một hệ quy chiếu cục bộ riêng!* Nếu bạn cứ hồn nhiên cộng dồn vector đặc trưng từ các nguyên tử láng giềng mà không vận chuyển chúng về cùng một hệ khung, hay cho các tọa độ $$(x, y, z)$$ đi qua một hàm ReLU thông thường, tính đối xứng không gian lập tức bị phá nát!

Đó là lý do từ ý tưởng mạng tích chập đẳng biến **gauge** của Cohen và cộng sự (ICML 2019), giai đoạn 2022–2024 đã chứng kiến sự bùng nổ của **Equiformer** (ICLR 2023) và **EquiformerV2** (Liao, Smidt và cộng sự, 2023): thay vì chỉ xử lý mảng số phẳng, các kiến trúc transformer này cấy thẳng **biểu diễn bất khả quy (irreps)** của nhóm quay $$SO(3)$$ và phép nhân **Clebsch–Gordan** vào cơ chế chú ý (attention) — biến bài toán liên kết và vận chuyển song song thành hạ tầng lõi của AI cho khoa học vật liệu!

**Mạch bài học:** Kiến thức cần nhớ (gauge = chọn khung cục bộ, biểu diễn bất khả quy bậc $$l$$ của $$SO(3)$$, tích tensor Clebsch–Gordan) → Trực giác vận chuyển đặc trưng trên lưới & Equiformer → Định nghĩa hình thức → Ví dụ tính tay làm từng bước: kiểm tra phép quay $$90^\circ$$ trên lưỡng cực nguyên tử (vô hướng $$l=0$$ vs. lực $$l=1$$ vs. ReLU thường) → Giải thích: 3 bước từ liên kết gauge đến Equiformer / EquiformerV2 → Ứng dụng, Video & Bài tập.

---

## Kiến thức cần nhớ: Gauge, Biểu diễn bất khả quy và Equiformer là gì?

### 1. "Gauge" trong hình học và vật lý chính là quyền tự do chọn khung cục bộ
Trên một bề mặt cong (như mặt cầu — nơi không thể chải phẳng bộ lông mà không có xoáy), ta không có hướng "Đông–Bắc" chung cho mọi điểm. Tại mỗi điểm $$p$$ ta chọn một hệ khung trực chuẩn địa phương — lựa chọn đó gọi là một **gauge**. Để truyền thông điệp từ điểm $$q$$ sang $$p$$, ta cần một **liên kết** (phép vận chuyển song song) xoay đặc trưng từ gauge tại $$q$$ khớp vào gauge tại $$p$$.

### 2. Biểu diễn bất khả quy (Irreps) của $$SO(3)$$ — phân loại đặc trưng theo bậc $$l$$
Mọi đối tượng hình học trong không gian 3D đều phân rã thành các khối cơ bản không thể chia nhỏ hơn dưới phép quay $$SO(3)$$, đánh số bằng bậc $$l = 0, 1, 2, \dots$$ (ứng với các hàm hài cầu $$Y_l^m$$ có $$2l+1$$ thành phần):
- **$$l = 0$$ (1 thành phần):** đại lượng **vô hướng** bất biến (năng lượng, nhiệt độ, khối lượng).
- **$$l = 1$$ (3 thành phần):** **vector** 3D quay đúng theo ma trận $$R \in SO(3)$$ (lực, vận tốc, mô-men lưỡng cực).
- **$$l = 2$$ (5 thành phần):** **tensor bậc 2 đối xứng không vết** (tensor ứng suất, độ phân cực).

### 3. Tích tensor Clebsch–Gordan — cách nhân hai đặc trưng mà không phá vỡ đối xứng
Khi hai nguyên tử tương tác, ta cần kết hợp đặc trưng bậc $$l_1$$ của nguyên tử nguồn với vector khoảng cách tương đối bậc $$l_2$$ (hàm hài cầu của hướng nối $$q \to p$$). Phép nhân **tích tensor Clebsch–Gordan** trộn chúng thành các đặc trưng đầu ra bậc $$l_3$$ (với $$\vert l_1 - l_2\vert \le l_3 \le l_1 + l_2$$) mà vẫn bảo toàn tuyệt đối tính đẳng biến quay!

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

---

## Ví dụ tính tay làm từng bước: Thử phép quay $$90^\circ$$ trên lưỡng cực 2 nguyên tử

Xét hệ 2 nguyên tử có vector nối $$r = (1, 0, 0)^T$$ và phép quay $$90^\circ$$ quanh trục $$z$$:

$$
R = \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 1 \end{pmatrix} \;\Longrightarrow\; Rr = \begin{pmatrix} 0 \\ 1 \\ 0 \end{pmatrix}.
$$

1. **Năng lượng thế ($$l=0$$, bất biến):** $$E(r) = \Vert r \Vert^2 = 1$$. Sau khi quay: $$E(Rr) = \Vert (0,1,0)^T \Vert^2 = 1 = E(r)$$. Khớp tuyệt đối!
2. **Vector lực ($$l=1$$, đẳng biến):** $$F(r) = -\nabla E(r) = -2r = (-2, 0, 0)^T$$. Sau khi quay đầu vào: $$F(Rr) = -2(Rr) = (0, -2, 0)^T$$, khớp chính xác với $$R F(r) = (0, -2, 0)^T$$!
3. **Tại sao mạng ReLU thường lại thất bại?** Thử áp dụng hàm $$\mathrm{ReLU}$$ theo từng tọa độ lên vector lực $$F(r) = (-2, 0, 0)^T$$:
   - Tính ReLU trước rồi mới quay: $$R\,\mathrm{ReLU}(-2, 0, 0)^T = R(0, 0, 0)^T = (0, 0, 0)^T$$.
   - Quay trước rồi mới tính ReLU (nếu đổi dấu hoặc xoay góc $$180^\circ$$, $$R_{180} F(r) = (+2, 0, 0)^T$$): $$\mathrm{ReLU}(+2, 0, 0)^T = (+2, 0, 0)^T \neq (0, 0, 0)^T$$!

Chỉ một phép thử 3 dòng đủ thấy tại sao các mạng đẳng biến phải thay ReLU tọa độ bằng các toán tử **cổng vô hướng** (nhân vector $$v$$ với $$\sigma(\Vert v \Vert)$$) và tích tensor Clebsch–Gordan!

---

### Giải thích: Từ liên kết gauge đến kiến trúc Equiformer & EquiformerV2

#### Bước 1: Gauge CNN (Cohen et al., 2019) — vận chuyển song song trên lưới cong
Trên một mặt cong rời rạc hóa (như mặt cầu 20 mặt đều), mỗi mặt có một hệ khung cục bộ. Trước khi nhân tích chập với bộ lọc tại đỉnh $$p$$, đặc trưng của láng giềng $$q$$ được nhân với ma trận vận chuyển song song $$\rho(g_{q\to p})$$ — đúng là phiên bản rời rạc của liên kết trên phân thớ vector!

#### Bước 2: Equiformer (ICLR 2023) — Attention đẳng biến với biểu diễn $$SO(3)$$
Trong Transformer truyền thống, trọng số chú ý tính từ tích vô hướng $$q^T k$$. Trong **Equiformer**, mỗi nút mang một bộ đặc trưng phân bậc $$l = 0, 1, 2, \dots$$; thông điệp giữa hai nguyên tử $$p, q$$ được tính qua **Depthwise Tensor Product (DTP)** kết hợp đặc trưng nút với hàm hài cầu của hướng $$r_{pq}$$, còn trọng số chú ý chỉ rút ra từ kênh **vô hướng $$l=0$$** (bất biến dưới quay) rồi nhân đều lên các kênh $$l \ge 1$$!

#### Bước 3: EquiformerV2 (2023) — tăng tốc lên bậc $$l$$ cao nhờ xoay về trục chuẩn
Tính tích tensor tổng quát bậc $$l$$ tốn chi phí $$O(L^6)$$. EquiformerV2 dùng một mẹo hình học cực khéo: **tạm xoay hệ khung sao cho trục nối hai nguyên tử $$r_{pq}$$ trùng khít trục $$z$$** (tức chọn một gauge đặc biệt dọc cạnh $$pq$$!), nơi tích tensor $$SO(3)$$ sụp gọn thành tích $$SO(2)$$ chỉ tốn $$O(L^3)$$, rồi xoay ngược lại!

Tóm tắt mạch nối hình học – AI của Chương 6:

$$
\text{Liên kết } \nabla \text{ (Levi-Civita)}
\;\xrightarrow{\text{Rời rạc hóa khung}}\;
\text{Gauge CNN (2019)}
\;\xrightarrow{\text{Irreps } SO(3) + \text{Attention}}\;
\text{Equiformer / V2 (2023)}.
$$

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
