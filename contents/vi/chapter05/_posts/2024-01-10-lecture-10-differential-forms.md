---
layout: post
lang: vi
title: "Bài 10: Dạng Vi phân và Giải tích Ngoài — Giới thiệu Khái niệm"
chapter: "05"
order: 1
owner: "Hình học Vi phân"
---

## 1. Tổng quan

Trong chín bài giảng trước, chúng ta đã xây dựng nền tảng của hình học vi phân cổ điển: đường cong, mặt cong, độ cong và đường trắc địa (geodesics). Các công cụ được dùng chủ yếu đến từ giải tích vector như hệ tọa độ, đạo hàm riêng và các tensor như dạng cơ bản thứ nhất và thứ hai.

Trong bài giảng này, chúng ta chuyển sang một cách tiếp cận hiện đại và tổng quát hơn: *giải tích ngoài* (exterior calculus) và *dạng vi phân* (differential forms). Đây là ngôn ngữ tiêu chuẩn của hình học vi phân hiện đại, do Élie Cartan và các nhà toán học thế kỷ 20 phát triển, đóng vai trò nền tảng cho hình học Riemann, lý thuyết đa tạp, tô pô vi phân và vật lý lý thuyết.

Dạng vi phân mang lại cách tiếp cận độc lập tọa độ, gọn gàng và giàu tính khái niệm để nghiên cứu phép tích phân, tính định hướng cũng như mối liên hệ giữa hình học cục bộ và toàn cục. Một trong những kết quả trung tâm là *Định lý Stokes tổng quát*, hợp nhất nhiều định lý cổ điển như định lý Green, định lý Gauss–Ostrogradsky và định lý Stokes trong giải tích vector.

Bài giảng này dừng ở mức giới thiệu khái niệm, giúp bạn nắm bức tranh tổng thể làm bàn đạp cho các chủ đề chuyên sâu hơn của hình học vi phân hiện đại.

## 2. Giải thích Trực quan

### 2.1. Dạng Vi phân: Các đối tượng có thể lấy tích phân

Trong giải tích một biến, ta thường tính tích phân có dạng $$\int f(x) \, dx$$. Biểu thức $$f(x) \, dx$$ không chỉ là hàm số $$f(x)$$, mà là một đối tượng toán học riêng biệt gọi là *dạng vi phân bậc 1* (1-form). Ký hiệu $$dx$$ không đơn thuần là "một phần vô cùng nhỏ của $$x$$", mà là một thực thể toán học tuân theo các quy tắc đại số xác định.

Trong không gian ba chiều, ta có các dạng vi phân bậc 0 (hàm số), bậc 1 (như $$f \, dx + g \, dy + h \, dz$$), bậc 2 (như $$f \, dx \wedge dy + g \, dy \wedge dz + h \, dz \wedge dx$$) và bậc 3 (như $$f \, dx \wedge dy \wedge dz$$).

### 2.2. Dạng 1-form: Công (Work)

Xét một trường lực $$\mathbf{F}$$ trong không gian. Khi một hạt chuyển động dọc theo một đường cong, lực thực hiện công. Dạng 1-form $$\omega = F_x dx + F_y dy + F_z dz$$ là công cụ đo đại lượng này: nó nhận vào một vector tiếp tuyến (vận tốc của hạt) và trả về một số thực (công suất tức thời). Tích phân của 1-form dọc theo đường cong cho ta tổng công thực hiện.

> [!TIP]
> **Hình dung "Cây thước dây":**
> Có thể hình dung vector như một mũi tên trong không gian, còn **1-form** như một cây thước dây (hay hệ các vạch chia song song) đặt sẵn:
> - Cây thước (1-form) đứng yên như một công cụ đo.
> - Khi mũi tên (vector) đi qua, thước đo xem mũi tên đó dài bao nhiêu theo phương của thước.
> - Nếu mũi tên vuông góc với phương đo, kết quả bằng 0.
> - Nói gọn lại, 1-form là một phép đo độ dài có hướng.

### 2.3. Dạng 2-form: Thông lượng (Flux)

