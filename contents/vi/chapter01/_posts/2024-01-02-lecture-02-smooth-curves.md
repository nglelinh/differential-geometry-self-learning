---
layout: post
lang: vi
title: "Bài 2: Nghệ thuật của Tham số hóa — Tốc độ và Hình dáng"
chapter: "01"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Chiếc đồng hồ và Con đường

Hãy tưởng tượng bạn đang lái xe trên một đường đua F1.
- Con đường đua (hình dáng, các khúc cua, độ dài) là một thực thể hình học cố định. Nó nằm đó, bất kể bạn có lái xe trên đó hay không.
- Nhưng trải nghiệm của bạn về con đường đó phụ thuộc vào cách bạn lái. Bạn có thể lái chậm rãi để ngắm cảnh, hoặc bạn có thể đạp ga hết cỡ. Bạn có thể thậm chí lái ngược chiều.

Trong toán học:
- Con đường đua là **Đường cong Hình học** (Geometric Curve).
- Cách bạn lái xe (vị trí của bạn tại mỗi thời điểm $$t$$) là **Tham số hóa** (Parametrization).

Bài giảng này sẽ giải quyết một vấn đề hóc búa: *Làm thế nào để tách biệt "hình dáng" của con đường ra khỏi "tốc độ" của người lái?* Chúng ta muốn nghiên cứu bản chất của đường cong, chứ không phải thói quen lái xe của bạn.
Câu trả lời nằm ở một khái niệm gọi là **Tham số hóa theo Độ dài cung (Arc Length Parametrization)**.

## 2. Tham số hóa: Tự do và Rắc rối

Như đã học ở Bài 1, một đường cong được cho bởi hàm $$\gamma(t)$$.
Nhưng cùng một đường cong có thể có vô số cách tham số hóa.

**Ví dụ:** Xét đoạn thẳng từ $$(0,0)$$ đến $$(1,1)$$.
1.  Người đi bộ: $$\gamma_1(t) = (t, t)$$ với $$t \in [0, 1]$$. Vận tốc $$\|\gamma_1'\| = \sqrt{2}$$.
2.  Người đi xe đua: $$\gamma_2(t) = (t^2, t^2)$$ với $$t \in [0, 1]$$. Vận tốc $$\|\gamma_2'\| = 2t\sqrt{2}$$ (tăng tốc dần).
3.  Người đi giật lùi: $$\gamma_3(t) = (1-t, 1-t)$$ với $$t \in [0, 1]$$.

Tất cả đều vẽ ra cùng một đoạn thẳng. Nhưng các đạo hàm (vận tốc, gia tốc) của chúng hoàn toàn khác nhau!
Nếu chúng ta muốn tính "độ cong" của đường thẳng này, chúng ta không thể dùng trực tiếp đạo hàm cấp 2, vì $$\gamma_2''(t) \neq 0$$ mặc dù đường thẳng thì không cong tí nào!

**Bài học:** Đạo hàm theo tham số $$t$$ tùy ý chứa đựng cả thông tin về *hình học* lẫn thông tin về *tốc độ*. Chúng ta cần loại bỏ yếu tố tốc độ.

## 3. Độ dài cung: Thước đo tự nhiên

Cách tốt nhất để loại bỏ yếu tố tốc độ là... chuẩn hóa nó. Hãy tưởng tượng bạn đi bộ dọc theo đường cong với tốc độ đều đặn là **1 đơn vị độ dài trên 1 giây**.
Khi đó, thời gian bạn đi chính bằng quãng đường bạn đi được.
Tham số này được gọi là **Độ dài cung**, ký hiệu là $$s$$.

> [!TIP]
> **Chế độ Lái tự động (Cruise Control):**
> Tham số hóa theo độ dài cung $$s$$ giống như bạn bật chế độ Cruise Control trên xe hơi và cài đặt tốc độ là 1 m/s.
> - Bất kể đường cong hay thẳng, lên dốc hay xuống dốc, kim đồng hồ tốc độ luôn chỉ số 1.
> - Khi đó, sự thay đổi của vector vận tốc chỉ còn là sự thay đổi về **hướng** (do đường cong), không còn sự thay đổi về độ lớn (do đạp ga/phanh). Điều này giúp công thức tính độ cong trở nên cực kỳ đơn giản.

### 3.1. Công thức tính độ dài
Nếu bạn di chuyển với vận tốc $$\mathbf{v}(t) = \gamma'(t)$$, thì quãng đường đi được từ thời điểm $$a$$ đến $$b$$ là tích phân của tốc độ:
$$ L = \int_a^b \|\gamma'(t)\| dt = \int_a^b \sqrt{(x')^2 + (y')^2 + (z')^2} dt $$

### 3.2. Hàm độ dài cung
Chúng ta định nghĩa hàm $$s(t)$$ là quãng đường đi được từ điểm bắt đầu $$t_0$$ đến thời điểm $$t$$:
$$ s(t) = \int_{t_0}^t \|\gamma'(u)\| du $$

Theo định lý cơ bản của vi tích phân:
$$ \frac{ds}{dt} = \|\gamma'(t)\| = \text{Tốc độ} $$

### 3.3. Tham số hóa theo $$s$$
Nếu chúng ta dùng $$s$$ làm tham số thay vì $$t$$, điều kỳ diệu sẽ xảy ra.
Gọi $$\alpha(s)$$ là đường cong tham số theo $$s$$. Vận tốc của nó là:
$$ \|\alpha'(s)\| = \left\| \frac{d\alpha}{ds} \right\| = 1 $$

