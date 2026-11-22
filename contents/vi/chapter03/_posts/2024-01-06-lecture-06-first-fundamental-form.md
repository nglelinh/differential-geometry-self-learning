---
layout: post
lang: vi
title: "Bài 6: Thước đo của Con kiến — Dạng Cơ bản Thứ nhất"
chapter: "03"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Bài toán của người vẽ bản đồ

Hãy hình dung bạn đang vẽ bản đồ phẳng $$(u, v)$$ cho một vùng địa hình lồi lõm được mô tả bởi bề mặt $$\mathbf{r}(u, v)$$. Câu hỏi cơ bản đặt ra là: **1 cm trên bản đồ phẳng tương ứng với bao nhiêu km ngoài thực địa?**

Tỉ lệ quy đổi này thay đổi tùy theo vị trí trên bản đồ:
- Ở vùng đồng bằng phẳng, 1 cm trên bản đồ có thể tương ứng với 1 km thực tế.
- Ở vùng núi dốc, 1 cm trên bản đồ chiếu từ trên xuống có thể tương ứng với 2 km quãng đường thực tế.
- Gần cực Bắc trên phép chiếu Mercator, 1 cm trên bản đồ chỉ tương ứng với một khoảng cách rất ngắn ngoài thực địa.

**Dạng Cơ bản Thứ nhất (First Fundamental Form)** là công cụ toán học giải quyết bài toán này: nó đóng vai trò thước đo quy đổi từ các độ dịch chuyển nhỏ trên hệ tọa độ bản đồ $$(u, v)$$ sang khoảng cách, góc và diện tích thực tế trên bề mặt.

## 2. Dạng Cơ bản Thứ nhất: Tensor Metric

### 2.1. Ý tưởng trực giác
Xét một độ dịch chuyển vô cùng nhỏ $$(du, dv)$$ trong miền tham số. Vector dịch chuyển tương ứng trên bề mặt trong không gian 3 chiều là:
$$ d\mathbf{r} = \mathbf{r}_u du + \mathbf{r}_v dv $$

Bình phương độ dài thực tế của bước dịch chuyển này là:
$$ ds^2 = \| d\mathbf{r} \|^2 = d\mathbf{r} \cdot d\mathbf{r} $$
$$ ds^2 = (\mathbf{r}_u du + \mathbf{r}_v dv) \cdot (\mathbf{r}_u du + \mathbf{r}_v dv) $$
$$ ds^2 = (\mathbf{r}_u \cdot \mathbf{r}_u) du^2 + 2(\mathbf{r}_u \cdot \mathbf{r}_v) du dv + (\mathbf{r}_v \cdot \mathbf{r}_v) dv^2 $$

Đặt tên các tích vô hướng này lần lượt là $$E, F, G$$:
- $$E = \mathbf{r}_u \cdot \mathbf{r}_u$$: Hệ số co giãn theo phương tọa độ $$u$$.
- $$F = \mathbf{r}_u \cdot \mathbf{r}_v$$: Hệ số đo độ lệch góc giữa hai đường tọa độ (nếu $$F=0$$, lưới tọa độ trực giao).
- $$G = \mathbf{r}_v \cdot \mathbf{r}_v$$: Hệ số co giãn theo phương tọa độ $$v$$.

Từ đó ta thu được biểu thức của Dạng Cơ bản Thứ nhất:
$$ I = ds^2 = E du^2 + 2F du dv + G dv^2 $$

Trong ngôn ngữ hình học hiện đại, ma trận đối xứng $$\begin{pmatrix} E & F \\ F & G \end{pmatrix}$$ được gọi là **tensor metric** ($$g_{ij}$$).

### 2.2. Ví dụ: Tọa độ Cực
Xét mặt phẳng Euclid nhưng biểu diễn bằng tọa độ cực $$(r, \theta)$$:
$$ x = r \cos \theta, \quad y = r \sin \theta $$
Tính các đạo hàm riêng và tích vô hướng:
- $$\mathbf{r}_r = (\cos\theta, \sin\theta) \Rightarrow E = 1$$.
- $$\mathbf{r}_\theta = (-r\sin\theta, r\cos\theta) \Rightarrow G = r^2$$.
- $$\mathbf{r}_r \cdot \mathbf{r}_\theta = 0 \Rightarrow F = 0$$.

Do đó, metric có dạng $$ds^2 = dr^2 + r^2 d\theta^2$$.

**Ý nghĩa:**
- Khi di chuyển dọc theo phương bán kính ($$dr$$), khoảng cách thực tế đúng bằng $$1 \cdot dr$$.
- Khi di chuyển dọc theo đường tròn ($$d\theta$$), khoảng cách thực tế tỉ lệ thuận với bán kính $$r$$ (bằng $$r\,d\theta$$): ở càng xa tâm, cùng một góc quay $$d\theta$$ tương ứng với cung đường càng dài. Đó cũng là lý do trên đường chạy điền kinh hình vòng, các làn chạy phía ngoài phải đặt vạch xuất phát nhô lên trước so với làn trong.

## 3. Diện tích và Góc

Bên cạnh độ dài cung, dạng cơ bản thứ nhất cho phép tính trực tiếp cả diện tích và góc trên bề mặt.

