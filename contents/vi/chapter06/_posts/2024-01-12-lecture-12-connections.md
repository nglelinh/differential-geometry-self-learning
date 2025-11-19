---
layout: post
lang: vi
title: "Bài 12: Liên kết và Đạo hàm Hiệp biến — Dẫn đường trên Đa tạp Cong"
chapter: "06"
order: 2
owner: "Hình học Vi phân"
---

## 1. Tổng quan

Trong giải tích phẳng (trên $$\mathbb{R}^n$$), việc so sánh hai vector tại hai điểm khác nhau rất dễ dàng: chúng ta chỉ cần tịnh tiến (di chuyển song song) vector này đến vị trí của vector kia và so sánh các thành phần của chúng. Vì không gian là phẳng, việc tịnh tiến không phụ thuộc vào đường đi. Đạo hàm của một trường vector chỉ đơn giản là lấy đạo hàm từng thành phần.

Tuy nhiên, trên một đa tạp cong (như mặt cầu), khái niệm "song song" trở nên rắc rối. Nếu bạn di chuyển một vector "song song" với chính nó dọc theo một đường kín trên mặt cầu (ví dụ: từ Bắc Cực xuống Xích đạo, đi dọc Xích đạo rồi quay về Bắc Cực), vector đó khi quay về sẽ bị xoay đi một góc so với vector ban đầu! Điều này có nghĩa là không gian cong không có tính chất "song song toàn cục".

Để làm giải tích trên đa tạp cong, chúng ta cần một quy tắc để kết nối các không gian tiếp tuyến tại các điểm lân cận nhau. Quy tắc này được gọi là *Liên kết* (Connection) hay *Liên kết Affine*. Nó cho phép chúng ta định nghĩa *Đạo hàm hiệp biến* (Covariant Derivative) — sự tổng quát hóa của đạo hàm định hướng cho các trường vector trên đa tạp.

Bài giảng này sẽ giới thiệu khái niệm đạo hàm hiệp biến, các ký hiệu Christoffel (tái xuất hiện từ góc nhìn hiện đại), và định nghĩa lại đường trắc địa (geodesic) một cách thanh lịch hơn: đường cong có vector vận tốc song song với chính nó.

## 2. Giải thích Trực quan

## 2. Giải thích Trực quan

### 2.1. Vấn đề của Đạo hàm trên Mặt cong

Đạo hàm là phép so sánh giá trị của hàm (hoặc vector) tại hai điểm rất gần nhau.
$$
\lim_{h \to 0} \frac{V(p+h) - V(p)}{h}
$$
Phép trừ $$V(p+h) - V(p)$$ chỉ thực hiện được nếu hai vector này nằm trong cùng một không gian vector. Nhưng trên đa tạp cong, $$V(p)$$ nằm trong không gian tiếp tuyến $$T_pM$$, còn $$V(p+h)$$ nằm trong $$T_{p+h}M$$. Hai không gian này là hai mặt phẳng khác nhau! Chúng ta không thể trừ chúng trực tiếp.

> [!TIP]
> **Hình dung "So sánh Táo và Cam":**
> Bạn không thể trừ trực tiếp một vector ở Hà Nội cho một vector ở New York vì "hệ quy chiếu" (mặt phẳng tiếp tuyến) của chúng khác nhau.
> Để so sánh, bạn phải "vận chuyển" vector từ New York về Hà Nội (hoặc ngược lại) theo một quy tắc nhất định. Quy tắc đó gọi là **Liên kết (Connection)**.

Chúng ta cần một cách để "vận chuyển" vector từ $$p+h$$ về $$p$$ để so sánh. Cách vận chuyển này không phải là duy nhất mà phụ thuộc vào cấu trúc hình học của đa tạp. Quy tắc vận chuyển này chính là *Liên kết*.

### 2.2. Vận chuyển Song song (Parallel Transport)

Hãy tưởng tượng bạn đang đi bộ trên mặt đất (đa tạp) và cầm theo một cây gậy (vector). Bạn cố gắng giữ cây gậy luôn chỉ theo cùng một hướng so với la bàn (song song).
- Trên mặt phẳng: Sau khi đi một vòng, cây gậy vẫn chỉ hướng cũ.
- Trên mặt cầu: Sau một vòng tam giác (Cực Bắc -> Xích đạo -> Xích đạo -> Cực Bắc), cây gậy sẽ bị xoay đi!

