---
layout: post
lang: vi
title: "Bài 0.3: Tô-pô Đại cương — Hình học của Màng cao su"
chapter: "00"
order: 3
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Chiếc ly cà phê và chiếc bánh donut

Có một câu nói đùa kinh điển trong toán học: *"Nhà tô-pô học không phân biệt được chiếc ly cà phê buổi sáng với chiếc bánh donut."* Lý do là nếu chiếc ly được nặn từ đất sét dẻo, bạn có thể biến dạng liên tục nó thành chiếc bánh donut mà không cần xé rách hay dán thêm: phần quai ly trở thành cái lỗ của bánh, còn phần thân ly dồn lại thành phần thân bánh.

**Tô-pô (Topology)** là nghệ thuật nghiên cứu những tính chất còn sống sót sau mọi phép biến dạng liên tục (co giãn, uốn nắn mà không cắt hay dán). Nếu Hình học quan tâm đến độ dài, góc đo và độ cong, thì Tô-pô bỏ sạch thước đo để chỉ giữ lại **tính liên kết** và **cấu trúc lân cận**. Trong Hình học Vi phân, Tô-pô chính là bộ khung xương: trước khi đo độ cong trên một không gian (tính chất hình học), ta phải biết hình dạng tổng thể và cách vá các mảnh bản đồ phẳng lại với nhau thành một **đa tạp (manifold)**.

**Mạch bài học:** Kiến thức cần nhớ (tập mở & liên tục, bất biến tô-pô, đa tạp & tập đồ) → Tập mở và không gian tô-pô → Ánh xạ liên tục và phép đồng phôi → Tính compắc, liên thông và Hausdorff → Đa tạp, bản đồ và tập đồ → Giải thích: tự tay dựng tập đồ 2 bản đồ chiếu nổi cho mặt cầu $$S^2$$ và kiểm tra ánh xạ chuyển trơn.

---

## Kiến thức cần nhớ: Tô-pô Đại cương là gì và đóng vai trò gì trong Hình học Vi phân?

Với sinh viên đại học đã quen định nghĩa giới hạn $$\epsilon - \delta$$ trong giải tích, tô-pô mở rộng tư duy qua **ba trụ cột lớn**:

### 1. Tập mở và Liên tục không cần thước đo
Trong giải tích, ta nói hai điểm "gần nhau" bằng khoảng cách $$\vert x - y\vert < \delta$$. Tô-pô trừu tượng hóa khái niệm "gần" bằng **họ các tập mở**, cho phép định nghĩa ánh xạ liên tục (*nghịch ảnh tập mở là tập mở*) trên những không gian không hề có khoảng cách sẵn, hoặc trước khi ta chọn một metric Riemann cụ thể.

### 2. Bất biến Tô-pô (Compắc, Liên thông, Giống $$g$$)
Hai không gian đồng phôi phải có cùng các tính chất tô-pô toàn cục: tính **compắc** (đảm bảo bài toán tìm đường trắc địa ngắn nhất có nghiệm đạt cực tiểu), tính **liên thông**, và số lỗ hổng (mặt cầu $$S^2$$ có 0 lỗ, mặt xuyến $$T^2$$ có 1 lỗ). Đặc biệt, Định lý Gauss–Bonnet về sau sẽ chứng minh một cầu nối kỳ diệu: tích phân độ cong *hình học* trên cả mặt đóng phụ thuộc hoàn toàn vào số lỗ *tô-pô*!

### 3. Đa tạp (Manifold), Bản đồ (Chart) và Tập đồ (Atlas)
Một đa tạp $$n$$-chiều là không gian cục bộ giống $$\mathbb{R}^n$$ nhưng toàn cục có thể cong và khép kín. Giống như một cuốn tập bản đồ địa lý gồm nhiều trang phẳng chồng lấn lên nhau để phủ kín Trái Đất, một **tập đồ trơn** cho phép ta thực hiện phép tính vi phân trên không gian cong bằng cách chuyển qua lại giữa các trang bản đồ qua **ánh xạ chuyển trơn**.

---

## 2. Tập Mở (Open Sets) — Nền tảng của Tô-pô

