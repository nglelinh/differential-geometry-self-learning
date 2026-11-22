---
layout: post
lang: vi
title: "Bài 2: Nghệ thuật của Tham số hóa — Tốc độ và Hình dáng"
chapter: "01"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Chiếc đồng hồ và Con đường

Hãy hình dung một chiếc xe chạy trên đường đua F1:
- Bản thân đường đua (hình dáng, các khúc cua, tổng chiều dài) là một đối tượng hình học cố định, không phụ thuộc vào việc có ai lái xe trên đó hay không.
- Ngược lại, vị trí của xe tại mỗi thời điểm phụ thuộc vào cách lái: người lái có thể đi chậm, tăng tốc tối đa hoặc thậm chí đi ngược chiều.

Trong toán học, hai yếu tố này tương ứng với:
- **Đường cong hình học** (Geometric Curve): hình dáng cố định của đường đua.
- **Tham số hóa** (Parametrization): hàm mô tả vị trí trên đường cong tại mỗi thời điểm $$t$$.

Bài giảng này trả lời câu hỏi: *Làm thế nào để tách riêng "hình dáng" của đường cong khỏi "tốc độ" di chuyển trên nó?* Ta muốn nghiên cứu bản chất hình học của đường cong chứ không phải cách chọn tham số. Công cụ để thực hiện điều đó là **tham số hóa theo độ dài cung (arc length parametrization)**.

## 2. Tham số hóa: Tính tự do và vấn đề phát sinh

Như đã trình bày ở Bài 1, một đường cong được biểu diễn bởi ánh xạ $$\gamma(t)$$. Tuy nhiên, cùng một đường cong hình học có thể có vô số cách tham số hóa khác nhau.

**Ví dụ:** Xét đoạn thẳng nối từ $$(0,0)$$ đến $$(1,1)$$:
1.  Chuyển động đều: $$\gamma_1(t) = (t, t)$$ với $$t \in [0, 1]$$, có tốc độ $$\|\gamma_1'\| = \sqrt{2}$$.
2.  Chuyển động nhanh dần: $$\gamma_2(t) = (t^2, t^2)$$ với $$t \in [0, 1]$$, có tốc độ $$\|\gamma_2'\| = 2t\sqrt{2}$$.
3.  Chuyển động ngược chiều: $$\gamma_3(t) = (1-t, 1-t)$$ với $$t \in [0, 1]$$.

Cả ba ánh xạ đều vạch ra cùng một đoạn thẳng, nhưng các đạo hàm (vận tốc, gia tốc) của chúng khác nhau. Nếu dùng trực tiếp đạo hàm cấp 2 để đo "độ cong", ta sẽ gặp mâu thuẫn vì $$\gamma_2''(t) \neq 0$$ dù đoạn thẳng hoàn toàn không cong.

**Nhận xét:** Đạo hàm theo một tham số $$t$$ tùy ý luôn trộn lẫn thông tin về *hình học* và thông tin về *tốc độ*. Vì vậy, cần một cách chọn tham số chuẩn hóa để loại bỏ ảnh hưởng của tốc độ.

## 3. Độ dài cung: Thước đo tự nhiên

Cách trực tiếp nhất để loại bỏ sự biến thiên của tốc độ là chuẩn hóa tốc độ về hằng số **1 đơn vị độ dài trên 1 đơn vị thời gian**. Khi đó, thời gian di chuyển bằng đúng quãng đường đã đi. Tham số thu được gọi là **độ dài cung**, ký hiệu là $$s$$.

> [!TIP]
> **Hình dung bằng chế độ ga tự động (Cruise Control):**
> Tham số hóa theo độ dài cung $$s$$ tương đương với việc cài đặt xe chạy ở tốc độ không đổi 1 m/s:
> - Dù đường thẳng hay cong, lên dốc hay xuống dốc, tốc độ luôn giữ nguyên bằng 1.
> - Khi đó, sự thay đổi của vector vận tốc chỉ còn phản ánh sự thay đổi về **hướng** (do độ cong của đường), không còn lẫn sự thay đổi về độ lớn (do tăng ga hay phanh). Nhờ vậy, công thức tính độ cong trở nên gọn gàng và chỉ phụ thuộc vào hình dáng đường cong.

