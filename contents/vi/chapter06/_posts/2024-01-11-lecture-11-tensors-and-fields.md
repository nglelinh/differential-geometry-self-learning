---
layout: post
lang: vi
title: "Bài 11: Tensor và Trường Tensor trên Đa tạp"
chapter: "06"
order: 1
owner: "Hình học Vi phân"
---

## 1. Tổng quan

Trong các bài giảng trước, chúng ta đã làm quen với vector tiếp tuyến (đại diện cho vận tốc, hướng) và vector pháp tuyến. Tuy nhiên, để mô tả đầy đủ các tính chất hình học và vật lý trên một đa tạp, vector thôi là chưa đủ. Chúng ta cần những đối tượng phức tạp hơn có thể kết hợp nhiều vector lại với nhau, đo lường độ lớn, thể tích, hoặc mô tả các quan hệ tuyến tính phức tạp. Những đối tượng đó được gọi là *tensor*.

Tensor là khái niệm nền tảng không chỉ trong hình học vi phân cao cấp mà còn trong vật lý lý thuyết (Thuyết tương đối rộng, Cơ học lượng tử) và kỹ thuật (Cơ học môi trường liên tục, Ứng suất - Biến dạng). Nếu vector là "mũi tên", thì tensor có thể được hình dung như một "cỗ máy" đa năng: bạn đưa vào đó các vector, và nó trả về cho bạn một con số thực hoặc một vector khác.

Trong bài giảng này, chúng ta sẽ xây dựng khái niệm tensor từ nền tảng đại số tuyến tính (không gian đối ngẫu, tích tensor) lên đa tạp trơn. Chúng ta sẽ học cách làm việc với các chỉ số (indices) — ký hiệu Einstein — một công cụ tính toán cực kỳ hiệu quả. Cuối cùng, chúng ta sẽ thấy rằng metric (dạng cơ bản thứ nhất) mà chúng ta đã học thực chất là một tensor hạng (0,2).

Việc nắm vững ngôn ngữ tensor là bước chuẩn bị thiết yếu để hiểu về độ cong Riemann và các phương trình trường của Einstein trong các bài giảng cuối của khóa học.

## 2. Giải thích Trực quan

## 2. Giải thích Trực quan

### 2.1. Tensor như một "Cỗ máy Ăn Vector"

Hãy tưởng tượng một tensor như một cỗ máy màu đen với các khe cắm (slots).
- Một **hàm số** (scalar) là một cỗ máy không có khe cắm nào. Nó chỉ là một con số.
- Một **covector** (dạng 1) là một cỗ máy có 1 khe cắm. Bạn nhét vào đó một vector, nó nhả ra một con số. Ví dụ: $$df(\mathbf{v})$$ là đạo hàm theo hướng $$\mathbf{v}$$.
- Một **metric tensor** $$g$$ là một cỗ máy có 2 khe cắm. Bạn nhét vào hai vector $$\mathbf{u}$$ và $$\mathbf{v}$$, nó nhả ra tích vô hướng $$g(\mathbf{u}, \mathbf{v})$$.
- Một **tensor độ cong Riemann** là một cỗ máy có 3 khe cắm đầu vào và 1 khe cắm đầu ra (hoặc 4 khe cắm đầu vào nếu coi nó là tensor (0,4)).

> [!TIP]
> **Góc nhìn Lập trình viên: "Data Container with Rules":**
> Hãy nghĩ về Tensor như một cấu trúc dữ liệu (struct/class) chứa một mảng đa chiều các con số.
> Nhưng nó không chỉ là mảng số! Nó đi kèm với một **phương thức (method) biến đổi tọa độ**.
> - Nếu bạn đổi hệ tọa độ (ví dụ: xoay trục), các con số trong mảng sẽ tự động cập nhật theo một công thức toán học chính xác để đảm bảo ý nghĩa vật lý của nó không đổi.
> - "Tensor là một đối tượng biến đổi như một tensor" — nghĩa là nó tuân thủ đúng cái interface biến đổi đó.

Điều quan trọng nhất của tensor là tính *đa tuyến tính* (multilinearity): nó tuyến tính trên từng khe cắm riêng biệt. Nếu bạn nhét vào vector $$2\mathbf{v}$$, kết quả đầu ra sẽ gấp đôi (hoặc gấp 4, 8... tùy thuộc vào số lượng khe cắm mà vector đó đi vào, nhưng với tensor đơn giản thì là tuyến tính).

### 2.2. Vector vs Covector: Mũi tên và Chồng Bánh kếp

