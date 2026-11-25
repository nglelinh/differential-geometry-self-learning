---
layout: post
lang: vi
title: "Bài 11: Tensor và Trường Tensor trên Đa tạp"
chapter: "06"
order: 1
owner: "Hình học Vi phân"
---

Tại sao Albert Einstein phải nhờ người bạn thân Marcel Grossmann dạy lại một nhánh toán học ít người biết thời năm 1912 mang tên "phép tính vi phân tuyệt đối" của Ricci-Curbastro và Levi-Civita mới viết nổi Thuyết tương đối rộng? Lý do rất đẹp và cũng rất thực tế: **tự nhiên không hề vẽ sẵn hệ trục tọa độ $$Oxyz$$ trên bầu trời!** Nếu một định luật vật lý chỉ đúng trong tọa độ Descartes nhưng bị biến dạng khi bạn đổi sang tọa độ cầu hay hệ quy chiếu đang quay, đó không thể là định luật của tự nhiên.

Để diễn tả những thực thể hình học và vật lý **sống sót nguyên vẹn qua mọi phép đổi tọa độ**, toán học tạo ra khái niệm **tensor**. Đừng để vẻ ngoài chi chít chỉ số trên–dưới làm bạn choáng ngợp: ẩn sau mọi bảng số $$T^i_{jk}$$ là một cỗ máy đa tuyến tính cực kỳ trong sáng, nhận vào các vector (mũi tên) cùng covector (thước đo) và trả về một con số hoàn toàn bất biến.

**Mạch bài học:** Kiến thức cần nhớ (tính bất biến tọa độ, không gian đối ngẫu, sự khác nhau giữa tensor toán học và "tensor" học sâu) → Trực giác cỗ máy khe đầu vào & phản biến/hiệp biến → Định nghĩa hình thức & quy ước tổng Einstein → Ví dụ tính tay làm từng bước: biến đổi ma trận metric từ tọa độ Descartes sang tọa độ cực và hạ chỉ số vector → Giải thích: 4 bước nhận diện tensor thật sự → Ứng dụng, Video & Bài tập.

---

## Kiến thức cần nhớ: Lý thuyết Tensor trên Đa tạp nghiên cứu gì?

### 1. Bất biến tọa độ — triết lý cốt lõi của hình học hiện đại
Một mảng số bất kỳ $$A_{ij}$$ **chưa chắc** là tensor! Khi bạn đổi từ hệ tọa độ $$(x^i)$$ sang $$(y^p)$$, các con số biểu diễn sẽ thay đổi — nhưng chúng phải thay đổi ăn khớp tuyệt đối với ma trận Jacobi $$\frac{\partial y^p}{\partial x^i}$$ và nghịch đảo $$\frac{\partial x^j}{\partial y^q}$$ sao cho đối tượng hình học bên dưới đứng yên tuyệt đối.

### 2. Hai nửa đối xứng: Vector (Phản biến) và Covector (Hiệp biến)
Trên mỗi không gian tiếp tuyến $$T_p M$$ luôn song hành **không gian đối ngẫu** $$T_p^* M$$. Vector (chỉ số trên $$v^i$$) là vận tốc hay độ dịch chuyển; covector (chỉ số dưới $$\alpha_i$$) là gradient hay 1-form đo tốc độ thay đổi. Ghép nhiều bản sao của $$T_p M$$ và $$T_p^* M$$ bằng tích tensor $$\otimes$$ cho ta toàn bộ thế giới tensor kiểu $$(r, s)$$ — trong đó metric $$g_{ij}$$ là cầu nối biến vector thành covector và ngược lại!

### 3. Tensor hình học vi phân vs. "Tensor" trong PyTorch / TensorFlow
Trong học sâu, "tensor" thường chỉ là một mảng số đa chiều (array) tiện tính toán trên GPU. Trong hình học vi phân và vật lý, một **trường tensor** trên đa tạp $$M$$ là một gán mượt tại *mỗi* điểm $$p \in M$$ một ánh xạ đa tuyến tính trên $$T_p M$$ và $$T_p^* M$$ — có hình học, có quy tắc biến đổi và chỉ có thể đạo hàm bằng liên kết (Bài 12).

