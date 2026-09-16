---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Giả thuyết đa tạp và hình học của dữ liệu"
chapter: "00"
order: 5
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Bài này không thay thế các bài nền tảng vừa học. Đại số tuyến tính, giải tích đa biến, tô-pô và phương trình vi phân vẫn là ngôn ngữ bắt buộc; những gì theo sau chỉ là một bức thư từ tương lai gần, viết cho người vừa nắm được các chữ cái ấy, để thấy chúng đang được dùng như thế nào khi người ta cố gắng hiểu dữ liệu cao chiều.

Khoảng 2022–2026, một luận điểm cũ — *giả thuyết đa tạp* — được nhìn lại bằng thống kê nghiêm túc hơn, trong khi *học sâu hình học* (geometric deep learning) biến các đối tượng của chương này thành một bản đồ thiết kế mạng: lưới, nhóm, đồ thị, trắc địa, và chuẩn (gauge). Ở một góc nhẹ hơn, hình học thông tin nhắc rằng không gian các phân bố xác suất cũng mang một metric, và đạo hàm tự nhiên trên không gian ấy không phải đạo hàm Euclid.

Hãy đọc bài này sau khi bạn đã làm việc với không gian vector, Jacobian, tập mở, và trường vector. Mục đích không phải là học một lý thuyết mới, mà là nhận ra rằng các công cụ “khô” của Chapter 00 đang trở thành ngôn ngữ chung của hình học, học máy, và khoa học dữ liệu.

## Giải thích trực quan

Hãy tưởng tượng một cuộn giấy Swiss roll: một dải hai chiều bị cuốn trong không gian ba chiều. Nếu bạn chỉ nhìn các điểm như một đám mây trong $$\mathbb{R}^3$$, chúng có vẻ phức tạp; nếu bạn “mở” cuộn giấy ra, chúng nằm trên một hình chữ nhật phẳng. Giả thuyết đa tạp nói rằng nhiều dữ liệu thực — ảnh khuôn mặt, phổ biểu hiện gene, quỹ đạo robot — cũng vậy: chúng *trông* cao chiều vì ta nhúng chúng vào $$\mathbb{R}^N$$ lớn, nhưng chúng sống gần một đa tạp $$M$$ có chiều thấp hơn nhiều.

Whiteley, Gray và Rubin-Delanchy (bản thảo 2022, được hoàn thiện và thảo luận như một bài JRSS-B vào giữa thập niên 2020) chỉ ra rằng cấu trúc đa tạp phong phú có thể *trỗi dậy* từ một mô hình thống kê rất đơn giản: các trường ngẫu nhiên trên một không gian ẩn, cộng nhiễu. Nói cách khác, bạn không cần giả định một đa tạp “thần bí” có sẵn; tương quan và biến ẩn đã đủ để các điểm tập trung quanh một hình dạng trơn. Đây chính là lúc tô-pô và giải tích đa biến của bạn trở nên hữu ích: PCA, đồ thị kề cận, và các thuật toán trên đồ thị chỉ là cách thô để *đọc* hình dạng ấy.

Song song, Bronstein, Bruna, Cohen và Veličković đã vẽ một bản đồ — “năm chữ G”: Grids, Groups, Graphs, Geodesics, Gauges — để nói rằng hầu hết kiến trúc học sâu thành công đều là những cách rời rạc hóa các đối tượng hình học bạn sẽ gặp trong khóa này. Lưới là không gian Euclid có tọa độ; nhóm là đối xứng; đồ thị là quan hệ; trắc địa là đường thẳng nhất; chuẩn (gauge) là cách so sánh các không gian tiếp tuyến. Chapter 00 chưa định nghĩa hết các chữ ấy, nhưng nó đã cho bạn ngôn ngữ để không bị lạc khi gặp chúng.

Ở một góc nhẹ, hình học thông tin nhìn họ các phân bố xác suất như một đa tạp. Metric Fisher–Rao đo “chi phí” khi thay đổi tham số theo nghĩa thống kê, không theo nghĩa Euclid trên không gian $$(\mu,\sigma)$$. Đạo hàm tự nhiên (natural gradient) chính là gradient hiệp biến đối với metric ấy: cùng một ý tưởng “đừng trừ hai vector ở hai điểm khác nhau mà không có metric”, chỉ khác là điểm lúc này là một phân bố.