- **Vector (Contravariant):** Được hình dung như một mũi tên. Nó đại diện cho sự dịch chuyển hoặc vận tốc.
- **Covector (Covariant):** Được hình dung như một tập hợp các mặt phẳng song song đều nhau (giống như một chồng bánh kếp hoặc các đường đồng mức trên bản đồ).

Khi một vector "tác động" lên một covector (hoặc ngược lại), chúng ta đếm xem mũi tên xuyên qua bao nhiêu mặt phẳng. Số lượng mặt phẳng bị xuyên qua chính là giá trị của phép đo.

### 2.3. Tại sao cần Chỉ số trên/dưới?

Trong hình học vi phân, chúng ta phân biệt chặt chẽ giữa vector (thường viết chỉ số trên, $$v^i$$) và covector (thường viết chỉ số dưới, $$\alpha_i$$).
- **Vector (contravariant):** Biến đổi ngược với cơ sở. Ví dụ: nếu thước đo dài gấp đôi (cơ sở tăng), số đo chiều dài sẽ giảm một nửa (thành phần giảm).
- **Covector (covariant):** Biến đổi cùng chiều với cơ sở. Ví dụ: gradient của một hàm số.

> [!NOTE]
> **Ví dụ "Đổi Tiền" (Currency Exchange):**
> Hãy tưởng tượng bạn đổi đơn vị tiền tệ từ USD sang Cents.
> - **Cơ sở (Basis):** 1 USD $$\to$$ 1 Cent. Cơ sở trở nên "nhỏ đi" 100 lần.
> - **Số tiền (Vector Component):** Nếu bạn có 1 tờ tiền (1 USD), bây giờ bạn có 100 xu. Số lượng thành phần "tăng lên" 100 lần. (Đây là Contravariant - biến đổi ngược).
> - **Giá trị (Covector Component):** Nếu một cái kẹo giá 1 USD/cái, thì giá của nó là 0.01 USD/xu. Giá trị trên mỗi đơn vị cơ sở "giảm đi" 100 lần. (Đây là Covariant - biến đổi cùng chiều với độ lớn của cơ sở).

Tensor là sự kết hợp của các thành phần này. Ký hiệu chỉ số giúp chúng ta theo dõi chính xác loại đối tượng nào đang được xử lý và đảm bảo tính bất biến (invariant) của các phương trình vật lý dưới sự thay đổi hệ tọa độ.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Không gian Đối ngẫu (Dual Space)

**Định nghĩa:**
Cho $$V$$ là một không gian vector thực $$n$$ chiều. *Không gian đối ngẫu* $$V^*$$ là tập hợp tất cả các ánh xạ tuyến tính từ $$V$$ vào $$\mathbb{R}$$. Các phần tử của $$V^*$$ gọi là covector hoặc dạng 1.

Nếu $$\{e_1, \dots, e_n\}$$ là cơ sở của $$V$$, thì cơ sở đối ngẫu $$\{\epsilon^1, \dots, \epsilon^n\}$$ của $$V^*$$ được định nghĩa bởi:
$$
\epsilon^i(e_j) = \delta^i_j = \begin{cases} 1 & \text{nếu } i=j \\ 0 & \text{nếu } i \neq j \end{cases}
$$

### 3.2. Tensor và Tích Tensor

**Định nghĩa:**
Một tensor kiểu $$(r, s)$$ trên không gian vector $$V$$ là một ánh xạ đa tuyến tính:
$$
T: \underbrace{V^* \times \dots \times V^*}_{r \text{ lần}} \times \underbrace{V \times \dots \times V}_{s \text{ lần}} \to \mathbb{R}
$$
- $$r$$ là số lượng chỉ số "contravariant" (trên).
- $$s$$ là số lượng chỉ số "covariant" (dưới).

**Ký hiệu:**
Không gian các tensor kiểu $$(r, s)$$ ký hiệu là $$T^{(r, s)}(V) = V \otimes \dots \otimes V \otimes V^* \otimes \dots \otimes V^*$$.

### 3.3. Thành phần của Tensor và Quy ước Einstein

Trong một hệ tọa độ địa phương $$(x^1, \dots, x^n)$$, chúng ta có cơ sở vector $$\{\frac{\partial}{\partial x^i}\}$$ và cơ sở covector $$\{dx^i\}$$.

Một tensor $$T$$ kiểu $$(1, 2)$$ có thể được viết là:
$$
T = T^i_{jk} \frac{\partial}{\partial x^i} \otimes dx^j \otimes dx^k
$$
(Sử dụng quy ước tổng Einstein: chỉ số lặp lại một trên một dưới nghĩa là lấy tổng theo chỉ số đó từ 1 đến $$n$$).

