---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Ứng dụng: thị giác, robot, hình dạng, hyperbolic, và số GR"
chapter: "09"
order: 7
owner: "Hình học Vi phân"
lesson_type: optional
---

Khi khép lại hành trình từ đường cong phẳng đến đa tạp Riemann, nhóm Lie và sáu câu chuyện trực quan của Chương 9 — từ lát pizza, đường bay Bắc Cực, màng xà phòng, lỗ đen, quả bóng có lông cho đến tranh Escher — ta nhận ra một điều kỳ diệu: **mỗi câu chuyện tưởng chừng chỉ để thưởng thức ấy đều đang là trái tim của một nhánh công nghệ mũi nhọn giai đoạn 2022–2026!**

Độ cong Gauss $$K$$ của lát pizza nay sống trong **3D Gaussian Splatting** và **Neural Jacobian Fields**; đường trắc địa mặt cầu sống trong **tối ưu hóa Riemann (Geoopt)**; mặt phẳng hyperbolic của Escher nay trở thành không gian nhúng cây phân cấp trong **mạng nơ-ron hyperbolic** (*IEEE TPAMI*, 2022); còn đường trắc địa ánh sáng quanh lỗ đen trở thành bộ mô phỏng **GRMHD** dựng ảnh **Sagittarius A\*** của Event Horizon Telescope! Bài tùy chọn kết khóa này là bản đồ tổng hợp toàn bộ các nhịp cầu đó.

**Mạch bài học:** Kiến thức cần nhớ (bảng nối 6 câu chuyện Chương 9 với 6 mũi nhọn công nghệ 2022–2026) → Bức tranh tổng hợp & nhắc lại các biểu thức cốt lõi → Ví dụ tính số làm từng bước: so sánh nhúng cây nhị phân độ sâu $$D = 10$$ ($$1024$$ nút lá) trong mặt phẳng Euclid 2D vs. Đĩa Poincaré 2D → Giải thích: 3 trục lớn từ Hình học Vi phân cổ điển sang Công nghệ hiện đại → Tài liệu, Video & Bài tập tổng kết.

---

## Kiến thức cần nhớ: Sáu viên ngọc Chương 9 đi về đâu trong công nghệ 2022–2026?

### 1. Độ cong Nội tại & Bề mặt (Pizza & Màng xà phòng) $$\to$$ Thị giác 3D & Đồ họa
- **3D Gaussian Splatting (Kerbl et al., 2023)** và **Neural Jacobian Fields (Aigerman et al., 2022):** tái dựng và biến dạng bề mặt 3D tôn trọng hình học nội tại và độ cong Gauss $$K$$ thay vì chỉ xử lý điểm ảnh phẳng.
- **Dòng độ cong trung bình rời rạc ($$H = 0$$):** công cụ chuẩn mực để làm mượt lưới tam giác và mô phỏng vật liệu đàn hồi.

### 2. Đường Trắc địa, Nhóm Lie & Tôpô (Đường bay & Quả bóng có lông) $$\to$$ Robot & Tối ưu hóa
- **Theseus (Pineda et al., 2022)** và **Geometric Fabrics (Van Wyk et al., 2022):** tối ưu quỹ đạo và điều khiển robot trực tiếp trên $$SE(3)$$ và không gian cấu hình cong.
- **Định lý Quả bóng có lông ($$\chi(S^2) = 2$$):** lý do đồ họa 3D và điều khiển vệ tinh không bao giờ có một trường khung tiếp tuyến duy nhất không kỳ dị trên mặt cầu, buộc phải dùng nhiều bản đồ (atlas) hoặc quaternion/$$SU(2)$$.

