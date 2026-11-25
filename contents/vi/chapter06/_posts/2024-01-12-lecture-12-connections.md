---
layout: post
lang: vi
title: "Bài 12: Liên kết và Đạo hàm Hiệp biến — Dẫn đường trên Đa tạp Cong"
chapter: "06"
order: 2
owner: "Hình học Vi phân"
---

Hãy thử một thí nghiệm tưởng tượng trên quả địa cầu: bạn đứng ở Bắc Cực, cầm một ngọn giáo chỉ thẳng về phía kinh tuyến $$0^\circ$$ (London). Bây giờ bạn đi thẳng xuống Xích đạo, luôn giữ ngọn giáo **song song với chính nó** (không xoay cổ tay). Đến Xích đạo, bạn rẽ trái đi $$90^\circ$$ dọc Xích đạo về phía Đông (vẫn giữ ngọn giáo luôn hướng về phía Nam, vuông góc với đường đi). Cuối cùng, bạn đi thẳng dọc kinh tuyến $$90^\circ$$ Đông trở lại Bắc Cực. Khi đặt chân về đúng điểm xuất phát, hãy nhìn ngọn giáo trên tay: **nó đã xoay đúng $$90^\circ$$ so với hướng ban đầu!**

Nghịch lý thú vị đó tiết lộ một sự thật nền tảng của hình học vi phân: trên đa tạp cong, không hề tồn tại khái niệm "song song toàn cục", và bạn thậm chí **không thể trừ trực tiếp** hai vector nằm ở hai điểm khác nhau vì chúng sống trong hai mặt phẳng tiếp tuyến khác nhau! Để làm phép tính vi phân trên không gian cong, Tullio Levi-Civita (1917) và Jean-Louis Koszul (1950) đã xây dựng khái niệm **Liên kết (Connection)** và **Đạo hàm hiệp biến (Covariant Derivative)** — chiếc cầu nối giữa các không gian tiếp tuyến lân cận nhau.

**Mạch bài học:** Kiến thức cần nhớ (vì sao đạo hàm thường hỏng, vận chuyển song song, liên kết Levi-Civita) → Trực giác đi bộ cầm cờ & ký hiệu Christoffel → Định nghĩa hình thức & đường trắc địa $$\nabla_{\dot\gamma}\dot\gamma = 0$$ → Ví dụ tính tay làm từng bước: tính tường minh $$\Gamma^r_{\theta\theta} = -r$$, $$\Gamma^\theta_{r\theta} = 1/r$$ trong tọa độ cực và kiểm tra tam giác cầu $$90^\circ$$ → Giải thích: 4 bước chứng minh định lý cơ bản của hình học Riemann (tính duy nhất của liên kết Levi-Civita) → Ứng dụng, Video & Bài tập.

---

## Kiến thức cần nhớ: Liên kết, Vận chuyển song song và Liên kết Levi-Civita nghiên cứu gì?

### 1. Khủng hoảng của phép trừ vector trên đa tạp cong
Trong $$\mathbb{R}^n$$, mọi không gian tiếp tuyến đều trùng với chính $$\mathbb{R}^n$$, nên phép lấy giới hạn $$\lim_{h\to 0}\frac{V(p+h)-V(p)}{h}$$ hợp lệ. Trên đa tạp cong $$M$$, $$V(p) \in T_p M$$ còn $$V(p+h) \in T_{p+h}M$$ — hai không gian vector khác hẳn nhau! Muốn lấy đạo hàm, ta bắt buộc phải trang bị một **liên kết** $$\nabla$$ làm quy tắc dịch chuyển vector từ $$T_{p+h}M$$ về $$T_p M$$.

### 2. Liên kết Affine và Ký hiệu Christoffel $$\Gamma^k_{ij}$$
Một liên kết affine $$\nabla_X Y$$ đo tốc độ biến thiên thực sự của trường vector $$Y$$ dọc theo hướng $$X$$. Trong tọa độ địa phương, nó bằng đạo hàm thường cộng thêm **số hạng hiệu chỉnh Christoffel** $$\Gamma^k_{ij}$$ đo tốc độ các vector cơ sở $$\partial_j$$ tự bẻ hướng theo lưới tọa độ. Bản thân $$\Gamma^k_{ij}$$ không phải tensor, nhưng tổ hợp $$\nabla_i Y^k = \partial_i Y^k + \Gamma^k_{ij} Y^j$$ lại là một **tensor thực sự**!

