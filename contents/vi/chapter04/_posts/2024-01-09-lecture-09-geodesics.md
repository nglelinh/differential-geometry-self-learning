---
layout: post
lang: vi
title: "Bài 9: Geodesics — Những Đường đi Thẳng nhất trên Bề mặt"
chapter: "04"
order: 2
owner: "Hình học Vi phân"
---

## 1. Tổng quan

Trong hình học Euclid, đường thẳng là đường đi ngắn nhất giữa hai điểm. Nhưng trên một bề mặt cong, không có "đường thẳng" theo nghĩa thông thường. Thay vào đó, chúng ta có *geodesics* — những đường cong đóng vai trò tương tự như đường thẳng: chúng là đường đi ngắn nhất (cục bộ) và là đường đi "thẳng nhất" theo nghĩa của bề mặt.

Geodesics xuất hiện khắp nơi: quỹ đạo của ánh sáng trong không gian cong (theo thuyết tương đối rộng), đường bay của máy bay trên Trái Đất (đường cung lớn trên mặt cầu), và quỹ đạo của các vệ tinh. Chúng là khái niệm trung tâm trong hình học nội tại và kết nối sâu sắc giữa hình học và vật lý.

Trong bài giảng này, chúng ta sẽ định nghĩa geodesics qua nhiều cách tương đương: như đường cong có gia tốc geodesic bằng không, như đường cong cực trị hóa năng lượng, và như nghiệm của phương trình vi phân geodesic chứa ký hiệu Christoffel. Chúng ta sẽ tính toán geodesics trên các bề mặt cụ thể như mặt cầu, mặt phẳng, và mặt trụ, và thấy rằng chúng có những tính chất hình học đẹp đẽ.

Bài giảng này kết nối lý thuyết bề mặt với động học và tối ưu hóa, đồng thời chuẩn bị nền tảng cho hình học Riemann hiện đại.

## 2. Giải thích Trực quan

### 2.1. Đường bay Máy bay: Tại sao lại bay vòng?

Hãy tưởng tượng hai thành phố trên bề mặt Trái Đất: New York và London. Nếu một máy bay muốn bay từ New York đến London theo đường ngắn nhất (trên bề mặt Trái Đất, không bay qua lòng đất), nó sẽ bay theo một geodesic — trong trường hợp này là một *đường cung lớn* (great circle) trên mặt cầu.

Trên bản đồ phẳng (như bản đồ Mercator), đường bay này có thể trông cong vòng lên phía Bắc. Nhưng trên mặt cầu, đó là đường đi "thẳng nhất" có thể. Nó là đường đi mà nếu phi công cố gắng đi "thẳng" theo cảm giác của mình (không rẽ trái hay phải), anh ta sẽ đi theo.

### 2.2. Vận chuyển Song song (Parallel Transport)

Một cách khác để hiểu geodesic là thông qua khái niệm *vận chuyển song song*. Hãy tưởng tượng bạn cầm một mũi tên (vector) và đi dọc theo một đường cong. Bạn cố gắng giữ cho mũi tên luôn chỉ theo cùng một hướng "tuyệt đối" trong không gian (song song với chính nó).

Tuy nhiên, trên bề mặt cong, khái niệm "cùng hướng" là không rõ ràng. Thay vào đó, chúng ta nói rằng một vector được vận chuyển song song dọc theo đường cong nếu nó không quay *so với đường cong* trong mặt phẳng tiếp tuyến.

> [!TIP]
> **Hình dung "Hiệp sĩ Cầm Thương":**
> Hãy tưởng tượng bạn là một hiệp sĩ cưỡi ngựa đi trên bề mặt. Bạn cầm một cây thương (vector) và cố gắng giữ nó **ổn định nhất có thể**, không vung vẩy sang trái hay phải.
> - Nếu bạn đi trên đường thẳng, cây thương luôn chỉ về một hướng cố định.
> - Nếu bạn đi trên đường cong, bạn phải liên tục xoay người để giữ cây thương "thẳng" theo ý bạn.
> - **Geodesic** là con đường mà nếu bạn cứ đi và giữ cây thương "thẳng" theo cách tự nhiên nhất (song song với chính nó dọc theo đường đi), bạn sẽ không cần phải tác dụng lực xoay nào cả.

Một đường cong là geodesic nếu vector tiếp tuyến của nó luôn song song với chính nó khi được vận chuyển dọc theo đường cong. Nói cách khác, đường cong không "tự rẽ".

