---
layout: post
lang: vi
title: "Bài 6: Thước đo của Con kiến — Dạng Cơ bản Thứ nhất"
chapter: "03"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Bài toán của những Nhà làm Bản đồ

Hãy tưởng tượng bạn là một nhà thám hiểm đang vẽ bản đồ cho một vùng đất mới.
Bạn có một tờ giấy phẳng $$(u, v)$$.
Bạn có một bề mặt thực địa lồi lõm $$\mathbf{r}(u, v)$$.
Vấn đề là: **1 cm trên bản đồ của bạn tương ứng với bao nhiêu km ngoài thực địa?**

Câu trả lời không đơn giản.
- Ở vùng đồng bằng, 1 cm có thể là 1 km.
- Ở vùng núi dốc, 1 cm trên bản đồ (nhìn từ trên xuống) có thể tương ứng với 2 km leo dốc.
- Ở gần cực Bắc (trên bản đồ Mercator), 1 cm có thể chỉ là vài mét.

**Dạng Cơ bản Thứ nhất (First Fundamental Form)** chính là công cụ toán học để giải quyết vấn đề này. Nó là "bảng quy đổi tỉ giá" từ tọa độ bản đồ sang khoảng cách thực tế.

## 2. Dạng Cơ bản Thứ nhất: Metric Tensor

### 2.1. Ý tưởng trực giác
Xét một bước đi vô cùng nhỏ trên bản đồ: $$(du, dv)$$.
Vector dịch chuyển thực tế trong không gian là:
$$ d\mathbf{r} = \mathbf{r}_u du + \mathbf{r}_v dv $$

Bình phương độ dài thực tế của bước đi này là:
$$ ds^2 = \| d\mathbf{r} \|^2 = d\mathbf{r} \cdot d\mathbf{r} $$
$$ ds^2 = (\mathbf{r}_u du + \mathbf{r}_v dv) \cdot (\mathbf{r}_u du + \mathbf{r}_v dv) $$
$$ ds^2 = (\mathbf{r}_u \cdot \mathbf{r}_u) du^2 + 2(\mathbf{r}_u \cdot \mathbf{r}_v) du dv + (\mathbf{r}_v \cdot \mathbf{r}_v) dv^2 $$

Chúng ta đặt tên cho các tích vô hướng này là $$E, F, G$$:
- $$E = \mathbf{r}_u \cdot \mathbf{r}_u$$: Hệ số co giãn theo hướng $$u$$.
- $$F = \mathbf{r}_u \cdot \mathbf{r}_v$$: Hệ số méo góc (nếu $$F=0$$, lưới tọa độ vuông góc).
- $$G = \mathbf{r}_v \cdot \mathbf{r}_v$$: Hệ số co giãn theo hướng $$v$$.

Vậy công thức thần thánh của chúng ta là:
$$ I = ds^2 = E du^2 + 2F du dv + G dv^2 $$

Trong ngôn ngữ hiện đại, chúng ta gọi ma trận $$\begin{pmatrix} E & F \\ F & G \end{pmatrix}$$ là **Tensor Metric** ($$g_{ij}$$).

### 2.2. Ví dụ Kinh điển: Tọa độ Cực
Xét mặt phẳng phẳng lì, nhưng dùng tọa độ cực $$(r, \theta)$$.
$$ x = r \cos \theta, \quad y = r \sin \theta $$
- $$\mathbf{r}_r = (\cos\theta, \sin\theta)$$. Suy ra $$E = 1$$.
- $$\mathbf{r}_\theta = (-r\sin\theta, r\cos\theta)$$. Suy ra $$G = r^2$$.
- $$\mathbf{r}_r \cdot \mathbf{r}_\theta = 0$$. Suy ra $$F = 0$$.

Metric: $$ds^2 = dr^2 + r^2 d\theta^2$$.

**Ý nghĩa:**
- Đi theo hướng bán kính ($$dr$$): Khoảng cách là thật ($$1 \cdot dr$$).
- Đi theo vòng tròn ($$d\theta$$): Khoảng cách bị phóng đại theo $$r$$. Ở xa tâm ($$r$$ lớn), cùng một góc quay $$d\theta$$ tương ứng với quãng đường dài hơn rất nhiều ($$r d\theta$$).
Đó là lý do tại sao các đường chạy điền kinh ở làn ngoài cùng phải xuất phát trước làn trong cùng!