### 3. Định lý cơ bản của hình học Riemann: Liên kết Levi-Civita
Trên một đa tạp có trang bị metric $$g$$, trong vô số liên kết có thể chọn, tồn tại **duy nhất một** liên kết vừa **không xoắn** ($$\Gamma^k_{ij} = \Gamma^k_{ji}$$) vừa **bảo toàn độ dài và góc khi vận chuyển song song** ($$\nabla g = 0$$). Đó chính là **liên kết Levi-Civita** — nền móng trực tiếp sinh ra đường trắc địa và tensor độ cong Riemann ở Bài 13.

---

## 1. Tổng quan

Trong không gian phẳng $$\mathbb{R}^n$$, việc so sánh hai vector đặt tại hai điểm khác nhau rất đơn giản: ta chỉ cần tịnh tiến song song một vector đến gốc của vector kia rồi so sánh từng thành phần. Vì không gian phẳng, phép tịnh tiến không phụ thuộc vào đường đi, và đạo hàm của một trường vector đơn giản là lấy đạo hàm từng thành phần tọa độ.

Tuy nhiên, trên một đa tạp cong (chẳng hạn mặt cầu), khái niệm "song song" phụ thuộc vào đường đi. Để thực hiện phép tính vi phân trên đa tạp cong, ta cần một quy tắc liên hệ giữa các không gian tiếp tuyến tại những điểm lân cận nhau gọi là *Liên kết* (Connection), cho phép định nghĩa *Đạo hàm hiệp biến* (Covariant Derivative). Bài giảng này trình bày khái niệm đạo hàm hiệp biến, vai trò của các ký hiệu Christoffel dưới góc nhìn hiện đại, và định nghĩa lại đường trắc địa một cách gọn gàng: đường cong có vector vận tốc song song dọc theo chính nó.

## 2. Giải thích Trực quan

### 2.1. Vấn đề của phép lấy đạo hàm trên mặt cong

Đạo hàm về bản chất là phép so sánh giá trị của hàm số (hoặc vector) tại hai điểm rất gần nhau:
$$
\lim_{h \to 0} \frac{V(p+h) - V(p)}{h}
$$
Phép trừ $$V(p+h) - V(p)$$ chỉ có nghĩa khi hai vector thuộc cùng một không gian vector. Nhưng trên đa tạp cong, $$V(p)$$ thuộc không gian tiếp tuyến $$T_pM$$, còn $$V(p+h)$$ thuộc không gian tiếp tuyến $$T_{p+h}M$$ — hai mặt phẳng khác nhau, nên không thể trừ trực tiếp cho nhau.

> [!TIP]
> **Vì sao không thể trừ trực tiếp hai vector ở hai điểm khác nhau?**
> Bạn không thể lấy trực tiếp một vector tiếp tuyến tại Hà Nội trừ đi một vector tiếp tuyến tại New York vì hai mặt phẳng tiếp tuyến của Trái Đất tại hai vị trí đó nghiêng khác nhau. Để so sánh chúng, trước hết cần "vận chuyển" một vector từ điểm này về điểm kia theo một quy tắc xác định. Quy tắc đó chính là **Liên kết (Connection)**.

Như vậy, để so sánh, ta cần một quy tắc vận chuyển vector từ $$p+h$$ về $$p$$. Quy tắc này không duy nhất mà phụ thuộc vào cấu trúc hình học được chọn trên đa tạp, và được gọi là *liên kết*.

### 2.2. Vận chuyển Song song (Parallel Transport)

Hãy tưởng tượng bạn đi bộ trên một bề mặt (đa tạp) và mang theo một cây gậy (vector), cố gắng giữ cây gậy luôn song song với chính nó qua từng bước đi mà không tự xoay nó:
- Trên mặt phẳng: sau khi đi hết một vòng kín, cây gậy vẫn chỉ đúng hướng ban đầu.
- Trên mặt cầu: sau khi đi theo một tam giác cầu kín (Bắc Cực $$\to$$ Xích đạo $$\to$$ đi dọc Xích đạo $$\to$$ quay lại Bắc Cực), hướng của cây gậy bị lệch đi một góc so với lúc xuất phát.

> [!NOTE]
> **Hình dung "Đi bộ cầm cờ":**
> Giả sử bạn cầm một lá cờ đi trên bề mặt Trái Đất và giữ cán cờ luôn song song với chính nó tại mỗi bước đi (không xoay cổ tay). Trên mặt phẳng, đi hết một vòng kín lá cờ vẫn giữ nguyên hướng; còn trên mặt cầu cong, khi quay về đúng điểm xuất phát, hướng lá cờ đã xoay đi một góc. Độ lệch góc này là biểu hiện trực tiếp của độ cong.