---

## 1. Tổng quan

Trong các bài giảng trước, chúng ta đã làm quen với vector tiếp tuyến (biểu diễn vận tốc, hướng) và vector pháp tuyến. Tuy nhiên, để mô tả đầy đủ các tính chất hình học và vật lý trên đa tạp, chỉ dùng vector là chưa đủ. Ta cần những đối tượng tổng quát hơn có thể kết hợp nhiều vector cùng lúc, đo độ dài, thể tích hoặc biểu diễn các quan hệ đa tuyến tính phức tạp. Các đối tượng đó được gọi là *tensor*.

Trong bài giảng này, chúng ta xây dựng khái niệm tensor từ nền tảng đại số tuyến tính (không gian đối ngẫu, tích tensor) mở rộng lên đa tạp trơn, đồng thời làm quen với ký hiệu chỉ số và quy ước tổng Einstein. Cuối cùng, ta sẽ thấy metric (dạng cơ bản thứ nhất đã học) thực chất là một tensor kiểu $$(0, 2)$$, làm bước đệm trực tiếp cho liên kết, độ cong Riemann và phương trình trường Einstein ở các bài giảng sau.

## 2. Giải thích Trực quan

### 2.1. Tensor như một "Cỗ máy nhận đầu vào là Vector"

Có thể hình dung một tensor như một hộp đen có sẵn các khe đầu vào (slots):
- Một **đại lượng vô hướng** (scalar) không có khe đầu vào nào; nó chỉ là một con số.
- Một **covector** (dạng bậc 1) có 1 khe đầu vào: đưa vào một vector, nó trả về một số thực. Ví dụ: $$df(\mathbf{v})$$ là đạo hàm của hàm $$f$$ theo hướng $$\mathbf{v}$$.
- Một **tensor metric** $$g$$ có 2 khe đầu vào: đưa vào hai vector $$\mathbf{u}$$ và $$\mathbf{v}$$, nó trả về tích vô hướng $$g(\mathbf{u}, \mathbf{v})$$.
- Một **tensor độ cong Riemann** có 3 khe đầu vào và trả về 1 vector đầu ra (hoặc có 4 khe đầu vào trả về số thực nếu xét dưới dạng tensor kiểu $$(0, 4)$$).

> [!TIP]
> **Góc nhìn lập trình: Cấu trúc dữ liệu kèm quy tắc biến đổi**
> Có thể xem tensor như một cấu trúc dữ liệu (struct/class) chứa một mảng đa chiều các con số, đi kèm một **quy tắc biến đổi tọa độ**:
> - Khi đổi hệ tọa độ (chẳng hạn xoay trục), các con số trong mảng thay đổi theo một công thức xác định sao cho bản chất hình học hay vật lý của đối tượng không đổi.
> - Câu nói quen thuộc trong vật lý — "tensor là đối tượng biến đổi như một tensor" — hàm ý chính sự tuân thủ quy tắc biến đổi này.

Đặc trưng cốt lõi của tensor là tính *đa tuyến tính* (multilinearity): nó tuyến tính theo từng khe đầu vào riêng biệt. Khi nhân vector ở một khe với hằng số $$2$$ (giữ nguyên các khe khác), kết quả đầu ra tăng gấp đôi; nếu nhân đồng thời vector ở $$k$$ khe khác nhau với $$2$$, kết quả sẽ nhân với $$2^k$$.

### 2.2. Vector và Covector: Mũi tên và Chồng mặt phẳng song song

- **Vector (phản biến — Contravariant):** Được hình dung như một mũi tên, biểu diễn độ dịch chuyển hoặc vận tốc.
- **Covector (hiệp biến — Covariant):** Được hình dung như một họ các mặt phẳng song song cách đều nhau (tương tự các đường đồng mức trên bản đồ địa hình).

Khi một covector tác động lên một vector, giá trị thu được có thể hình dung là số mặt phẳng song song mà mũi tên xuyên qua.

