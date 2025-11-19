---
layout: post
lang: vi
title: "Bài 0.1: Đại số Tuyến tính — Ngôn ngữ của Không gian Phẳng"
chapter: "00"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Tại sao lại là Đại số Tuyến tính?

Hình học Vi phân nghiên cứu các không gian cong. Nhưng chiến lược của chúng ta là: **"Chia để trị"**.
Chúng ta cắt nhỏ không gian cong thành vô số mảnh nhỏ xíu. Mỗi mảnh nhỏ xíu đó trông giống như một không gian phẳng.
Và ngôn ngữ để mô tả không gian phẳng chính là **Đại số Tuyến tính**.

Nếu Giải tích (Calculus) là công cụ để cắt nhỏ (vi phân) và ghép lại (tích phân), thì Đại số Tuyến tính là công cụ để nghiên cứu từng mảnh nhỏ đó. Không nắm vững Đại số Tuyến tính, bạn sẽ không thể hiểu được không gian tiếp tuyến, tensor, hay độ cong.

## 2. Không gian Vector: Sân chơi chính

### 2.1. Định nghĩa trực giác
Một **Không gian Vector** $$V$$ là một tập hợp các đối tượng (gọi là vector) mà bạn có thể:
1.  **Cộng** hai vector lại với nhau ($$\mathbf{u} + \mathbf{v}$$).
2.  **Nhân** một vector với một số thực ($$c\mathbf{v}$$).

Hãy nghĩ về các mũi tên. Bạn có thể nối đuôi chúng (cộng) và kéo dài/co ngắn chúng (nhân vô hướng).

### 2.2. Cơ sở và Số chiều
- **Cơ sở (Basis):** Là một tập hợp tối thiểu các vector $$\{\mathbf{e}_1, \dots, \mathbf{e}_n\}$$ mà từ đó bạn có thể tạo ra mọi vector khác trong không gian bằng cách tổ hợp tuyến tính: $$\mathbf{v} = v^1\mathbf{e}_1 + \dots + v^n\mathbf{e}_n$$.
- **Số chiều (Dimension):** Số lượng vector trong một cơ sở.
    - Đường thẳng: 1 chiều.
    - Mặt phẳng: 2 chiều.
    - Không gian chúng ta sống: 3 chiều.

> [!NOTE]
> **Einstein Summation Convention (Quy ước tính tổng Einstein):**
> Để gọn gàng, chúng ta bỏ dấu tổng $$\sum$$. Nếu một chỉ số xuất hiện hai lần (một trên, một dưới), ta tự hiểu là cộng theo chỉ số đó.
> $$\mathbf{v} = v^i \mathbf{e}_i \equiv \sum_{i=1}^n v^i \mathbf{e}_i$$.

## 3. Không gian Đối ngẫu (Dual Space): Khái niệm khó nhất nhưng quan trọng nhất

Đây là chỗ mà nhiều người mới học bị vấp ngã. Hãy chú ý!

### 3.1. Covector là gì?
Nếu Vector là một "mũi tên", thì **Covector** (hay dual vector) là một "cái máy đo".
Một covector $$\alpha$$ là một hàm tuyến tính nhận vào một vector và trả về một số thực:
$$ \alpha: V \to \mathbb{R} $$

**Ví dụ:**
- Vector $$\mathbf{v}$$: Nguyên liệu (ví dụ: 2kg táo, 3kg cam).
- Covector $$\mathbf{p}$$: Bảng giá (ví dụ: 20k/kg táo, 30k/kg cam).
- Tác động $$\mathbf{p}(\mathbf{v})$$: Tổng tiền (2*20 + 3*30 = 130k).

### 3.2. Mối quan hệ Hình học
- **Vector:** Được hình dung như một mũi tên.
- **Covector:** Được hình dung như một tập hợp các **mặt phẳng song song đều nhau** (level sets).
- **Tác động $$\alpha(\mathbf{v})$$:** Số lượng mặt phẳng mà mũi tên $$\mathbf{v}$$ xuyên qua.

### 3.3. Cơ sở Đối ngẫu (Dual Basis)
Nếu chúng ta có một cơ sở $$\{\mathbf{e}_1, \dots, \mathbf{e}_n\}$$ cho không gian vector $$V$$, thì luôn tồn tại một cơ sở tương ứng $$\{\theta^1, \dots, \theta^n\}$$ cho không gian đối ngẫu $$V^*$$, được gọi là **Cơ sở Đối ngẫu**.
Định nghĩa bởi quy tắc:
$$ \theta^i(\mathbf{e}_j) = \delta^i_j = \begin{cases} 1 & \text{nếu } i = j \\ 0 & \text{nếu } i \neq j \end{cases} $$

**Ví dụ:**
Trong $$\mathbb{R}^2$$ với cơ sở chuẩn $$\mathbf{e}_1 = (1, 0), \mathbf{e}_2 = (0, 1)$$.
Cơ sở đối ngẫu là các hàm chiếu:
- $$\theta^1(x, y) = x$$ (lấy thành phần thứ nhất).
- $$\theta^2(x, y) = y$$ (lấy thành phần thứ hai).
Kiểm tra: $$\theta^1(\mathbf{e}_1) = 1, \theta^1(\mathbf{e}_2) = 0$$.