Hiện tượng vector bị xoay khi vận chuyển song song quanh một vòng kín chính là dấu hiệu hình học của *độ cong*. Đạo hàm hiệp biến đo mức độ thay đổi thực sự của trường vector so với chuẩn mực vận chuyển song song: nếu vector thay đổi đúng theo quy luật vận chuyển song song, đạo hàm hiệp biến của nó bằng 0.

### 2.3. Ký hiệu Christoffel: Các hệ số hiệu chỉnh

Trong một hệ tọa độ địa phương, đạo hàm riêng thông thường $$\partial_j V^i$$ của các thành phần vector $$V = V^i \partial_i$$ không tạo thành một tensor vì nó phụ thuộc vào cách chọn hệ tọa độ. Đạo hàm hiệp biến bổ sung thêm một số hạng hiệu chỉnh để tính đến sự biến thiên của chính các vector cơ sở trên lưới tọa độ cong:
$$
\nabla_j V^i = \partial_j V^i + \Gamma^i_{jk} V^k
$$
Các hệ số $$\Gamma^i_{jk}$$ chính là ký hiệu Christoffel. Chúng không phải là tensor, mà đóng vai trò tương tự "lực quán tính" (như lực Coriolis) phát sinh do hệ tọa độ bị cong.

> [!IMPORTANT]
> **Cấu trúc của Đạo hàm Hiệp biến:**
> $$ \text{Biến thiên nội tại} = \text{Biến thiên thành phần tọa độ} + \text{Biến thiên do lưới tọa độ đổi hướng} $$
> - $$\nabla_j V^i$$: biến thiên nội tại (intrinsic change) — đại lượng hình học thực sự cần tìm.
> - $$\partial_j V^i$$: đạo hàm thông thường của các thành phần tọa độ.
> - $$\Gamma^i_{jk} V^k$$: phần đóng góp do các vector cơ sở của hệ tọa độ thay đổi hướng từ điểm này sang điểm khác.
> Cộng hai phần này lại cho ta tốc độ biến thiên thực sự của vector, độc lập với cách chọn hệ tọa độ.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Liên kết Affine (Affine Connection)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Một *liên kết affine* $$\nabla$$ trên đa tạp trơn $$M$$ là một quy tắc gán cho mỗi cặp trường vector $$X, Y$$ một trường vector thứ ba $$\nabla_X Y$$, gọi là đạo hàm hiệp biến của $$Y$$ theo hướng $$X$$, thỏa mãn ba tiên đề:

1. **Tuyến tính theo $$X$$ trên $$C^\infty(M)$$:**
   $$\nabla_{fX_1 + gX_2} Y = f \nabla_{X_1} Y + g \nabla_{X_2} Y$$
2. **Tuyến tính theo $$Y$$ trên $$\mathbb{R}$$:**
   $$\nabla_X (aY_1 + bY_2) = a \nabla_X Y_1 + b \nabla_X Y_2$$
3. **Quy tắc Leibniz:**
   $$\nabla_X (fY) = f \nabla_X Y + (Xf)Y$$
   (trong đó $$Xf$$ là đạo hàm theo hướng của hàm $$f$$ theo vector $$X$$).
</div>

### 3.2. Thành phần và Ký hiệu Christoffel

Trong một hệ tọa độ địa phương $$(x^i)$$ với cơ sở $$\partial_i = \frac{\partial}{\partial x^i}$$, các *ký hiệu Christoffel* $$\Gamma^k_{ij}$$ của liên kết $$\nabla$$ được định nghĩa qua khai triển:
$$
\nabla_{\partial_i} \partial_j = \Gamma^k_{ij} \partial_k
$$
(áp dụng quy ước tổng Einstein).

Đạo hàm hiệp biến của trường vector $$Y = Y^j \partial_j$$ theo hướng $$X = X^i \partial_i$$ có biểu thức:
$$
\nabla_X Y = \left( X(Y^k) + X^i Y^j \Gamma^k_{ij} \right) \partial_k
$$
Thành phần của $$\nabla Y$$ thường được ký hiệu là $$Y^k_{;i}$$ hoặc $$\nabla_i Y^k$$:
$$
\nabla_i Y^k = \frac{\partial Y^k}{\partial x^i} + \Gamma^k_{ij} Y^j
$$

### 3.3. Liên kết Levi-Civita

