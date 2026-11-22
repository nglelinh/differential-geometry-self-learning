---
layout: post
lang: vi
title: "Bài 0.3: Tô-pô Đại cương — Hình học của Màng cao su"
chapter: "00"
order: 3
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Chiếc ly cà phê và chiếc bánh donut

Có một câu nói đùa quen thuộc trong toán học: "Nhà tô-pô học không phân biệt được chiếc ly cà phê và chiếc bánh donut." Lý do là nếu chiếc ly được làm từ đất sét dẻo, ta có thể biến dạng liên tục nó thành hình chiếc bánh donut mà không cần xé rách hay dán dính thêm phần nào: phần quai ly trở thành cái lỗ của bánh, còn phần thân ly dồn lại thành phần thân bánh.

**Tô-pô (Topology)** là ngành toán học nghiên cứu những tính chất bất biến qua các phép biến đổi liên tục (co giãn, uốn nắn mà không cắt hay dán). Khác với Hình học vốn quan tâm đến khoảng cách, độ dài và góc, Tô-pô chỉ tập trung vào tính "liên kết" và khái niệm "lân cận".

Trong Hình học Vi phân, Tô-pô đóng vai trò là phần khung nền: trước khi đo độ cong (tính chất hình học), ta cần xác định hình dạng tổng thể và cấu trúc lân cận (tính chất tô-pô) của không gian.

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
