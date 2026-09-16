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

Chapter 02 dạy bạn bề mặt chính quy như một mảnh parametrization $$\mathbf{x}(u,v)$$, với mặt phẳng tiếp tuyến và pháp tuyến. Đó vẫn là định nghĩa đúng. Những gì xảy ra trong đồ họa máy tính và thị giác 3D từ khoảng 2021–2024 là một cuộc đổi ngôi của *cách biểu diễn*: thay vì lưu một lưới tam giác, người ta học một hàm ẩn — thường là hàm khoảng cách có dấu $$\mathrm{SDF}:\mathbb{R}^3\to\mathbb{R}$$ — mà bề mặt là mặt mức không, hoặc học một đám Gaussian 3D rời rạc rồi “rải” (splat) chúng lên ảnh.

NeuS (Wang và cộng sự, NeurIPS 2021, và các hậu duệ 2022–2024) gắn SDF với kết xuất thể tích sao cho mặt mức không khớp với hình học thật, không chỉ với màu sắc. 3D Gaussian Splatting (Kerbl, Kopanas, Leimkühler, Drettakis, TOG / SIGGRAPH 2023) cho thấy một biểu diễn tường minh, tối ưu được, có thể dựng cảnh thời gian thực. 2D Gaussian Splatting (2024) kéo các quả cầu ấy sát hơn vào mặt, vì hình học — không chỉ ánh sáng — mới là điều Chapter 02 quan tâm.

Bài này không dạy bạn cài đặt các phương pháp ấy. Nó chỉ nối lại một câu hỏi cổ điển: *thế nào là một bề mặt?* với câu trả lời hiện đại: *một mặt mức chỉnh quy của một hàm học được, hoặc một tập hợp các mảnh tiếp xúc nhỏ*.

## Giải thích trực quan

Hãy nhớ tấm bìa cứng đặt lên quả địa cầu: đó là mặt phẳng tiếp tuyến. Một SDF thần kinh làm điều ngược lại. Nó gán cho mỗi điểm trong không gian một số thực — âm bên trong, dương bên ngoài — và bề mặt là nơi số ấy bằng không. Nếu hàm trơn và gradient không triệt tiêu trên mặt mức, định lý hàm ẩn (bài giải tích đa biến) bảo bạn rằng tập không là một bề mặt chính quy, đúng như định nghĩa vừa học. Pháp tuyến chính là $$\nabla \mathrm{SDF}/\|\nabla \mathrm{SDF}\|$$.

Gaussian splatting thì giống việc phủ vật thể bằng vô số viên kẹo dẹt, mỗi viên có vị trí, phương sai (hình elip), màu và độ mờ. Khi chiếu, chúng chồng lên nhau thành ảnh. Để *hình học* đúng, các viên kẹo phải nằm sát mặt chứ không lơ lửng trong thể tích. Đó là lý do các biến thể 2024 nói nhiều về việc “kéo” Gaussian xuống mặt mức không: họ đang quay về mặt phẳng tiếp tuyến của bạn.