### 2.3. Gia tốc Geodesic Bằng Không

Một cách khác để hiểu geodesic là thông qua gia tốc. Khi một đường cong là geodesic, gia tốc của nó vuông góc với bề mặt tại mọi điểm — không có thành phần gia tốc nào nằm trong không gian tiếp tuyến. Nói cách khác, đường cong không "rẽ" theo nghĩa của bề mặt; nó chỉ "uốn" vì bề mặt uốn.

Hãy tưởng tượng một viên bi lăn trên bề mặt mà không có ma sát. Nếu viên bi chỉ chịu lực pháp tuyến (từ bề mặt), không có lực tiếp tuyến, thì quỹ đạo của nó là một geodesic.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Định nghĩa Geodesic

**Định nghĩa 1 (Gia tốc geodesic bằng 0):**  
Một đường cong $$\gamma(t)$$ trên bề mặt $$S$$ là *geodesic* nếu gia tốc $$\gamma''(t)$$ vuông góc với bề mặt tại mọi điểm, tức là

$$
\gamma''(t) \parallel \mathbf{n}(\gamma(t)),
$$

trong đó $$\mathbf{n}$$ là vector pháp tuyến đơn vị.

Tương đương, gia tốc tiếp tuyến (thành phần gia tốc nằm trong không gian tiếp tuyến) bằng không.

> [!NOTE]
> **"Thẳng nhất" vs "Ngắn nhất":**
> - Định nghĩa "gia tốc bằng 0" nói rằng geodesic là đường **thẳng nhất**. Nó không rẽ trái, không rẽ phải.
> - Định nghĩa "độ dài cực tiểu" nói rằng geodesic là đường **ngắn nhất**.
> - Về mặt địa phương (khoảng cách gần), hai khái niệm này trùng nhau. Nhưng ở khoảng cách xa, geodesic có thể không còn là ngắn nhất (ví dụ: đường cung lớn đi vòng quanh trái đất theo hướng ngược lại vẫn là geodesic, nhưng không ngắn nhất).

**Định nghĩa 2 (Cực trị hóa độ dài):**  
Một đường cong $$\gamma$$ là geodesic nếu nó cực tiểu hóa độ dài (cục bộ) giữa hai điểm đầu mút cố định.

Cụ thể, $$\gamma$$ là điểm tới hạn của phiếm hàm năng lượng

$$
E[\gamma] = \frac{1}{2} \int_a^b \|\gamma'(t)\|^2 \, dt.
$$

### 3.2. Phương trình Geodesic và Ký hiệu Christoffel

**Định nghĩa (Phương trình geodesic):**  
Trong tọa độ tham số $$(u(t), v(t))$$, geodesic thỏa mãn hệ phương trình vi phân

$$
\begin{aligned}
\frac{d^2 u}{dt^2} + \Gamma^u_{uu}\left(\frac{du}{dt}\right)^2 + 2\Gamma^u_{uv}\frac{du}{dt}\frac{dv}{dt} + \Gamma^u_{vv}\left(\frac{dv}{dt}\right)^2 &= 0, \\
\frac{d^2 v}{dt^2} + \Gamma^v_{uu}\left(\frac{du}{dt}\right)^2 + 2\Gamma^v_{uv}\frac{du}{dt}\frac{dv}{dt} + \Gamma^v_{vv}\left(\frac{dv}{dt}\right)^2 &= 0,
\end{aligned}
$$

trong đó $$\Gamma^i_{jk}$$ là các *ký hiệu Christoffel* (Christoffel symbols).

**Ký hiệu Christoffel:**  
Ký hiệu Christoffel được định nghĩa từ dạng cơ bản thứ nhất:

$$
\Gamma^k_{ij} = \frac{1}{2} \sum_{l} g^{kl} \left( \frac{\partial g_{jl}}{\partial x^i} + \frac{\partial g_{il}}{\partial x^j} - \frac{\partial g_{ij}}{\partial x^l} \right),
$$

trong đó $$g_{ij}$$ là các thành phần của tensor metric (trong trường hợp bề mặt: $$g_{11} = E, g_{12} = g_{21} = F, g_{22} = G$$).

