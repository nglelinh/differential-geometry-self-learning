---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Bề mặt ẩn và Gaussian splatting"
chapter: "02"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Trong gần nửa thế kỷ, đồ họa 3D gần như đồng nghĩa với **lưới tam giác (triangle meshes)** — hàng triệu mảnh tam giác phẳng ghép lại để xấp xỉ bề mặt cong. Thế nhưng chỉ trong giai đoạn 2021–2024, thị giác 3D và đồ họa máy tính đã trải qua hai cú xoay chuyển ngoạn mục quay trở lại tận gốc của Chương 2:
- **Bề mặt ẩn thần kinh (NeuS, 2021–2024):** thay vì lưu đỉnh và tam giác, mạng nơ-ron học một **hàm khoảng cách có dấu (SDF)** để bề mặt hiện ra đúng là *tập mức không* $$f^{-1}(0)$$.
- **3D và 2D Gaussian Splatting (2023–2024):** biểu diễn cả cảnh 3D bằng hàng trăm nghìn đĩa elip mờ có thể tối ưu trực tiếp — đủ nhanh để kết xuất thời gian thực — rồi ép dẹt chúng sát mặt phẳng tiếp tuyến để lấy lại hình học chính xác.

Bài đọc thêm này không đi vào chi tiết lập trình GPU, mà nối trực tiếp câu hỏi kinh điển của Bài 5 (*thế nào là một bề mặt chính quy?*) với hai cuộc cách mạng biểu diễn bề mặt hiện đại ấy.

**Mạch bài học:** Kiến thức cần nhớ (hàm khoảng cách có dấu SDF & phương trình Eikonal, kết xuất thể tích NeuS, Gaussian Splatting 3D/2D) → Trực giác biểu diễn ẩn và đĩa tiếp tuyến → Định nghĩa hình thức → Giải thích: tự tay kiểm tra phương trình Eikonal $$\|\nabla f\| = 1$$ cho SDF mặt cầu và kiểm tra elipxôit Gaussian ép dẹt → Ứng dụng và Bài tập.

---

## Kiến thức cần nhớ: Bề mặt Ẩn (SDF), NeuS và Gaussian Splatting là gì?

Để nhìn xuyên qua các thuật ngữ đồ họa AI và thấy đúng toán học của Chương 2 đằng sau chúng, hãy nắm ba trụ cột:

### 1. Hàm Khoảng cách Có dấu (SDF) và Phương trình Eikonal
Một **SDF** gán cho mỗi điểm $$\mathbf{x} \in \mathbb{R}^3$$ khoảng cách ngắn nhất từ $$\mathbf{x}$$ tới bề mặt (mang dấu âm nếu ở trong vật thể, dương nếu ở ngoài, và bằng $$0$$ ngay trên bề mặt). Nhờ Định lý Hàm Ẩn (Bài 0.2), chỉ cần $$\nabla \mathrm{SDF} \neq \mathbf{0}$$ trên tập mức không, ta tự động có một bề mặt chính quy với pháp tuyến đơn vị $$\mathbf{n} = \nabla \mathrm{SDF}$$ (vì SDF chuẩn luôn thỏa **phương trình Eikonal** $$\|\nabla \mathrm{SDF}\| = 1$$!).

### 2. NeuS — Khử lệch hình học trong Kết xuất Thể tích
Trong kết xuất thể tích (như NeRF), tia sáng đi qua đám mây mật độ mờ. Nếu gắn mật độ trực tiếp vào SDF một cách ngây thơ, trọng số tích lũy sẽ bị lệch khỏi mặt mức không $$f = 0$$. **NeuS** thiết kế hàm mật độ dựa trên đạo hàm của hàm logistic sao cho đỉnh trọng số rơi *đúng tuyệt đối* lên mặt mức không, biến ảnh đa góc nhìn thành bề mặt hình học sắc nét.