### 3.1. Công thức tính độ dài
Nếu hạt chuyển động với vận tốc $$\mathbf{v}(t) = \gamma'(t)$$, quãng đường đi được từ thời điểm $$a$$ đến $$b$$ là tích phân của tốc độ:
$$ L = \int_a^b \|\gamma'(t)\| dt = \int_a^b \sqrt{(x')^2 + (y')^2 + (z')^2} dt $$

### 3.2. Hàm độ dài cung
Ta định nghĩa hàm độ dài cung $$s(t)$$ là quãng đường đi được tính từ mốc $$t_0$$ đến thời điểm $$t$$:
$$ s(t) = \int_{t_0}^t \|\gamma'(u)\| du $$

Theo định lý cơ bản của giải tích:
$$ \frac{ds}{dt} = \|\gamma'(t)\| = \text{Tốc độ} $$

### 3.3. Tham số hóa theo $$s$$
Gọi $$\alpha(s)$$ là biểu diễn của đường cong theo tham số độ dài cung $$s$$. Khi đó, độ lớn vận tốc luôn bằng 1:
$$ \|\alpha'(s)\| = \left\| \frac{d\alpha}{ds} \right\| = 1 $$

**Ý nghĩa:** Tham số hóa theo độ dài cung tương ứng với chuyển động có **tốc độ đơn vị không đổi**. Vector tiếp tuyến $$\mathbf{T}(s) = \alpha'(s)$$ luôn là vector đơn vị, nên nó chỉ mang thông tin thuần túy về **hướng**.

> [!NOTE]
> **Hệ quả quan trọng của điều kiện $$\|\gamma'(s)\| = 1$$:**
> Nhớ lại quy tắc đạo hàm của tích vô hướng: $$\frac{d}{ds}(\mathbf{v} \cdot \mathbf{v}) = 2\mathbf{v} \cdot \mathbf{v}'$$.
> Vì $$\|\mathbf{T}\|^2 = \mathbf{T} \cdot \mathbf{T} = 1$$ là hằng số, đạo hàm của nó bằng 0:
> $$\Rightarrow 2\mathbf{T} \cdot \mathbf{T}' = 0 \Rightarrow \mathbf{T} \perp \mathbf{T}'$$.
> Điều này có nghĩa là **vector gia tốc luôn vuông góc với vector vận tốc**. Toàn bộ gia tốc chỉ dùng để đổi hướng chuyển động chứ không làm thay đổi tốc độ — điều kiện lý tưởng để định nghĩa độ cong.

## 4. Tái tham số hóa (Reparametrization)