![Cuộn Swiss roll được mở ra — dữ liệu cao chiều sống gần một mặt hai chiều.](https://upload.wikimedia.org/wikipedia/commons/4/4a/Swissroll_manifold_unrolled.png)
*Hình 1. Swiss roll: một mặt 2 chiều bị nhúng vào $$\mathbb{R}^3$$. Đây là hình ảnh trực giác chuẩn của giả thuyết đa tạp. Nguồn: Wikimedia Commons, miền công cộng / tài liệu giáo khoa mở.*

## Định nghĩa hình thức và ký hiệu

**Định nghĩa (phiên bản làm việc của giả thuyết đa tạp).**
Cho dữ liệu $$x_1,\dots,x_n \in \mathbb{R}^N$$. Ta nói chúng thỏa một giả thuyết đa tạp nếu tồn tại một đa tạp trơn $$M$$ chiều $$d \ll N$$, một nhúng $$\iota: M \to \mathbb{R}^N$$, và nhiễu nhỏ $$\varepsilon_i$$ sao cho
$$
x_i = \iota(p_i) + \varepsilon_i, \qquad p_i \in M.
$$
Chiều $$d$$ là “số bậc tự do thật”; $$N$$ chỉ là chiều của hệ tọa độ quan sát.

**Trực giác.** $$M$$ là tờ giấy; $$\iota$$ là cách ta vo tờ giấy bỏ vào không gian lớn; $$\varepsilon_i$$ là nếp nhăn và nhiễu đo.

**Định nghĩa (metric Fisher–Rao, chạm nhẹ).**
Với họ phân bố $$p_\theta$$, $$\theta \in \Theta \subset \mathbb{R}^k$$, ma trận thông tin Fisher
$$
g_{ij}(\theta) = \mathbb{E}_\theta\Bigl[\partial_{\theta^i}\log p_\theta \cdot \partial_{\theta^j}\log p_\theta\Bigr]
$$
là một metric Riemann (nửa xác định dương) trên không gian tham số. Gradient tự nhiên của một hàm mất mát $$L$$ là
$$
\widetilde{\nabla} L = g(\theta)^{-1} \nabla L,
$$
tức là “nâng” gradient Euclid bằng metric thống kê.

Bạn chưa cần thành thạo hình học Riemann để hiểu câu chuyện: $$g$$ chỉ là một cách đổi thước đo, giống như đổi cơ sở trong đại số tuyến tính, và $$g^{-1}\nabla L$$ là tọa độ của cùng một covector trong cơ sở ấy.

## Minh họa hình học

![Phép chiếu stereographic: một chart từ mặt cầu xuống mặt phẳng.](https://upload.wikimedia.org/wikipedia/commons/8/88/Stereographic_projection_in_3D.svg)
*Hình 2. Một đường tròn được phủ bởi các miền tọa độ chồng lên nhau — đúng ý tưởng chart/atlas của bài tô-pô. Tác giả: Wikimedia Commons, giấy phép mở (thường CC BY-SA). Nếu ảnh không tải, hãy tưởng tượng hai cung mở phủ hết đường tròn, giao nhau ở hai đầu.*

[Image placeholder: “Sơ đồ Latent Metric Model: biến ẩn → trường ngẫu nhiên → điểm cao chiều nằm gần một đa tạp”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo, M. P.** *Differential Geometry of Curves and Surfaces*. Giáo trình nền của khóa học; giữ nguyên vai trò lý thuyết.

2. **Bronstein, M. M., Bruna, J., Cohen, T., & Veličković, P. (2021).** *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*. arXiv:2104.13478. Bản đồ thiết kế mà phần lớn công trình 2022–2026 vẫn đi theo.

3. **Whiteley, N., Gray, A., & Rubin-Delanchy, P. (2022–2025).** *Statistical exploration of the Manifold Hypothesis*. arXiv:2208.11665; phiên bản tạp chí JRSS Series B. Một giải thích thống kê cho việc dữ liệu “tự xếp” thành đa tạp.

4. **Amari, S.-I.** *Information Geometry and Its Applications*. Nền tảng cổ điển; đọc nhẹ phần Fisher–Rao để thấy giải tích đa biến sống trong thống kê.

5. **Lee, J. M.** *Introduction to Smooth Manifolds*. Để quay lại định nghĩa chart, atlas, và ánh xạ trơn khi các bài học máy dùng từ “manifold” hơi thoáng.

## 🔗 Ứng dụng và kết nối liên ngành

Trong học máy, giả thuyết đa tạp là lý do người ta tin rằng một mạng có thể học từ hữu hạn mẫu trong không gian ảnh khổng lồ: dữ liệu không lấp đầy $$\mathbb{R}^N$$, chúng nằm trên một “tờ giấy” mỏng. Trong khoa học dữ liệu, UMAP, t-SNE và các biến thể đồ thị-kề cận chỉ là những cách vẽ bản đồ địa phương của $$M$$. Trong vật lý thống kê và tối ưu, gradient tự nhiên xuất hiện mỗi khi ta không muốn thước đo Euclid trên tham số xuyên tạc hình học của mô hình.

Một ví dụ cụ thể: khi huấn luyện một mô hình xác suất, hai hướng thay đổi tham số có thể trông “bằng nhau” trên giấy nhưng một hướng làm phân bố thay đổi rất ít, hướng kia làm phân bố thay đổi rất nhiều. Metric Fisher phát hiện sự bất công ấy, đúng như Jacobian trong bài giải tích đa biến phát hiện việc đổi biến làm méo diện tích.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác một cuộn Swiss roll và đánh dấu hai điểm gần nhau theo khoảng cách trên mặt giấy nhưng xa nhau trong $$\mathbb{R}^3$$. Giải thích tại sao khoảng cách Euclid trên dữ liệu thô có thể đánh lừa một thuật toán phân cụm.

**Bài 2.** Lấy một họ Gauss một chiều $$p_{\mu}(x) = (2\pi)^{-1/2}\exp(-(x-\mu)^2/2)$$. Viết (không cần tính hết) đại lượng nào trong công thức Fisher sẽ xuất hiện, và giải thích bằng lời tại sao metric trên đường thẳng $$\mu \in \mathbb{R}$$ *không* nhất thiết là $$d\mu^2$$ thông thường nếu phương sai cũng thay đổi.

**Bài 3.** Đọc lại định nghĩa tập mở và chart ở bài tô-pô. Một thuật toán k-láng giềng trên đám mây điểm đang cố xây *cái gì* — một atlas thô, một metric thô, hay chỉ một đồ thị?

**Bài 4.** Suy ngẫm: nếu giả thuyết đa tạp sai (dữ liệu lấp đầy một hình khối), các kỹ thuật giảm chiều hình học sẽ thất bại ở chỗ nào? Hãy mô tả bằng một hình chứ không bằng một công thức.

---

Lý thuyết của Chapter 00 không thay đổi. Khi bạn sẵn sàng, hãy bước sang các đường cong trơn — và, nếu muốn, đọc tiếp bài tùy chọn của chương ấy để thấy hệ Frenet đang sống trong điều khiển robot.