Xét một dòng chảy chất lỏng (hoặc gió) trong không gian và ta cần đo lượng chất lỏng đi qua một mảnh mặt nhỏ. Dạng 2-form $$\eta = V_x dy \wedge dz + V_y dz \wedge dx + V_z dx \wedge dy$$ là công cụ đo thông lượng này: nó nhận vào hai vector tiếp tuyến (tạo thành một hình bình hành nhỏ trên mặt) và trả về thể tích chất lỏng chảy qua hình bình hành đó trong một đơn vị thời gian.

> [!TIP]
> **Hình dung "Chiếc vợt lưới":**
> Có thể hình dung **2-form** như một chiếc vợt lưới đặt trong dòng chảy:
> - Khi đặt vợt (2-form) vào dòng chảy, lượng chất lỏng đi qua lưới phụ thuộc vào góc nghiêng của lưới so với hướng dòng.
> - Tích phân của 2-form trên một bề mặt chính là tổng lưu lượng đi qua toàn bộ bề mặt đó (thông lượng).

### 2.4. Tích Ngoài: Tính phản đối xứng

Ký hiệu $$\wedge$$ (đọc là "wedge" hay tích nêm) là *tích ngoài* (exterior product). Đối với các dạng bậc 1, phép toán này có tính phản đối xứng:

$$
dx \wedge dy = -dy \wedge dx, \quad dx \wedge dx = 0.
$$

Tính chất này phản ánh việc khi lấy tích phân trên một miền hai chiều, thứ tự các biến tích phân quyết định định hướng của miền. Diện tích định hướng của hình bình hành sinh bởi cặp vector $$(\mathbf{u}, \mathbf{v})$$ trái dấu với diện tích sinh bởi cặp $$(\mathbf{v}, \mathbf{u})$$.

> [!NOTE]
> **Mảnh diện tích có hướng:**
> Có thể hình dung $$dx \wedge dy$$ như một mảnh diện tích hình chữ nhật vô cùng nhỏ có gán hướng. Khi lật ngược mặt của mảnh diện tích đó, định hướng đổi chiều và biểu thức đổi dấu; đó là lý do $$dx \wedge dy = -dy \wedge dx$$.

### 2.5. Đạo hàm Ngoài: Tổng quát hóa Gradient, Curl và Divergence

Trong giải tích vector, ta có ba phép toán quen thuộc là gradient (grad), curl và divergence (div). Trong giải tích ngoài, cả ba đều là trường hợp riêng của một phép toán duy nhất: *đạo hàm ngoài* $$d$$.

- Nếu $$\omega$$ là dạng bậc 0 (hàm số), thì $$d\omega$$ tương ứng với gradient.
- Nếu $$\omega$$ là dạng bậc 1, thì $$d\omega$$ tương ứng với curl.
- Nếu $$\omega$$ là dạng bậc 2, thì $$d\omega$$ tương ứng với divergence.

Một tính chất cơ bản của đạo hàm ngoài là $$d^2 = 0$$: lấy đạo hàm ngoài hai lần liên tiếp luôn cho kết quả bằng 0. Tính chất này bao hàm hai đồng nhất thức quen thuộc trong giải tích vector:

$$
\text{curl}(\text{grad} f) = 0, \quad \text{div}(\text{curl} \mathbf{F}) = 0.
$$

> [!IMPORTANT]
> **Đạo hàm ngoài và mối liên hệ với biên:**
> Định lý Stokes phát biểu rằng $$\int_M d\omega = \int_{\partial M} \omega$$.
> Có thể hiểu $$d\omega$$ như mật độ của đại lượng phân bố bên trong miền $$M$$ mà tổng của nó được phản ánh qua giá trị của $$\omega$$ trên biên $$\partial M$$:
> - Gradient đo tốc độ biến thiên của hàm số (tích phân cho hiệu giá trị tại hai đầu mút).
> - Curl đo độ xoáy cục bộ (tích phân mặt cho lưu số dọc theo đường biên kín).
> - Divergence đo độ phân kỳ của nguồn (tích phân thể tích cho thông lượng qua mặt biên).
> Cả ba đều thể hiện cùng một nguyên lý: hành vi bên trong một miền liên hệ trực tiếp với đại lượng đo được trên biên của miền đó.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Dạng Vi phân Bậc k

<div class="textbook-definition" markdown="1">
**Định nghĩa:**  
Trên không gian $$\mathbb{R}^n$$ với hệ tọa độ $$(x^1, \ldots, x^n)$$, một *dạng vi phân bậc $$k$$* (hay $$k$$-form) là một biểu thức có dạng