### 3. 3D và 2D Gaussian Splatting — Trở về với Mặt phẳng Tiếp tuyến
**3D Gaussian Splatting (2023)** thay mạng nơ-ron chậm bằng hàng trăm nghìn khối elipxôit 3D mang màu sắc và độ mờ, chiếu thẳng lên màn hình ở tốc độ trên 100 khung hình/giây. Tuy nhiên các khối 3D "bồng bềnh" khó xác định pháp tuyến bề mặt chính xác — nên **2D Gaussian Splatting (2024)** ép dẹt một trục của ma trận hiệp phương sai $$\Sigma$$ về $$0$$, biến mỗi phần tử thành một **mảnh đĩa tiếp tuyến 2D** áp sát bề mặt!

---

## Giải thích trực quan

Hãy nhớ lại hình ảnh mặt phẳng tiếp tuyến áp sát một điểm trên quả địa cầu. Một hàm khoảng cách có dấu (SDF) học bằng mạng nơ-ron tiếp cận bề mặt theo hướng ẩn: nó gán cho mỗi điểm trong $$\mathbb{R}^3$$ một số thực — âm ở bên trong vật thể, dương ở bên ngoài — và bề mặt chính là tập các điểm có giá trị bằng không. Nếu hàm trơn và gradient khác không trên tập mức không, định lý hàm ẩn (ở bài giải tích đa biến) đảm bảo tập mức không là một bề mặt chính quy đúng theo định nghĩa đã học, với vector pháp tuyến đơn vị là $$\nabla \mathrm{SDF}/\|\nabla \mathrm{SDF}\|$$.

Trong khi đó, Gaussian splatting có thể hình dung như việc phủ bề mặt vật thể bằng rất nhiều đĩa elip mờ, mỗi phần tử có tâm, ma trận hiệp phương sai (quyết định hình dạng elip), màu sắc và độ trong suốt. Khi chiếu lên camera, chúng chồng chập tạo thành hình ảnh. Để tái tạo đúng *hình học* bề mặt, các phần tử Gaussian cần nằm sát bề mặt thay vì phân tán lơ lửng trong thể tích. Đó là lý do các biến thể năm 2024 tập trung ép các phần tử Gaussian sát về bề mặt thực — tức quay trở về đúng bản chất của các mảnh mặt phẳng tiếp tuyến.

