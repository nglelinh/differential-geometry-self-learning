---
layout: post
lang: vi
title: "Bài 0.3: Tô-pô Đại cương — Hình học của Màng cao su"
chapter: "00"
order: 3
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Ly cà phê và Cái bánh Donut

Có một câu đùa kinh điển: "Nhà tô-pô học là người không phân biệt được cái ly cà phê và cái bánh donut."
Tại sao? Vì nếu cái ly làm bằng đất sét dẻo, bạn có thể nặn nó thành cái bánh donut mà không cần xé rách hay dán thêm đất sét.
- Cái quai ly biến thành cái lỗ của bánh donut.
- Phần thân ly biến thành phần thịt bánh.

**Tô-pô (Topology)** là ngành toán học nghiên cứu những tính chất không thay đổi qua các phép biến đổi liên tục (co giãn, uốn nắn). Nó không quan tâm đến khoảng cách, độ dài, góc (đó là việc của Hình học). Nó chỉ quan tâm đến sự "liên kết" và "gần gũi".

Trong Hình học Vi phân, Tô-pô đóng vai trò là cái **khung xương**. Trước khi đo độ cong (hình học), chúng ta cần biết hình dáng tổng thể (tô-pô) của vật thể.

## 2. Tập Mở (Open Sets) — Viên gạch của Tô-pô

Trong Giải tích, chúng ta định nghĩa tính liên tục bằng $$\epsilon-\delta$$ (khoảng cách).
Trong Tô-pô, chúng ta không có thước đo khoảng cách. Chúng ta dùng khái niệm **Tập mở**.

### 2.1. Định nghĩa trực giác
Một tập hợp được gọi là "mở" nếu mọi điểm trong nó đều có một chút không gian xung quanh nằm trọn trong tập đó. Nó không chứa biên giới của nó.
- Khoảng $$(0, 1)$$: Mở. (Điểm 0.999 vẫn nằm trong, và xung quanh nó vẫn còn đất).
- Đoạn $$[0, 1]$$: Đóng. (Điểm 1 nằm ngay biên, bước ra ngoài là rơi xuống vực).

### 2.2. Tô-pô là gì?
Một không gian tô-pô là một tập hợp $$X$$ cùng với một danh sách các tập con được gọi là "tập mở". Danh sách này phải tuân theo 3 luật:
1.  Tập rỗng và cả tập $$X$$ đều mở.
2.  Hợp của bất kỳ số lượng tập mở nào cũng là tập mở.
3.  Giao của hữu hạn tập mở là tập mở.

### 2.3. Không gian Metric vs Không gian Tô-pô
- **Không gian Metric:** Có thước đo khoảng cách $$d(x, y)$$. Mọi không gian metric đều sinh ra một không gian tô-pô (tập mở là các hình cầu mở).
- **Không gian Tô-pô:** Tổng quát hơn, không cần thước đo.
Ví dụ: "Mạng xã hội" là một không gian tô-pô (bạn bè của bạn bè là lân cận), nhưng khó định nghĩa khoảng cách mét cụ thể.

## 3. Tính Liên tục và Phép Đồng phôi

### 3.1. Ánh xạ Liên tục (Continuous Map)
Trong giải tích: Hàm số liên tục nếu "đồ thị không bị đứt gãy".
Trong tô-pô: Ánh xạ $$f: X \to Y$$ là liên tục nếu **nghịch ảnh của mọi tập mở là tập mở**.
$$ U \subset Y \text{ mở } \Rightarrow f^{-1}(U) \subset X \text{ mở} $$
Định nghĩa này không cần dùng đến $$\epsilon-\delta$$ hay khoảng cách, nhưng nó tổng quát hóa hoàn hảo khái niệm liên tục.

### 3.2. Phép Đồng phôi (Homeomorphism)
Hai không gian $$X$$ và $$Y$$ được gọi là **đồng phôi** (giống nhau về mặt tô-pô) nếu tồn tại một ánh xạ $$f: X \to Y$$ sao cho:
1.  $$f$$ là song ánh (1-1 và lên toàn bộ).
2.  $$f$$ liên tục.
3.  $$f^{-1}$$ cũng liên tục.

