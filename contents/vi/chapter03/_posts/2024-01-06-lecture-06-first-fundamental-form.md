---
layout: post
lang: vi
title: "Bài 6: Thước đo của Con kiến — Dạng Cơ bản Thứ nhất"
chapter: "03"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Vì sao đảo Greenland trông to ngang châu Phi trên bản đồ?

Mở bất kỳ bản đồ thế giới Mercator nào, bạn sẽ thấy đảo Greenland trông đồ sộ chẳng kém gì cả lục địa châu Phi — dù ngoài thực tế châu Phi rộng gấp **14 lần** Greenland! Chuyện đó xảy ra vì phép chiếu từ mặt cầu lên trang giấy phẳng làm **tỉ lệ co giãn thay đổi theo từng vị trí**: $$1\,\text{cm}$$ trên bản đồ ở xích đạo dài hơn gấp nhiều lần $$1\,\text{cm}$$ trên bản đồ ở gần cực Bắc.

Câu hỏi cốt lõi của người vẽ bản đồ — và của con kiến sống trên bề mặt cong — là: **khi ta nhích một bước nhỏ $$(du, dv)$$ trên bản đồ phẳng, quãng đường thực tế $$ds$$ ngoài bề mặt dài bao nhiêu?** Công cụ toán học trả lời trọn vẹn câu hỏi đó, đồng thời đo luôn cả **góc** và **diện tích**, chính là **Dạng Cơ bản Thứ nhất (First Fundamental Form)** — hay trong ngôn ngữ hiện đại là **tensor metric $$g_{ij}$$**.

**Mạch bài học:** Kiến thức cần nhớ (tensor metric $$g_{ij}$$, định lý Pythagoras trên mặt cong, hình học nội tại & đẳng cự) → Dạng cơ bản thứ nhất $$I = E\,du^2 + 2F\,du\,dv + G\,dv^2$$ → Ví dụ tọa độ cực → Giải thích: tự tay tính $$E, F, G$$ và tích phân diện tích $$4\pi R^2$$ cho mặt cầu bán kính $$R$$ → Diện tích, góc, hình học nội tại và Bài tập.

---

## Kiến thức cần nhớ: Dạng Cơ bản Thứ nhất và Tensor Metric là gì?

Để người tốt nghiệp đại học thấy ngay cầu nối giữa Đại số Tuyến tính (Bài 0.1) với Hình học Riemann hiện đại, hãy nắm ba trụ cột của bài học:

### 1. Tensor Metric ($$g_{ij}$$) — Tích vô hướng biến đổi theo từng điểm
Nhắc lại Bài 0.1: trên mỗi mặt phẳng tiếp tuyến $$T_P S$$, tích vô hướng Euclid của không gian $$\mathbb{R}^3$$ cảm sinh một tích vô hướng 2 chiều, biểu diễn trong cơ sở $$\{\mathbf{r}_u, \mathbf{r}_v\}$$ bởi ma trận đối xứng xác định dương $$2 \times 2$$:
$$
g = \begin{pmatrix} E & F \\ F & G \end{pmatrix} = \begin{pmatrix} \mathbf{r}_u \cdot \mathbf{r}_u & \mathbf{r}_u \cdot \mathbf{r}_v \\ \mathbf{r}_v \cdot \mathbf{r}_u & \mathbf{r}_v \cdot \mathbf{r}_v \end{pmatrix}.
$$
Đó chính là **Dạng Cơ bản Thứ nhất** — định lý Pythagoras tổng quát cho hệ trục có thể co giãn và không vuông góc!

### 2. Từ Độ dài đến Góc và Diện tích ($$\sqrt{\det g}$$)
Chỉ cần biết đúng 3 hàm $$E(u,v), F(u,v), G(u,v)$$, bạn lập tức tính được:
- **Độ dài đường cong:** $$L = \int \sqrt{E (u')^2 + 2F u' v' + G (v')^2}\,dt$$.
- **Góc giữa hai đường cong:** qua tích vô hướng $$\mathbf{v}^T g \mathbf{w}$$.
- **Diện tích miền:** $$A = \iint \sqrt{EG - F^2}\,du\,dv = \iint \sqrt{\det g}\,du\,dv$$.