### 2.3. Vì sao cần phân biệt chỉ số trên và chỉ số dưới?

Trong hình học vi phân, ta phân biệt rõ thành phần của vector (viết bằng chỉ số trên, $$v^i$$) và thành phần của covector (viết bằng chỉ số dưới, $$\alpha_i$$):
- **Vector (phản biến):** Biến đổi ngược chiều với sự thay đổi của cơ sở. Ví dụ, nếu đơn vị đo dài gấp đôi (vector cơ sở tăng gấp đôi), thì số đo độ dài sẽ giảm đi một nửa (thành phần giảm một nửa).
- **Covector (hiệp biến):** Biến đổi cùng chiều với sự thay đổi của cơ sở, chẳng hạn như gradient của một hàm số.

> [!NOTE]
> **Ví dụ đổi đơn vị tiền tệ:**
> Giả sử bạn đổi đơn vị đo từ USD sang xu (Cent):
> - **Cơ sở (Basis):** 1 USD $$\to$$ 1 xu. Đơn vị cơ sở nhỏ đi 100 lần.
> - **Thành phần vector (số tiền):** Số tiền 1 USD nay biểu diễn thành 100 xu. Giá trị số tăng lên 100 lần (biến đổi ngược chiều với cơ sở — phản biến).
> - **Thành phần covector (sức mua trên mỗi đơn vị cơ sở):** Nếu 1 USD mua được 1 cái kẹo (1 cái/USD), thì 1 xu chỉ mua được 0,01 cái kẹo (0,01 cái/xu). Giá trị số giảm đi 100 lần (biến đổi cùng chiều với cơ sở — hiệp biến).

Tensor kết hợp cả hai loại thành phần trên. Ký hiệu chỉ số giúp theo dõi rõ bản chất từng đại lượng và bảo đảm các phương trình vật lý giữ nguyên dạng khi đổi hệ tọa độ.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Không gian Đối ngẫu (Dual Space)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Cho $$V$$ là một không gian vector thực $$n$$ chiều. *Không gian đối ngẫu* $$V^*$$ là tập hợp tất cả các ánh xạ tuyến tính từ $$V$$ vào $$\mathbb{R}$$. Các phần tử của $$V^*$$ được gọi là covector hay dạng bậc 1.
</div>

Nếu $$\{e_1, \dots, e_n\}$$ là một cơ sở của $$V$$, thì cơ sở đối ngẫu $$\{\epsilon^1, \dots, \epsilon^n\}$$ của $$V^*$$ được xác định bởi:
$$
\epsilon^i(e_j) = \delta^i_j = \begin{cases} 1 & \text{nếu } i=j \\ 0 & \text{nếu } i \neq j \end{cases}
$$

### 3.2. Tensor và Tích Tensor

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Một tensor kiểu $$(r, s)$$ trên không gian vector $$V$$ là một ánh xạ đa tuyến tính:
$$
T: \underbrace{V^* \times \dots \times V^*}_{r \text{ lần}} \times \underbrace{V \times \dots \times V}_{s \text{ lần}} \to \mathbb{R}
$$
- $$r$$ là số chỉ số phản biến (chỉ số trên).
- $$s$$ là số chỉ số hiệp biến (chỉ số dưới).
</div>

**Ký hiệu:**
Không gian các tensor kiểu $$(r, s)$$ được ký hiệu là $$T^{(r, s)}(V) = V \otimes \dots \otimes V \otimes V^* \otimes \dots \otimes V^*$$.

### 3.3. Thành phần của Tensor và Quy ước Tổng Einstein

Trong một hệ tọa độ địa phương $$(x^1, \dots, x^n)$$, ta có cơ sở vector $$\{\frac{\partial}{\partial x^i}\}$$ và cơ sở covector đối ngẫu $$\{dx^i\}$$.

