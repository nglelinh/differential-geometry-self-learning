---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Dạng cơ bản, Jacobian, và phân tích hình dạng"
chapter: "03"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

Khi chuyển từ giấy bút sang màn hình máy tính, những bề mặt trơn mượt trong sách giáo khoa không còn tồn tại dưới dạng công thức $$z = f(x, y)$$ nữa — chúng biến thành các **lưới tam giác (triangle meshes)** gồm hàng chục nghìn đỉnh phẳng ghép lại. Thế nhưng nếu mọi mặt tam giác đều phẳng (độ cong bằng 0 ở bên trong), thì độ cong của một khuôn mặt 3D hay một bức tượng quét laser đã "trốn" đi đâu? Và làm sao một mạng nơ-ron có thể học cách căn khớp hai tư thế khác nhau của cùng một người mà không bị đánh lừa bởi cách họ uốn cong tay chân trong không gian 3D?

Bài đọc thêm này nối trực tiếp hai dạng cơ bản cổ điển của Chương 3 với hai mũi nhọn của đồ họa máy tính và phân tích hình dạng giai đoạn 2022–2026: **hình học vi phân rời rạc (Discrete Differential Geometry)** và **Neural Jacobian Fields (SIGGRAPH 2022)**.

**Mạch bài học:** Từ bề mặt trơn sang lưới tam giác rời rạc → Bản đồ kiến thức nền (Góc thiếu, Ánh xạ gần đẳng cự, Trường Jacobian nội tại) → Trực giác chiếc áo & bài toán Poisson → Định nghĩa hình thức $$F^*\mathrm{I}_2 \approx \mathrm{I}_1$$ và $$K(v)$$ → Kiểm tra bằng tay góc thiếu trên hình lập phương, lưới phẳng, điểm yên ngựa và ma trận Jacobian khi cuộn trụ → Tài liệu nền tảng & ứng dụng.

## Bản đồ kiến thức nền: Hình học bề mặt rời rạc và học sâu hình dạng nghiên cứu điều gì?

### 1. Hình học vi phân rời rạc (Discrete Differential Geometry — DDG)
- **Là gì:** Nhánh toán học xây dựng các phiên bản rời rạc của độ cong Gauss $$K$$, độ cong trung bình $$H$$, và toán tử Laplace–Beltrami trên lưới đa giác sao cho các định lý cấu trúc lớn (như Gauss–Bonnet) vẫn đúng **chính xác** ngay cả trên lưới thô.
- **Nghiên cứu gì:** Khi bề mặt được xấp xỉ bởi các tam giác phẳng, toàn bộ độ cong Gauss tập trung tại các *đỉnh* dưới dạng **góc thiếu (angle defect)** $$2\pi - \sum_i \theta_i$$, còn độ cong trung bình tập trung dọc theo các *cạnh* (góc nhị diện giữa hai tam giác kề nhau).

### 2. Ánh xạ gần đẳng cự (Near-Isometric Mappings) và Phân tích hình dạng
- **Là gì:** Bài toán tìm ánh xạ $$F: M \to N$$ giữa hai bề mặt 3D sao cho dạng kéo lùi bảo toàn gần đúng dạng cơ bản thứ nhất: $$F^*\mathrm{I}_2 \approx \mathrm{I}_1$$.
- **Nghiên cứu gì:** Phân biệt biến dạng *nội tại* (kéo giãn, xé rách bề mặt) với biến dạng *ngoại tại* (uốn cong khớp tay chân trong 3D). Nhờ bám vào $$\mathrm{I}$$, các thuật toán có thể nhận ra hai tư thế khác nhau của cùng một cơ thể người, hoặc trải bề mặt 3D xuống bản đồ UV 2D với độ méo nhỏ nhất.

### 3. Trường Jacobian nơ-ron (Neural Jacobian Fields)
- **Là gì:** Cách tiếp cận do Aigerman và cộng sự đề xuất (SIGGRAPH 2022): thay vì dự đoán thẳng tọa độ đỉnh $$F(p) \in \mathbb{R}^3$$, mạng nơ-ron học trực tiếp trường vi phân tiếp tuyến $$dF_p$$ (ma trận Jacobian trên từng tam giác), rồi khôi phục ánh xạ $$F$$ bằng cách giải một hệ tuyến tính Poisson.
- **Nghiên cứu gì:** Khắc phục điểm yếu cố hữu của học trực tiếp trên tọa độ đỉnh: vì vi phân $$dF$$ chỉ sống trên mặt phẳng tiếp tuyến và gắn chặt với dạng cơ bản thứ nhất, mô hình khái quát được sang các lưới có số đỉnh và cách chia tam giác hoàn toàn khác nhau.