## 3. Diện tích và Góc

Dạng cơ bản thứ nhất không chỉ đo độ dài, nó đo cả diện tích và góc.

### 3.1. Diện tích
Một hình chữ nhật nhỏ kích thước $$du \times dv$$ trên bản đồ sẽ biến thành một hình bình hành cong trên bề mặt thực tế.
Diện tích thực tế của nó là:
$$ dA = \| \mathbf{r}_u \times \mathbf{r}_v \| du dv = \sqrt{EG - F^2} du dv $$

Đại lượng $$\sqrt{EG - F^2}$$ (hoặc $$\sqrt{\det g}$$) là "nhân tử diện tích".
- Trên mặt cầu bán kính $$R$$, nhân tử này là $$R^2 \sin \varphi$$.
- Gần xích đạo ($$\sin \varphi \approx 1$$), diện tích lớn nhất.
- Gần cực ($$\sin \varphi \approx 0$$), diện tích co về 0.

### 3.2. Góc
Góc $$\alpha$$ giữa hai đường cong giao nhau được tính bằng tích vô hướng (sử dụng metric):
$$ \cos \alpha = \frac{\langle \mathbf{v}, \mathbf{w} \rangle}{\|\mathbf{v}\| \|\mathbf{w}\|} $$
Nếu $$F=0$$, lưới tọa độ là trực giao (vuông góc) mọi nơi. Hầu hết các hệ tọa độ tốt (Kinh vĩ độ, Cực) đều có tính chất này.

## 4. Bản chất của Hình học Nội tại

Điều quan trọng nhất cần nhớ: **$$E, F, G$$ là tất cả những gì con kiến cần biết.**
Con kiến không cần biết bề mặt cong trong không gian 3 chiều như thế nào. Nó chỉ cần biết metric $$ds^2$$.
- Nếu con kiến đo được $$E=1, F=0, G=1$$ mọi nơi: Nó biết nó đang ở trên một mặt phẳng (hoặc một tờ giấy cuộn tròn - mặt trụ).
- Nếu con kiến đo được $$E=1, F=0, G=\sin^2 u$$: Nó biết nó đang ở trên một mặt cầu (hoặc vật gì đó có độ cong tương đương).

Dạng cơ bản thứ nhất định nghĩa **Hình học Nội tại**. Nó phân biệt "Cong do metric" (như mặt cầu) và "Cong do uốn nắn" (như mặt trụ).
Mặt trụ là phẳng về mặt nội tại (bạn có thể trải nó ra bàn). Mặt cầu thì không.

## 5. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Kiểm tra Mặt trụ:**
    Tham số hóa mặt trụ: $$\mathbf{r}(u, v) = (R\cos u, R\sin u, v)$$.
    Tính $$E, F, G$$. Bạn sẽ thấy $$ds^2 = R^2 du^2 + dv^2$$.
    Nếu ta đổi biến $$U = Ru$$, thì $$ds^2 = dU^2 + dv^2$$. Đây chính xác là metric của mặt phẳng Pythagore ($$dx^2 + dy^2$$)! Điều này chứng minh mặt trụ có thể trải phẳng hoàn toàn.
2.  **Thách thức Mặt cầu:**
    Tính diện tích bề mặt của chỏm cầu từ vĩ độ $$0$$ đến $$\alpha$$ bằng công thức tích phân diện tích $$\iint \sqrt{EG-F^2} du dv$$. (Kết quả phải là $$2\pi R^2 (1-\cos\alpha)$$).
3.  **Suy ngẫm:**
    Tại sao không có bản đồ thế giới nào là hoàn hảo? (Gợi ý: Để vẽ mặt cầu lên giấy phẳng, bạn phải thay đổi metric. Bạn có thể giữ đúng góc (Mercator) nhưng sai diện tích, hoặc giữ đúng diện tích (Peters) nhưng sai góc. Bạn không thể giữ cả hai cùng lúc vì $$E, G$$ của mặt cầu không thể biến thành hằng số cùng lúc).

---
*Con kiến đã biết cách đo độ dài. Nhưng nó vẫn chưa biết mình đang ở trên đỉnh núi hay dưới thung lũng. Để biết điều đó, nó cần đo độ cong. Đó là nhiệm vụ của Dạng Cơ bản Thứ hai.*