### 3. Độ cong Âm & Không-Thời gian (Escher & Lỗ đen) $$\to$$ AI Hyperbolic & Thiên văn học số
- **Mạng nơ-ron Hyperbolic (Peng et al., IEEE TPAMI 2022)** và **Độ cong Ollivier–Ricci (Nguyen et al., ICML 2023):** khai thác độ cong âm $$K < 0$$ để biểu diễn đồ thị phân cấp và chữa nghẽn thông tin trên GNN.
- **Event Horizon Telescope (2022):** tích phân hàng triệu đường trắc địa kiểu ánh sáng trên metric Lorentz để đối chiếu ảnh lỗ đen Sagittarius A\*.

---

## Tổng quan

Chương 9 đã mở ra nhiều ví dụ trực quan của hình học vi phân: định lý pizza và độ cong Gauss, đường bay vòng tròn lớn, màng xà phòng, lỗ đen, định lý quả bóng lông và hình học hyperbolic của Escher. Bài tùy chọn này không đưa thêm định lý mới mà cập nhật, thông qua các công trình giai đoạn 2022–2026, cách từng chủ đề trên được ứng dụng trong thị giác máy tính, kỹ thuật robot, phân tích hình dạng, học sâu hyperbolic và tính toán số trong thuyết tương đối rộng.

Phần lớn các công trình sau đây đã xuất hiện rải rác ở những chương trước; bài này tổng hợp lại theo tinh thần của chương ứng dụng để tạo thành một bản đồ định hướng cho việc đọc sâu hơn sau khi hoàn thành khóa học.

## Giải thích trực quan

Nguyên lý *Theorema Egregium* đằng sau việc gập lát pizza cũng là nền tảng giải thích vì sao *3D Gaussian Splatting* cần học cấu trúc *mặt* chứ không chỉ học màu sắc (Chương 2), và vì sao *Neural Jacobian Fields* học các ánh xạ biến dạng nội tại (Chương 3). Đường bay vòng tròn lớn là đường trắc địa trên mặt cầu (Chương 4), đồng thời là quỹ đạo mà phép retraction trên $$S^2$$ xấp xỉ trong tối ưu hóa Riemann (Chương 7). Màng xà phòng thỏa mãn $$H=0$$, và các dòng chảy độ cong trung bình rời rạc vẫn là công cụ cơ bản để làm mượt lưới đa giác. Định lý quả bóng lông khẳng định không tồn tại trường vector tiếp tuyến liên tục không triệt tiêu ở mọi điểm trên $$S^2$$: đó là lý do đồ họa và robot phải xử lý điểm kỳ dị khi định hướng trên mặt cầu, cũng như lý do atlas của $$S^2$$ cần ít nhất hai bản đồ tọa độ.

Mô hình đĩa Poincaré của Escher nay không chỉ dừng ở minh họa hình học. Bài tổng quan của Peng, Varanka, Mostafa, Shi và Zhao (*IEEE TPAMI*, 2022) hệ thống hóa làn sóng mạng nơ-ron hyperbolic dùng để nhúng dữ liệu phân cấp, đồ thị, từ vựng, tế bào và hình ảnh. Không gian có độ cong âm $$K<0$$ biểu diễn cấu trúc cây hiệu quả hơn không gian Euclid vì thể tích tăng theo hàm mũ khi đi ra phía biên.

Ở mảng vật lý thiên văn, năm 2022 dự án Event Horizon Telescope (EHT) công bố hình ảnh của lỗ đen Sagittarius A* và đối chiếu vòng sáng quan sát với thư viện mô phỏng GRMHD. Đây là minh họa thực tế cho việc các đường trắc địa kiểu ánh sáng và metric Lorentz được tích phân trên quy mô lớn bằng siêu máy tính.