> [!NOTE]
> **Hình dung "Đi bộ cầm Cờ":**
> Tưởng tượng bạn cầm một lá cờ và đi bộ trên bề mặt trái đất.
> - Nhiệm vụ của bạn là giữ cho cán cờ luôn song song với chính nó tại mọi bước đi (không xoay cổ tay).
> - Nếu bạn đi trên đường thẳng, lá cờ luôn chỉ về một hướng.
> - Nếu bạn đi trên đường cong, bạn cảm thấy mình phải liên tục điều chỉnh để lá cờ "thẳng".
> - Sự khác biệt giữa hướng lá cờ khi bạn quay về điểm xuất phát so với lúc bắt đầu chính là bằng chứng của độ cong.

Hiện tượng vector bị xoay khi vận chuyển song song quanh một vòng kín chính là bản chất của *Độ cong*. Đạo hàm hiệp biến đo lường sự thay đổi của vector so với sự vận chuyển song song này. Nếu vector thay đổi đúng bằng lượng mà sự vận chuyển song song quy định, ta nói đạo hàm hiệp biến của nó bằng 0.

### 2.3. Ký hiệu Christoffel: Những kẻ điều chỉnh

Trong hệ tọa độ, đạo hàm thường của một vector $$V = V^i \partial_i$$ sẽ là $$\partial_j V^i$$. Tuy nhiên, đạo hàm này không phải là một tensor vì nó phụ thuộc vào hệ tọa độ.
Đạo hàm hiệp biến thêm vào một số hạng "điều chỉnh" để bù trừ cho sự cong của hệ tọa độ và đa tạp:
$$
\nabla_j V^i = \partial_j V^i + \Gamma^i_{jk} V^k
$$
Các hệ số $$\Gamma^i_{jk}$$ chính là ký hiệu Christoffel. Chúng không phải là tensor, mà đóng vai trò như "lực giả" (giống lực Coriolis) xuất hiện do hệ tọa độ cong.

> [!IMPORTANT]
> **Công thức Đạo hàm Hiệp biến:**
> $$ \text{Thay đổi Nội tại} = \text{Thay đổi Tổng cộng} - \text{Thay đổi do Lưới Tọa độ} $$
> - $$\nabla_j V^i$$: Thay đổi nội tại (Intrinsic change) - cái chúng ta quan tâm.
> - $$\partial_j V^i$$: Thay đổi tổng cộng (Total change) - cái chúng ta tính được từ đạo hàm thường.
> - $$\Gamma^i_{jk} V^k$$: Thay đổi do lưới tọa độ (Coordinate grid change) - phần "ảo" do hệ tọa độ bị cong.
> Chúng ta trừ đi phần thay đổi do lưới tọa độ để có được sự thay đổi thực sự về mặt hình học.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Liên kết Affine (Affine Connection)

**Định nghĩa:**
Một *liên kết affine* $$\nabla$$ trên đa tạp trơn $$M$$ là một quy tắc gán cho mỗi cặp trường vector $$X, Y$$ một trường vector thứ ba $$\nabla_X Y$$, gọi là đạo hàm hiệp biến của $$Y$$ theo hướng $$X$$, thỏa mãn các tính chất:

1.  **Tuyến tính theo $$X$$ trên $$C^\infty(M)$$:**
    $$\nabla_{fX_1 + gX_2} Y = f \nabla_{X_1} Y + g \nabla_{X_2} Y$$
2.  **Tuyến tính theo $$Y$$ trên $$\mathbb{R}$$:**
    $$\nabla_X (aY_1 + bY_2) = a \nabla_X Y_1 + b \nabla_X Y_2$$
3.  **Quy tắc Leibniz (Product Rule):**
    $$\nabla_X (fY) = f \nabla_X Y + (Xf)Y$$
    (Trong đó $$Xf$$ là đạo hàm hướng của hàm $$f$$ theo vector $$X$$).

### 3.2. Thành phần và Ký hiệu Christoffel