Quá trình chuyển từ tham số $$t$$ tùy ý sang tham số độ dài cung $$s$$ gọi là **tái tham số hóa**. Về mặt lý thuyết, quá trình này luôn thực hiện được với mọi đường cong chính quy ($$\gamma'(t) \neq 0$$), vì khi đó $$ds/dt > 0$$ nên hàm $$s(t)$$ đơn điệu tăng và có hàm ngược $$t(s)$$. Tuy nhiên, trong thực hành, việc tính tích phân để tìm $$s(t)$$ rồi giải ngược ra $$t(s)$$ dưới dạng công thức sơ cấp thường rất khó hoặc không thực hiện được.

**Ví dụ:** Xét đường xoắn ốc $$\gamma(t) = (a\cos t, a\sin t, bt)$$:
- Vận tốc: $$\gamma'(t) = (-a\sin t, a\cos t, b)$$.
- Tốc độ: $$\|\gamma'(t)\| = \sqrt{a^2\sin^2t + a^2\cos^2t + b^2} = \sqrt{a^2+b^2} = c$$ (hằng số).
- Độ dài cung: $$s(t) = \int_0^t c \, du = ct$$.
- Hàm ngược: $$t(s) = s/c$$.
- Tham số hóa theo $$s$$:
  $$ \alpha(s) = \left( a\cos\frac{s}{c}, a\sin\frac{s}{c}, \frac{b s}{c} \right) $$

Đây là một trong số ít các đường cong không gian có thể viết công thức tham số hóa theo độ dài cung một cách tường minh.

## 5. Điểm kỳ dị và Đường cong chính quy

Để thấy vì sao điều kiện $$\gamma'(t) \neq 0$$ là cần thiết, hãy xét đường cong $$\gamma(t) = (t^2, t^3)$$:
- Tại $$t=0$$, ta có $$\gamma'(0) = (0,0)$$, tức vận tốc triệt tiêu.
- Đồ thị của đường cong có một **điểm lùi** (cusp) sắc nhọn tại gốc tọa độ.

![Đường cong có điểm lùi (Cusp)](https://upload.wikimedia.org/wikipedia/commons/8/8c/Semicubical_parabola.svg)
*Hình 1: Đường cong $$y^2 = x^3$$ có một điểm lùi tại gốc tọa độ, nơi hướng tiếp tuyến không biến thiên trơn.*

Khi vận tốc bằng 0, hạt có thể dừng lại rồi đổi hướng đột ngột, tạo ra góc nhọn nơi không thể áp dụng các phép tính vi phân hình học chuẩn. Do đó, hình học vi phân tập trung vào các **đường cong chính quy** (regular curves), nơi vector tiếp tuyến luôn khác không và biến thiên trơn dọc theo đường cong.

## Video tham khảo

- [Arc Length and Reparameterization \| Differential Geometry 2](https://www.youtube.com/watch?v=am5MIduPkKQ) — Faculty of Khan, tiếng Anh. Nên xem trước để nắm cách tính độ dài cung và đổi tham số về tốc độ bằng 1, tương ứng với ví dụ ga tự động trong bài.
- [Calculus 3 Lecture 12.3:  Arc Length/Parameterization, TNB (Frenet-Serret) Intro](https://www.youtube.com/watch?v=Hu72QVWsMlg) — Professor Leonard, tiếng Anh. Phần đầu buổi giảng trình bày cách tính độ dài cung và tham số hóa theo độ dài cung trước khi dựng khung TNB; chỉ cần xem hết phần tốc độ đơn vị cho bài này.
- [Lecture 10: Smooth Curves (Discrete Differential Geometry)](https://www.youtube.com/watch?v=seLcPBax3OI) — Keenan Crane, tiếng Anh. Giới thiệu định lý cơ bản cho thấy độ cong xác định đường cong phẳng sai khác một phép dời hình, giải thích vì sao tham số hóa theo độ dài cung tách biệt được hình dạng khỏi tốc độ di chuyển.

## 6. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Tính độ dài:** Tính độ dài một vòng của đường xoắn ốc $$\gamma(t) = (\cos t, \sin t, t)$$ từ $$t=0$$ đến $$t=2\pi$$. (Đáp số: $$2\pi\sqrt{2}$$).
2.  **Kiểm tra tham số hóa:** Giải thích vì sao đường tròn đơn vị $$\gamma(t) = (\cos t, \sin t)$$ đã được tham số hóa sẵn theo độ dài cung (bằng cách kiểm tra tốc độ của nó).
3.  **Suy ngẫm:** Trong vật lý, công $$W$$ của một trường lực $$\mathbf{F}$$ dọc theo đường cong là tích phân đường $$\int \mathbf{F} \cdot d\mathbf{r}$$. Tích phân này có phụ thuộc vào cách tham số hóa (giữ nguyên hướng đi) hay không? Tại sao? (Gợi ý: Công cơ học để di chuyển một vật từ điểm A đến điểm B theo cùng một quỹ đạo không phụ thuộc vào việc đi nhanh hay chậm, mà chỉ phụ thuộc vào quỹ đạo và trường lực).

---
*Trong bài tiếp theo, ta sẽ sử dụng tham số hóa theo độ dài cung để định nghĩa chính xác khái niệm Độ cong và Độ xoắn mà không bị ảnh hưởng bởi gia tốc tiếp tuyến.*