## Tổng quan

Hai dạng cơ bản cung cấp bộ công cụ đầy đủ để đo đạc bề mặt: dạng thứ nhất xác định độ dài, góc và diện tích nội tại, còn dạng thứ hai mô tả cách bề mặt uốn cong trong không gian bao quanh; từ đó định nghĩa độ cong Gauss và độ cong trung bình. Bài đọc thêm này không lặp lại các phép tính $$E,F,G$$ hay $$L,M,N$$, mà giới thiệu cách đồ họa máy tính và phân tích hình dạng giai đoạn 2022–2026 vận dụng chính các khái niệm này qua *trường Jacobian*, *ánh xạ nội tại* và *độ cong rời rạc trên lưới*.

*Neural Jacobian Fields* (Aigerman, Gupta, Kim, Chaudhuri, Saito, Groueix, SIGGRAPH 2022) học một trường ma trận trên bề mặt, chiếu xuống không gian tiếp tuyến rồi giải phương trình Poisson để khôi phục ánh xạ giữa hai hình dạng — tức thao tác trực tiếp trong miền gradient nội tại gắn với dạng cơ bản thứ nhất. Song song với đó, hình học vi phân rời rạc tiếp tục sử dụng độ cong Gauss và độ cong trung bình trên lưới tam giác làm nền tảng cho các bài toán làm mượt, phân đoạn và căn khớp hình dạng (shape registration).

## Giải thích trực quan

Hãy hình dung hai chiếc áo cắt từ cùng một tấm vải nhưng mặc lên hai dáng người khác nhau: chiều dài đo theo thớ vải (hình học nội tại) gần như không đổi, còn các nếp gấp trong không gian 3D (hình học ngoại tại) thay đổi rõ rệt. Dạng cơ bản thứ nhất mô tả thước đo dọc theo thớ vải, còn dạng thứ hai mô tả các nếp uốn cong. Một ánh xạ nội tại tốt giữa hai lưới 3D cần tôn trọng dạng thứ nhất, tức không gây co giãn tùy tiện trên bề mặt.

Thay vì dự đoán trực tiếp tọa độ từng đỉnh, Neural Jacobian Fields học tại mỗi điểm một ma trận đại diện cho vi phân $$dF$$ của ánh xạ $$F$$, sau đó tìm ánh xạ $$F$$ phù hợp nhất bằng cách giải bài toán Poisson. Cách tiếp cận này nối trực tiếp với bài giải tích đa biến: ma trận Jacobian là xấp xỉ tuyến tính tốt nhất của ánh xạ, và trên bề mặt ta chỉ giữ thành phần tiếp tuyến. Ưu điểm quan trọng của phương pháp này là không đòi hỏi hai lưới tam giác (triangulation) phải có cùng cấu trúc đỉnh và cạnh.

Trên máy tính, các phiên bản rời rạc của độ cong — góc thiếu (angle defect) cho độ cong Gauss $$K$$ và toán tử Laplace–Beltrami cho độ cong trung bình $$H$$ — là công cụ chuẩn để xử lý bề mặt, từ làm mượt lưới, dòng chảy độ cong trung bình cho đến phân tích biến dạng hình học.

