---
layout: post
lang: vi
title: "Bài 0.1: Đại số Tuyến tính — Ngôn ngữ của Không gian Phẳng"
chapter: "00"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Tại sao cần Đại số Tuyến tính?

Hình học Vi phân nghiên cứu các không gian cong bằng chiến lược **"chia để trị"**: ta chia không gian cong thành những mảnh vô cùng nhỏ, sao cho mỗi mảnh cục bộ đều xấp xỉ một không gian phẳng. Ngôn ngữ để mô tả và tính toán trên không gian phẳng chính là **Đại số Tuyến tính**.

Nếu Giải tích là công cụ để vi phân (xét ở quy mô vô cùng nhỏ) và tích phân (ghép các phần cục bộ lại với nhau), thì Đại số Tuyến tính là công cụ để khảo sát cấu trúc của từng mảnh phẳng đó. Việc nắm vững Đại số Tuyến tính là điều kiện cần để hiểu không gian tiếp tuyến, tensor và độ cong.

## 2. Không gian Vector

### 2.1. Định nghĩa trực giác
Một **Không gian Vector** $$V$$ là một tập hợp các đối tượng (gọi là vector) được trang bị hai phép toán:
1.  **Phép cộng** hai vector với nhau ($$\mathbf{u} + \mathbf{v}$$).
2.  **Phép nhân** một vector với một số thực ($$c\mathbf{v}$$).

Theo trực giác hình học, ta có thể hình dung các vector như những mũi tên: phép cộng tương ứng với việc nối đuôi các mũi tên, còn phép nhân vô hướng tương ứng với việc kéo dài, co ngắn hoặc đảo chiều chúng.

### 2.2. Cơ sở và Số chiều
- **Cơ sở (Basis):** Là một tập hợp tối thiểu các vector $$\{\mathbf{e}_1, \dots, \mathbf{e}_n\}$$ sao cho mọi vector khác trong không gian đều biểu diễn được duy nhất dưới dạng tổ hợp tuyến tính của chúng: $$\mathbf{v} = v^1\mathbf{e}_1 + \dots + v^n\mathbf{e}_n$$.
- **Số chiều (Dimension):** Là số lượng vector trong một cơ sở.
    - Đường thẳng: 1 chiều.
    - Mặt phẳng: 2 chiều.
    - Không gian quen thuộc quanh ta: 3 chiều.

> [!NOTE]
> **Quy ước tính tổng Einstein (Einstein Summation Convention):**
> Để ký hiệu ngắn gọn hơn, ta bỏ dấu tổng $$\sum$$. Khi một chỉ số xuất hiện hai lần trong cùng một số hạng (một chỉ số trên, một chỉ số dưới), ta mặc định lấy tổng theo chỉ số đó:
> $$\mathbf{v} = v^i \mathbf{e}_i \equiv \sum_{i=1}^n v^i \mathbf{e}_i$$.

## 3. Không gian Đối ngẫu (Dual Space)

Đây là khái niệm mà nhiều người mới học thường gặp khó khăn, nhưng lại giữ vai trò trung tâm trong Hình học Vi phân.

### 3.1. Covector là gì?
Nếu vector được hình dung như một "mũi tên", thì **covector** (hay vector đối ngẫu) có thể xem như một "dụng cụ đo". Về mặt toán học, một covector $$\alpha$$ là một hàm tuyến tính nhận vào một vector và trả về một số thực:
$$ \alpha: V \to \mathbb{R} $$

**Ví dụ:**
- Vector $$\mathbf{v}$$: Khối lượng hàng hóa (ví dụ: 2 kg táo, 3 kg cam).
- Covector $$\mathbf{p}$$: Bảng đơn giá (ví dụ: 20 nghìn đồng/kg táo, 30 nghìn đồng/kg cam).
- Tác động $$\mathbf{p}(\mathbf{v})$$: Tổng số tiền phải trả ($$2 \cdot 20 + 3 \cdot 30 = 130$$ nghìn đồng).