**Ý nghĩa:** Tham số hóa theo độ dài cung có nghĩa là di chuyển với **tốc độ đơn vị không đổi**.
Khi đó, vector tiếp tuyến $$\mathbf{T}(s) = \alpha'(s)$$ luôn có độ dài bằng 1. Nó chỉ mang thông tin về **hướng**, không còn bị nhiễu bởi độ lớn vận tốc nữa.

> [!NOTE]
> **Tại sao $$\|\gamma'(s)\| = 1$$ lại tuyệt vời?**
> Hãy nhớ lại công thức đạo hàm tích vô hướng: $$\frac{d}{ds}(\mathbf{v} \cdot \mathbf{v}) = 2\mathbf{v} \cdot \mathbf{v}'$$.
> Nếu $$\|\mathbf{T}\|^2 = \mathbf{T} \cdot \mathbf{T} = 1$$ (hằng số), thì đạo hàm của nó bằng 0.
> $$\Rightarrow 2\mathbf{T} \cdot \mathbf{T}' = 0 \Rightarrow \mathbf{T} \perp \mathbf{T}'$$.
> Điều này có nghĩa là: **Gia tốc luôn vuông góc với vận tốc**. Mọi lực tác dụng lên hạt chỉ dùng để bẻ lái (thay đổi hướng), không dùng để tăng tốc/giảm tốc. Đây là trạng thái lý tưởng để nghiên cứu hình học.

## 4. Tái tham số hóa (Reparametrization)

Quá trình chuyển đổi từ tham số $$t$$ (thời gian tùy ý) sang tham số $$s$$ (độ dài cung) gọi là Tái tham số hóa.
Về mặt lý thuyết, nó luôn thực hiện được nếu đường cong trơn và vận tốc không bao giờ bằng 0.
Về mặt thực hành, việc tính tích phân để tìm $$s(t)$$ và sau đó tìm hàm ngược $$t(s)$$ thường rất khó hoặc không thể làm được bằng công thức sơ cấp.

**Ví dụ:** Đường xoắn ốc $$\gamma(t) = (a\cos t, a\sin t, bt)$$.
- Vận tốc: $$\gamma'(t) = (-a\sin t, a\cos t, b)$$.
- Tốc độ: $$\|\gamma'(t)\| = \sqrt{a^2\sin^2t + a^2\cos^2t + b^2} = \sqrt{a^2+b^2} = c$$ (hằng số).
- Độ dài cung: $$s(t) = \int_0^t c \, du = ct$$.
- Hàm ngược: $$t(s) = s/c$$.
- Tham số hóa theo $$s$$:
  $$ \alpha(s) = \left( a\cos\frac{s}{c}, a\sin\frac{s}{c}, \frac{b s}{c} \right) $$

Đây là một trong số ít trường hợp chúng ta có thể viết công thức tường minh.

## 5. Điểm kỳ dị và Đường cong trơn từng khúc

Chúng ta luôn yêu cầu $$\gamma'(t) \neq 0$$. Tại sao?
Hãy xem đường cong $$\gamma(t) = (t^2, t^3)$$.
- Tại $$t=0$$, $$\gamma'(0) = (0,0)$$. Vận tốc bằng 0.
- Hình dáng đồ thị là một đường cong có "mỏ nhọn" (cusp) tại gốc tọa độ.

![Đường cong có điểm lùi (Cusp)](https://upload.wikimedia.org/wikipedia/commons/8/8c/Semicubical_parabola.svg)
*Hình 1: Đường cong $$y^2 = x^3$$ có một điểm lùi tại gốc tọa độ. Tại đây, tiếp tuyến không xác định rõ ràng.*

Nếu vận tốc bằng 0, hạt có thể dừng lại và đổi hướng đột ngột, tạo ra các góc nhọn. Hình học vi phân "ghét" các góc nhọn vì tại đó không có đạo hàm. Chúng ta chỉ nghiên cứu các đường cong **Chính quy** (Regular) - nơi vector tiếp tuyến luôn tồn tại và biến đổi trơn tru.

## 6. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Tính độ dài:** Tính độ dài của một vòng xoắn ốc $$\gamma(t) = (\cos t, \sin t, t)$$ từ $$t=0$$ đến $$t=2\pi$$. (Đáp số: $$2\pi\sqrt{2}$$).
2.  **Thử thách:** Tại sao đường tròn đơn vị $$\gamma(t) = (\cos t, \sin t)$$ đã là tham số hóa theo độ dài cung? (Kiểm tra tốc độ của nó).
3.  **Suy ngẫm:** Trong vật lý, công $$W$$ của một lực $$\mathbf{F}$$ dọc theo đường cong là tích phân đường $$\int \mathbf{F} \cdot d\mathbf{r}$$. Tích phân này có phụ thuộc vào tham số hóa không? Tại sao? (Gợi ý: Công sinh ra để đẩy một vật từ A đến B không phụ thuộc vào việc bạn đẩy nhanh hay chậm, chỉ phụ thuộc vào con đường và lực).

---
*Trong bài tiếp theo, chúng ta sẽ thấy sức mạnh thực sự của tham số hóa theo độ dài cung. Nó cho phép chúng ta định nghĩa Độ cong một cách chính xác mà không sợ bị nhầm lẫn với gia tốc của xe.*
