---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Dạng vi phân, đại số Clifford, và mạng đẳng biến"
chapter: "05"
order: 2
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Dạng vi phân là cách hiện đại để tích phân trên đa tạp: chúng ăn các bộ vector và trả về số, tự xử lý định hướng và đổi biến. Tích nêm và đạo hàm ngoài dẫn tới công thức Stokes duy nhất. Bài tùy chọn này không dạy lại $$d$$ và $$\wedge$$. Nó kể rằng, khoảng 2023, học sâu đã lấy lại đúng tinh thần ấy dưới tên *đại số hình học* (Clifford) và *transformer đẳng biến*.

Clifford Group Equivariant Neural Networks (Ruhe, Brandstetter, Forré, NeurIPS 2023) xây các lớp $$O(n)$$ và $$E(n)$$-đẳng biến bằng tích hình học trên đa vector: vô hướng, vector, 2-form, … sống trong cùng một đại số. Geometric Algebra Transformer (Brehmer, de Haan, Behrends, Cohen, NeurIPS 2023) nhúng điểm, hướng, phép tịnh tiến và phép quay vào đại số hình học xạ ảnh 16 chiều, rồi viết một transformer đẳng biến với $$E(3)$$. Cả hai đều nói một điều mà bài dạng vi phân đã chuẩn bị: *các đối tượng hình học khác bậc không nên bị ép thành cùng một vector Euclid*.

## Giải thích trực quan

Hãy nhớ 1-form như một máy đo lưu lượng qua một hướng, 2-form như máy đo thông lượng qua một mảnh diện tích. Đại số Clifford thêm một phép nhân — tích hình học — hòa cả tích vô hướng lẫn tích nêm. Một đa vector có thể chứa “một chút số, một chút mũi tên, một chút diện tích có hướng”. Khi bạn quay không gian, từng thành phần biến đổi đúng theo bậc của nó: số thì im, vector thì quay, 2-form thì quay như một diện tích.

Mạng nơ-ron thông thường không biết điều ấy. Chúng xếp mọi thứ thành một danh sách số và hy vọng phép nhân ma trận tự học đối xứng. Các mạng 2023 *ép* đối xứng: nếu thế giới quay, đầu ra phải quay cùng một luật. Đó là đẳng biến, và đại số ngoài / Clifford là ngôn ngữ tự nhiên của luật ấy — cùng ngôn ngữ với $$dx\wedge dy$$.

Ứng dụng trong bài GATr trải từ bài toán $$n$$-vật, đến ứng suất thành mạch máu trên lưới lớn, đến quy hoạch chuyển động robot: đúng những nơi bạn đã được hứa rằng dạng vi phân sống ngoài trang giáo trình.

![Định hướng trên một mặt — điều mà dạng vi phân ghi nhớ giúp ta.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Hình 1. Một mặt định hướng được (torus): 2-form thể tích “biết” mặt trên và mặt dưới. Wikimedia Commons.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại.** Một $$k$$-form tại $$p$$ là một ánh xạ đa tuyến tính phản xứng $$\omega_p:(T_pM)^k\to\mathbb{R}$$. Tích nêm thỏa $$\alpha\wedge\beta = (-1)^{\deg\alpha\deg\beta}\beta\wedge\alpha$$, và Stokes đọc
$$
\int_\Omega d\omega = \int_{\partial\Omega}\omega.
$$

**Đa vector Clifford (mức khẩu hiệu).** Đại số Clifford $$\mathrm{Cl}(\mathbb{R}^n)$$ được sinh bởi các vector với
$$
v w + w v = 2\langle v,w\rangle.
$$
Phần bậc $$0$$ là vô hướng, bậc $$1$$ là vector, bậc $$2$$ chứa các 2-form. Nhóm Clifford tác động bằng tự đẳng cấu trực giao, bảo toàn bậc và bảo toàn tích hình học: mọi đa thức theo đa vector, kể cả phép chiếu bậc, đều đẳng biến. Đó là định lý thiết kế mạng của Ruhe và cộng sự.

## Minh họa hình học

![Vận chuyển một vector quanh một vòng — cảm giác “dạng” nhớ định hướng.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2. Một vòng kín trên mặt cầu: định hướng biên và diện tích bên trong, đúng cặp mà Stokes kết nối. Fred the Oyster / Wikimedia Commons.*

[Image placeholder: “Một đa vector 3D: chấm vô hướng, mũi tên, song song có hướng; phép quay SO(3) tác động khác nhau lên từng bậc”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Spivak, M.** *Calculus on Manifolds*. Định nghĩa $$d$$, $$\wedge$$, Stokes — không viết lại.

2. **Ruhe, D., Brandstetter, J., & Forré, P. (2023).** *Clifford Group Equivariant Neural Networks*. NeurIPS 2023. arXiv:2305.11141.

3. **Brehmer, J., de Haan, P., Behrends, S., & Cohen, T. (2023).** *Geometric Algebra Transformer*. NeurIPS 2023. arXiv:2305.18415.

4. **Cohen, T., Weiler, M., Kicanaoglu, B., & Welling, M. (2019).** *Gauge Equivariant Convolutional Networks and the Icosahedral CNN*. ICML 2019. Nguồn của chữ “gauge” trong học sâu; đọc như tiền sử của các bài 2023.

## 🔗 Ứng dụng và kết nối liên ngành

Trong vật lý hạt, đẳng biến Lorentz bốn chiều xuất hiện như một thí nghiệm trong bài Clifford. Trong y sinh, ước lượng ứng suất trên lưới động mạch là tích phân một 2-form trên mặt — GATr làm việc ấy mà không phá đối xứng Euclid. Trong robot, điểm, trục quay và mặt phẳng kẹp phải sống chung một kiến trúc; đại số hình học xạ ảnh được sinh ra đúng cho việc ấy.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Viết bằng lời, không cần khai triển, sự khác nhau giữa một vector và một 2-form khi bạn đảo định hướng không gian (phép phản xạ). Mạng đẳng biến $$E(3)$$ phải làm gì với từng loại?

**Bài 2.** Stokes nói tích phân $$d\omega$$ trong $$\Omega$$ bằng tích phân $$\omega$$ trên biên. Hãy tưởng tượng một mạng “học” thông lượng qua một mặt kín. Vì sao việc biểu diễn thông lượng như 2-form (chứ không như một kênh vô hướng) giúp mạng tôn trọng định hướng?

**Bài 3.** Suy ngẫm: tích nêm phản giao hoán. Nếu một lớp mạng dùng tích hình học, chỗ nào trong công thức $$vw+wv=2\langle v,w\rangle$$ là phần đối xứng (metric) và chỗ nào là phần phản đối xứng (dạng)?

---

Ngôn ngữ dạng vi phân không đổi. Chapter 06 sẽ nói về tensor và liên kết; bài tùy chọn bên ấy nhìn các mạng đẳng biến như những liên kết rời rạc.