![Dấu của độ cong Gauss trên các mặt mẫu.](https://upload.wikimedia.org/wikipedia/commons/6/61/Gaussian_curvature.svg)
*Hình 1. Dấu của độ cong Gauss $$K$$ trên các mặt mẫu (cong âm, phẳng/triển khai được và cong dương), phản ánh dấu của tích hai độ cong chính khi chéo hóa dạng thứ hai đối với dạng thứ nhất. Nguồn: Wikimedia Commons, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

Trong một tham số hóa địa phương, dạng cơ bản thứ nhất có dạng:
$$
\mathrm{I} = E\,du^2 + 2F\,du\,dv + G\,dv^2.
$$
Một ánh xạ $$F$$ giữa hai bề mặt được gọi là *gần đẳng cự* nếu dạng kéo lùi thỏa mãn $$F^*\mathrm{I}_2 \approx \mathrm{I}_1$$. Vi phân $$dF_p: T_pM\to T_{F(p)}N$$ là biểu diễn tuyến tính cục bộ của điều kiện đó: $$dF_p$$ bảo toàn gần đúng tích vô hướng cảm sinh bởi $$\mathrm{I}$$.

Trên lưới tam giác, độ cong Gauss rời rạc tại một đỉnh trong $$v$$ thường được ước lượng qua góc thiếu:
$$
K(v) \approx \frac{2\pi - \sum_i \theta_i}{A_v},
$$
trong đó $$\theta_i$$ là các góc của các tam giác hội tụ tại đỉnh $$v$$ và $$A_v$$ là diện tích vùng trọng tâm (barycentric area) quanh $$v$$. Tuy là công thức rời rạc, đại lượng này hội tụ về độ cong Gauss trơn $$K$$ khi lưới được chia đủ mịn theo các điều kiện thích hợp.

## Khung giải thích: Tự tính góc thiếu và kiểm tra đẳng cự bằng ma trận Jacobian (nên đọc chậm)

Để thấy công thức rời rạc và điều kiện kéo lùi $$F^*\mathrm{I}_2 = \mathrm{I}_1$$ cụ thể đến mức nào, ta kiểm tra hai ví dụ chỉ cần giấy bút.

### Ví dụ 1: Ba đỉnh mẫu cho góc thiếu $$\Theta(v) = 2\pi - \sum_i \theta_i$$
1. **Đỉnh của hình lập phương (cong dương, đồng phôi mặt cầu $$S^2$$):** Tại mỗi đỉnh có 3 hình vuông gặp nhau, mỗi góc bằng $$\frac{\pi}{2}$$. Góc thiếu tại một đỉnh là:
   $$ \Theta(v) = 2\pi - 3 \cdot \frac{\pi}{2} = \frac{\pi}{2} > 0. $$
   Điều kỳ diệu xảy ra khi cộng trên cả 8 đỉnh của hình lập phương:
   $$ \sum_{v=1}^{8} \Theta(v) = 8 \cdot \frac{\pi}{2} = 4\pi = 2\pi \chi(S^2)! $$
   Dù hình lập phương "góc cạnh" hoàn toàn và phẳng lỳ trên cả 6 mặt, tổng độ cong Gauss rời rạc của nó vẫn bằng đúng $$4\pi$$ giống hệt một mặt cầu trơn!
2. **Đỉnh trên lưới tam giác đều phẳng ($$K = 0$$):** Có đúng 6 tam giác đều gặp nhau tại một đỉnh, mỗi góc bằng $$\frac{\pi}{3}$$:
   $$ \Theta(v) = 2\pi - 6 \cdot \frac{\pi}{3} = 0. $$
3. **Đỉnh yên ngựa rời rạc (cong âm, $$K < 0$$):** Giả sử ta ghép 7 tam giác đều quanh cùng một đỉnh (vượt quá $$2\pi$$ nên lưới buộc phải gợn sóng lên xuống như bèo nhún):
   $$ \Theta(v) = 2\pi - 7 \cdot \frac{\pi}{3} = -\frac{\pi}{3} < 0. $$

### Ví dụ 2: Kiểm tra trực tiếp $$F^*\mathrm{I}_2 = \mathrm{I}_1$$ qua Jacobian $$J = dF$$
Xét ánh xạ cuộn một dải phẳng $$(u, v) \in \mathbb{R}^2$$ thành mặt trụ bán kính $$R$$:
$$ F(u, v) = \left(R\cos\frac{u}{R},\; R\sin\frac{u}{R},\; v\right). $$
Ma trận Jacobian $$3 \times 2$$ của $$F$$ là:
$$ J = \begin{pmatrix} -\sin(u/R) & 0 \\ \cos(u/R) & 0 \\ 0 & 1 \end{pmatrix}. $$
Dạng cơ bản thứ nhất kéo lùi $$F^*\mathrm{I}_2$$ có ma trận chính là $$J^\top J$$:
$$ J^\top J = \begin{pmatrix} \sin^2(u/R) + \cos^2(u/R) & 0 \\ 0 & 1 \end{pmatrix} = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} = \mathrm{I}_1. $$
Mặc dù ảnh trong $$\mathbb{R}^3$$ đã cong tròn, hai cột của $$J$$ vẫn trực chuẩn tại mọi điểm nên $$F^*\mathrm{I}_2 = \mathrm{I}_1$$ tuyệt đối. Trong Neural Jacobian Fields, mạng nơ-ron học chính các ma trận $$J$$ cỡ nhỏ kiểu này trên từng tam giác, rồi giải hệ Poisson $$\min_F \sum_t A_t \|dF_t - J_t\|_F^2$$ để ghép chúng thành một biến dạng toàn cục mượt mà.

## Minh họa hình học

