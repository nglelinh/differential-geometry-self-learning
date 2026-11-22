---
layout: post
lang: vi
title: "Bài 11: Tensor và Trường Tensor trên Đa tạp"
chapter: "06"
order: 1
owner: "Hình học Vi phân"
---

## 1. Tổng quan

Trong các bài giảng trước, chúng ta đã làm quen với vector tiếp tuyến (biểu diễn vận tốc, hướng) và vector pháp tuyến. Tuy nhiên, để mô tả đầy đủ các tính chất hình học và vật lý trên đa tạp, chỉ dùng vector là chưa đủ. Ta cần những đối tượng tổng quát hơn có thể kết hợp nhiều vector cùng lúc, đo độ dài, thể tích hoặc biểu diễn các quan hệ đa tuyến tính phức tạp. Các đối tượng đó được gọi là *tensor*.

Tensor là khái niệm nền tảng trong hình học vi phân hiện đại, vật lý lý thuyết (Thuyết tương đối rộng, Cơ học lượng tử) và kỹ thuật (Cơ học môi trường liên tục, ứng suất – biến dạng). Nếu vector được hình dung như một mũi tên, thì tensor có thể xem như một hàm đa tuyến tính: nhận vào các vector (và covector) rồi trả về một số thực hoặc một vector khác.

Trong bài giảng này, chúng ta xây dựng khái niệm tensor từ nền tảng đại số tuyến tính (không gian đối ngẫu, tích tensor) mở rộng lên đa tạp trơn, đồng thời làm quen với ký hiệu chỉ số và quy ước tổng Einstein. Cuối cùng, ta sẽ thấy metric (dạng cơ bản thứ nhất đã học) thực chất là một tensor kiểu $$(0, 2)$$.

Nắm vững ngôn ngữ tensor là bước chuẩn bị cần thiết để tiếp cận độ cong Riemann và phương trình trường Einstein ở các bài giảng sau.

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

## 4. Các Ví dụ Quan trọng

### 4.1. Tensor Metric (Hạng 2)

Trong không gian Euclid 3 chiều với tọa độ Descartes $$(x, y, z)$$, tensor metric là ma trận đơn vị:
$$
g_{ij} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix}
$$
Trong tọa độ cầu $$(r, \theta, \varphi)$$, tensor metric có dạng:
$$
g_{ij} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & r^2 & 0 \\ 0 & 0 & r^2\sin^2\theta \end{pmatrix}
$$

### 4.2. Tensor Ứng suất (Stress Tensor)

Trong cơ học môi trường liên tục, tensor ứng suất Cauchy $$\sigma$$ là một tensor kiểu $$(2, 0)$$ (hoặc kiểu $$(0, 2)$$ sau khi hạ chỉ số bằng metric). Thành phần $$\sigma_{ij}$$ biểu diễn lực theo phương $$i$$ tác dụng lên đơn vị diện tích của mặt phẳng có pháp tuyến theo phương $$j$$.

### 4.3. Tensor Độ cong Riemann (Hạng 4)

Đây là tensor trung tâm của hình học Riemann, đo mức độ không giao hoán của đạo hàm hiệp biến (hoặc góc xoay của vector khi vận chuyển song song quanh một vòng kín). Nó là một tensor kiểu $$(1, 3)$$, ký hiệu là $$R^i_{jkl}$$.

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