$$
\omega = \sum_{i_1 < \cdots < i_k} f_{i_1 \cdots i_k} \, dx^{i_1} \wedge \cdots \wedge dx^{i_k},
$$

trong đó các hệ số $$f_{i_1 \cdots i_k}$$ là các hàm số trơn.
</div>

**Ví dụ trong $$\mathbb{R}^3$$:**

- Dạng bậc 0: $$f$$ (hàm số).
- Dạng bậc 1: $$\omega = f \, dx + g \, dy + h \, dz$$.
- Dạng bậc 2: $$\omega = f \, dy \wedge dz + g \, dz \wedge dx + h \, dx \wedge dy$$.
- Dạng bậc 3: $$\omega = f \, dx \wedge dy \wedge dz$$.

### 3.2. Tích Ngoài (Wedge Product)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**  
Tích ngoài $$\wedge$$ là phép nhân giữa các dạng vi phân, thỏa mãn tính song tuyến tính cùng hai tính chất:

1. **Tính kết hợp:** $$(\alpha \wedge \beta) \wedge \gamma = \alpha \wedge (\beta \wedge \gamma)$$.
2. **Tính phản giao hoán phân bậc:** Nếu $$\alpha$$ là $$k$$-form và $$\beta$$ là $$l$$-form, thì
$$
\alpha \wedge \beta = (-1)^{k \cdot l} \beta \wedge \alpha.
$$
</div>

<div class="textbook-theorem" markdown="1">
**Hệ quả:**  
$$dx^i \wedge dx^j = -dx^j \wedge dx^i$$, và $$dx^i \wedge dx^i = 0$$.
</div>

### 3.3. Đạo hàm Ngoài

<div class="textbook-definition" markdown="1">
**Định nghĩa:**  
*Đạo hàm ngoài* $$d$$ là một ánh xạ tuyến tính biến đổi các $$k$$-form thành $$(k+1)$$-form, xác định bởi công thức:

Nếu $$\omega = f_{i_1 \cdots i_k} \, dx^{i_1} \wedge \cdots \wedge dx^{i_k}$$, thì

$$
d\omega = \sum_j \frac{\partial f_{i_1 \cdots i_k}}{\partial x^j} \, dx^j \wedge dx^{i_1} \wedge \cdots \wedge dx^{i_k}.
$$
</div>

**Tính chất quan trọng:**

1. **Quy tắc Leibniz phân bậc:** $$d(\alpha \wedge \beta) = d\alpha \wedge \beta + (-1)^k \alpha \wedge d\beta$$, nếu $$\alpha$$ là $$k$$-form.
2. **$$d^2 = 0$$:** $$d(d\omega) = 0$$ với mọi dạng vi phân $$\omega$$.

**Ví dụ trong $$\mathbb{R}^3$$:**

- $$d(f) = \frac{\partial f}{\partial x} dx + \frac{\partial f}{\partial y} dy + \frac{\partial f}{\partial z} dz$$ (tương ứng với gradient).
- Nếu $$\omega = P \, dx + Q \, dy + R \, dz$$, thì
$$
d\omega = \left(\frac{\partial R}{\partial y} - \frac{\partial Q}{\partial z}\right) dy \wedge dz + \left(\frac{\partial P}{\partial z} - \frac{\partial R}{\partial x}\right) dz \wedge dx + \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\right) dx \wedge dy
$$
(tương ứng với curl).

### 3.4. Định lý Stokes Tổng quát

<div class="textbook-theorem" markdown="1">
**Định lý (Định lý Stokes Tổng quát):**  
Cho $$M$$ là một đa tạp định hướng $$k$$ chiều có biên $$\partial M$$, và $$\omega$$ là một $$(k-1)$$-form trơn (có giá compact) trên $$M$$. Khi đó

$$
\int_M d\omega = \int_{\partial M} \omega.
$$
</div>

**Ý nghĩa:**  
Định lý này hợp nhất các định lý tích phân cổ điển và chỉ ra mối liên hệ trực tiếp giữa tích phân của đạo hàm trên miền với tích phân của chính dạng đó trên biên.

