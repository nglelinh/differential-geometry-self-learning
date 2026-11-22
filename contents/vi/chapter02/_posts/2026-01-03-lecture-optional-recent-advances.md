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

Chương 2 trình bày bề mặt chính quy thông qua mảnh tham số hóa $$\mathbf{x}(u,v)$$, mặt phẳng tiếp tuyến và vector pháp tuyến. Định nghĩa đó vẫn là chuẩn mực toán học. Trong đồ họa máy tính và thị giác 3D giai đoạn 2021–2024, thay đổi lớn nhất nằm ở *cách biểu diễn bề mặt*: thay vì lưu trực tiếp lưới tam giác, nhiều phương pháp hiện đại học một hàm ẩn — phổ biến nhất là hàm khoảng cách có dấu $$\mathrm{SDF}:\mathbb{R}^3\to\mathbb{R}$$ — trong đó bề mặt là tập mức không, hoặc biểu diễn cảnh bằng một tập hợp các hàm Gaussian 3D rời rạc rồi chiếu ("splat") chúng lên mặt phẳng ảnh.

NeuS (Wang và cộng sự, NeurIPS 2021, cùng các phát triển kế tiếp giai đoạn 2022–2024) kết hợp SDF với kết xuất thể tích sao cho mặt mức không khớp với hình học thực thay vì chỉ tái tạo màu sắc. 3D Gaussian Splatting (Kerbl, Kopanas, Leimkühler, Drettakis, TOG / SIGGRAPH 2023) cho thấy một biểu diễn tường minh, có thể tối ưu trực tiếp, đủ khả năng kết xuất cảnh theo thời gian thực. Sau đó, 2D Gaussian Splatting (2024) ép dẹt các phần tử Gaussian sát hơn vào bề mặt nhằm đảm bảo độ chính xác về hình học chứ không chỉ về ánh sáng.

Bài đọc thêm này không đi vào chi tiết cài đặt thuật toán, mà kết nối câu hỏi cổ điển *thế nào là một bề mặt?* với các biểu diễn hiện đại: *mặt mức chính quy của một hàm học được, hoặc tập hợp các mảnh tiếp xúc nhỏ*.

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