### 3.4. Quy tắc Đổi cơ sở (Change of Basis)
Đây là chìa khóa để hiểu khái niệm **Tensor**.
Giả sử ta đổi sang một cơ sở mới "dài hơn gấp đôi": $$\tilde{\mathbf{e}}_i = 2\mathbf{e}_i$$.
Để biểu diễn cùng một vector vật lý $$\mathbf{v}$$, các thành phần tọa độ của nó phải "co lại một nửa": $$\tilde{v}^i = \frac{1}{2}v^i$$.
$$ \mathbf{v} = v^i \mathbf{e}_i = (\frac{1}{2}v^i) (2\mathbf{e}_i) = \tilde{v}^i \tilde{\mathbf{e}}_i $$

- **Contravariant (Phản biến):** Các thành phần vector biến đổi *ngược* với cơ sở (cơ sở tăng, tọa độ giảm). Ký hiệu chỉ số trên ($$v^i$$).
- **Covariant (Hiệp biến):** Các thành phần covector biến đổi *cùng* với cơ sở (cơ sở tăng, tọa độ tăng). Ký hiệu chỉ số dưới ($$\alpha_i$$).

## 4. Tích Tensor (Tensor Product)

Chúng ta có thể ghép các không gian vector lại với nhau để tạo ra không gian lớn hơn.
**Tích Tensor** $$V \otimes W$$ là không gian của các đại lượng đa tuyến tính.
Một tensor hạng $$(k, l)$$ là một cỗ máy nhận vào $$k$$ covector và $$l$$ vector để trả về một số thực.

$$ T: \underbrace{V^* \times \dots \times V^*}_{k} \times \underbrace{V \times \dots \times V}_{l} \to \mathbb{R} $$

Ví dụ:
- Metric tensor $$g$$ là tensor hạng $$(0, 2)$$. Nó nhận vào 2 vector và trả về tích vô hướng của chúng.
- Riemann curvature tensor $$R$$ là tensor hạng $$(1, 3)$$. Nó nhận vào 1 covector và 3 vector.

## 5. Ánh xạ Tuyến tính và Ma trận

Một ánh xạ $$T: V \to W$$ được gọi là tuyến tính nếu nó bảo toàn cấu trúc cộng và nhân vô hướng.
$$ T(a\mathbf{u} + b\mathbf{v}) = aT(\mathbf{u}) + bT(\mathbf{v}) $$

Khi chọn một cơ sở cho $$V$$ và $$W$$, ánh xạ tuyến tính được biểu diễn bằng một **Ma trận**.
Ma trận không phải là ánh xạ. Ma trận chỉ là *bảng số biểu diễn* ánh xạ đó trong một hệ tọa độ cụ thể. Nếu đổi hệ tọa độ, ma trận thay đổi, nhưng ánh xạ (bản chất hình học) vẫn y nguyên.

## 5. Tích Vô hướng (Inner Product) và Metric

Để đo độ dài và góc, chúng ta cần thêm cấu trúc: **Tích vô hướng**.
$$ g(\mathbf{u}, \mathbf{v}) = \langle \mathbf{u}, \mathbf{v} \rangle $$

- Độ dài: $$\|\mathbf{v}\| = \sqrt{g(\mathbf{v}, \mathbf{v})}$$.
- Góc $$\theta$$: $$\cos \theta = \frac{g(\mathbf{u}, \mathbf{v})}{\|\mathbf{u}\| \|\mathbf{v}\|}$$.

Trong không gian Euclid, tích vô hướng là tích chấm thông thường. Nhưng trong Hình học Riemann, tích vô hướng này có thể thay đổi từ điểm này sang điểm khác (đó chính là Metric Tensor).

## 6. Trị riêng và Vector riêng (Eigenvalues & Eigenvectors)

Khi một ánh xạ tuyến tính tác động lên một vector, thường thì vector đó sẽ bị xoay và co giãn.
Tuy nhiên, có những vector đặc biệt không bị xoay, chỉ bị co giãn.
- **Vector riêng:** Hướng không thay đổi.
- **Trị riêng:** Hệ số co giãn dọc theo hướng đó.

Trong Hình học Vi phân, khái niệm này xuất hiện khi chúng ta nghiên cứu **Độ cong chính** (Principal Curvatures). Các hướng cong chính chính là các vector riêng của Toán tử Hình dáng (Shape Operator).

## 7. Tổng kết

Đại số Tuyến tính cung cấp cho chúng ta:
1.  **Vector:** Để mô tả hướng và tốc độ (Tiếp tuyến).
2.  **Covector:** Để mô tả sự thay đổi của hàm số (Gradient, Vi phân).
3.  **Tích vô hướng:** Để đo độ dài và góc (Metric).
4.  **Định thức (Determinant):** Để đo sự thay đổi thể tích.

Hãy nắm chắc các khái niệm này. Chúng là những viên gạch đầu tiên để xây dựng nên tòa lâu đài Hình học Vi phân.

---
*Bài tiếp theo: Giải tích Đa biến — Nghệ thuật xấp xỉ tuyến tính.*