Một tensor $$T$$ kiểu $$(1, 2)$$ có thể được biểu diễn dưới dạng:
$$
T = T^i_{jk} \frac{\partial}{\partial x^i} \otimes dx^j \otimes dx^k
$$
(theo quy ước tổng Einstein: một chỉ số xuất hiện hai lần — một ở trên và một ở dưới — được hiểu ngầm là lấy tổng từ $$1$$ đến $$n$$).

Các hàm $$T^i_{jk}$$ là các *thành phần* của tensor trong hệ tọa độ đã chọn.

### 3.4. Quy tắc Biến đổi Tọa độ

Khi chuyển từ hệ tọa độ $$x$$ sang hệ tọa độ $$y$$, các thành phần của tensor biến đổi theo quy tắc đạo hàm hàm hợp (chain rule) đối với từng chỉ số:

$$
T'^{p}_{qr} = T^i_{jk} \underbrace{\frac{\partial y^p}{\partial x^i}}_{\text{cho chỉ số trên}} \underbrace{\frac{\partial x^j}{\partial y^q}}_{\text{cho chỉ số dưới}} \underbrace{\frac{\partial x^k}{\partial y^r}}_{\text{cho chỉ số dưới}}
$$

Đây chính là cách định nghĩa thực hành phổ biến trong vật lý: một bộ đại lượng chỉ là tensor nếu các thành phần của nó tuân theo đúng quy tắc biến đổi trên khi đổi tọa độ (chẳng hạn, ký hiệu Christoffel không tuân theo quy tắc này nên không phải là tensor).

### 3.5. Tensor Metric (Metric Tensor)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Tensor metric $$g$$ là một trường tensor kiểu $$(0, 2)$$, đối xứng và xác định dương. Tại mỗi điểm $$p$$, $$g$$ xác định một tích vô hướng trên không gian tiếp tuyến $$T_pM$$:
$$
g = g_{ij} dx^i \otimes dx^j
$$
trong đó $$g_{ij} = g(\frac{\partial}{\partial x^i}, \frac{\partial}{\partial x^j})$$. Đây chính là sự tổng quát hóa của các hệ số $$E, F, G$$ trên mặt hai chiều.
</div>

Metric cho phép "hạ chỉ số" (chuyển vector thành covector) và "nâng chỉ số" (chuyển covector thành vector thông qua metric nghịch đảo $$g^{ij}$$).

## 4. Các Ví dụ Cầm tay Chỉ việc và Quan trọng

### 4.1. Tự tay biến đổi Tensor Metric từ Descartes sang Tọa độ cực & Hạ chỉ số

Trên mặt phẳng $$\mathbb{R}^2$$, trong tọa độ Descartes $$(x^1, x^2) = (x, y)$$, metric Euclid là ma trận đơn vị $$g_{ij} = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}$$. Bây giờ đổi sang tọa độ cực $$(y^1, y^2) = (r, \theta)$$ với $$x = r\cos\theta,\; y = r\sin\theta$$.

1. **Tính ma trận Jacobi $$J^i_a = \frac{\partial x^i}{\partial y^a}$$:**
   $$
   J = \begin{pmatrix} \frac{\partial x}{\partial r} & \frac{\partial x}{\partial \theta} \\ \frac{\partial y}{\partial r} & \frac{\partial y}{\partial \theta} \end{pmatrix} = \begin{pmatrix} \cos\theta & -r\sin\theta \\ \sin\theta & r\cos\theta \end{pmatrix}.
   $$