> [!IMPORTANT]
> **Giải mã Christoffel Symbols ($$\Gamma$$):**
> Đừng sợ các chỉ số! Hãy nghĩ về $$\Gamma$$ như là **"hệ số điều chỉnh"** cho lưới tọa độ cong.
> - Nếu bạn dùng tọa độ Descartes phẳng, lưới thẳng tắp, tất cả $$\Gamma = 0$$. Phương trình trở thành $$d^2u/dt^2 = 0$$ (gia tốc bằng 0, chuyển động thẳng đều).
> - Nếu bạn dùng tọa độ cong (như cực, cầu), lưới bị uốn cong. Ngay cả khi bạn đi "thẳng", tọa độ của bạn thay đổi một cách phức tạp.
> - Các số hạng chứa $$\Gamma$$ xuất hiện để bù trừ cho sự cong của hệ tọa độ, đảm bảo rằng "gia tốc vật lý" thực sự bằng 0.

**Ý nghĩa:**  
Ký hiệu Christoffel mô tả cách mà hệ tọa độ "xoắn" trên bề mặt. Chúng đóng vai trò của "lực giả" trong phương trình geodesic.

### 3.3. Độ cong Geodesic

**Định nghĩa:**  
Cho đường cong $$\gamma(s)$$ tham số hóa theo độ dài cung trên bề mặt. *Độ cong geodesic* $$\kappa_g$$ là thành phần của vector độ cong nằm trong không gian tiếp tuyến.

Nếu $$\gamma$$ là geodesic, thì $$\kappa_g = 0$$.

**Phân tích vector độ cong:**  
Vector độ cong $$\gamma''(s)$$ có thể được phân tích thành

$$
\gamma''(s) = \kappa_g \mathbf{n}_g + \kappa_n \mathbf{n},
$$