Trên một đa tạp Riemann có trang bị metric $$g$$, có vô số liên kết affine khác nhau. Tuy nhiên, tồn tại duy nhất một liên kết thỏa mãn đồng thời hai điều kiện tự nhiên:
1. **Không xoắn (Torsion-free):** $$\Gamma^k_{ij} = \Gamma^k_{ji}$$ (đối xứng theo hai chỉ số dưới).
2. **Tương thích với metric (Metric-compatible):** $$\nabla g = 0$$, nghĩa là tích vô hướng của hai vector không đổi khi cả hai được vận chuyển song song dọc theo cùng một đường cong.

Liên kết duy nhất này được gọi là *Liên kết Levi-Civita*. Các ký hiệu Christoffel của nó được xác định hoàn toàn bởi metric $$g$$ (như đã gặp ở Bài 9):
$$
\Gamma^k_{ij} = \frac{1}{2} g^{kl} (\partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij})
$$

### 3.4. Định nghĩa lại Đường Trắc địa (Geodesic)

Với khái niệm liên kết, đường trắc địa có một định nghĩa rất ngắn gọn: một đường cong $$\gamma(t)$$ là *đường trắc địa* nếu vector vận tốc $$\dot{\gamma}(t)$$ của nó được vận chuyển song song dọc theo chính nó:
$$
\nabla_{\dot{\gamma}} \dot{\gamma} = 0
$$
Trong hệ tọa độ địa phương, điều kiện này tương đương với hệ phương trình vi phân quen thuộc:
$$
\ddot{x}^k + \Gamma^k_{ij} \dot{x}^i \dot{x}^j = 0
$$
Cách nhìn này thống nhất hai đặc trưng của đường trắc địa: "ngắn nhất cục bộ" (theo phép tính biến phân) và "thẳng nhất" (gia tốc nội tại bằng 0).

---

## Ví dụ tính tay làm từng bước: Ký hiệu Christoffel trong tọa độ cực & lực quán tính

Xét chính mặt phẳng $$\mathbb{R}^2$$ với tọa độ cực $$(r, \theta)$$ và metric $$g_{rr} = 1,\; g_{\theta\theta} = r^2,\; g_{r\theta} = 0$$ (nên nghịch đảo $$g^{rr} = 1,\; g^{\theta\theta} = 1/r^2$$). Chỉ có đúng một đạo hàm riêng khác $$0$$ là $$\partial_r g_{\theta\theta} = 2r$$!

Thay trực tiếp vào công thức Levi-Civita $$\Gamma^k_{ij} = \frac{1}{2}g^{kl}(\partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij})$$, ta tính ngay bằng tay tất cả các hệ số khác $$0$$:
- $$\Gamma^r_{\theta\theta} = \frac{1}{2} g^{rr}(0 + 0 - \partial_r g_{\theta\theta}) = \frac{1}{2}(1)(-2r) = -r$$.
- $$\Gamma^\theta_{r\theta} = \Gamma^\theta_{\theta r} = \frac{1}{2} g^{\theta\theta}(\partial_r g_{\theta\theta} + 0 - 0) = \frac{1}{2}\left(\frac{1}{r^2}\right)(2r) = \frac{1}{r}$$.
- Tất cả các thành phần còn lại ($$\Gamma^r_{rr}, \Gamma^r_{r\theta}, \Gamma^\theta_{rr}, \Gamma^\theta_{\theta\theta}$$) đều bằng $$0$$!

Bây giờ thay vào phương trình đường trắc địa $$\ddot{x}^k + \Gamma^k_{ij}\dot{x}^i\dot{x}^j = 0$$:

$$
\ddot{r} - r\dot{\theta}^2 = 0, \qquad \ddot{\theta} + \frac{2}{r}\dot{r}\dot{\theta} = 0!
$$

Bạn nhận ra hai số hạng quen thuộc trong cơ học cổ điển chứ? Số hạng $$-r\dot{\theta}^2$$ chính là **gia tốc hướng tâm / lực ly tâm**, còn $$\frac{2}{r}\dot{r}\dot{\theta}$$ chính là **gia tốc Coriolis**! Trên một đường thẳng trong $$\mathbb{R}^2$$ không hề có lực nào tác dụng, nhưng chỉ vì ta dùng lưới tọa độ cực bị cong mà các hệ số $$\Gamma^k_{ij}$$ tự xuất hiện để giữ cho phương trình đường thẳng bất biến!

---

### Giải thích: Tại sao Liên kết Levi-Civita tồn tại duy nhất từ metric $$g$$?