### 3.2. Minh họa hình học
- **Vector:** Được hình dung như một mũi tên.
- **Covector:** Được hình dung như một họ các **mặt phẳng song song cách đều nhau** (các tập mức — level sets).
- **Tác động $$\alpha(\mathbf{v})$$:** Là số lượng mặt phẳng mà mũi tên $$\mathbf{v}$$ xuyên qua.

### 3.3. Cơ sở Đối ngẫu (Dual Basis)
Nếu $$\{\mathbf{e}_1, \dots, \mathbf{e}_n\}$$ là một cơ sở của không gian vector $$V$$, thì luôn tồn tại duy nhất một cơ sở tương ứng $$\{\theta^1, \dots, \theta^n\}$$ của không gian đối ngẫu $$V^*$$, gọi là **cơ sở đối ngẫu**. Cơ sở này được xác định bởi điều kiện:
$$ \theta^i(\mathbf{e}_j) = \delta^i_j = \begin{cases} 1 & \text{nếu } i = j \\ 0 & \text{nếu } i \neq j \end{cases} $$

**Ví dụ:**
Trong $$\mathbb{R}^2$$ với cơ sở chuẩn $$\mathbf{e}_1 = (1, 0), \mathbf{e}_2 = (0, 1)$$, cơ sở đối ngẫu gồm hai hàm chiếu:
- $$\theta^1(x, y) = x$$ (lấy thành phần thứ nhất).
- $$\theta^2(x, y) = y$$ (lấy thành phần thứ hai).

Kiểm tra trực tiếp ta thấy $$\theta^1(\mathbf{e}_1) = 1$$ và $$\theta^1(\mathbf{e}_2) = 0$$.

### 3.4. Quy tắc Đổi cơ sở (Change of Basis)
Quy tắc đổi cơ sở là cơ sở trực tiếp để định nghĩa **tensor**. Giả sử ta chuyển sang một cơ sở mới có độ dài gấp đôi: $$\tilde{\mathbf{e}}_i = 2\mathbf{e}_i$$. Để vẫn biểu diễn cùng một vector $$\mathbf{v}$$, các thành phần tọa độ của nó phải giảm đi một nửa: $$\tilde{v}^i = \frac{1}{2}v^i$$. Khi đó:
$$ \mathbf{v} = v^i \mathbf{e}_i = (\frac{1}{2}v^i) (2\mathbf{e}_i) = \tilde{v}^i \tilde{\mathbf{e}}_i $$

Từ đây ta phân biệt hai kiểu biến đổi tọa độ:
- **Phản biến (Contravariant):** Các thành phần của vector biến đổi *ngược chiều* với cơ sở (cơ sở tăng thì tọa độ giảm), được ký hiệu bằng chỉ số trên ($$v^i$$).
- **Hiệp biến (Covariant):** Các thành phần của covector biến đổi *cùng chiều* với cơ sở (cơ sở tăng thì tọa độ tăng), được ký hiệu bằng chỉ số dưới ($$\alpha_i$$).

## 4. Tích Tensor (Tensor Product)

Ta có thể kết hợp nhiều không gian vector để xây dựng các không gian lớn hơn. **Tích Tensor** $$V \otimes W$$ là không gian dùng để biểu diễn các đại lượng đa tuyến tính. Một tensor hạng $$(k, l)$$ là một ánh xạ đa tuyến tính nhận vào $$k$$ covector và $$l$$ vector rồi trả về một số thực:

$$ T: \underbrace{V^* \times \dots \times V^*}_{k} \times \underbrace{V \times \dots \times V}_{l} \to \mathbb{R} $$

Ví dụ:
- Tensor metric $$g$$ là tensor hạng $$(0, 2)$$: nó nhận vào 2 vector và trả về tích vô hướng của chúng.
- Tensor độ cong Riemann $$R$$ là tensor hạng $$(1, 3)$$: nó nhận vào 1 covector và 3 vector.

## 5. Ánh xạ Tuyến tính và Ma trận

Một ánh xạ $$T: V \to W$$ được gọi là tuyến tính nếu nó bảo toàn phép cộng vector và phép nhân vô hướng:
$$ T(a\mathbf{u} + b\mathbf{v}) = aT(\mathbf{u}) + bT(\mathbf{v}) $$