![Đĩa Poincaré — đường song song hyperbolic.](https://upload.wikimedia.org/wikipedia/commons/4/4c/Poincare_disc_hyperbolic_parallel_lines.svg)
*Hình 1. Trong mô hình đĩa Poincaré, "đường thẳng" là các cung tròn vuông góc với biên; qua một điểm nằm ngoài đường thẳng cho trước có vô số đường song song. Wikimedia Commons, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

Bài này không giới thiệu định nghĩa mới mà đối chiếu lại các biểu thức cốt lõi đã học xuyên suốt khóa học:

Độ cong Gauss của miếng pizza và của bề mặt được tái tạo trong thị giác máy tính đều là cùng một đại lượng $$K$$. Đường bay vòng tròn lớn là đường trắc địa thỏa phương trình Christoffel trên mặt cầu $$S^2$$ với metric tròn chuẩn. Mặt cực tiểu thỏa điều kiện $$H=0$$ (vết của dạng cơ bản thứ hai triệt tiêu). Định lý quả bóng lông khẳng định không tồn tại nhát cắt liên tục không triệt tiêu ở mọi điểm nào thuộc $$\Gamma(TS^2)$$. Metric hyperbolic trên đĩa Poincaré,
$$
g = \frac{4\,(dx^2+dy^2)}{(1-x^2-y^2)^2},
$$
chính là metric làm nền cho các thuật toán tối ưu Riemann (Geoopt, Boumal) và các lớp mạng hyperbolic. Còn metric Lorentz là đầu vào cho bước tích phân đường trắc địa trong các mã mô phỏng của EHT.

---

## Ví dụ tính số làm từng bước: Nhúng cây nhị phân độ sâu $$D = 10$$ trong Euclid 2D vs. Hyperbolic 2D

Giả sử bạn cần nhúng một **cây phân cấp nhị phân** (như cây từ vựng WordNet hay cây phân loại sinh học) có độ sâu $$D = 10$$ — đặt nút gốc tại tâm và mỗi tầng cách nhau khoảng cách $$1$$, nên tầng lá ở bán kính $$R = 10$$ có đúng $$2^{10} = 1{,}024$$ nút lá cần đặt cách đều nhau (mỗi nút chiếm ít nhất khoảng cách $$1$$ để không dính vào nhau):
- **Trong mặt phẳng Euclid 2D ($$K = 0$$):** Chu vi vòng tròn bán kính $$R = 10$$ chỉ là:
  $$
  C_{\text{Euc}}(10) = 2\pi \cdot 10 \approx 62.8.
  $$
  Bạn chỉ có chỗ cho khoảng **$$62$$ nút lá** — nhồi $$1{,}024$$ nút lá vào đó sẽ gây chồng chéo khủng khiếp, ép các mô hình học máy Euclid phải nhảy lên không gian hàng trăm chiều!
- **Trong Đĩa Poincaré 2D ($$K = -1$$):** Chu vi vòng tròn bán kính hyperbolic $$R = 10$$ là:
  $$
  C_{\text{hyp}}(10) = 2\pi \sinh(10) \approx 2\pi \cdot 11{,}013.2 \approx 69{,}198!
  $$
  Chỉ với **2 chiều duy nhất**, không gian hyperbolic cung cấp chỗ trống gấp **hơn $$1{,}100$$ lần** không gian Euclid — thừa sức trải phẳng toàn bộ $$1{,}024$$ nút lá mà vẫn giữ nguyên cấu trúc khoảng cách của cây!

---

### Giải thích: Ba trục xuyên suốt từ Lý thuyết Hình học Vi phân đến Công nghệ 2022–2026

#### Bước 1: Trục 1 — Tôn trọng tính "Nội tại" (Intrinsic Geometry)
Từ *Theorema Egregium* của Gauss (1827) đến Neural Jacobian Fields và 3D Gaussian Splatting (2022–2023): bài học lớn nhất là **đừng làm việc bằng tọa độ nhúng thô trong $$\mathbb{R}^3$$** khi bản chất bài toán nằm trên bề mặt (metric $$g$$ và độ cong $$K$$).

#### Bước 2: Trục 2 — Tôn trọng "Đường trắc địa & Độ cong" (Geodesics & Curvature)
Từ đường bay Bắc Cực, bài toán tối ưu Riemann (Geoopt, Boumal 2023) đến mạng nơ-ron hyperbolic (Peng et al., 2022) và ảnh lỗ đen (EHT 2022): chọn đúng metric $$g$$ (cầu, hyperbolic hay Lorentz) sẽ tự động sinh ra đúng đường đi ngắn nhất và đúng hình học dữ liệu.

#### Bước 3: Trục 3 — Tôn trọng "Đối xứng & Tôpô" (Symmetry & Topology)
Từ Định lý Quả bóng có lông, Nhóm Lie $$SE(3)$$ đến Theseus (2022) và EquiformerV2 (2023): cấy trực tiếp nhóm đối xứng vào kiến trúc và nhận diện sớm các rào cản tôpô (như gimbal lock hay điểm kỳ dị trên $$S^2$$) giúp hệ thống vừa chính xác, vừa tiết kiệm dữ liệu vượt bậc!

Tóm tắt hành trình trọn khóa học:

$$
\text{Đường cong \& Mặt cong}
\;\xrightarrow{\text{Tensor, Liên kết, Độ cong}}\;
\text{Đa tạp Riemann, Lie \& Lorentz}
\;\xrightarrow{\text{2022–2026}}\;
\text{Thị giác 3D, Robot, AI Hyperbolic \& EHT}.
$$

## Minh họa hình học

![Ảnh chân trời sự kiện của M87* — hình học ánh sáng quanh một hố đen.](https://upload.wikimedia.org/wikipedia/commons/4/4f/Black_hole_-_Messier_87_crop_max_res.jpg)
*Hình 2. Ảnh EHT của M87* (năm 2019; cùng chương trình quan sát dẫn tới kết quả Sgr A* năm 2022). Collaboration EHT, CC BY 4.0, qua Wikimedia Commons. Vòng sáng phản ánh hình học của các đường trắc địa kiểu ánh sáng, không phải một đĩa vật chất phẳng.*

![Trường vector trên torus — hairy ball không cấm mặt này.](https://upload.wikimedia.org/wikipedia/commons/7/75/Torus_vectors_radial.png)
*Hình 3. Hình xuyến (torus) cho phép tồn tại trường vector tiếp tuyến không triệt tiêu ở mọi điểm, trong khi mặt cầu $$S^2$$ thì không. RokerHRO / Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Hilbert & Cohn-Vossen.** *Geometry and the Imagination.* Tác phẩm kinh điển thể hiện tinh thần trực quan của Chương 9.

2. **Kerbl et al. (2023).** 3D Gaussian Splatting. **Aigerman et al. (2022).** Neural Jacobian Fields. Các ứng dụng trong thị giác máy tính và phân tích hình dạng.

3. **Van Wyk et al. (2022)** và **Pineda et al. (2022).** Kỹ thuật robot: Geometric Fabrics và thư viện Theseus.

4. **Peng, W., Varanka, T., Mostafa, A., Shi, H., & Zhao, G. (2022).** *Hyperbolic Deep Neural Networks: A Survey.* IEEE Trans. Pattern Anal. Mach. Intell. 44(12):10023–10044. doi:10.1109/TPAMI.2021.3136921.

5. **Topping et al. (2022)** và **Nguyen et al. (2023).** Độ cong đồ thị và dòng Ricci rời rạc.

6. **Event Horizon Telescope Collaboration (2022).** *First Sgr A* EHT Results. V.* ApJL 930, L16. Thuyết tương đối rộng tính toán gắn với dữ liệu quan sát.

## 🔗 Ứng dụng và kết nối liên ngành

Trong thị giác máy tính, hình học vi phân xuất hiện ở bài toán tái tạo bề mặt, đăng ký hình dạng và tham số hóa UV. Trong kỹ thuật robot, các bài toán quỹ đạo trên $$SE(3)$$, kiểm soát lực tiếp xúc theo pháp tuyến và ổn định chuyển động kiểu *Geometric Fabrics* đều dựa trên cấu trúc đa tạp. Trong phân tích hình dạng, phép so khớp gần đẳng cự giữa các tư thế và tính độ cong rời rạc trên lưới quét được dùng rộng rãi. Trong học biểu diễn, đĩa Poincaré phù hợp cho dữ liệu phân cấp. Trong thiên văn học, ảnh chân trời sự kiện được đối chiếu bằng cách tích phân đường trắc địa trên metric Kerr hoặc kết quả mô phỏng GRMHD. Trong khoa học dữ liệu, khoảng cách trắc địa trên đa tạp dữ liệu thay thế khoảng cách Euclid thô — kết nối trở lại với giả thuyết đa tạp ở Chương 0.

Chẳng hạn, khi mô phỏng một cánh tay robot cầm một miếng pizza số biểu diễn bằng lưới đa giác, thuật toán cần biến dạng lưới sao cho độ cong Gauss $$K$$ được bảo toàn trên từng vùng; nếu chỉ tối ưu vị trí đỉnh tự do trong $$\mathbb{R}^3$$, lưới sẽ bị kéo giãn phi vật lý — một biểu hiện trực tiếp của *Theorema Egregium* trong kỹ thuật mô phỏng.

## Video tham khảo

- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, tiếng Anh. Xem trước: minh họa trực quan độ cong Gauss $$K$$, kết nối lát pizza với các bài toán học hình học bề mặt.
- [Playing Sports in Hyperbolic Space - Numberphile](https://www.youtube.com/watch?v=u6Got0X41pY) — Numberphile, tiếng Anh. Trình bày đĩa Poincaré và sự tăng trưởng diện tích theo hàm mũ, giải thích vì sao không gian $$K<0$$ phù hợp để nhúng dữ liệu dạng cây hơn không gian Euclid.
- [General Relativity & Curved Spacetime Explained! \| Space Time \| PBS Digital Studios](https://www.youtube.com/watch?v=AwhKZ3fd9JA) — PBS Space Time, tiếng Anh. Trình bày đường trắc địa kiểu ánh sáng trong không-thời gian cong, kết nối với phần vòng sáng quanh lỗ đen trong bài.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Chọn *một* bài bắt buộc của Chương 9 (định lý pizza, đường bay, màng xà phòng, lỗ đen, định lý quả bóng lông hoặc Escher) và viết một đoạn ngắn kết nối nội dung bài đó với đúng *một* trích dẫn giai đoạn 2022–2026 ở trên mà không cần dùng thêm công thức mới.

**Bài 2.** Phác họa đĩa Poincaré cùng một cây phân cấp (chẳng hạn cây thư mục, từ điển hoặc cây phân loại sinh học). Giải thích vì sao càng ra gần biên càng có nhiều không gian cho các nút lá, và vì sao không gian Euclid thường phải tăng số chiều để chứa cùng một cây mà ít méo khoảng cách.

**Bài 3.** Định lý quả bóng lông khẳng định không tồn tại trường vector tiếp tuyến liên tục không triệt tiêu trên mặt cầu $$S^2$$, nhưng trường vector *pháp tuyến* đơn vị hướng ra ngoài lại tồn tại ở mọi điểm trên $$S^2 \subset \mathbb{R}^3$$. Hãy phân biệt hai loại trường này và giải thích vì sao atlas của $$S^2$$ vẫn cần ít nhất hai bản đồ cục bộ dù trường pháp tuyến tồn tại toàn cục trong $$\mathbb{R}^3$$.

**Bài 4.** Suy ngẫm cuối khóa: nếu chỉ nắm ba khái niệm cốt lõi — *nội tại*, *đường trắc địa* và *đẳng biến* — bạn đã có thể theo dõi phần lớn các công trình giai đoạn 2022–2026 ở trên chưa? Ở những bài toán nào vẫn cần tới đầy đủ tensor độ cong Riemann?

---

Toàn bộ nền tảng lý thuyết của khóa học vẫn giữ nguyên giá trị cốt lõi. Các bài tùy chọn đóng vai trò cầu nối sang các hướng nghiên cứu hiện đại dành cho người học sau khi đã đi trọn vẹn qua đường cong, mặt cong và đa tạp.