![Mặt xuyến — bề mặt chính quy kinh điển.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Hình 1. Một torus nhúng trong $$\mathbb{R}^3$$. Mọi điểm có mặt phẳng tiếp tuyến và pháp tuyến, đúng như bài bề mặt chính quy. Wikimedia Commons, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

**Định nghĩa (bề mặt như mặt mức).**
Nếu $$f:\mathbb{R}^3\to\mathbb{R}$$ thuộc lớp $$C^1$$ và $$f(p)=0$$, $$\nabla f(p)\neq 0$$, thì gần $$p$$ tập $$f^{-1}(0)$$ là một bề mặt chính quy. Pháp tuyến đơn vị là $$\mathbf{n}=\nabla f/\|\nabla f\|$$.

**Định nghĩa (mảnh Gaussian, mức trực giác).**
Một Gaussian 3D có trung tâm $$\boldsymbol{\mu}$$ và hiệp phương sai $$\Sigma$$ mô tả một “đám mây” elip
$$
G(\mathbf{x}) = \exp\bigl(-\tfrac12 (\mathbf{x}-\boldsymbol{\mu})^\top \Sigma^{-1}(\mathbf{x}-\boldsymbol{\mu})\bigr).
$$
Khi các trục của $$\Sigma$$ bị ép sát một mặt phẳng, đám mây trở thành một mảnh tiếp xúc — một lời nhắc về tấm bìa cứng của bạn.

NeuS quan sát rằng kết xuất thể tích cổ điển, nếu gắn mật độ một cách ngây thơ vào SDF, sẽ *lệch* khỏi mặt mức không. Công thức hiệu chỉnh của họ nhằm khử sai số bậc nhất ấy: một lời nhắc rằng “bề mặt” và “ảnh đẹp” không tự động trùng nhau.

## Minh họa hình học

![Mặt yên ngựa — hyperbolic paraboloid.](https://upload.wikimedia.org/wikipedia/commons/4/40/Saddle_point.png)
*Hình 2. Mặt yên: pháp tuyến thay đổi theo hai hướng ngược dấu. Đây là hình ảnh mà các phương pháp học bề mặt phải tái tạo được, không chỉ các mặt cầu trơn. Wikimedia Commons.*

[Image placeholder: “Cắt ngang SDF: đường mức f=0, mũi tên gradient làm pháp tuyến, và vài Gaussian bị kéo sát mặt”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo, Chapter 2.** Bề mặt chính quy, parametrization, pháp tuyến — không viết lại.

2. **Wang, P., Liu, L., Liu, Y., Theobalt, C., Komura, T., & Wang, W. (2021).** *NeuS: Learning Neural Implicit Surfaces by Volume Rendering for Multi-view Reconstruction*. NeurIPS 2021. Điểm khởi đầu mà các hệ 2022–2024 vẫn so sánh.

3. **Kerbl, B., Kopanas, G., Leimkühler, T., & Drettakis, G. (2023).** *3D Gaussian Splatting for Real-Time Radiance Field Rendering*. ACM Trans. Graph. 42(4). doi:10.1145/3592433.

4. **Huang, B., Yu, Z., Chen, A., Geiger, A., & Gao, S. (2024).** *2D Gaussian Splatting for Geometrically Accurate Radiance Fields*. (CVPR / arXiv:2403.17888). Kéo primitive về phía mặt, đúng tinh thần Chapter 02.

## 🔗 Ứng dụng và kết nối liên ngành

Trong thị giác máy tính, tái tạo bề mặt từ nhiều ảnh là bài toán ước lượng một đa tạp 2 chiều nhúng trong $$\mathbb{R}^3$$. Trong đồ họa, pháp tuyến từ SDF hay từ lưới quyết định tô bóng. Trong kỹ thuật ngược (reverse engineering) và y khoa, một SDF mượt cho phép tính độ dày, khoảng cách tới bề mặt, và phẫu thuật ảo. Robot nắm đồ cần đúng pháp tuyến tại điểm tiếp xúc: tấm bìa cứng không còn là ẩn dụ, nó là vector lực.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác mặt cầu $$f(x,y,z)=x^2+y^2+z^2-1$$. Tại một điểm, vẽ $$\nabla f$$ và mặt phẳng tiếp tuyến. Giải thích tại sao $$\nabla f\neq 0$$ trên mặt cầu đơn vị.

**Bài 2.** Nếu một phương pháp học SDF cho $$\nabla f \approx 0$$ tại một vùng của mặt mức không, định lý hàm ẩn nói gì? Đó có phải là chỗ hình học “gãy” — cạnh, gai, hay tự giao?

**Bài 3.** Dùng lời, không cần mã: phân biệt *ảnh đẹp từ một hướng* với *bề mặt đúng*. Vì sao Gaussian splatting có thể thắng về tốc độ kết xuất nhưng thua SDF về hình học, và vì sao các bài 2024 cố gắng lấy lại phần hình học ấy?

---

Lý thuyết bề mặt chính quy không đổi. Chapter 03 sẽ đo độ cong bằng hai dạng cơ bản; bài tùy chọn bên ấy nói về ánh xạ nội tại và Jacobian trên lưới.