Trong một hệ tọa độ địa phương $$(x^i)$$ với cơ sở $$\partial_i = \frac{\partial}{\partial x^i}$$, chúng ta định nghĩa các *ký hiệu Christoffel* $$\Gamma^k_{ij}$$ của liên kết $$\nabla$$ bởi:
$$
\nabla_{\partial_i} \partial_j = \Gamma^k_{ij} \partial_k
$$
(Quy ước tổng Einstein được sử dụng).

Đạo hàm hiệp biến của một trường vector $$Y = Y^j \partial_j$$ theo hướng $$X = X^i \partial_i$$ được tính bằng công thức:
$$
\nabla_X Y = \left( X(Y^k) + X^i Y^j \Gamma^k_{ij} \right) \partial_k
$$
Thành phần thứ $$k$$ của $$\nabla Y$$ thường được ký hiệu là $$Y^k_{;i}$$ hoặc $$\nabla_i Y^k$$:
$$
\nabla_i Y^k = \frac{\partial Y^k}{\partial x^i} + \Gamma^k_{ij} Y^j
$$

### 3.3. Liên kết Levi-Civita

Trên một đa tạp Riemann có metric $$g$$, có vô số liên kết possible. Tuy nhiên, có một liên kết duy nhất thỏa mãn hai điều kiện tự nhiên:
1.  **Không xoắn (Torsion-free):** $$\Gamma^k_{ij} = \Gamma^k_{ji}$$ (đối xứng dưới).
2.  **Bảo toàn metric (Metric-compatible):** $$\nabla g = 0$$. Nghĩa là tích vô hướng của hai vector không đổi khi cả hai được vận chuyển song song.

Liên kết này gọi là *Liên kết Levi-Civita*. Các ký hiệu Christoffel của nó được tính hoàn toàn từ metric $$g$$ (như chúng ta đã thấy ở Bài 9):
$$
\Gamma^k_{ij} = \frac{1}{2} g^{kl} (\partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij})
$$

### 3.4. Đường Trắc địa (Geodesic) Tái định nghĩa

Sử dụng liên kết, ta có định nghĩa thanh lịch nhất về đường trắc địa:
Một đường cong $$\gamma(t)$$ là *trắc địa* nếu vector vận tốc $$\dot{\gamma}(t)$$ của nó *song song* dọc theo chính nó.
$$
\nabla_{\dot{\gamma}} \dot{\gamma} = 0
$$
Trong tọa độ địa phương, phương trình này khai triển thành hệ phương trình vi phân quen thuộc:
$$
\ddot{x}^k + \Gamma^k_{ij} \dot{x}^i \dot{x}^j = 0
$$
Điều này thống nhất khái niệm "ngắn nhất" (từ biến phân) và "thẳng nhất" (gia tốc bằng 0).

## 4. Hình ảnh minh họa