trong đó $$\mathbf{n}_g$$ là vector pháp tuyến geodesic (trong không gian tiếp tuyến, vuông góc với $$\gamma'(s)$$), và $$\kappa_n$$ là độ cong pháp tuyến.

## 4. Các Ví dụ Tính toán Chi tiết

### 4.1. Mặt phẳng

Metric: $$ds^2 = du^2 + dv^2$$ ($$E=1, F=0, G=1$$).
Tất cả các đạo hàm của $$E, F, G$$ đều bằng 0, nên tất cả $$\Gamma^k_{ij} = 0$$.
Phương trình geodesic trở thành:
$$
\frac{d^2 u}{dt^2} = 0, \quad \frac{d^2 v}{dt^2} = 0.
$$
Nghiệm là $$u(t) = at + b, v(t) = ct + d$$. Đây là phương trình tham số của đường thẳng.

### 4.2. Mặt trụ

Metric: $$ds^2 = du^2 + dv^2$$ (với $$u = R\theta, v = z$$).
Tương tự như mặt phẳng, metric là hằng số (trong hệ tọa độ này), nên $$\Gamma^k_{ij} = 0$$.
Geodesics là các đường thẳng trong mặt phẳng $$(u, v)$$, tức là $$u = at + b, v = ct + d$$.
Khi cuộn lại thành mặt trụ:
- Nếu $$c=0$$: đường tròn ngang.
- Nếu $$a=0$$: đường thẳng dọc.
- Nếu $$a, c \neq 0$$: đường xoắn ốc (helix).

> [!TIP]
> **Trải phẳng Mặt trụ:**
> Cách dễ nhất để tìm geodesic trên mặt trụ là lấy một tờ giấy, vẽ một đường thẳng lên đó, rồi cuộn tờ giấy lại thành ống trụ.
> - Đường thẳng bạn vẽ sẽ trở thành đường xoắn ốc (helix) quanh ống trụ.
> - Đây là lý do tại sao đường xoắn ốc là geodesic: nó là "đường thẳng" trên bản đồ trải phẳng của mặt trụ.

### 4.3. Mặt cầu

Metric: $$ds^2 = R^2 \, d\theta^2 + R^2\sin^2\theta \, d\varphi^2$$ (với $$\theta$$ là vĩ độ tính từ cực bắc, $$\varphi$$ là kinh độ).
$$E = R^2, G = R^2\sin^2\theta$$.
Tính toán Christoffel cho thấy một số $$\Gamma$$ khác 0.
Tuy nhiên, bằng trực giác đối xứng, các đường tròn lớn (great circles) đi qua cực bắc là các đường kinh tuyến ($$\varphi = \text{const}$$).
Thật vậy, nếu $$\varphi = \text{const}$$, thì $$d\varphi/dt = 0, d^2\varphi/dt^2 = 0$$. Phương trình thứ hai thỏa mãn.
Do tính đối xứng cầu, mọi đường tròn lớn đều là geodesic.

## 5. Hình ảnh minh họa

![Đường Geodesic trên Mặt cầu](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Geodesic_problem_on_sphere.svg/640px-Geodesic_problem_on_sphere.svg.png)
*Hình 1: Đường geodesic giữa hai điểm trên mặt cầu là cung của đường tròn lớn đi qua hai điểm đó.*

![Vận chuyển Song song](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2: Vận chuyển song song một vector dọc theo một vòng kín trên mặt cầu. Khi quay lại điểm xuất phát, vector đã bị quay đi một góc, minh họa độ cong của không gian.*

## 6. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Gauss, Carl Friedrich (1827).** *Disquisitiones Generales Circa Superficies Curvas*.  
   Gauss nghiên cứu geodesics và mối quan hệ của chúng với độ cong.

2. **Riemann, Bernhard (1854).** *Über die Hypothesen, welche der Geometrie zu Grunde liegen*.  
   Riemann tổng quát hóa khái niệm geodesic lên đa tạp Riemann.

3. **do Carmo, Manfredo P. (1976).** *Differential Geometry of Curves and Surfaces*.  
   Chương 4 cung cấp giới thiệu chi tiết về geodesics với nhiều ví dụ.

4. **Pressley, Andrew (2010).** *Elementary Differential Geometry* (2nd Edition).  
   Chương 10-11 về geodesics và phương trình geodesic.

5. **O'Neill, Barrett (2006).** *Elementary Differential Geometry*.  
   Cách tiếp cận hiện đại với nhiều bài tập tính toán.

## 7. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 7.1. Hàng không và Hàng hải: Đường Cung Lớn

Máy bay thương mại bay theo đường cung lớn trên mặt cầu (geodesics) để tiết kiệm nhiên liệu và thời gian. Trên bản đồ Mercator (chiếu phẳng), những đường này trông cong, nhưng trên mặt cầu chúng là đường ngắn nhất.

Ví dụ: Đường bay từ San Francisco đến Tokyo đi qua gần Alaska, dù trên bản đồ phẳng có vẻ xa hơn.

### 7.2. Vật lý: Nguyên lý Tác dụng Cực tiểu

Trong cơ học cổ điển và lượng tử, các hệ vật lý di chuyển dọc theo các đường cực trị hóa tác dụng (action). Trong thuyết tương đối rộng, các hạt tự do di chuyển dọc theo geodesics của không gian-thời gian cong.

### 7.3. Robotics và Lập kế hoạch Chuyển động

Khi robot di chuyển trên một bề mặt (như robot leo tường hoặc robot trên địa hình phức tạp), việc tìm đường đi ngắn nhất trên bề mặt là bài toán tìm geodesic.

**Ví dụ cụ thể:**  
Khoảng cách geodesic từ cực bắc đến cực nam trên mặt cầu bán kính $$R$$ là

$$
d = \pi R,
$$

chính là một nửa chu vi của đường cung lớn đi qua hai cực. Đây cũng chính là khoảng cách ngắn nhất trên bề mặt giữa hai điểm đó.

## 8. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1:** Chứng minh rằng các đường thẳng trên mặt phẳng là geodesics.

**Bài tập 2:** Vẽ một vài geodesics trên một quả cầu (hoặc trái banh). Quan sát rằng chúng là các đường cung lớn.

**Bài tập 3:** Tại sao trên mặt trụ, các đường xoắn ốc là geodesics? Hãy trải mặt trụ ra phẳng và quan sát.

**Bài tập 4:** Tính ký hiệu Christoffel cho mặt cầu với tham số hóa chuẩn.

**Bài tập 5:** Suy ngẫm: Nếu bạn là một con kiến đi trên bề mặt và muốn đi "thẳng" theo cảm giác của bạn (không rẽ trái hay phải), bạn sẽ đi theo geodesic. Điều này có nghĩa gì về mối quan hệ giữa geodesics và hình học nội tại?

**Bài tập 6:** Nghiên cứu *Định lý Gauss-Bonnet* — một kết quả đẹp liên hệ độ cong Gauss, độ cong geodesic, và tô pô của bề mặt.

---

Trong bài giảng cuối cùng của khóa học này, chúng ta sẽ giới thiệu *Dạng vi phân và Giải tích ngoài* — một cách tiếp cận hiện đại và mạnh mẽ hơn để nghiên cứu hình học vi phân, sử dụng ngôn ngữ của các dạng vi phân, tích ngoài, và đạo hàm ngoài. Đây là cửa ngõ vào hình học vi phân hiện đại và lý thuyết đa tạp.