Các trường hợp đặc biệt bao gồm:
- **Định lý cơ bản của giải tích:** $$\int_a^b f'(x) \, dx = f(b) - f(a)$$.
- **Định lý Green:** trên miền phẳng.
- **Định lý Stokes cổ điển:** trên mặt cong trong $$\mathbb{R}^3$$.
- **Định lý Gauss–Ostrogradsky (định lý phân kỳ):** trên miền thể tích trong $$\mathbb{R}^3$$.

## 4. Các Ví dụ Tính toán Chi tiết

### 4.1. Tính Tích Ngoài

Cho $$\alpha = 2dx + 3dy$$ và $$\beta = dx - 5dy$$. Ta có:
$$
\begin{aligned}
\alpha \wedge \beta &= (2dx + 3dy) \wedge (dx - 5dy) \\
&= 2dx \wedge dx - 10dx \wedge dy + 3dy \wedge dx - 15dy \wedge dy \\
&= 0 - 10dx \wedge dy - 3dx \wedge dy - 0 \\
&= -13 dx \wedge dy.
\end{aligned}
$$

### 4.2. Tính Đạo hàm Ngoài

Cho $$\omega = x^2 y \, dx + yz \, dy$$. Ta có:
$$
\begin{aligned}
d\omega &= d(x^2 y) \wedge dx + d(yz) \wedge dy \\
&= (2xy \, dx + x^2 \, dy) \wedge dx + (z \, dy + y \, dz) \wedge dy \\
&= 2xy \, dx \wedge dx + x^2 \, dy \wedge dx + z \, dy \wedge dy + y \, dz \wedge dy \\
&= 0 - x^2 \, dx \wedge dy + 0 - y \, dy \wedge dz \\
&= -x^2 \, dx \wedge dy - y \, dy \wedge dz.
\end{aligned}
$$

## 5. Hình ảnh minh họa