Các số $$T^i_{jk}$$ là *thành phần* của tensor trong hệ tọa độ đó.

### 3.4. Quy tắc Biến đổi Tọa độ

Khi đổi từ hệ tọa độ $$x$$ sang $$y$$, các thành phần của tensor biến đổi theo quy tắc chuỗi (chain rule) cho từng chỉ số:

$$
T'^{p}_{qr} = T^i_{jk} \underbrace{\frac{\partial y^p}{\partial x^i}}_{\text{cho chỉ số trên}} \underbrace{\frac{\partial x^j}{\partial y^q}}_{\text{cho chỉ số dưới}} \underbrace{\frac{\partial x^k}{\partial y^r}}_{\text{cho chỉ số dưới}}
$$

Đây chính là định nghĩa thực dụng của tensor trong vật lý: "Tensor là đối tượng biến đổi như một tensor". Nếu một đại lượng không tuân theo quy tắc này khi đổi tọa độ, nó không phải là tensor (ví dụ: ký hiệu Christoffel không phải là tensor).

### 3.5. Tensor Metric (Metric Tensor)

**Định nghĩa:**
Tensor metric $$g$$ là một trường tensor kiểu $$(0, 2)$$, đối xứng và xác định dương. Tại mỗi điểm $$p$$, nó là một tích vô hướng trên không gian tiếp tuyến $$T_pM$$.
$$
g = g_{ij} dx^i \otimes dx^j
$$
Trong đó $$g_{ij} = g(\frac{\partial}{\partial x^i}, \frac{\partial}{\partial x^j})$$. Đây chính là các hệ số $$E, F, G$$ (trong 2D) được tổng quát hóa.

Metric cho phép chúng ta "hạ chỉ số" (chuyển vector thành covector) và ngược lại ("nâng chỉ số" bằng metric nghịch đảo $$g^{ij}$$).

## 4. Các Ví dụ Quan trọng

### 4.1. Tensor Metric (Hạng 2)

Trong không gian Euclid 3D với tọa độ Descartes $$(x, y, z)$$, tensor metric là ma trận đơn vị:
$$
g_{ij} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix}
$$
Trong tọa độ cầu $$(r, \theta, \varphi)$$, nó trở thành:
$$
g_{ij} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & r^2 & 0 \\ 0 & 0 & r^2\sin^2\theta \end{pmatrix}
$$

### 4.2. Tensor Ứng suất (Stress Tensor)

Trong cơ học môi trường liên tục, tensor ứng suất Cauchy $$\sigma$$ là một tensor hạng (2, 0) (hoặc (0, 2) nếu dùng metric để hạ chỉ số). Thành phần $$\sigma_{ij}$$ biểu diễn lực theo phương $$i$$ tác dụng lên một mặt phẳng có pháp tuyến theo phương $$j$$.

### 4.3. Tensor Độ cong Riemann (Hạng 4)

Đây là tensor quan trọng nhất trong hình học Riemann, đo lường sự không giao hoán của đạo hàm hiệp biến (hoặc sự thay đổi của vector khi vận chuyển song song quanh một vòng kín). Nó là một tensor kiểu (1, 3), ký hiệu là $$R^i_{jkl}$$.

## 5. Hình ảnh minh họa

![Tensor Ứng suất](https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Stress_tensor.svg/640px-Stress_tensor.svg.png)
*Hình 1: Tensor ứng suất Cauchy. Các mũi tên biểu diễn các thành phần lực tác dụng lên các mặt của một phân tố thể tích vô cùng nhỏ.*

![Covector như Chồng Mặt phẳng](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Covector_stack.svg/640px-Covector_stack.svg.png)
*Hình 2: Minh họa hình học của Covector (dạng 1). Trong khi vector là một mũi tên, covector được hình dung như các lớp mặt phẳng song song. Giá trị của covector tác động lên vector là số lớp mặt phẳng mà vector xuyên qua.*

## 6. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1.  **Ricci-Curbastro, Gregorio & Levi-Civita, Tullio (1900).** *Méthodes de calcul différentiel absolu et leurs applications*.
    Công trình nền tảng phát triển phép tính tensor (hay còn gọi là phép tính vi phân tuyệt đối), công cụ mà sau này Einstein sử dụng cho Thuyết tương đối rộng.

2.  **Einstein, Albert (1916).** *The Foundation of the General Theory of Relativity*.
    Tác phẩm nổi tiếng nhất đưa giải tích tensor từ toán học thuần túy vào trung tâm của vật lý hiện đại.

3.  **Lee, John M. (2013).** *Introduction to Smooth Manifolds*.
    Chương về Tensor và Trường Tensor là tài liệu tham khảo chuẩn mực và chi tiết cho sinh viên toán.