2. **Áp dụng công thức biến đổi tensor kiểu $$(0, 2)$$ ($$g'_{ab} = J^i_a J^j_b g_{ij} = (J^T g J)_{ab}$$):**
   $$
   g' = J^T I J = \begin{pmatrix} \cos\theta & \sin\theta \\ -r\sin\theta & r\cos\theta \end{pmatrix} \begin{pmatrix} \cos\theta & -r\sin\theta \\ \sin\theta & r\cos\theta \end{pmatrix} = \begin{pmatrix} 1 & 0 \\ 0 & r^2 \end{pmatrix}!
   $$
   Đúng bằng công thức độ dài cung quen thuộc $$ds^2 = dr^2 + r^2 d\theta^2$$!
3. **Thử đo độ dài và hạ chỉ số một vector cụ thể:** Tại điểm có bán kính $$r = 3$$, xét vector tiếp tuyến $$v = 2\frac{\partial}{\partial r} + 1\frac{\partial}{\partial \theta}$$ (tức $$(v^r, v^\theta) = (2, 1)$$). Khi đó:
   - Bình phương độ dài (bất biến!): $$g'(v, v) = g'_{rr}(v^r)^2 + g'_{\theta\theta}(v^\theta)^2 = 1\cdot 2^2 + 3^2 \cdot 1^2 = 4 + 9 = 13$$.
   - Covector tương ứng sau khi hạ chỉ số ($$v_a = g'_{ab} v^b$$): $$v_r = 1\cdot 2 = 2$$ và $$v_\theta = 9\cdot 1 = 9$$, và bạn kiểm tra ngay $$v_a v^a = 2\cdot 2 + 9\cdot 1 = 13$$!

### 4.2. Tensor Metric trong $$\mathbb{R}^3$$

Trong không gian Euclid 3 chiều với tọa độ Descartes $$(x, y, z)$$, tensor metric là ma trận đơn vị:
$$
g_{ij} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix}
$$
Trong tọa độ cầu $$(r, \theta, \varphi)$$, tensor metric có dạng:
$$
g_{ij} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & r^2 & 0 \\ 0 & 0 & r^2\sin^2\theta \end{pmatrix}
$$

### 4.3. Tensor Ứng suất và Tensor Độ cong Riemann

- **Tensor ứng suất Cauchy $$\sigma$$:** Trong cơ học môi trường liên tục, $$\sigma_{ij}$$ biểu diễn lực theo phương $$i$$ tác dụng lên đơn vị diện tích của mặt phẳng có pháp tuyến theo phương $$j$$.
- **Tensor độ cong Riemann $$R^i_{jkl}$$ (kiểu $$(1,3)$$):** Đo mức độ không giao hoán của đạo hàm hiệp biến (hoặc góc xoay của vector khi vận chuyển song song quanh một vòng kín).

---

### Giải thích: Làm sao nhận diện một tensor thật sự và vì sao nó bất biến?

#### Bước 1: Tách bạch "đối tượng hình học" khỏi "bảng tọa độ"
Một vector $$v = v^i \partial_i$$ không đổi khi ta đổi hệ tọa độ, nhưng bộ số $$(v^1, \ldots, v^n)$$ thì có. Sự thay đổi của $$v^i$$ luôn **bù trừ chính xác** cho sự thay đổi của cơ sở $$\partial_i$$!

#### Bước 2: Kiểm tra quy tắc biến đổi tuyến tính thuần nhất
Mọi tensor $$T$$ biến đổi bằng cách nhân tuyến tính với các ma trận Jacobi $$\frac{\partial y}{\partial x}$$ và $$\frac{\partial x}{\partial y}$$ — **không có số hạng cộng thêm nào chứa đạo hàm bậc hai** $$\frac{\partial^2 x}{\partial y^2}$$. Chính vì tính thuần nhất này, một hệ quả cực mạnh ra đời: **nếu mọi thành phần của một tensor bằng $$0$$ trong một hệ tọa độ, thì chúng bằng $$0$$ trong MỌI hệ tọa độ!**

#### Bước 3: Hiểu vì sao phương trình vật lý dạng tensor có giá trị phổ quát
Nếu viết một định luật dưới dạng $$A_{\mu\nu} = B_{\mu\nu}$$ (tức hiệu $$T_{\mu\nu} = A_{\mu\nu} - B_{\mu\nu} = 0$$ là một tensor), thì định luật ấy đúng trong hệ tọa độ của người đứng trên Trái Đất **khi và chỉ khi** nó đúng trong hệ tọa độ của phi hành gia bay quanh lỗ đen!

#### Bước 4: Cảnh giác với các "giả tensor" — điển hình là ký hiệu Christoffel
Ở Bài 12, ta sẽ thấy khi đổi từ tọa độ Descartes sang tọa độ cực trên chính mặt phẳng $$\mathbb{R}^2$$ phẳng lì, các ký hiệu Christoffel nhảy từ $$0$$ sang khác $$0$$ ($$\Gamma^r_{\theta\theta} = -r \neq 0$$)! Bằng đúng tiêu chuẩn ở Bước 2, chỉ cần quan sát điều đó là biết ngay $$\Gamma^k_{ij}$$ **không phải** tensor!

Tóm tắt mạch tư duy tensor:

$$
\text{Ánh xạ đa tuyến tính}
\;\Longleftrightarrow\;
\text{Biến đổi thuần nhất theo Jacobi}
\;\Longrightarrow\;
T = 0 \text{ ở 1 hệ tọa độ} \iff T = 0 \text{ ở mọi hệ tọa độ}.
$$

## 5. Hình ảnh minh họa

![Tensor Ứng suất](https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Stress_tensor.svg/640px-Stress_tensor.svg.png)
*Hình 1: Tensor ứng suất Cauchy. Các mũi tên biểu diễn các thành phần lực tác dụng lên các mặt của một phân tố thể tích vô cùng nhỏ.*

![Covector như Chồng Mặt phẳng](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Covector_stack.svg/640px-Covector_stack.svg.png)
*Hình 2: Minh họa hình học của covector (dạng bậc 1). Trong khi vector là một mũi tên, covector được hình dung như một họ mặt phẳng song song. Giá trị của covector tác động lên vector là số lớp mặt phẳng mà vector xuyên qua.*

## 6. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Ricci-Curbastro, Gregorio & Levi-Civita, Tullio (1900).** *Méthodes de calcul différentiel absolu et leurs applications*.  
   Công trình nền tảng xây dựng phép tính tensor (phép tính vi phân tuyệt đối), công cụ mà Einstein sau này sử dụng cho Thuyết tương đối rộng.

2. **Einstein, Albert (1916).** *The Foundation of the General Theory of Relativity*.  
   Công trình đưa giải tích tensor từ toán học thuần túy trở thành ngôn ngữ trung tâm của vật lý lý thuyết hiện đại.

3. **Lee, John M. (2013).** *Introduction to Smooth Manifolds*.  
   Chương về tensor và trường tensor là tài liệu tham khảo chuẩn mực và chi tiết cho sinh viên toán học.

4. **Misner, Thorne, Wheeler (1973).** *Gravitation*.  
   Giáo trình kinh điển về thuyết tương đối rộng, trình bày cách tiếp cận hình học về tensor như các ánh xạ đa tuyến tính rất trực quan.

## 7. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 7.1. Vật lý: Thuyết Tương đối Rộng
Trong thuyết tương đối rộng, không gian và thời gian hợp nhất thành không-thời gian 4 chiều. Vì các định luật vật lý phải giữ nguyên dạng trong mọi hệ tọa độ, chúng được viết dưới dạng các phương trình tensor. Chẳng hạn, phương trình trường Einstein $$G_{\mu\nu} = 8\pi T_{\mu\nu}$$ liên hệ tensor độ cong Einstein $$G_{\mu\nu}$$ với tensor năng lượng – xung lượng $$T_{\mu\nu}$$.

### 7.2. Cơ học Môi trường Liên tục
Trong kỹ thuật cơ khí và xây dựng, trạng thái ứng suất bên trong vật thể rắn hoặc lỏng được mô tả bởi *tensor ứng suất Cauchy* $$\sigma_{ij}$$ (lực trên đơn vị diện tích theo các phương), còn biến dạng được mô tả bởi *tensor biến dạng* $$\epsilon_{ij}$$. Định luật Hooke tổng quát biểu diễn mối liên hệ tuyến tính (dạng tensor) giữa ứng suất và biến dạng.

### 7.3. Khoa học Dữ liệu và Học máy
Khái niệm "tensor" trong các thư viện như TensorFlow hay PyTorch thực chất chỉ các mảng đa chiều (multi-dimensional arrays). Dù tính chất biến đổi tọa độ ít được đặt nặng trong ngữ cảnh này, cách tổ chức dữ liệu theo nhiều chỉ số (chẳng hạn mảng 3 chiều cho video, 4 chiều cho một lô video) bắt nguồn trực tiếp từ cấu trúc chỉ số của tensor toán học.

### 7.4. Chẩn đoán Hình ảnh Y khoa: Diffusion Tensor Imaging (DTI)
Trong y học và xử lý ảnh 3D, kỹ thuật DTI sử dụng tensor khuếch tán (một tensor hạng 2 tại mỗi voxel) để mô tả sự khuếch tán có hướng của phân tử nước trong não, từ đó tái tạo hình ảnh các bó sợi thần kinh.

## Video tham khảo

- [Tensors for Beginners 4: What are Covectors?](https://www.youtube.com/watch?v=LNoQ_Q5JQMY) — eigenchris, tiếng Anh. Xem trước: trình bày vector và covector cùng chỉ số trên và chỉ số dưới, tương ứng với hình ảnh mũi tên và chồng mặt phẳng trong bài.
- [Change of basis \| Chapter 13, Essence of linear algebra](https://www.youtube.com/watch?v=P2LTAUO1TdA) — 3Blue1Brown, tiếng Anh. Minh họa việc đổi cơ sở làm tọa độ biến đổi ngược chiều với cơ sở — nền tảng đại số tuyến tính cho quy tắc biến đổi tensor.
- [Tensor Calculus 12: The Metric Tensor in Curved Spaces for Measuring Arc Length](https://www.youtube.com/watch?v=SmjbpIgVKFs) — eigenchris, tiếng Anh. Trình bày tensor metric kiểu $$(0,2)$$ dùng để đo độ dài cung, đúng với ví dụ trung tâm của bài giảng.

## 8. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đếm số thành phần**
Một tensor tổng quát kiểu $$(1, 2)$$ trong không gian 3 chiều có bao nhiêu thành phần độc lập? Kết quả thay đổi thế nào trong không gian 4 chiều (như không-thời gian)?
(Gợi ý: Số thành phần là $$n^{r+s}$$).

**Bài tập 2: Tích Tensor**
Cho $$v = (1, 2)$$ và $$w = (3, 4)$$ trong $$\mathbb{R}^2$$. Hãy viết ma trận biểu diễn tích tensor $$v \otimes w$$.

**Bài tập 3: Rút gọn chỉ số (Contraction)**
Cho tensor $$T^i_j$$. Phép rút gọn chỉ số (đặt $$i=j$$ và lấy tổng) cho ra số thực $$S = \sum_i T^i_i$$. Trong đại số tuyến tính, đại lượng này gọi là gì của ma trận $$T$$? (Gợi ý: Vết — Trace).

**Bài tập 4: Metric và phép hạ chỉ số**
Xét không gian $$\mathbb{R}^2$$ với metric Euclid $$g_{ij} = \delta_{ij}$$ (ma trận đơn vị) và vector $$v^i = (3, -1)$$. Tính các thành phần của covector tương ứng $$v_i = g_{ij}v^j$$. Nếu metric đổi thành $$g_{11}=2, g_{22}=3, g_{12}=0$$, thì các thành phần $$v_i$$ mới bằng bao nhiêu?

**Bài tập 5: Suy ngẫm về Vật lý**
Vì sao các đại lượng vật lý như lực, vận tốc hay điện trường phải là vector hoặc tensor thay vì những danh sách số tùy ý? (Gợi ý: Xét việc xoay hệ quy chiếu hoặc thay đổi vị trí quan sát — bản thân quy luật tự nhiên có thay đổi không?)

---

Trong bài giảng tiếp theo, chúng ta sẽ giải quyết một câu hỏi quan trọng: làm thế nào để lấy đạo hàm của một trường vector trên một bề mặt cong? Vì phép lấy đạo hàm thông thường không còn phù hợp, ta sẽ cần đến khái niệm *Liên kết* (Connection) và *Đạo hàm hiệp biến*.
