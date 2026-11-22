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

Bài đọc thêm này không thay thế các bài nền tảng trước đó. Đại số tuyến tính, giải tích đa biến, tô-pô và phương trình vi phân vẫn là ngôn ngữ bắt buộc; nội dung dưới đây chỉ nhằm minh họa cách các công cụ ấy đang được vận dụng trong việc phân tích dữ liệu cao chiều hiện nay.

Trong giai đoạn 2022–2026, một luận điểm quen thuộc — *giả thuyết đa tạp* (manifold hypothesis) — đã được xem xét lại bằng các công cụ thống kê chặt chẽ hơn. Song song với đó, *học sâu hình học* (geometric deep learning) dùng các khái niệm của chương này làm khung thiết kế kiến trúc mạng: lưới, nhóm, đồ thị, trắc địa và chuẩn (gauge). Ở một hướng khác, hình học thông tin cho thấy không gian các phân bố xác suất cũng mang cấu trúc metric, và đạo hàm phù hợp trên không gian đó là đạo hàm gắn với metric này thay vì đạo hàm Euclid thông thường.

Bạn nên đọc bài này sau khi đã nắm vững không gian vector, ma trận Jacobian, tập mở và trường vector. Mục đích không phải là học thêm một lý thuyết mới, mà là nhận ra các công cụ cơ bản của Chương 0 đã trở thành ngôn ngữ chung cho hình học, học máy và khoa học dữ liệu.

## Giải thích trực quan

Hãy hình dung một cuộn giấy Swiss roll: một dải mặt phẳng hai chiều bị cuộn lại trong không gian ba chiều. Nếu chỉ nhìn tập các điểm dữ liệu như một đám mây điểm trong $$\mathbb{R}^3$$, cấu trúc của chúng có vẻ phức tạp; nhưng khi trải phẳng cuộn giấy ra, các điểm đó đơn giản nằm trên một hình chữ nhật phẳng. Giả thuyết đa tạp cho rằng nhiều tập dữ liệu thực — như ảnh khuôn mặt, phổ biểu hiện gene hay quỹ đạo robot — cũng có tính chất tương tự: chúng có số chiều quan sát rất lớn vì được nhúng trong $$\mathbb{R}^N$$, nhưng thực chất tập trung gần một đa tạp $$M$$ có số chiều thấp hơn nhiều.

Whiteley, Gray và Rubin-Delanchy (bản thảo 2022, sau đó hoàn thiện và thảo luận trên tạp chí JRSS-B vào giữa thập niên 2020) chỉ ra rằng cấu trúc đa tạp có thể phát sinh tự nhiên từ một mô hình thống kê đơn giản: các trường ngẫu nhiên xác định trên một không gian biến ẩn cộng thêm nhiễu. Nói cách khác, không nhất thiết phải giả định sẵn một đa tạp trừu tượng nào đó; bản thân cấu trúc tương quan và các biến ẩn đã đủ khiến các điểm dữ liệu tập trung quanh một hình dạng trơn. Khi đó, các công cụ tô-pô và giải tích đa biến phát huy tác dụng: PCA, đồ thị láng giềng gần nhất và các thuật toán trên đồ thị đều là những phương pháp xấp xỉ để đọc lại hình dạng cục bộ và toàn cục ấy.

Song song với hướng thống kê, Bronstein, Bruna, Cohen và Veličković đề xuất khung nhìn "năm chữ G" — Grids (lưới), Groups (nhóm), Graphs (đồ thị), Geodesics (trắc địa), Gauges (chuẩn) — để hệ thống hóa nhiều kiến trúc học sâu dưới góc độ rời rạc hóa các đối tượng hình học. Trong khung này, lưới tương ứng với không gian Euclid có hệ tọa độ, nhóm biểu diễn đối xứng, đồ thị mô tả quan hệ, trắc địa là đường ngắn nhất cục bộ, còn chuẩn (gauge) cung cấp cách so sánh các không gian tiếp tuyến tại các điểm khác nhau. Chương 0 chưa định nghĩa đầy đủ mọi khái niệm đó, nhưng đã cung cấp ngôn ngữ nền tảng để tiếp cận chúng.

Ở góc độ thống kê, hình học thông tin xem một họ các phân bố xác suất như một đa tạp. Metric Fisher–Rao đo mức độ thay đổi giữa các tham số theo nghĩa thống kê thay vì theo khoảng cách Euclid trên không gian tham số $$(\mu,\sigma)$$. Gradient tự nhiên (natural gradient) chính là gradient được xác định theo metric ấy: cùng một nguyên tắc "không trừ trực tiếp hai vector ở các hệ thước đo khác nhau mà bỏ qua metric", chỉ khác là mỗi điểm trên đa tạp lúc này đại diện cho một phân bố xác suất.

