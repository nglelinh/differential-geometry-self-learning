---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Dạng cơ bản, Jacobian, và phân tích hình dạng"
chapter: "03"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Hai dạng cơ bản là cặp công cụ đo đạc của bề mặt: dạng thứ nhất giữ độ dài, góc, diện tích; dạng thứ hai giữ cách mặt uốn vào không gian bao quanh. Độ cong Gauss và độ cong trung bình ra đời từ cặp ấy. Bài tùy chọn này không tính lại $$E,F,G$$ hay $$e,f,g$$. Nó kể chuyện các năm 2022–2026, khi đồ họa và học hình dạng lấy lại đúng các đối tượng ấy dưới tên *trường Jacobian*, *ánh xạ nội tại*, và *độ cong rời rạc trên lưới*.

Neural Jacobian Fields (Aigerman, Gupta, Kim, Chaudhuri, Saito, Groueix, SIGGRAPH 2022) học một trường ma trận trên mặt, chiếu chúng xuống không gian tiếp tuyến, rồi giải Poisson để được một ánh xạ. Đó chính là việc làm việc trong “miền gradient nội tại” — họ hàng tính toán của dạng cơ bản thứ nhất. Song song, cộng đồng hình học rời rạc tiếp tục ước lượng độ cong Gauss và độ cong trung bình trên lưới tam giác, vì mọi thuật toán làm mượt, phân đoạn, hay đăng ký hình dạng đều cần biết mặt đang cong theo nghĩa nào.

## Giải thích trực quan

Hãy tưởng tượng hai chiếc áo cùng một mẫu vải, bị mặc lên hai cơ thể khác nhau. Sợi vải (độ dài trên mặt) gần như được bảo toàn; nếp gấp (độ uốn trong không gian) thì đổi. Dạng thứ nhất là sổ đo sợi vải; dạng thứ hai là sổ đo nếp gấp. Một ánh xạ nội tại “tốt” giữa hai lưới 3D phải tôn trọng sổ thứ nhất: nó không được kéo giãn da một cách tùy tiện.

Neural Jacobian Fields không học trực tiếp vị trí đỉnh. Nó học, tại mỗi điểm, một ma trận — ứng viên cho $$dF$$ của ánh xạ $$F$$ — rồi tìm $$F$$ gần nhất theo nghĩa Poisson. Bạn có thể nghe thấy tiếng vọng của bài giải tích đa biến: Jacobian là bản đồ tuyến tính tốt nhất, và trên bề mặt ta chỉ giữ phần tiếp xúc. Việc khung lưới (triangulation) có thể khác nhau giữa các mẫu chính là điểm mạnh: thuật toán không đòi hai hình phải “cùng một bộ đỉnh”.

Độ cong rời rạc — góc thiếu (angle defect) cho Gauss, toán tử Laplace–Beltrami cho trung bình — là cách máy tính cầm $$K$$ và $$H$$ trên tay. Không có chúng, không có làm mượt lưới, không có dòng chảy độ cong trung bình trong đồ họa, không có phân tích nếp nhăn trên khuôn mặt số.

![Dấu của độ cong Gauss trên các mặt mẫu.](https://upload.wikimedia.org/wikipedia/commons/6/61/Gaussian_curvature.svg)
*Hình 1. Đường độ cong chính trên một mặt: hình ảnh trực giác của việc chéo hóa dạng thứ hai đối với dạng thứ nhất. Wikimedia Commons, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

Trên một parametrization, dạng thứ nhất là
$$
\mathrm{I} = E\,du^2 + 2F\,du\,dv + G\,dv^2,
$$
và ánh xạ $$F$$ giữa hai bề mặt được gọi là *gần đẳng cự* khi $$F^*\mathrm{I}_2 \approx \mathrm{I}_1$$. Jacobian $$dF_p: T_pM\to T_{F(p)}N$$ là phiên bản tuyến tính của câu chuyện ấy: $$dF_p$$ bảo toàn (gần đúng) tích vô hướng cảm sinh bởi $$\mathrm{I}$$.

Độ cong Gauss rời rạc tại đỉnh $$v$$ thường lấy
$$
K(v) \approx \frac{2\pi - \sum_i \theta_i}{A_v},
$$
với $$\theta_i$$ các góc phẳng gặp tại $$v$$ và $$A_v$$ diện tích barycentric. Đây không phải định nghĩa trơn, nhưng nó hội tụ, theo nhiều nghĩa, về $$K$$ khi lưới tinh.

## Minh họa hình học

![Điểm yên — độ cong Gauss âm.](https://upload.wikimedia.org/wikipedia/commons/4/40/Saddle_point.png)
*Hình 2. Tại yên ngựa, hai độ cong chính trái dấu, $$K<0$$. Các phương pháp học ánh xạ phải phân biệt chỗ này với chỗ mũ cầu $$K>0$$. Wikimedia Commons.*

[Image placeholder: “Hai lưới khác triangulation; mũi tên trường Jacobian trên từng tam giác; ánh xạ Poisson đưa lưới này sang lưới kia”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo.** Dạng cơ bản thứ nhất và thứ hai, độ cong chính — lý thuyết giữ nguyên.

2. **Aigerman, N., Gupta, K., Kim, V. G., Chaudhuri, S., Saito, J., & Groueix, T. (2022).** *Neural Jacobian Fields: Learning Intrinsic Mappings of Arbitrary Meshes*. ACM Trans. Graph. (SIGGRAPH). doi:10.1145/3528223.3530141.

3. **Crane, K.** *Discrete Differential Geometry: An Applied Introduction*. Ghi chú hiện đại về $$K,H$$ rời rạc, vẫn là cầu nối từ lớp này sang mã máy tính.

4. **Pressley, A.** *Elementary Differential Geometry*. Để ôn ý nghĩa hình học của $$K$$ và $$H$$ trước khi đọc các bài học lưới.

## 🔗 Ứng dụng và kết nối liên ngành

Trong phân tích hình dạng, đăng ký hai tư thế của cùng một người là tìm một ánh xạ gần đẳng cự: da không giãn, chỉ khớp gập. Trong đồ họa, UV parametrization — trải mặt 3D ra 2D — chính là tìm $$F$$ sao cho $$\mathrm{I}$$ bị méo ít nhất; Neural Jacobian Fields là một trong những hệ đầu tiên *học* việc ấy trên các lưới không cùng cấu trúc. Trong kỹ thuật, độ cong trung bình điều khiển ứng suất vỏ mỏng; ước lượng $$H$$ trên lưới quét 3D là bước đầu của phân tích vỏ.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác một hình trụ và một mặt phẳng. Chỉ ra hướng nào $$K=0$$, và giải thích tại sao một ánh xạ “mở” hình trụ ra tờ giấy có thể bảo toàn $$\mathrm{I}$$ cục bộ nhưng không phải toàn cục.

**Bài 2.** Trên một lưới tam giác thô của mặt cầu, góc thiếu tại đỉnh có xu hướng dương. Hãy giải thích bằng lời tại sao tổng góc thiếu của cả lưới lại nhớ tới định lý Gauss–Bonnet, dù bạn chưa học định lý ấy chính thức.

**Bài 3.** Suy ngẫm: nếu mạng chỉ học tọa độ đỉnh trong $$\mathbb{R}^3$$, nó dễ học biến dạng ngoại tại. Vì sao học Jacobian *nội tại* lại trung thành hơn với dạng thứ nhất?

---

Hai dạng cơ bản không bị viết lại. Sang Chapter 04, Theorema Egregium và đường trắc địa sẽ gặp Ricci flow trên đồ thị và hiện tượng over-squashing của GNN.