4.  **Misner, Thorne, Wheeler (1973).** *Gravitation*.
    Cuốn "Kinh thánh" của thuyết tương đối, với cách giải thích hình học về tensor (cỗ máy đa tuyến tính) rất trực quan và sâu sắc.

## 7. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 7.1. Vật lý: Thuyết Tương đối Rộng
Trong thuyết tương đối, không gian và thời gian hòa quyện thành không-thời gian 4 chiều. Các định luật vật lý phải đúng trong mọi hệ quy chiếu, do đó chúng phải được viết dưới dạng các phương trình tensor.
Ví dụ: Phương trình trường Einstein $$G_{\mu\nu} = 8\pi T_{\mu\nu}$$ liên hệ tensor độ cong Einstein $$G_{\mu\nu}$$ với tensor năng lượng-xung lượng $$T_{\mu\nu}$$.

### 7.2. Cơ học Môi trường Liên tục
Trong kỹ thuật cơ khí và xây dựng, trạng thái ứng suất bên trong một vật thể rắn hoặc lỏng được mô tả bởi *tensor ứng suất Cauchy* $$\sigma_{ij}$$. Nó mô tả lực trên đơn vị diện tích theo các phương khác nhau. Biến dạng của vật thể được mô tả bởi *tensor biến dạng* $$\epsilon_{ij}$$. Định luật Hooke tổng quát là mối quan hệ tensor giữa ứng suất và biến dạng.

### 7.3. Khoa học Dữ liệu và Học máy
Khái niệm "Tensor" trong các thư viện như TensorFlow hay PyTorch thực chất là mảng đa chiều (multi-dimensional array). Mặc dù trong bối cảnh này, tính chất biến đổi tọa độ ít được nhấn mạnh, nhưng cấu trúc tổ chức dữ liệu (hạng 3 là video, hạng 4 là batch video...) lấy cảm hứng trực tiếp từ cấu trúc chỉ số của tensor toán học.

### 7.4. Đồ họa Máy tính: Diffusion Tensor Imaging (DTI)
Trong y học và đồ họa, DTI sử dụng tensor khuyếch tán (một tensor hạng 2 tại mỗi voxel) để mô tả sự di chuyển của phân tử nước trong não, giúp tái tạo hình ảnh các bó sợi thần kinh. Đây là ứng dụng trực tiếp của trường tensor trong xử lý ảnh 3D.

## 8. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đếm thành phần**
Một tensor hạng $$(1, 2)$$ trong không gian 3 chiều có bao nhiêu thành phần độc lập? Nếu không gian là 4 chiều (như không-thời gian) thì sao?
(Gợi ý: Số thành phần là $$n^{r+s}$$).

**Bài tập 2: Tích Tensor**
Cho $$v = (1, 2)$$ và $$w = (3, 4)$$ trong $$\mathbb{R}^2$$. Hãy viết ma trận biểu diễn tích tensor $$v \otimes w$$.

**Bài tập 3: Co thắt (Contraction)**
Cho tensor $$T^i_j$$. Phép co thắt chỉ số (cho $$i=j$$ và lấy tổng) tạo ra một số thực $$S = \sum_i T^i_i$$. Trong đại số tuyến tính, đại lượng này gọi là gì của ma trận $$T$$? (Gợi ý: Vết - Trace).

**Bài tập 4: Metric và Hạ chỉ số**
Cho không gian $$\mathbb{R}^2$$ với metric Euclid $$g_{ij} = \delta_{ij}$$ (ma trận đơn vị). Và cho một vector $$v^i = (3, -1)$$. Tính các thành phần của covector tương ứng $$v_i = g_{ij}v^j$$. Nếu metric thay đổi thành $$g_{11}=2, g_{22}=3, g_{12}=0$$, thì $$v_i$$ mới là gì?

**Bài tập 5: Suy ngẫm về Vật lý**
Tại sao các đại lượng vật lý (như lực, vận tốc, điện trường) lại là vector hoặc tensor mà không phải là những danh sách số ngẫu nhiên? (Gợi ý: Hãy nghĩ về việc quay đầu hoặc thay đổi vị trí quan sát - quy luật tự nhiên có thay đổi không?)

---

Trong bài giảng tiếp theo, chúng ta sẽ giải quyết một vấn đề hóc búa: Làm thế nào để lấy đạo hàm của một trường vector trên bề mặt cong? Khái niệm đạo hàm thông thường không còn hoạt động tốt, và chúng ta sẽ cần đến một công cụ mới gọi là *Liên kết* (Connection) hay *Đạo hàm hiệp biến*.