### 3. Hình học Nội tại (Intrinsic Geometry) và Phép Đẳng cự
Mọi đại lượng tính được *chỉ từ $$E, F, G$$* thuộc về **hình học nội tại** — những gì con kiến tự đo được bằng thước dây mà không cần nhìn ra chiều thứ ba. Hai bề mặt có cùng dạng cơ bản thứ nhất (như tờ giấy phẳng và ống trụ cuộn lại) là **đẳng cự cục bộ** và hoàn toàn không phân biệt được dưới góc nhìn nội tại!

---

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

---

## Giải thích: tự tay tính $$E, F, G$$ và diện tích $$4\pi R^2$$ cho Mặt cầu

Hãy tính tay trọn vẹn Dạng Cơ bản Thứ nhất của **mặt cầu bán kính $$R$$** với tham số hóa $$\mathbf{r}(\varphi, \theta) = (R\sin\varphi\cos\theta,\ R\sin\varphi\sin\theta,\ R\cos\varphi)$$ ($$\varphi \in (0, \pi)$$ là góc cực, $$\theta \in [0, 2\pi)$$ là kinh độ):

1. **Bước 1 — Hai vector tiếp tuyến cơ sở:**
   $$
   \mathbf{r}_\varphi = (R\cos\varphi\cos\theta,\ R\cos\varphi\sin\theta,\ -R\sin\varphi), \qquad
   \mathbf{r}_\theta = (-R\sin\varphi\sin\theta,\ R\sin\varphi\cos\theta,\ 0).
   $$
2. **Bước 2 — Tính ba hệ số $$E, F, G$$:**
   - $$E = \mathbf{r}_\varphi \cdot \mathbf{r}_\varphi = R^2\cos^2\varphi(\cos^2\theta + \sin^2\theta) + R^2\sin^2\varphi = R^2(\cos^2\varphi + \sin^2\varphi) = \mathbf{R^2}$$.
   - $$F = \mathbf{r}_\varphi \cdot \mathbf{r}_\theta = -R^2\sin\varphi\cos\varphi\sin\theta\cos\theta + R^2\sin\varphi\cos\varphi\sin\theta\cos\theta + 0 = \mathbf{0}$$ (kinh tuyến luôn vuông góc vĩ tuyến!).
   - $$G = \mathbf{r}_\theta \cdot \mathbf{r}_\theta = R^2\sin^2\varphi(\sin^2\theta + \cos^2\theta) = \mathbf{R^2\sin^2\varphi}$$.
   Vậy metric mặt cầu là:
   $$
   ds^2 \;=\; R^2\,d\varphi^2 + R^2\sin^2\varphi\,d\theta^2.
   $$
3. **Bước 3 — Kiểm tra phần tử diện tích và diện tích toàn mặt cầu:**
   $$
   dA = \sqrt{EG - F^2}\,d\varphi\,d\theta = \sqrt{R^4\sin^2\varphi}\,d\varphi\,d\theta = R^2\sin\varphi\,d\varphi\,d\theta.
   $$
   Lấy tích phân trên toàn mặt cầu:
   $$
   A = \int_0^{2\pi} \int_0^{\pi} R^2\sin\varphi\,d\varphi\,d\theta = 2\pi R^2 \bigl[-\cos\varphi\bigr]_0^{\pi} = 2\pi R^2(1 - (-1)) = \mathbf{4\pi R^2}!
   $$
4. **Bước 4 — Đọc ra bí mật của Greenland:**
   Tại xích đạo ($$\varphi = 90^\circ, \sin\varphi = 1$$), một ô $$1^\circ \times 1^\circ$$ có diện tích tỉ lệ với $$1$$. Tại vĩ độ $$70^\circ\text{B}$$ của Greenland ($$\varphi = 20^\circ, \sin 20^\circ \approx 0.34$$), cùng ô $$1^\circ \times 1^\circ$$ chỉ rộng bằng khoảng $$1/3$$ theo chiều đông–tây — đó chính là lý do bản đồ phẳng kéo ngang Greenland phồng to một cách giả tạo!

---

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