Trong Giải tích, tính liên tục được định nghĩa bằng ngôn ngữ $$\epsilon-\delta$$ dựa trên khoảng cách. Trong Tô-pô, ta không cần đến thước đo khoảng cách mà thay bằng khái niệm **tập mở**.

### 2.1. Định nghĩa trực giác
Một tập hợp được gọi là "mở" nếu quanh mọi điểm thuộc tập đó đều có một vùng lân cận nhỏ nằm hoàn toàn bên trong tập; nói cách khác, tập mở không chứa biên của nó.
- Khoảng $$(0, 1)$$ là tập mở (với mọi điểm như $$0.999$$, xung quanh nó vẫn có một khoảng nhỏ nằm gọn trong $$(0, 1)$$).
- Đoạn $$[0, 1]$$ là tập đóng (điểm $$1$$ nằm ngay trên biên, mọi lân cận quanh $$1$$ đều chứa các điểm nằm ngoài đoạn).

### 2.2. Không gian tô-pô là gì?
Một không gian tô-pô là một tập hợp $$X$$ đi kèm với một họ các tập con gọi là các "tập mở", thỏa mãn 3 tiên đề sau:
1.  Tập rỗng và toàn bộ tập $$X$$ đều là tập mở.
2.  Hợp của một họ bất kỳ các tập mở là một tập mở.
3.  Giao của hữu hạn tập mở là một tập mở.

### 2.3. Không gian Metric và Không gian Tô-pô
- **Không gian Metric:** Được trang bị một hàm khoảng cách $$d(x, y)$$. Mọi không gian metric đều sinh ra một không gian tô-pô tự nhiên (với các tập mở được xây dựng từ các hình cầu mở).
- **Không gian Tô-pô:** Tổng quát hơn, không đòi hỏi phải có thước đo khoảng cách. Chẳng hạn, một mạng xã hội có thể xem xét theo quan hệ lân cận (bạn bè của bạn bè) mà không cần một hàm khoảng cách theo nghĩa hình học thông thường.

## 3. Tính Liên tục và Phép Đồng phôi

### 3.1. Ánh xạ Liên tục (Continuous Map)
Trong giải tích, hàm số liên tục thường được hình dung là có "đồ thị liền nét, không bị đứt gãy". Trong tô-pô, ánh xạ $$f: X \to Y$$ được gọi là liên tục nếu **nghịch ảnh của mọi tập mở trong $$Y$$ là một tập mở trong $$X$$**:
$$ U \subset Y \text{ mở } \Rightarrow f^{-1}(U) \subset X \text{ mở} $$
Định nghĩa này không cần đến $$\epsilon-\delta$$ hay khoảng cách, nhưng tổng quát hóa chính xác khái niệm liên tục trong giải tích.

### 3.2. Phép Đồng phôi (Homeomorphism)
Hai không gian tô-pô $$X$$ và $$Y$$ được gọi là **đồng phôi** (tương đương về mặt tô-pô) nếu tồn tại một ánh xạ $$f: X \to Y$$ thỏa mãn ba điều kiện:
1.  $$f$$ là song ánh (đơn ánh và toàn ánh).
2.  $$f$$ liên tục.
3.  Ánh xạ ngược $$f^{-1}$$ cũng liên tục.

Ví dụ:
- Mặt cầu và bề mặt khối lập phương là đồng phôi (có thể biến dạng liên tục khối lập phương thành mặt cầu).
- Mặt cầu và mặt xuyến (hình bánh donut) **không** đồng phôi, vì không thể tạo ra lỗ xuyên qua mặt cầu mà không cắt hoặc dán.

## 4. Các tính chất Tô-pô quan trọng

### 4.1. Tính Compắc (Compactness)
Trực giác cho thấy một không gian compắc có tính chất "khép kín" và "hữu hạn" theo nghĩa tô-pô.
- Trong $$\mathbb{R}^n$$, theo Định lý Heine-Borel, một tập là compắc khi và chỉ khi nó **đóng và bị chặn**.
- Ví dụ: Mặt cầu là compắc; mặt phẳng $$\mathbb{R}^2$$ không compắc (vì không bị chặn); khoảng $$(0, 1)$$ không compắc (vì không đóng).