Ví dụ:
- Mặt cầu và khối lập phương là đồng phôi (bạn có thể thổi phồng khối lập phương thành mặt cầu).
- Mặt cầu và mặt xuyến (donut) **không** đồng phôi (bạn không thể tạo ra cái lỗ mà không xé rách mặt cầu).

## 4. Các tính chất Tô-pô quan trọng

### 4.1. Tính Compắc (Compactness)
Một không gian là compắc nếu nó "nhỏ gọn" và "hữu hạn" theo một nghĩa nào đó.
- Trong $$\mathbb{R}^n$$: Tập compắc là tập **Đóng và Bị chặn** (Định lý Heine-Borel).
- Ví dụ: Mặt cầu là compắc. Mặt phẳng $$\mathbb{R}^2$$ không compắc (nó vô hạn). Khoảng $$(0, 1)$$ không compắc (nó không đóng).

Tại sao quan trọng?
Trên một tập compắc, mọi hàm số liên tục đều đạt giá trị lớn nhất và nhỏ nhất (Max-Min Theorem). Điều này cực kỳ quan trọng để chứng minh sự tồn tại của nghiệm (ví dụ: đường trắc địa ngắn nhất).

### 4.2. Tính Liên thông (Connectedness)
Một không gian là liên thông nếu nó là "một mảnh liền lạc", không thể bị chia cắt thành hai tập mở rời nhau.
- Ví dụ: Khoảng $$(0, 1) \cup (2, 3)$$ là không liên thông (có 2 mảnh).

### 4.3. Hausdorff
Một không gian là Hausdorff nếu hai điểm phân biệt bất kỳ luôn có thể được tách biệt bởi hai tập mở không giao nhau.
Hầu hết các không gian "đẹp" trong vật lý và hình học đều là Hausdorff. Nó đảm bảo rằng giới hạn của dãy số là duy nhất.

## 5. Đa tạp (Manifold): Ngôi sao của chương trình

Đây là định nghĩa quan trọng nhất mà bạn cần nhớ.
Một **Đa tạp topo $$n$$-chiều** $$M$$ là một không gian tô-pô thỏa mãn:
1.  **Hausdorff:** Hai điểm phân biệt tách nhau được.
2.  **Second Countable:** Có cơ sở đếm được (đảm bảo không quá to).
3.  **Locally Euclidean:** Tại mỗi điểm $$p$$, có một lân cận mở $$U$$ đồng phôi với một tập mở trong $$\mathbb{R}^n$$.

### 5.1. Bản đồ và Tập đồ (Charts and Atlases)
Để làm việc cụ thể trên đa tạp, chúng ta cần hệ tọa độ.
- **Bản đồ (Chart):** Một cặp $$(U, \varphi)$$ gồm một vùng mở $$U \subset M$$ và một phép đồng phôi $$\varphi: U \to \mathbb{R}^n$$. Nó "trải phẳng" vùng $$U$$ lên mặt giấy.
- **Tập đồ (Atlas):** Một bộ sưu tập các bản đồ phủ kín toàn bộ $$M$$.
- **Hàm chuyển (Transition Map):** Nếu hai bản đồ chồng lấn lên nhau, ta có thể đi từ bản đồ này sang bản đồ kia. Hàm chuyển $$\varphi_2 \circ \varphi_1^{-1}$$ là một hàm từ $$\mathbb{R}^n$$ vào $$\mathbb{R}^n$$. Nếu hàm này trơn (khả vi vô hạn), ta có một **Đa tạp khả vi**.

## 6. Tổng kết

Tô-pô cung cấp cho chúng ta:
1.  **Ngôn ngữ:** Tập mở, lân cận, biên.
2.  **Công cụ:** Tính liên tục, đồng phôi.
3.  **Tính chất toàn cục:** Compắc, liên thông.
4.  **Cấu trúc nền:** Định nghĩa chính xác của Đa tạp.

Hình học Vi phân xây dựng các cấu trúc đo đạc (metric, độ cong) lên trên cái nền móng tô-pô này. Một đa tạp (manifold) trước hết phải là một không gian tô-pô (cụ thể là Hausdorff và có cơ sở đếm được thứ hai), sau đó mới được trang bị thêm cấu trúc vi phân.

---
*Bài tiếp theo: Phương trình Vi phân — Quy luật của Chuyển động.*