### 3.1. Diện tích
Một hình chữ nhật vô cùng nhỏ kích thước $$du \times dv$$ trên miền tham số được ánh xạ thành một hình bình hành nhỏ trên bề mặt với phần tử diện tích:
$$ dA = \| \mathbf{r}_u \times \mathbf{r}_v \| du dv = \sqrt{EG - F^2} du dv $$

Đại lượng $$\sqrt{EG - F^2}$$ (tức $$\sqrt{\det g}$$) là nhân tử quy đổi diện tích:
- Trên mặt cầu bán kính $$R$$, nhân tử này bằng $$R^2 \sin \varphi$$.
- Gần xích đạo ($$\sin \varphi \approx 1$$), cùng một ô lưới tọa độ tương ứng với diện tích lớn nhất.
- Gần hai cực ($$\sin \varphi \approx 0$$), diện tích thực tế co dần về 0.

### 3.2. Góc
Góc $$\alpha$$ giữa hai đường cong cắt nhau trên bề mặt được xác định bằng tích vô hướng cảm sinh từ metric:
$$ \cos \alpha = \frac{\langle \mathbf{v}, \mathbf{w} \rangle}{\|\mathbf{v}\| \|\mathbf{w}\|} $$
Nếu $$F=0$$ tại mọi điểm, hai họ đường tọa độ luôn vuông góc với nhau (hệ tọa độ trực giao), như trong tọa độ cực hay tọa độ kinh–vĩ độ.

## 4. Bản chất của Hình học Nội tại

Điểm cốt lõi cần nắm là **bộ ba hàm $$E, F, G$$ chứa toàn bộ thông tin nội tại mà con kiến có thể đo được trên bề mặt**, mà không cần biết bề mặt được nhúng trong không gian 3 chiều ra sao:
- Nếu đo được $$E=1, F=0, G=1$$ ở mọi điểm, bề mặt có hình học nội tại phẳng (như mặt phẳng hoặc mặt trụ cuộn từ tờ giấy).
- Nếu đo được $$E=1, F=0, G=\sin^2 u$$, bề mặt có hình học nội tại giống mặt cầu đơn vị.

Như vậy, dạng cơ bản thứ nhất xác định **hình học nội tại** của bề mặt, phân biệt giữa độ cong thực sự do metric (như mặt cầu, không thể trải phẳng) và độ cong ngoại tại do uốn không co giãn (như mặt trụ, vốn phẳng về mặt nội tại vì có thể trải phẳng ra mặt bàn).

## Video tham khảo

- [Tensor Calculus 12: The Metric Tensor in Curved Spaces for Measuring Arc Length](https://www.youtube.com/watch?v=SmjbpIgVKFs) — eigenchris, tiếng Anh. Nên xem trước để thấy cách tensor metric đo độ dài cung trên mặt cong, đúng biểu thức $$ds^2 = E\,du^2 + 2F\,du\,dv + G\,dv^2$$ trong bài.
- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, tiếng Anh. Trình bày dạng cơ bản thứ nhất dưới dạng dạng toàn phương gắn với tham số hóa bề mặt, làm rõ nguồn gốc các hệ số $$E, F, G$$.
- [Change of Variables & The Jacobian \| Multi-variable Integration](https://www.youtube.com/watch?v=wUF-lyyWpUc) — Dr. Trefor Bazett, tiếng Anh. Giải thích nhân tử Jacobian khi đổi biến — cơ sở trực tiếp của thừa số diện tích $$\sqrt{EG-F^2}$$ khi ánh xạ từ bản đồ lên bề mặt.

## 5. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Kiểm tra mặt trụ:**
    Cho tham số hóa mặt trụ $$\mathbf{r}(u, v) = (R\cos u, R\sin u, v)$$. Hãy tính $$E, F, G$$ để thu được $$ds^2 = R^2 du^2 + dv^2$$. Sau đó đặt biến mới $$U = Ru$$ để suy ra $$ds^2 = dU^2 + dv^2$$ — trùng với metric Euclid $$dx^2 + dy^2$$ trên mặt phẳng. Điều này chứng tỏ mặt trụ đẳng cự cục bộ với mặt phẳng và có thể trải phẳng mà không bị co giãn.
2.  **Tính diện tích chỏm cầu:**
    Tính diện tích của chỏm cầu từ cực Bắc (góc cực $$\varphi = 0$$) đến góc cực $$\varphi = \alpha$$ bằng tích phân diện tích $$\iint \sqrt{EG-F^2} du dv$$. (Kết quả là $$2\pi R^2 (1-\cos\alpha)$$).
3.  **Suy ngẫm:**
    Vì sao không thể vẽ một bản đồ phẳng của Trái Đất bảo toàn đồng thời cả góc và diện tích? (Gợi ý: Mọi phép chiếu từ mặt cầu lên mặt phẳng đều làm thay đổi metric; phép chiếu Mercator bảo toàn góc nhưng làm biến dạng diện tích, còn phép chiếu Peters bảo toàn diện tích nhưng làm biến dạng góc).

---
*Dạng cơ bản thứ nhất cho phép đo độ dài, góc và diện tích ngay trên bề mặt. Để đo cách bề mặt uốn cong trong không gian 3 chiều bao quanh, bài tiếp theo sẽ giới thiệu Dạng Cơ bản Thứ hai (Second Fundamental Form).*