Khi chọn một cơ sở cho $$V$$ và một cơ sở cho $$W$$, ánh xạ tuyến tính $$T$$ được biểu diễn bằng một **ma trận**. Cần phân biệt rõ: ma trận không đồng nhất với bản thân ánh xạ, mà chỉ là *bảng số biểu diễn* ánh xạ đó trong một hệ tọa độ cụ thể. Khi đổi hệ tọa độ, ma trận biểu diễn thay đổi, còn bản chất hình học của ánh xạ thì không đổi.

## 6. Tích Vô hướng (Inner Product) và Metric

Để đo độ dài và góc trong không gian vector, ta bổ sung cấu trúc **tích vô hướng**:
$$ g(\mathbf{u}, \mathbf{v}) = \langle \mathbf{u}, \mathbf{v} \rangle $$

Từ tích vô hướng, ta xác định được:
- Độ dài của vector: $$\|\mathbf{v}\| = \sqrt{g(\mathbf{v}, \mathbf{v})}$$.
- Góc $$\theta$$ giữa hai vector khác không: $$\cos \theta = \frac{g(\mathbf{u}, \mathbf{v})}{\|\mathbf{u}\| \|\mathbf{v}\|}$$.

Trong không gian Euclid, tích vô hướng là tích vô hướng chuẩn thông thường. Trong Hình học Riemann, tích vô hướng có thể thay đổi trơn từ điểm này sang điểm khác trên đa tạp — đó chính là tensor metric.

## 7. Trị riêng và Vector riêng (Eigenvalues & Eigenvectors)

Khi một ánh xạ tuyến tính tác động lên một vector, thông thường vector đó vừa bị xoay hướng vừa bị co giãn. Tuy nhiên, có những vector khác không đặc biệt giữ nguyên phương và chỉ bị co giãn theo một hệ số:
- **Vector riêng:** Phương không thay đổi dưới tác động của ánh xạ.
- **Trị riêng:** Hệ số co giãn tương ứng dọc theo phương đó.

Trong Hình học Vi phân, khái niệm này xuất hiện trực tiếp khi nghiên cứu **độ cong chính** (principal curvatures): các phương cong chính chính là các vector riêng của toán tử hình dáng (shape operator).

## 8. Tổng kết

Đại số Tuyến tính cung cấp bốn công cụ cốt lõi cho Hình học Vi phân:
1.  **Vector:** Mô tả hướng và vận tốc (không gian tiếp tuyến).
2.  **Covector:** Mô tả tốc độ biến thiên của hàm số (gradient, vi phân).
3.  **Tích vô hướng:** Đo độ dài và góc (metric).
4.  **Định thức (Determinant):** Đo sự thay đổi thể tích dưới ánh xạ tuyến tính.

Nắm chắc các khái niệm này là bước chuẩn bị cần thiết trước khi tiếp cận các cấu trúc vi phân trên không gian cong.

---
*Bài tiếp theo: Giải tích Đa biến — Nghệ thuật xấp xỉ tuyến tính.*

## Video tham khảo

- [Vectors \| Chapter 1, Essence of linear algebra](https://www.youtube.com/watch?v=fNk_zzaMoSs) — 3Blue1Brown, tiếng Anh. Nên xem trước khi đọc mục không gian vector: trình bày trực quan về mũi tên đặt tại gốc tọa độ, phép cộng và phép nhân vô hướng, khớp với hình ảnh "nối đuôi và co giãn" trong bài.
- [Tensors for Beginners 4: What are Covectors?](https://www.youtube.com/watch?v=LNoQ_Q5JQMY) — eigenchris, tiếng Anh. Minh họa covector dưới dạng các mặt mức mà mũi tên xuyên qua, tương ứng với phần không gian đối ngẫu, cơ sở đối ngẫu và quy tắc đổi cơ sở.
- [Eigenvectors and eigenvalues \| Chapter 14, Essence of linear algebra](https://www.youtube.com/watch?v=PFDu9oVAE-g) — 3Blue1Brown, tiếng Anh. Giải thích trực giác về phương không bị xoay mà chỉ bị co giãn — hình ảnh sẽ xuất hiện lại khi xét độ cong chính dưới dạng vector riêng của toán tử hình dáng.