#### Bước 1: Ghi lại hai đòi hỏi hình học tự nhiên nhất
Ta muốn phép đạo hàm hiệp biến $$\nabla$$ tôn trọng thước đo độ dài–góc (tương thích metric: $$X\bigl(g(Y,Z)\bigr) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z)$$) và không vặn xoắn hình bình hành vô cùng nhỏ (không xoắn: $$\nabla_X Y - \nabla_Y X = [X, Y]$$).

#### Bước 2: "Thủ thuật vòng tròn Koszul" — viết ba phương trình hoán vị
Viết điều kiện tương thích metric cho ba hoán vị vòng của $$(X, Y, Z)$$:
1. $$X g(Y, Z) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z)$$
2. $$Y g(Z, X) = g(\nabla_Y Z, X) + g(Z, \nabla_Y X)$$
3. $$-Z g(X, Y) = -g(\nabla_Z X, Y) - g(X, \nabla_Z Y)$$

#### Bước 3: Cộng ba dòng lại và rút gọn bằng điều kiện không xoắn
Khi cộng (1) + (2) + (3) và ghép cặp bằng tính không xoắn $$\nabla_X Y - \nabla_Y X = [X, Y]$$, mọi số hạng đạo hàm hiệp biến khác triệt tiêu lẫn nhau, chỉ còn sót lại đúng **một** số hạng $$2g(\nabla_X Y, Z)$$ ở vế phải!

#### Bước 4: Rút ra công thức tường minh cho $$\Gamma^k_{ij}$$
Thay $$X = \partial_i,\; Y = \partial_j,\; Z = \partial_l$$ (nên mọi móc Lie $$[\partial_i, \partial_j] = 0$$), ta thu được ngay $$2 g_{kl}\Gamma^k_{ij} = \partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij}$$, nhân thêm metric nghịch đảo $$g^{kl}$$ là ra công thức Levi-Civita duy nhất!

Tóm tắt mạch chứng minh định lý cơ bản của hình học Riemann:

$$
\nabla g = 0 \text{ \& } \text{Torsion} = 0
\;\xrightarrow{\text{Cộng 3 hoán vị Koszul}}\;
\Gamma^k_{ij} = \frac{1}{2}g^{kl}(\partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij})
\;\Longrightarrow\;
\nabla \text{ duy nhất!}
$$

## 4. Hình ảnh minh họa