Tính compắc có vai trò quan trọng vì trên một không gian compắc, mọi hàm số thực liên tục đều đạt giá trị lớn nhất và giá trị nhỏ nhất (định lý cực trị). Đây là công cụ cơ bản để chứng minh sự tồn tại nghiệm của các bài toán tối ưu hình học, chẳng hạn sự tồn tại của đường trắc địa ngắn nhất.

### 4.2. Tính Liên thông (Connectedness)
Một không gian được gọi là liên thông nếu nó tạo thành một khối liền lạc, tức là không thể tách thành hợp của hai tập mở khác rỗng và rời nhau.
- Ví dụ: Tập $$(0, 1) \cup (2, 3)$$ không liên thông vì gồm hai mảnh rời nhau.

### 4.3. Tính chất Hausdorff
Một không gian tô-pô được gọi là Hausdorff nếu hai điểm phân biệt bất kỳ luôn có thể được tách bởi hai tập mở rời nhau. Hầu hết các không gian xuất hiện trong vật lý và hình học đều thỏa mãn tính chất này, nhờ đó giới hạn của một dãy hội tụ (nếu tồn tại) là duy nhất.

## 5. Đa tạp (Manifold): Đối tượng trung tâm

Một **đa tạp tô-pô $$n$$-chiều** $$M$$ là một không gian tô-pô thỏa mãn ba điều kiện:
1.  **Hausdorff:** Hai điểm phân biệt bất kỳ đều tách được bởi hai lân cận mở rời nhau.
2.  **Có cơ sở đếm được thứ hai (Second Countable):** Không gian có một cơ sở tô-pô gồm đếm được các tập mở (đảm bảo không gian không quá "lớn" về mặt tập hợp).
3.  **Euclid cục bộ (Locally Euclidean):** Tại mỗi điểm $$p \in M$$, tồn tại một lân cận mở $$U$$ đồng phôi với một tập mở trong $$\mathbb{R}^n$$.

### 5.1. Bản đồ và Tập đồ (Charts and Atlases)
Để tính toán cụ thể trên đa tạp, ta gán hệ tọa độ cho từng vùng của nó:
- **Bản đồ (Chart):** Một cặp $$(U, \varphi)$$ gồm một tập mở $$U \subset M$$ và một phép đồng phôi $$\varphi: U \to \mathbb{R}^n$$ (lên ảnh mở trong $$\mathbb{R}^n$$), giúp biểu diễn vùng $$U$$ bằng tọa độ phẳng.
- **Tập đồ (Atlas):** Một họ các bản đồ phủ kín toàn bộ đa tạp $$M$$.
- **Ánh xạ chuyển (Transition Map):** Trên phần giao của hai bản đồ, ánh xạ chuyển $$\varphi_2 \circ \varphi_1^{-1}$$ đi từ một tập mở của $$\mathbb{R}^n$$ vào $$\mathbb{R}^n$$ cho phép đổi giữa hai hệ tọa độ. Nếu mọi ánh xạ chuyển đều trơn (khả vi vô hạn), ta thu được một **đa tạp khả vi** (hay đa tạp trơn).

---

## Giải thích: tự tay dựng tập đồ 2 bản đồ cho mặt cầu $$S^2$$

Để khái niệm *bản đồ (chart)* và *ánh xạ chuyển trơn* không còn trừu tượng, hãy tự tay kiểm tra **phép chiếu nổi (stereographic projection)** trên mặt cầu đơn vị $$S^2 = \{(x,y,z) : x^2 + y^2 + z^2 = 1\}$$:

1. **Bản đồ 1 (chiếu từ Cực Bắc $$N = (0, 0, 1)$$):** Phủ toàn bộ $$U_N = S^2 \setminus \{N\}$$ lên mặt phẳng xích đạo $$z = 0$$ bằng tia thẳng nối $$N$$ với điểm $$(x, y, z) \in S^2$$:
   $$
   \varphi_N(x, y, z) \;=\; \left(\frac{x}{1 - z},\ \frac{y}{1 - z}\right) \;=\; (u, v).
   $$
   *Kiểm tra trên điểm cụ thể:* Điểm $$(1, 0, 0)$$ trên xích đạo ứng với $$(1, 0)$$; Cực Nam $$S = (0, 0, -1)$$ ứng với $$(0, 0)$$; còn điểm gần Cực Bắc $$(0.6, 0, 0.8)$$ ứng với $$(0.6 / 0.2,\ 0) = (3, 0)$$.