![Vận chuyển song song trên mặt cầu](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 1: Vận chuyển song song một vector dọc theo một đường kín trên mặt cầu. Vector bắt đầu tại cực Bắc, di chuyển xuống xích đạo, đi dọc xích đạo, rồi quay về cực Bắc. Khi quay về, vector đã bị xoay một góc $$\alpha$$, tỉ lệ với diện tích vùng bị bao quanh. Đây là minh họa trực quan của độ cong.*

![Tiếp tuyến và Liên kết](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Tangent_bundle_manifold.svg/640px-Tangent_bundle_manifold.svg.png)
*Hình 2: Minh họa không gian tiếp tuyến (Tangent Bundle). Liên kết (Connection) cung cấp một cách để "kết nối" các không gian tiếp tuyến tại các điểm khác nhau, cho phép so sánh vector.*

## 5. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1.  **Levi-Civita, Tullio (1917).** *Nozione di parallelismo in una varietà qualunque*.
    Bài báo giới thiệu khái niệm vận chuyển song song và liên kết, giải quyết vấn đề so sánh vector trên đa tạp cong một cách hình học.

2.  **Koszul, Jean-Louis (1950).**
    Người đã đưa ra định nghĩa đại số hiện đại (tiên đề hóa) cho liên kết mà chúng ta dùng ngày nay ($$\nabla_X Y$$), giúp giải phóng lý thuyết khỏi sự phụ thuộc vào hệ tọa độ.

3.  **Do Carmo, Manfredo P. (1992).** *Riemannian Geometry*.
    Chương 2 về Liên kết Levi-Civita là tài liệu chuẩn mực cho sinh viên toán.

4.  **Carroll, Sean (2004).** *Spacetime and Geometry*.
    Sách vật lý giải thích rất hay về ý nghĩa vật lý của đạo hàm hiệp biến và tại sao chúng ta cần nó trong Thuyết tương đối rộng.

## 6. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 6.1. Vật lý: Lực quán tính và Lực hấp dẫn
Trong cơ học cổ điển, nếu bạn viết định luật Newton $$F=ma$$ trong hệ tọa độ cong (ví dụ tọa độ cực), các số hạng chứa $$\Gamma$$ sẽ xuất hiện ở vế gia tốc. Chúng tương ứng với lực ly tâm và lực Coriolis.
Trong Thuyết tương đối rộng, lực hấp dẫn không phải là một lực thực sự mà chính là biểu hiện của các ký hiệu $$\Gamma$$ do không thời gian bị cong. Vật thể rơi tự do tuân theo phương trình geodesic $$\nabla_{\dot{\gamma}} \dot{\gamma} = 0$$.

### 6.2. Lý thuyết Trường Gauge (Gauge Theory)
Trong vật lý hạt cơ bản, các lực cơ bản (điện từ, yếu, mạnh) được mô tả bởi các "trường gauge". Về mặt toán học, trường gauge chính là một *liên kết* trên một phân thớ vector (vector bundle). Thế vector điện từ $$A_\mu$$ chính là thành phần của một liên kết, và trường điện từ $$F_{\mu\nu}$$ là độ cong của liên kết đó.

### 6.3. Robot và Điều khiển
Khi điều khiển cánh tay robot nhiều khớp, không gian cấu hình (configuration space) là một đa tạp cong. Để tính toán động lực học (lực cần thiết để di chuyển robot theo quỹ đạo), kỹ sư phải tính đạo hàm hiệp biến của vận tốc và gia tốc trong không gian cấu hình này.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đạo hàm thường vs Hiệp biến**
Trong không gian phẳng $$\mathbb{R}^2$$ với tọa độ cực $$(r, \theta)$$.
Vector cơ sở là $$e_r = \frac{\partial}{\partial r}, e_\theta = \frac{\partial}{\partial \theta}$$.
Hãy tính $$\nabla_{e_\theta} e_r$$. (Gợi ý: Vector $$e_r$$ thay đổi hướng như thế nào khi bạn quay một góc nhỏ $$\theta$$?). Kết quả sẽ cho bạn các ký hiệu Christoffel khác 0 của tọa độ cực.

**Bài tập 2: Tính chất của Liên kết**
Chứng minh tính chất: $$\nabla_X (fY) = (Xf)Y + f\nabla_X Y$$ bằng cách sử dụng biểu thức trong tọa độ địa phương.

**Bài tập 3: Vận chuyển song song**
Trên mặt phẳng $$\mathbb{R}^2$$, xét đường tròn đơn vị. Một vector luôn hướng ra ngoài (pháp tuyến) tại mọi điểm trên đường tròn có phải là trường vector song song dọc theo đường tròn đó không? Tại sao?

**Bài tập 4: Suy ngẫm**
Nếu $$\Gamma^k_{ij} = 0$$ tại mọi điểm trong một hệ tọa độ nào đó, điều này nói gì về không gian đó? (Gợi ý: Không gian phẳng). Liệu có thể làm cho $$\Gamma$$ bằng 0 tại *một điểm* trên đa tạp cong không? (Có, dùng tọa độ trắc địa/tọa độ chuẩn). Nhưng có thể làm $$\Gamma$$ bằng 0 tại *mọi điểm* trên đa tạp cong không?

---

Trong bài giảng tiếp theo, chúng ta sẽ quay lại với khái niệm **Độ cong** nhưng ở mức độ tổng quát và sâu sắc hơn: *Tensor độ cong Riemann*. Chúng ta sẽ thấy độ cong chính là thước đo sự "thất bại" của các đạo hàm hiệp biến trong việc giao hoán với nhau.