![Thông lượng qua bề mặt](https://upload.wikimedia.org/wikipedia/commons/7/72/Flux_diagram.png)
*Hình 1: Thông lượng (Flux) của một trường vector qua một bề mặt. Trong ngôn ngữ dạng vi phân, đại lượng này là tích phân của một 2-form trên mặt.*

![Trường Vector](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Vector_field_2.svg/640px-Vector_field_2.svg.png)
*Hình 2: Một trường vector trong không gian. Dạng 1-form tương ứng đo công của trường vector dọc theo một đường cong.*

## 6. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Cartan, Élie (1922).** *Leçons sur les Invariants Intégraux*.  
   Công trình đặt nền tảng cho lý thuyết dạng vi phân và giải tích ngoài hiện đại.

2. **de Rham, Georges (1931).** Lý thuyết đối đồng điều de Rham, kết nối dạng vi phân với tô pô đại số.

3. **Spivak, Michael (1965).** *Calculus on Manifolds*.  
   Tài liệu nhập môn súc tích và chặt chẽ về dạng vi phân và định lý Stokes.

4. **Tu, Loring W. (2011).** *An Introduction to Manifolds* (2nd Edition).  
   Giáo trình hiện đại và dễ tiếp cận về đa tạp và dạng vi phân.

5. **Lee, John M. (2013).** *Introduction to Smooth Manifolds* (2nd Edition).  
   Giáo trình đầy đủ về đa tạp trơn, bao gồm dạng vi phân, tích phân trên đa tạp và đối đồng điều.

## 7. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 7.1. Vật lý: Điện từ học và Phương trình Maxwell

Trong ngôn ngữ dạng vi phân, hệ phương trình Maxwell có dạng rất gọn:

$$
dF = 0, \quad d(*F) = J,
$$

trong đó $$F$$ là dạng bậc 2 biểu diễn trường điện từ, $$*$$ là toán tử sao Hodge (Hodge star) và $$J$$ là dạng bậc 3 biểu diễn dòng điện.

### 7.2. Vật lý: Thuyết Tương đối Rộng

Tensor độ cong Riemann và phương trình trường Einstein có thể được biểu diễn ngắn gọn thông qua dạng vi phân và các dạng liên kết (connection forms).

### 7.3. Tô pô Đại số: Đối đồng điều de Rham

Không gian thương của các dạng đóng ($$d\omega = 0$$) theo các dạng khớp ($$\omega = d\eta$$) tạo thành *đối đồng điều de Rham* — một bất biến tô pô của đa tạp.

### 7.4. Kỹ thuật: Phương pháp Phần tử Hữu hạn

Trong phương pháp phần tử hữu hạn (Finite Element Method), dạng vi phân được dùng để rời rạc hóa và mô hình hóa các trường vật lý (như trường điện từ, dòng chảy chất lỏng) theo cách bảo toàn cấu trúc hình học.

**Ví dụ cụ thể:**  
Định lý Stokes cổ điển:

$$
\int_S (\nabla \times \mathbf{F}) \cdot \mathbf{n} \, dA = \oint_{\partial S} \mathbf{F} \cdot d\mathbf{r}
$$

là trường hợp riêng của định lý Stokes tổng quát $$\int_M d\omega = \int_{\partial M} \omega$$ khi $$\omega$$ là dạng bậc 1 tương ứng với trường vector $$\mathbf{F}$$.

## Video tham khảo

- [Differential Forms \| What is a 1-form?](https://www.youtube.com/watch?v=Pw1ejJzsCPA) — Michael Penn, tiếng Anh. Xem trước: 1-form là ánh xạ tuyến tính nhận một vector tiếp tuyến và trả về một số thực, khớp với hình ảnh "thước dây" và ví dụ về công của lực.
- [Divergence and curl:  The language of Maxwell's equations, fluid flow, and more](https://www.youtube.com/watch?v=rB83DpBJQsE) — 3Blue1Brown, tiếng Anh. Trình bày gradient, curl và divergence trong cùng một ngôn ngữ hình học, dẫn tới định lý Stokes tổng quát trong bài.
- [The general Stoke's theorem via differential forms.](https://www.youtube.com/watch?v=jeImPnUeBBY) — Michael Penn, tiếng Anh. Trình bày định lý Stokes qua dạng vi phân, $$\int_\Omega d\omega = \int_{\partial\Omega}\omega$$, đúng trọng tâm của bài giảng.

## 8. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1:** Tính đạo hàm ngoài của dạng bậc 0 (hàm số) $$f(x, y, z) = x^2 + y^2 + z^2$$ và so sánh kết quả với gradient.

**Bài tập 2:** Cho dạng bậc 1 $$\omega = y \, dx + z \, dy + x \, dz$$. Tính $$d\omega$$ và diễn giải kết quả dưới dạng curl của trường vector tương ứng.

**Bài tập 3:** Kiểm tra tính chất $$d^2 = 0$$ bằng cách tính $$d(df)$$ cho một hàm số trơn $$f$$ bất kỳ.

**Bài tập 4:** Tìm hiểu mối liên hệ giữa dạng vi phân và tensor. Dạng bậc 1 liên hệ với covector như thế nào?

**Bài tập 5:** Suy ngẫm: Vì sao dạng vi phân được xem là "độc lập tọa độ" hơn so với các biểu diễn vector thông thường?

**Bài tập 6:** Đọc thêm về *đối đồng điều de Rham* và cách khái niệm này kết nối hình học vi phân với tô pô.

**Bài tập 7:** Tìm hiểu ứng dụng của dạng vi phân trong vật lý hiện đại, đặc biệt trong lý thuyết trường lượng tử và lý thuyết dây.

**Bài tập 8:** Tìm hiểu sơ lược về *phân thớ* (fiber bundles) và *liên kết* (connections) — các khái niệm trung tâm của hình học vi phân hiện đại và vật lý lý thuyết.

---

## Kết luận Khóa học

Chúng ta đã hoàn thành chặng đầu tiên của khóa học hình học vi phân, đi từ đường cong trong không gian ba chiều đến mặt cong, độ cong, đường trắc địa và dạng vi phân — ngôn ngữ của hình học hiện đại.

Những nội dung vừa học mới chỉ là nền tảng ban đầu. Hình học vi phân là một lĩnh vực rộng lớn với nhiều hướng phát triển chuyên sâu như hình học Riemann, hình học symplectic, hình học phức, lý thuyết đa tạp và tô pô vi phân, đồng thời gắn bó chặt chẽ với vật lý, kỹ thuật và khoa học máy tính.

Bạn có thể xem phần kiến thức này như bản đồ định hướng cho các chương tiếp theo và cho việc tự học sâu hơn về sau.

*"Hình học là nghệ thuật suy luận chính xác từ những hình vẽ không chính xác."*  
— George Pólya

*"Thượng đế luôn luôn hình học hóa."*  
— Plato (theo truyền thống)