2. **Công thức ngược $$\varphi_N^{-1}(u, v)$$:** Đặt $$r^2 = u^2 + v^2$$, ta giải ngược lại được:
   $$
   \varphi_N^{-1}(u, v) \;=\; \left(\frac{2u}{r^2 + 1},\ \frac{2v}{r^2 + 1},\ \frac{r^2 - 1}{r^2 + 1}\right).
   $$
   (Thử thay $$(u, v) = (3, 0) \implies r^2 = 9 \implies (6/10,\ 0,\ 8/10) = (0.6, 0, 0.8)$$, chuẩn xác!)
3. **Bản đồ 2 (chiếu từ Cực Nam $$S = (0, 0, -1)$$):** Phủ toàn bộ $$U_S = S^2 \setminus \{S\}$$ bằng:
   $$
   \varphi_S(x, y, z) \;=\; \left(\frac{x}{1 + z},\ \frac{y}{1 + z}\right).
   $$
   Hai tập mở $$U_N$$ và $$U_S$$ hợp lại phủ kín 100% mặt cầu $$S^2$$!
4. **Kiểm tra ánh xạ chuyển trên phần giao $$U_N \cap U_S = S^2 \setminus \{N, S\}$$:**
   Thay $$\varphi_N^{-1}(u, v)$$ vào $$\varphi_S$$, để ý $$1 + z = 1 + \frac{r^2 - 1}{r^2 + 1} = \frac{2r^2}{r^2 + 1}$$:
   $$
   (\varphi_S \circ \varphi_N^{-1})(u, v) \;=\; \left(\frac{u}{u^2 + v^2},\ \frac{v}{u^2 + v^2}\right).
   $$
   Trên $$\mathbb{R}^2 \setminus \{(0, 0)\}$$, mẫu số $$u^2 + v^2 > 0$$ nên ánh xạ chuyển này **khả vi vô hạn lần**! Vậy mặt cầu $$S^2$$ chính thức là một **đa tạp trơn 2 chiều** được phủ gọn bởi đúng 2 bản đồ.

---

## 6. Tổng kết

Tô-pô cung cấp cho Hình học Vi phân bốn yếu tố nền tảng:
1.  **Ngôn ngữ cơ bản:** Tập mở, lân cận, biên.
2.  **Công cụ so sánh:** Ánh xạ liên tục, phép đồng phôi.
3.  **Tính chất toàn cục:** Tính compắc, tính liên thông.
4.  **Cấu trúc nền:** Định nghĩa chính xác của đa tạp.

Hình học Vi phân xây dựng các cấu trúc đo đạc (metric, độ cong) dựa trên nền tảng tô-pô này: một đa tạp trước hết là một không gian tô-pô (Hausdorff và có cơ sở đếm được thứ hai), sau đó mới được trang bị thêm cấu trúc vi phân.

---
*Bài tiếp theo: Phương trình Vi phân — Quy luật của Chuyển động.*

## Video tham khảo

- [This open problem taught me what topology is](https://www.youtube.com/watch?v=IQqtsm-bBRU) — 3Blue1Brown, tiếng Anh. Nên xem trước để thấy vì sao biến dạng liên tục (không xé, không dán) là ngôn ngữ đặc trưng của tô-pô; video cũng minh họa mặt xuyến như trong ví dụ so sánh với chiếc ly của bài.
- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, tiếng Anh. Bài giảng mở đầu của khóa hình học vi phân rời rạc tại Carnegie Mellon, giới thiệu bề mặt như một đối tượng vừa trông phẳng ở phạm vi cục bộ vừa có hình dạng toàn cục, dẫn trực tiếp đến khái niệm đa tạp.