![Mặt xuyến — bề mặt chính quy kinh điển.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Hình 1. Mặt xuyến nhúng trong $$\mathbb{R}^3$$: mọi điểm đều có mặt phẳng tiếp tuyến và vector pháp tuyến xác định, đúng theo định nghĩa bề mặt chính quy. Nguồn: Wikimedia Commons, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

<div class="textbook-definition" markdown="1">
**Định nghĩa (bề mặt dưới dạng tập mức).**
Nếu $$f:\mathbb{R}^3\to\mathbb{R}$$ thuộc lớp $$C^1$$ và tại $$p$$ ta có $$f(p)=0$$, $$\nabla f(p)\neq 0$$, thì trong một lân cận của $$p$$, tập mức $$f^{-1}(0)$$ là một bề mặt chính quy. Vector pháp tuyến đơn vị tại $$p$$ được cho bởi $$\mathbf{n}=\nabla f/\|\nabla f\|$$.
</div>

<div class="textbook-definition" markdown="1">
**Định nghĩa (phần tử Gaussian, mức trực giác).**
Một hàm Gaussian 3D với tâm $$\boldsymbol{\mu}$$ và ma trận hiệp phương sai $$\Sigma$$ mô tả một phân bố dạng elipxôit:
$$
G(\mathbf{x}) = \exp\bigl(-\tfrac12 (\mathbf{x}-\boldsymbol{\mu})^\top \Sigma^{-1}(\mathbf{x}-\boldsymbol{\mu})\bigr).
$$
Khi một trục chính của $$\Sigma$$ bị ép rất nhỏ so với hai trục còn lại, phân bố này trở thành một mảnh dẹt áp sát mặt phẳng tiếp tuyến.
</div>

NeuS chỉ ra rằng nếu gắn mật độ thể tích vào hàm SDF một cách trực tiếp trong kết xuất thể tích cổ điển, vị trí bề mặt tái tạo sẽ bị lệch khỏi tập mức không. Công thức trọng số hiệu chỉnh của NeuS khử sai số bậc nhất này, cho thấy việc tạo ra "ảnh hiển thị tốt" không tự động đảm bảo "hình học bề mặt chính xác".

---

## Giải thích: tự tay kiểm tra SDF mặt cầu và elipxôit Gaussian ép dẹt

Để hai định nghĩa trên chạm xuống mặt đất, hãy tự tay tính hai ví dụ cụ thể:

### Ví dụ cầm tay 1: Kiểm tra phương trình Eikonal trên SDF của mặt cầu đơn vị
Xét hàm khoảng cách có dấu của mặt cầu đơn vị tâm $$O$$:
$$
f(x, y, z) = \sqrt{x^2 + y^2 + z^2} - 1.
$$
Kiểm tra tại điểm $$p = (3/5,\ 4/5,\ 0)$$:
1. **Có nằm trên bề mặt không?** $$f(p) = \sqrt{\frac{9}{25} + \frac{16}{25} + 0} - 1 = 1 - 1 = \mathbf{0}$$ (có!).
2. **Tính gradient $$\nabla f$$:** với $$r = \sqrt{x^2+y^2+z^2}$$, ta có $$\frac{\partial f}{\partial x} = \frac{x}{r}$$, suy ra:
   $$
   \nabla f(x, y, z) = \left(\frac{x}{r},\ \frac{y}{r},\ \frac{z}{r}\right) \implies \nabla f(p) = \left(\frac{3}{5},\ \frac{4}{5},\ 0\right).
   $$
3. **Kiểm tra phương trình Eikonal:** $$\|\nabla f(p)\| = \sqrt{\frac{9}{25} + \frac{16}{25} + 0} = \mathbf{1}$$! Tại mọi điểm $$r > 0$$, $$\|\nabla f\| \equiv 1$$ — đó là lý do các mạng nơ-ron học SDF luôn thêm số hạng phạt *Eikonal loss* $$\bigl(\|\nabla f_\theta\| - 1\bigr)^2$$ vào hàm mất mát để ép hàm học được hành xử đúng như khoảng cách thực!

### Ví dụ cầm tay 2: Ép dẹt elipxôit Gaussian thành mảnh tiếp tuyến 2D
Xét phần tử Gaussian đặt tại tâm $$\boldsymbol{\mu} = (0, 0, 0)$$ với ma trận hiệp phương sai chéo:
$$
\Sigma = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 0.01 \end{pmatrix} \implies \Sigma^{-1} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 100 \end{pmatrix}.
$$
Xét mặt mức mật độ $$(\mathbf{x} - \boldsymbol{\mu})^\top \Sigma^{-1} (\mathbf{x} - \boldsymbol{\mu}) = 1$$:
$$
x^2 + y^2 + 100 z^2 = 1 \iff \frac{x^2}{1^2} + \frac{y^2}{1^2} + \frac{z^2}{(0.1)^2} = 1.
$$
Đó là một chiếc đĩa dẹt có bán kính ngang $$1$$ nhưng bề dày theo trục $$z$$ chỉ còn $$0.1$$ — bám sát mặt phẳng tiếp tuyến $$z = 0$$ với vector pháp tuyến chính là trục riêng ứng với trị riêng nhỏ nhất $$\mathbf{e}_3 = (0, 0, 1)$$!

---

## Minh họa hình học

![Mặt yên ngựa — hyperbolic paraboloid.](https://upload.wikimedia.org/wikipedia/commons/4/40/Saddle_point.png)
*Hình 2. Mặt yên ngựa (hyperbolic paraboloid): pháp tuyến biến thiên theo hai phương với chiều cong ngược dấu. Các phương pháp tái tạo bề mặt cần nắm bắt được cả những vùng yên ngựa như thế này chứ không chỉ các mặt lồi. Nguồn: Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo, Chapter 2.** Lý thuyết nền tảng về bề mặt chính quy, tham số hóa và vector pháp tuyến.

2. **Wang, P., Liu, L., Liu, Y., Theobalt, C., Komura, T., & Wang, W. (2021).** *NeuS: Learning Neural Implicit Surfaces by Volume Rendering for Multi-view Reconstruction*. NeurIPS 2021. Mốc tham chiếu nền tảng cho nhiều hệ tái tạo bề mặt ẩn giai đoạn 2022–2024.

3. **Kerbl, B., Kopanas, G., Leimkühler, T., & Drettakis, G. (2023).** *3D Gaussian Splatting for Real-Time Radiance Field Rendering*. ACM Trans. Graph. 42(4). doi:10.1145/3592433.

4. **Huang, B., Yu, Z., Chen, A., Geiger, A., & Gao, S. (2024).** *2D Gaussian Splatting for Geometrically Accurate Radiance Fields*. (CVPR / arXiv:2403.17888). Hướng tiếp cận ép các phần tử cơ sở sát vào bề mặt để cải thiện độ chính xác hình học, gắn chặt với nội dung Chương 2.

## 🔗 Ứng dụng và kết nối liên ngành

Trong thị giác máy tính, tái tạo bề mặt 3D từ nhiều góc chụp thực chất là bài toán ước lượng một đa tạp 2 chiều nhúng trong $$\mathbb{R}^3$$. Trong đồ họa máy tính, vector pháp tuyến trích xuất từ SDF hay từ lưới quyết định chất lượng tô bóng. Trong kỹ thuật ngược (reverse engineering) và hình ảnh y khoa, biểu diễn SDF trơn hỗ trợ tính độ dày mô, khoảng cách tới bề mặt và mô phỏng phẫu thuật. Trong robotics, thao tác cầm nắm đòi hỏi biết chính xác vector pháp tuyến tại điểm tiếp xúc để xác định hướng lực tác dụng.

## Video tham khảo

- [3D Gaussian Splatting for Real-Time Radiance Field Rendering](https://www.youtube.com/watch?v=T_kXY43VZnk) — GraphDeco Inria Research Group, tiếng Anh. Nên xem trước để theo dõi trực tiếp công trình 3D Gaussian Splatting được trích dẫn trong bài: mỗi phần tử Gaussian là một elipxôit được tối ưu và chiếu lên ảnh.
- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, tiếng Anh. Nhắc lại khái niệm pháp tuyến và mặt phẳng tiếp tuyến cổ điển, giúp hiểu vì sao các phần tử Gaussian cần được ép dẹt sát bề mặt thay vì phân tán trong thể tích.
- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, tiếng Anh. Cung cấp bối cảnh xử lý hình học: bề mặt là đối tượng 3D mà thị giác máy tính hiện đại đang tái tạo bằng hàm ẩn hoặc các phần tử cơ sở tường minh.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Xét mặt cầu cho bởi phương trình ẩn $$f(x,y,z)=x^2+y^2+z^2-1=0$$. Tại một điểm trên mặt cầu, phác họa vector $$\nabla f$$ và mặt phẳng tiếp tuyến, đồng thời giải thích vì sao $$\nabla f\neq 0$$ tại mọi điểm của mặt cầu đơn vị.

**Bài 2.** Nếu một mô hình học SDF cho ra $$\nabla f \approx 0$$ trên một vùng của tập mức không, định lý hàm ẩn cho biết điều gì? Vùng đó có thể tương ứng với những đặc trưng hình học không trơn nào (như cạnh sắc, đỉnh nhọn hay tự cắt)?

**Bài 3.** Phân biệt bằng lời giữa *ảnh hiển thị tốt từ một góc nhìn* và *bề mặt hình học đúng*. Giải thích vì sao 3D Gaussian Splatting có lợi thế về tốc độ kết xuất nhưng thường kém chính xác hơn SDF về hình học bề mặt, và vì sao các nghiên cứu năm 2024 tìm cách khắc phục hạn chế này.

---

Lý thuyết bề mặt chính quy là nền tảng cố định. Chương 3 sẽ giới thiệu cách đo khoảng cách và độ cong trên bề mặt thông qua hai dạng cơ bản; bài tùy chọn của chương đó bàn về ánh xạ nội tại và ma trận Jacobian trên lưới rời rạc.