![Điểm yên — độ cong Gauss âm.](https://upload.wikimedia.org/wikipedia/commons/4/40/Saddle_point.png)
*Hình 2. Tại điểm yên ngựa, hai độ cong chính trái dấu nên $$K<0$$. Các thuật toán học ánh xạ hình dạng cần phân biệt rõ vùng cong âm như thế này với các vùng lồi có $$K>0$$. Nguồn: Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo.** Lý thuyết chuẩn về dạng cơ bản thứ nhất, dạng cơ bản thứ hai và các độ cong chính.

2. **Aigerman, N., Gupta, K., Kim, V. G., Chaudhuri, S., Saito, J., & Groueix, T. (2022).** *Neural Jacobian Fields: Learning Intrinsic Mappings of Arbitrary Meshes*. ACM Trans. Graph. (SIGGRAPH). doi:10.1145/3528223.3530141.

3. **Crane, K.** *Discrete Differential Geometry: An Applied Introduction*. Tài liệu hiện đại về độ cong $$K, H$$ rời rạc, là cầu nối trực tiếp giữa lý thuyết vi phân và cài đặt trên máy tính.

4. **Pressley, A.** *Elementary Differential Geometry*. Tài liệu ôn tập trực quan về ý nghĩa hình học của $$K$$ và $$H$$ trước khi chuyển sang hình học lưới.

## 🔗 Ứng dụng và kết nối liên ngành

Trong phân tích hình dạng, bài toán căn khớp hai tư thế khác nhau của cùng một cơ thể là bài toán tìm ánh xạ gần đẳng cự: khớp cử động làm thay đổi vị trí trong không gian nhưng bề mặt da hầu như không giãn. Trong đồ họa máy tính, tham số hóa UV (trải bề mặt 3D xuống mặt phẳng 2D) là bài toán tìm ánh xạ $$F$$ làm biến dạng $$\mathrm{I}$$ ít nhất có thể; Neural Jacobian Fields là một trong những mô hình học sâu đầu tiên xử lý được bài toán này trên các lưới có cấu trúc tùy ý. Trong cơ học kết cấu, độ cong trung bình liên quan đến ứng suất của vỏ mỏng, nên việc ước lượng $$H$$ trên dữ liệu quét 3D là bước đầu quan trọng trong phân tích vỏ.

## Video tham khảo

- [Shape Analysis (Lecture 6): Second fundamental form and surface curvature](https://www.youtube.com/watch?v=UewzuzaPlxA) — Justin Solomon, tiếng Anh. Nên xem trước để nắm cách tính độ cong rời rạc trên lưới (góc thiếu cho độ cong Gauss và độ cong trung bình), tương ứng với biểu thức $$K(v)$$ trong bài.
- [Tensor Calculus 12: The Metric Tensor in Curved Spaces for Measuring Arc Length](https://www.youtube.com/watch?v=SmjbpIgVKFs) — eigenchris, tiếng Anh. Trình bày dạng cơ bản thứ nhất như tensor metric trên bề mặt — thước đo độ dài mà ánh xạ gần đẳng cự cần bảo toàn.
- [Change of Variables & The Jacobian \| Multi-variable Integration](https://www.youtube.com/watch?v=wUF-lyyWpUc) — Dr. Trefor Bazett, tiếng Anh. Giải thích vai trò của ma trận Jacobian trong việc đo độ biến dạng diện tích khi đổi biến; trên bề mặt, vi phân $$dF$$ đóng vai trò tương tự trên không gian tiếp tuyến.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác họa một mặt trụ và một mặt phẳng. Chỉ ra phương có độ cong bằng không ($$K=0$$) và giải thích vì sao ánh xạ trải phẳng mặt trụ bảo toàn dạng cơ bản thứ nhất $$\mathrm{I}$$ ở phạm vi cục bộ nhưng không thể là phép đẳng cự toàn cục trên cả mặt trụ khép kín.

**Bài 2.** Trên một lưới tam giác thô xấp xỉ mặt cầu, góc thiếu tại các đỉnh thường mang giá trị dương. Hãy giải thích bằng lời mối liên hệ trực giác giữa tổng góc thiếu trên toàn bộ lưới với định lý Gauss–Bonnet (dù bạn chưa học định lý này một cách hình thức).

**Bài 3.** Nếu một mạng nơ-ron học trực tiếp tọa độ đỉnh trong $$\mathbb{R}^3$$, nó dễ phụ thuộc vào biến dạng ngoại tại. Vì sao việc học trường Jacobian *nội tại* lại phù hợp hơn với cấu trúc của dạng cơ bản thứ nhất?

---

Các khái niệm về hai dạng cơ bản vẫn là nền tảng xuyên suốt. Sang Chương 4, định lý Theorema Egregium và đường trắc địa sẽ kết nối với dòng chảy Ricci trên đồ thị và hiện tượng nghẽn thông tin (over-squashing) trong mạng nơ-ron đồ thị.