![Cuộn Swiss roll được mở ra — dữ liệu cao chiều sống gần một mặt hai chiều.](https://upload.wikimedia.org/wikipedia/commons/4/4a/Swissroll_manifold_unrolled.png)
*Hình 1. Swiss roll: một mặt 2 chiều nhúng trong $$\mathbb{R}^3$$, minh họa trực giác cơ bản của giả thuyết đa tạp. Nguồn: Wikimedia Commons, miền công cộng / tài liệu giáo khoa mở.*

## Định nghĩa hình thức và ký hiệu

<div class="textbook-definition" markdown="1">
**Định nghĩa (phiên bản thực hành của giả thuyết đa tạp).**
Cho tập dữ liệu $$x_1,\dots,x_n \in \mathbb{R}^N$$. Ta nói tập dữ liệu này thỏa mãn giả thuyết đa tạp nếu tồn tại một đa tạp trơn $$M$$ chiều $$d \ll N$$, một phép nhúng $$\iota: M \to \mathbb{R}^N$$, và các nhiễu nhỏ $$\varepsilon_i$$ sao cho
$$
x_i = \iota(p_i) + \varepsilon_i, \qquad p_i \in M.
$$
Ở đây, $$d$$ là số bậc tự do thực sự của dữ liệu, còn $$N$$ chỉ là số chiều của không gian tọa độ quan sát.
</div>

**Trực giác:** $$M$$ đóng vai trò như tờ giấy phẳng ban đầu, $$\iota$$ là cách uốn cong tờ giấy đó trong không gian nhiều chiều, còn $$\varepsilon_i$$ là các sai số và nhiễu đo.

<div class="textbook-definition" markdown="1">
**Định nghĩa (metric Fisher–Rao, giới thiệu sơ lược).**
Với một họ phân bố xác suất $$p_\theta$$, $$\theta \in \Theta \subset \mathbb{R}^k$$, ma trận thông tin Fisher
$$
g_{ij}(\theta) = \mathbb{E}_\theta\Bigl[\partial_{\theta^i}\log p_\theta \cdot \partial_{\theta^j}\log p_\theta\Bigr]
$$
xác định một metric Riemann (nửa xác định dương) trên không gian tham số. Gradient tự nhiên của một hàm mất mát $$L$$ được cho bởi
$$
\widetilde{\nabla} L = g(\theta)^{-1} \nabla L,
$$
tức là chuyển từ covector vi phân sang vector bằng cách nhân với nghịch đảo của metric thống kê.
</div>

Ngay cả khi chưa học sâu về hình học Riemann, ta vẫn có thể hiểu ý nghĩa của công thức trên qua Đại số Tuyến tính: $$g$$ đóng vai trò thay đổi thước đo tương tự phép đổi cơ sở, còn $$g^{-1}\nabla L$$ là biểu diễn vector tương ứng của cùng một covector trong thước đo ấy.

## Minh họa hình học

![Phép chiếu stereographic: một chart từ mặt cầu xuống mặt phẳng.](https://upload.wikimedia.org/wikipedia/commons/8/88/Stereographic_projection_in_3D.svg)
*Hình 2. Phép chiếu nổi (stereographic projection) từ mặt cầu xuống mặt phẳng — ví dụ tiêu biểu cho khái niệm bản đồ tọa độ (chart) trên đa tạp trong bài tô-pô. Nguồn: Wikimedia Commons, giấy phép mở (CC BY-SA). Nếu ảnh không hiển thị, hãy hình dung phép chiếu các điểm trên mặt cầu từ cực Bắc xuống mặt phẳng tiếp xúc hoặc mặt phẳng xích đạo.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **do Carmo, M. P.** *Differential Geometry of Curves and Surfaces*. Giáo trình nền tảng của khóa học về lý thuyết đường cong và mặt.

2. **Bronstein, M. M., Bruna, J., Cohen, T., & Veličković, P. (2021).** *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*. arXiv:2104.13478. Tài liệu tổng quan định hình khung thiết kế mà nhiều nghiên cứu giai đoạn 2022–2026 tiếp tục phát triển.

3. **Whiteley, N., Gray, A., & Rubin-Delanchy, P. (2022–2025).** *Statistical exploration of the Manifold Hypothesis*. arXiv:2208.11665; phiên bản tạp chí JRSS Series B. Phân tích thống kê giải thích cơ chế hình thành cấu trúc đa tạp từ dữ liệu cao chiều.

4. **Amari, S.-I.** *Information Geometry and Its Applications*. Tài liệu kinh điển về hình học thông tin; phần về metric Fisher–Rao cho thấy cách giải tích đa biến ứng dụng trong thống kê.

5. **Lee, J. M.** *Introduction to Smooth Manifolds*. Tài liệu chuẩn để đối chiếu định nghĩa chính xác của bản đồ tọa độ (chart), tập đồ (atlas) và ánh xạ trơn khi đọc các bài báo học máy sử dụng thuật ngữ "manifold" theo nghĩa rộng hơn.

## 🔗 Ứng dụng và kết nối liên ngành

Trong học máy, giả thuyết đa tạp giải thích vì sao một mô hình có thể học từ số lượng mẫu hữu hạn dù dữ liệu nằm trong không gian ảnh có số chiều rất lớn: dữ liệu không phân bố đều khắp $$\mathbb{R}^N$$ mà tập trung quanh một mặt có chiều thấp hơn. Trong khoa học dữ liệu, các thuật toán như UMAP, t-SNE và các phương pháp dựa trên đồ thị láng giềng thực chất là cách xây dựng bản đồ tọa độ cục bộ cho $$M$$. Trong vật lý thống kê và tối ưu hóa, gradient tự nhiên được sử dụng khi thước đo Euclid trên không gian tham số không phản ánh đúng sự thay đổi của mô hình.

Cụ thể, khi huấn luyện một mô hình xác suất, hai hướng dịch chuyển tham số có cùng độ dài Euclid có thể gây ra mức thay đổi rất khác nhau đối với phân bố xác suất thực tế. Metric Fisher đo trực tiếp sự khác biệt này, tương tự cách định thức Jacobian trong giải tích đa biến đo mức độ biến dạng diện tích khi đổi hệ tọa độ.

## Video tham khảo

- [StatQuest: t-SNE, Clearly Explained](https://www.youtube.com/watch?v=NEaUSP4YerM) — StatQuest with Josh Starmer, tiếng Anh. Nên xem trước để thấy cách biểu diễn lại một đám mây điểm cao chiều sao cho vẫn giữ được quan hệ láng giềng, khớp với trực giác Swiss roll và giả thuyết đa tạp.
- [3DGV Seminar: Michael Bronstein -- Geometric Deep Learning for 3D Shape Analysis and Synthesis](https://www.youtube.com/watch?v=2Z4L2I59AKo) — 3DGV Seminar, tiếng Anh. Michael Bronstein trình bày học sâu hình học qua việc thiết kế mạng trên lưới, nhóm, đồ thị và mặt — tương ứng với khung "năm chữ G" được đề cập trong bài.
- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, tiếng Anh. Giúp củng cố hình ảnh hình học của mặt và đa tạp trước khi xem xét chúng như một giả thuyết thống kê cho dữ liệu.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác họa một cuộn Swiss roll và đánh dấu hai điểm gần nhau theo khoảng cách đo trên mặt giấy nhưng xa nhau theo khoảng cách trong $$\mathbb{R}^3$$ (hoặc ngược lại: gần nhau trong $$\mathbb{R}^3$$ nhưng xa nhau dọc theo mặt giấy). Giải thích tại sao khoảng cách Euclid trên dữ liệu thô có thể làm sai lệch kết quả của một thuật toán phân cụm.

**Bài 2.** Xét họ phân bố chuẩn một chiều $$p_{\mu}(x) = (2\pi)^{-1/2}\exp(-(x-\mu)^2/2)$$. Hãy chỉ ra (không cần tính chi tiết) đại lượng nào sẽ xuất hiện trong công thức metric Fisher, và giải thích bằng lời vì sao metric trên không gian tham số không nhất thiết là $$d\mu^2$$ thông thường nếu phương sai cũng thay đổi.

**Bài 3.** Đối chiếu lại định nghĩa tập mở và bản đồ tọa độ (chart) trong bài tô-pô. Một thuật toán $$k$$-láng giềng gần nhất trên đám mây điểm đang xấp xỉ đối tượng nào: một tập đồ thô, một metric thô, hay chỉ một đồ thị?

**Bài 4.** Nếu giả thuyết đa tạp không đúng (chẳng hạn dữ liệu phân bố dày đặc lấp đầy cả một hình khối), các kỹ thuật giảm chiều hình học sẽ gặp hạn chế ở đâu? Hãy mô tả bằng hình ảnh trực quan thay vì dùng công thức.

---

Các nội dung lý thuyết nền tảng của Chương 0 là điểm xuất phát cố định. Khi đã sẵn sàng, bạn có thể chuyển sang chương tiếp theo về đường cong trơn — và có thể đọc thêm bài tùy chọn của chương đó để xem hệ Frenet được ứng dụng như thế nào trong điều khiển robot.