![Vận chuyển song song trên mặt cầu](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 1: Vận chuyển song song một vector dọc theo một đường kín trên mặt cầu. Vector xuất phát từ Bắc Cực, đi xuống Xích đạo, đi dọc Xích đạo rồi quay về Bắc Cực. Khi trở lại, vector bị xoay đi một góc $$\alpha$$ tỉ lệ với diện tích miền bao quanh — minh họa trực quan cho độ cong.*

![Tiếp tuyến và Liên kết](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Tangent_bundle_manifold.svg/640px-Tangent_bundle_manifold.svg.png)
*Hình 2: Minh họa phân thớ tiếp tuyến (Tangent Bundle). Liên kết (Connection) cung cấp quy tắc nối các không gian tiếp tuyến tại các điểm khác nhau để có thể so sánh vector.*

## 5. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Levi-Civita, Tullio (1917).** *Nozione di parallelismo in una varietà qualunque*.  
   Bài báo đưa ra khái niệm vận chuyển song song và liên kết, giải quyết bài toán so sánh vector trên đa tạp cong theo hướng hình học.

2. **Koszul, Jean-Louis (1950).**  
   Đưa ra định nghĩa tiên đề đại số hiện đại cho liên kết ($$\nabla_X Y$$), giúp trình bày lý thuyết độc lập với hệ tọa độ.

3. **Do Carmo, Manfredo P. (1992).** *Riemannian Geometry*.  
   Chương 2 về Liên kết Levi-Civita là tài liệu tham khảo chuẩn mực cho sinh viên toán học.

4. **Carroll, Sean (2004).** *Spacetime and Geometry*.  
   Giáo trình vật lý giải thích rõ ý nghĩa vật lý của đạo hàm hiệp biến và vai trò của nó trong Thuyết tương đối rộng.

## 6. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 6.1. Vật lý: Lực quán tính và Lực hấp dẫn
Trong cơ học cổ điển, khi viết định luật Newton $$F=ma$$ trong hệ tọa độ cong (như tọa độ cực), các số hạng chứa $$\Gamma$$ xuất hiện ở vế gia tốc — tương ứng với lực ly tâm và lực Coriolis. Trong Thuyết tương đối rộng, hấp dẫn không phải là một lực theo nghĩa Newton mà là biểu hiện của các ký hiệu Christoffel $$\Gamma$$ do không-thời gian bị cong; vật thể rơi tự do chuyển động dọc theo đường trắc địa $$\nabla_{\dot{\gamma}} \dot{\gamma} = 0$$.

### 6.2. Lý thuyết Trường Gauge (Gauge Theory)
Trong vật lý hạt cơ bản, các tương tác cơ bản (điện từ, yếu, mạnh) được mô tả bằng các "trường gauge". Về mặt toán học, trường gauge chính là một *liên kết* trên một phân thớ vector (vector bundle): thế vector điện từ $$A_\mu$$ đóng vai trò thành phần của liên kết, còn tensor trường điện từ $$F_{\mu\nu}$$ chính là độ cong của liên kết đó.

### 6.3. Robot và Điều khiển
Khi điều khiển cánh tay robot nhiều khớp, không gian cấu hình (configuration space) là một đa tạp cong. Để tính động lực học (lực và mô-men cần thiết giúp robot bám theo quỹ đạo), kỹ sư cần tính đạo hàm hiệp biến của vận tốc và gia tốc trên không gian cấu hình này.

## Video tham khảo

- [Tensor Calculus 18: Covariant Derivative (extrinsic) and Parallel Transport](https://www.youtube.com/watch?v=Af9JUiQtV1k) — eigenchris, tiếng Anh. Xem trước: trình bày vận chuyển song song và đạo hàm hiệp biến ngoại tại, giải thích vì sao không thể trừ trực tiếp hai vector ở hai điểm khác nhau nếu chưa có liên kết.
- [Tensor Calculus 17: The Covariant Derivative (flat space)](https://www.youtube.com/watch?v=U5iMpOn5IHw) — eigenchris, tiếng Anh. Đạo hàm hiệp biến trong không gian phẳng, giúp thấy ký hiệu Christoffel xuất hiện ngay cả khi chỉ dùng hệ tọa độ cong.
- [Tensor Calculus 15: Geodesics and Christoffel Symbols (extrinsic geometry)](https://www.youtube.com/watch?v=1CuTNveXJRc) — eigenchris, tiếng Anh. Vai trò của các ký hiệu Christoffel trong phương trình đường trắc địa, tương ứng với phần định nghĩa lại đường trắc địa bằng liên kết trong bài.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đạo hàm thường và đạo hàm hiệp biến**
Xét không gian phẳng $$\mathbb{R}^2$$ với tọa độ cực $$(r, \theta)$$ và cặp vector cơ sở $$e_r = \frac{\partial}{\partial r}, e_\theta = \frac{\partial}{\partial \theta}$$. Hãy tính $$\nabla_{e_\theta} e_r$$ (gợi ý: quan sát cách vector $$e_r$$ đổi hướng khi quay một góc nhỏ $$\theta$$). Kết quả sẽ cho các ký hiệu Christoffel khác 0 trong tọa độ cực.

**Bài tập 2: Tính chất của Liên kết**
Chứng minh quy tắc Leibniz $$\nabla_X (fY) = (Xf)Y + f\nabla_X Y$$ bằng cách sử dụng biểu thức trong hệ tọa độ địa phương.

**Bài tập 3: Vận chuyển song song**
Trên mặt phẳng $$\mathbb{R}^2$$, xét đường tròn đơn vị. Một trường vector luôn hướng ra ngoài (pháp tuyến) tại mọi điểm trên đường tròn có phải là trường vector song song dọc theo đường tròn đó không? Giải thích vì sao.

**Bài tập 4: Suy ngẫm**
Nếu $$\Gamma^k_{ij} = 0$$ tại mọi điểm trong một hệ tọa độ nào đó, điều này cho biết gì về không gian đang xét? (Gợi ý: không gian phẳng). Có thể chọn hệ tọa độ sao cho $$\Gamma$$ bằng 0 tại *một điểm* trên đa tạp cong không (tọa độ chuẩn trắc địa)? Và có thể làm $$\Gamma$$ bằng 0 tại *mọi điểm* trên đa tạp cong không?

---

Trong bài giảng tiếp theo, chúng ta sẽ tiếp cận khái niệm **độ cong** ở dạng tổng quát hơn: *Tensor độ cong Riemann*, đại lượng đo mức độ không giao hoán giữa các đạo hàm hiệp biến.
