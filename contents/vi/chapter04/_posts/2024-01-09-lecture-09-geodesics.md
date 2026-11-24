---
layout: post
lang: vi
title: "Bài 9: Geodesics — Những Đường đi Thẳng nhất trên Bề mặt"
chapter: "04"
order: 2
owner: "Hình học Vi phân"
---

Nếu bạn từng ngồi trên chuyến bay thẳng từ TP. Hồ Chí Minh hay Tokyo sang Mỹ và mở bản đồ màn hình ghế trước, hẳn bạn đã từng thắc mắc: tại sao máy bay lại bay vòng tít lên gần vùng biển Alaska lạnh giá thay vì kẻ một đường thẳng ngang qua Thái Bình Dương? Hay hãy thử một thí nghiệm tưởng tượng khác: đặt một chiếc ô tô đồ chơi có bánh lái bị khóa cứng đi thẳng lên một quả địa cầu khổng lồ, rồi đẩy nó chạy dọc theo vĩ tuyến $$45^\circ$$ Bắc. Nó có ở lại trên vĩ tuyến đó không? Không hề — nó sẽ lập tức trôi xuống phía xích đạo!

Cả hai hiện tượng ấy đều dẫn về một khái niệm xương sống của hình học nội tại: **đường trắc địa (geodesics)** — những quỹ đạo "thẳng nhất" có thể trong một thế giới cong, nơi người lái không hề xoay vô-lăng sang trái hay phải. Và điều tuyệt đẹp là toàn bộ phương trình xác định đường trắc địa chỉ cần đến metric nội tại $$g_{ij}$$ thông qua các **ký hiệu Christoffel** $$\Gamma^k_{ij}$$.

**Mạch bài học:** Câu đố đường bay & vĩ tuyến $$45^\circ$$ → Bản đồ kiến thức nền (Gia tốc trắc địa, Ký hiệu Christoffel, Biến phân năng lượng) → Trực giác vận chuyển song song & viên bi không ma sát → Định nghĩa hình thức & Phương trình trắc địa → Khung giải thích tính tay ký hiệu Christoffel của mặt cầu và kiểm tra Xích đạo vs. Vĩ tuyến $$45^\circ$$ → Ví dụ mặt phẳng, mặt trụ, mặt cầu & Ứng dụng.

## Bản đồ kiến thức nền: Đường trắc địa kết nối giải tích, cơ học và hình học ra sao?

### 1. Độ cong trắc địa $$\kappa_g$$ và Vận chuyển song song (Parallel Transport)
- **Là gì:** Khi một hạt chạy đều trên bề mặt, vector gia tốc $$\gamma''(s)$$ tách thành hai phần vuông góc: phần hướng vào không gian ngoài $$\kappa_n \mathbf{n}$$ (do bề mặt cong ép hạt phải uốn theo) và phần nằm ngay trong mặt phẳng tiếp tuyến $$\kappa_g \mathbf{n}_g$$ (do hạt tự bẻ lái).
- **Nghiên cứu gì:** Đường trắc địa được định nghĩa bởi $$\kappa_g = 0$$ — không bẻ lái sang trái hay phải. Điều này tương đương với việc vector tiếp tuyến $$\gamma'(s)$$ được **vận chuyển song song** dọc theo chính quỹ đạo của nó.

### 2. Ký hiệu Christoffel ($$\Gamma^k_{ij}$$) — Chiếc cầu nối metric với đạo hàm
- **Là gì:** Bộ hệ số $$\Gamma^k_{ij}$$ được tính hoàn toàn từ $$g_{ij}$$ và các đạo hàm bậc nhất $$\partial g_{ij}/\partial x^l$$, xuất hiện trong phương trình trắc địa $$\ddot{u}^k + \Gamma^k_{ij}\dot{u}^i\dot{u}^j = 0$$.
- **Nghiên cứu gì:** Đóng vai trò "số hạng hiệu chỉnh" cho lưới tọa độ cong (giống lực ly tâm hay lực Coriolis trong hệ quy chiếu quay). Quan trọng hơn: dù $$\Gamma^k_{ij}$$ không phải là một tensor, chúng định nghĩa phép **đạo hàm hiệp biến (covariant derivative)** — phép lấy đạo hàm đúng đắn trên mọi đa tạp cong.

### 3. Nguyên lý biến phân: "Ngắn nhất cục bộ" vs. "Thẳng nhất"
- **Là gì:** Đường trắc địa đồng thời là nghiệm phương trình Euler–Lagrange của phiếm hàm năng lượng $$E[\gamma] = \frac{1}{2}\int \|\gamma'(t)\|^2\,dt$$.
- **Nghiên cứu gì:** Nối thẳng hình học vi phân với cơ học cổ điển (Nguyên lý tác dụng cực tiểu) và thuyết tương đối rộng (hạt rơi tự do và tia sáng đi theo đường trắc địa của không-thời gian cong). Cần nhớ: mọi đường ngắn nhất đều là đường trắc địa, nhưng một đường trắc địa đủ dài (như đi vòng quá nửa Trái Đất) có thể không còn ngắn nhất toàn cục.

## 1. Tổng quan

Trong hình học Euclid, đường thẳng là đường đi ngắn nhất giữa hai điểm. Trên một bề mặt cong, không tồn tại "đường thẳng" theo nghĩa thông thường của không gian phẳng; thay vào đó, ta có **đường trắc địa (geodesics)** — những đường cong giữ vai trò tương tự đường thẳng: chúng là đường "thẳng nhất" theo góc nhìn nội tại của bề mặt và ngắn nhất ở phạm vi cục bộ.

Đường trắc địa xuất hiện trong nhiều lĩnh vực: quỹ đạo ánh sáng trong không-thời gian cong theo thuyết tương đối rộng, đường bay đường dài trên Trái Đất (cung tròn lớn trên mặt cầu), hay quỹ đạo chuyển động không ma sát trên bề mặt ràng buộc.

Bài giảng này trình bày đường trắc địa qua các cách tiếp cận tương đương: đường cong có gia tốc trắc địa bằng không, đường cong cực trị hóa phiếm hàm năng lượng, và nghiệm của hệ phương trình vi phân chứa ký hiệu Christoffel. Ta cũng sẽ tính cụ thể đường trắc địa trên mặt phẳng, mặt trụ và mặt cầu.

## 2. Giải thích Trực quan

### 2.1. Đường bay đường dài: Tại sao quỹ đạo trông cong trên bản đồ?

Xét hai thành phố trên bề mặt Trái Đất là New York và London. Đường bay ngắn nhất nằm trên bề mặt Trái Đất nối hai thành phố này là một đường trắc địa — cụ thể là cung của một *đường tròn lớn* (great circle) trên mặt cầu.

Trên bản đồ phẳng (như phép chiếu Mercator), đường bay này trông cong vồng lên phía Bắc. Tuy nhiên, xét trên chính mặt cầu, đó lại là đường "thẳng nhất" có thể: nếu di chuyển dọc theo bề mặt mà không rẽ trái hay rẽ phải, quỹ đạo vạch ra chính là đường tròn lớn đó.

### 2.2. Vận chuyển Song song (Parallel Transport)

Một cách tiếp cận khác là thông qua khái niệm *vận chuyển song song*. Khi mang một vector tiếp tuyến dọc theo một đường cong trên bề mặt cong, ta nói vector đó được vận chuyển song song nếu nó không bị quay *trong mặt phẳng tiếp tuyến* so với bề mặt dọc theo quỹ đạo.

> [!TIP]
> **Hình dung "Hiệp sĩ cầm thương":**
> Hãy hình dung một người cưỡi ngựa di chuyển trên bề mặt và giữ một cây thương (vector tiếp tuyến) ổn định, không chủ động xoay sang trái hay phải:
> - Trên mặt phẳng, đi theo đường thẳng giúp cây thương luôn giữ nguyên phương cố định.
> - Trên một đường cong bất kỳ, để hướng cây thương luôn trùng với hướng chuyển động, người cưỡi ngựa phải xoay hướng liên tục.
> - **Đường trắc địa** là đường đi mà khi vector tiếp tuyến được vận chuyển song song dọc theo đường đó, nó luôn tiếp tục trùng với hướng đi mà không cần rẽ trái hay rẽ phải.

Nói ngắn gọn, một đường cong là đường trắc địa khi vector tiếp tuyến của nó được vận chuyển song song dọc theo chính nó.

### 2.3. Gia tốc tiếp tuyến bằng không

Theo quan điểm cơ học, một đường cong chuyển động đều là đường trắc địa khi vector gia tốc của nó tại mọi điểm hoàn toàn vuông góc với bề mặt, tức không có thành phần gia tốc nào nằm trong mặt phẳng tiếp tuyến. Đường cong không tự rẽ trên bề mặt; nó chỉ uốn theo độ cong sẵn có của bề mặt.

Tương ứng trong vật lý, nếu một viên bi lăn tự do không ma sát trên bề mặt (chỉ chịu phản lực pháp tuyến từ bề mặt, không có lực tiếp tuyến), quỹ đạo của viên bi là một đường trắc địa.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Định nghĩa đường trắc địa

<div class="textbook-definition" markdown="1">
**Định nghĩa 1 (Gia tốc tiếp tuyến bằng 0):**
Một đường cong $$\gamma(t)$$ trên bề mặt $$S$$ là *đường trắc địa (geodesic)* nếu gia tốc $$\gamma''(t)$$ vuông góc với bề mặt tại mọi điểm, tức là

$$
\gamma''(t) \parallel \mathbf{n}(\gamma(t)),
$$

trong đó $$\mathbf{n}$$ là vector pháp tuyến đơn vị của bề mặt.
</div>

Điều kiện này tương đương với việc thành phần gia tốc nằm trong mặt phẳng tiếp tuyến bằng không (và kéo theo tốc độ $$\|\gamma'(t)\|$$ là hằng số).

> [!NOTE]
> **"Thẳng nhất" và "Ngắn nhất":**
> - Định nghĩa theo gia tốc tiếp tuyến bằng không mô tả tính chất **thẳng nhất** (không rẽ trái hay phải trên bề mặt).
> - Định nghĩa biến phân mô tả tính chất **ngắn nhất cục bộ**.
> - Với hai điểm đủ gần nhau, hai khái niệm này trùng khớp. Tuy nhiên ở khoảng cách xa, một đường trắc địa không nhất thiết là đường ngắn nhất toàn cục (ví dụ: cung lớn hơn của đường tròn lớn đi vòng quanh mặt cầu nối hai điểm vẫn là đường trắc địa nhưng dài hơn cung nhỏ).

<div class="textbook-definition" markdown="1">
**Định nghĩa 2 (Cực trị hóa độ dài cục bộ):**
Một đường cong $$\gamma$$ là đường trắc địa nếu nó cực tiểu hóa độ dài cục bộ (giữa hai điểm đủ gần nhau) và là điểm dừng của phiếm hàm năng lượng với hai đầu mút cố định.
</div>

Cụ thể, $$\gamma$$ là điểm tới hạn của phiếm hàm năng lượng:

$$
E[\gamma] = \frac{1}{2} \int_a^b \|\gamma'(t)\|^2 \, dt.
$$

### 3.2. Phương trình Trắc địa và Ký hiệu Christoffel

<div class="textbook-definition" markdown="1">
**Định nghĩa (Phương trình trắc địa):**
Trong tọa độ tham số $$(u(t), v(t))$$, đường trắc địa thỏa mãn hệ phương trình vi phân cấp hai:

$$
\begin{aligned}
\frac{d^2 u}{dt^2} + \Gamma^u_{uu}\left(\frac{du}{dt}\right)^2 + 2\Gamma^u_{uv}\frac{du}{dt}\frac{dv}{dt} + \Gamma^u_{vv}\left(\frac{dv}{dt}\right)^2 &= 0, \\
\frac{d^2 v}{dt^2} + \Gamma^v_{uu}\left(\frac{du}{dt}\right)^2 + 2\Gamma^v_{uv}\frac{du}{dt}\frac{dv}{dt} + \Gamma^v_{vv}\left(\frac{dv}{dt}\right)^2 &= 0,
\end{aligned}
$$

trong đó $$\Gamma^i_{jk}$$ là các *ký hiệu Christoffel* (Christoffel symbols).
</div>

**Ký hiệu Christoffel:**
Các ký hiệu Christoffel được tính hoàn toàn từ dạng cơ bản thứ nhất:

$$
\Gamma^k_{ij} = \frac{1}{2} \sum_{l} g^{kl} \left( \frac{\partial g_{jl}}{\partial x^i} + \frac{\partial g_{il}}{\partial x^j} - \frac{\partial g_{ij}}{\partial x^l} \right),
$$

trong đó $$g_{ij}$$ là các thành phần của tensor metric (với bề mặt: $$g_{11} = E, g_{12} = g_{21} = F, g_{22} = G$$).

> [!IMPORTANT]
> **Ý nghĩa của ký hiệu Christoffel ($$\Gamma$$):**
> Có thể xem $$\Gamma$$ là các **hệ số hiệu chỉnh** cho sự cong của lưới tọa độ:
> - Trong tọa độ Descartes phẳng, mọi $$\Gamma = 0$$ và phương trình rút gọn về $$d^2u/dt^2 = 0$$ (chuyển động thẳng đều).
> - Trong hệ tọa độ cong (như tọa độ cực hay tọa độ cầu), ngay cả khi hạt chuyển động "thẳng" trên bề mặt, các tọa độ $$(u(t), v(t))$$ vẫn biến thiên phi tuyến.
> - Các số hạng chứa $$\Gamma$$ bù trừ cho sự uốn cong của hệ tọa độ để đảm bảo gia tốc tiếp tuyến thực sự bằng không.

Nói cách khác, ký hiệu Christoffel mã hóa cách hệ tọa độ biến đổi trên bề mặt và đóng vai trò tương tự các số hạng lực quán tính trong phương trình chuyển động.

### 3.3. Độ cong Trắc địa

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Cho đường cong $$\gamma(s)$$ tham số hóa theo độ dài cung trên bề mặt. *Độ cong trắc địa* $$\kappa_g$$ là thành phần của vector gia tốc $$\gamma''(s)$$ nằm trong mặt phẳng tiếp tuyến.
</div>

Một đường cong tham số hóa theo độ dài cung là đường trắc địa khi và chỉ khi $$\kappa_g = 0$$ tại mọi điểm.

**Phân tích vector gia tốc:**
Vector $$\gamma''(s)$$ phân tích thành hai thành phần trực giao:

$$
\gamma''(s) = \kappa_g \mathbf{n}_g + \kappa_n \mathbf{n},
$$

trong đó $$\mathbf{n}_g$$ là vector pháp tuyến trắc địa (nằm trong mặt phẳng tiếp tuyến và vuông góc với $$\gamma'(s)$$), còn $$\kappa_n$$ là độ cong pháp tuyến.

## Khung giải thích: Tính tay ký hiệu Christoffel trên mặt cầu — Vì sao Xích đạo là trắc địa còn Vĩ tuyến $$45^\circ$$ thì không? (nên đọc chậm)

Hãy tính trọn vẹn các ký hiệu Christoffel của mặt cầu đơn vị ($$R = 1$$) với metric:
$$ ds^2 = d\theta^2 + \sin^2\theta\,d\varphi^2, $$
trong đó $$x^1 = \theta$$ (góc cực tính từ cực Bắc, $$0 < \theta < \pi$$) và $$x^2 = \varphi$$ (kinh độ).

### Bước 1: Ghi ma trận metric và nghịch đảo
$$ g = \begin{pmatrix} 1 & 0 \\ 0 & \sin^2\theta \end{pmatrix}, \qquad g^{-1} = \begin{pmatrix} 1 & 0 \\ 0 & \dfrac{1}{\sin^2\theta} \end{pmatrix}. $$
Đạo hàm riêng duy nhất khác $$0$$ trong cả ma trận $$g$$ là:
$$ \frac{\partial g_{\varphi\varphi}}{\partial \theta} = 2\sin\theta\cos\theta. $$

### Bước 2: Tính 8 ký hiệu Christoffel (rất gọn vì $$g$$ chéo!)
Vì $$g^{kl} = 0$$ khi $$k \neq l$$, tổng chỉ còn đúng số hạng $$l = k$$:
- **Với $$k = \theta$$ ($$g^{\theta\theta} = 1$$):** Thành phần duy nhất chứa $$\partial_\theta g_{\varphi\varphi}$$ là khi $$i = j = \varphi$$:
  $$ \Gamma^\theta_{\varphi\varphi} = \frac{1}{2} g^{\theta\theta}\left(0 + 0 - \frac{\partial g_{\varphi\varphi}}{\partial \theta}\right) = -\frac{1}{2}(2\sin\theta\cos\theta) = -\sin\theta\cos\theta. $$
  Cả ba ký hiệu còn lại $$\Gamma^\theta_{\theta\theta} = \Gamma^\theta_{\theta\varphi} = \Gamma^\theta_{\varphi\theta} = 0$$.
- **Với $$k = \varphi$$ ($$g^{\varphi\varphi} = \frac{1}{\sin^2\theta}$$):** Thành phần khác $$0$$ xuất hiện khi một chỉ số là $$\theta$$ và chỉ số kia là $$\varphi$$:
  $$ \Gamma^\varphi_{\theta\varphi} = \Gamma^\varphi_{\varphi\theta} = \frac{1}{2} g^{\varphi\varphi}\left(\frac{\partial g_{\varphi\varphi}}{\partial \theta} + 0 - 0\right) = \frac{1}{2\sin^2\theta}(2\sin\theta\cos\theta) = \cot\theta. $$
  Hai ký hiệu còn lại $$\Gamma^\varphi_{\theta\theta} = \Gamma^\varphi_{\varphi\varphi} = 0$$.

### Bước 3: Lắp vào phương trình trắc địa và kiểm chứng hai đường tròn vĩ tuyến!
Hệ phương trình trắc địa của mặt cầu đơn vị trở nên gọn đẹp bất ngờ:
$$ \frac{d^2\theta}{dt^2} - \sin\theta\cos\theta\left(\frac{d\varphi}{dt}\right)^2 = 0, \qquad \frac{d^2\varphi}{dt^2} + 2\cot\theta\,\frac{d\theta}{dt}\frac{d\varphi}{dt} = 0. $$
Bây giờ cho xe chạy đều dọc một vòng vĩ tuyến cố định $$\theta(t) = \theta_0$$ với tốc độ góc $$\varphi(t) = \omega t$$ ($$\omega \neq 0$$). Khi đó $$\frac{d\theta}{dt} = 0$$, $$\frac{d^2\theta}{dt^2} = 0$$, $$\frac{d^2\varphi}{dt^2} = 0$$. Phương trình thứ hai tự động thỏa mãn ($$0 + 0 = 0$$), còn phương trình thứ nhất trở thành:
$$ -\sin\theta_0\cos\theta_0 \cdot \omega^2 = 0. $$
- **Tại Xích đạo ($$\theta_0 = \frac{\pi}{2}$$):** $$\cos(\frac{\pi}{2}) = 0 \implies 0 = 0$$! Xích đạo là một **đường trắc địa** chính hiệu.
- **Tại Vĩ tuyến $$45^\circ$$ Bắc ($$\theta_0 = \frac{\pi}{4}$$):** Vế trái bằng $$-\sin\frac{\pi}{4}\cos\frac{\pi}{4}\,\omega^2 = -\frac{1}{2}\omega^2 \neq 0$$! Phương trình bị phá vỡ: để bám trụ trên vĩ tuyến $$45^\circ$$, người lái **bắt buộc phải đánh lái liên tục về phía cực Bắc** (chống lại xu hướng trôi về Xích đạo với độ cong trắc địa $$\kappa_g = \cot\frac{\pi}{4} = 1$$). Nếu thả vô-lăng, chiếc xe sẽ lập tức trượt sang một đường tròn lớn cắt xiên xuống Xích đạo!

## 4. Các Ví dụ Tính toán Chi tiết

### 4.1. Mặt phẳng

Với metric $$ds^2 = du^2 + dv^2$$ ($$E=1, F=0, G=1$$), mọi đạo hàm riêng của $$E, F, G$$ đều bằng 0 nên tất cả $$\Gamma^k_{ij} = 0$$. Phương trình trắc địa trở thành:
$$
\frac{d^2 u}{dt^2} = 0, \quad \frac{d^2 v}{dt^2} = 0.
$$
Nghiệm tổng quát là $$u(t) = at + b, \, v(t) = ct + d$$ — chính là các đường thẳng.

### 4.2. Mặt trụ

Sử dụng tọa độ $$u = R\theta, \, v = z$$, metric của mặt trụ là $$ds^2 = du^2 + dv^2$$. Vì các hệ số metric là hằng số, mọi $$\Gamma^k_{ij} = 0$$ và các đường trắc địa là đường thẳng trên miền phẳng $$(u, v)$$: $$u = at + b, \, v = ct + d$$. Khi cuộn lại thành mặt trụ, chúng tạo thành ba dạng:
- $$c = 0$$: các đường tròn ngang vuông góc với trục trụ.
- $$a = 0$$: các đường sinh thẳng đứng dọc theo trục trụ.
- $$a, c \neq 0$$: các đường xoắn ốc (helix).

> [!TIP]
> **Trải phẳng mặt trụ:**
> Cách trực quan nhất để thấy đường trắc địa trên mặt trụ là vẽ một đường thẳng trên tờ giấy phẳng rồi cuộn lại thành ống trụ: đường thẳng đó trở thành một đường xoắn ốc. Vì phép cuộn là đẳng cự cục bộ, nó biến đường trắc địa của mặt phẳng thành đường trắc địa của mặt trụ.

### 4.3. Mặt cầu

Metric của mặt cầu bán kính $$R$$ trong tọa độ cầu ($$\theta$$ là góc cực tính từ cực Bắc, $$\varphi$$ là kinh độ) là $$ds^2 = R^2 \, d\theta^2 + R^2\sin^2\theta \, d\varphi^2$$, với $$E = R^2, \, G = R^2\sin^2\theta$$. Một số ký hiệu Christoffel ở đây khác không (như ta vừa tính ở trên: $$\Gamma^\theta_{\varphi\varphi} = -\sin\theta\cos\theta$$ và $$\Gamma^\varphi_{\theta\varphi} = \cot\theta$$ — chú ý chúng không phụ thuộc vào bán kính $$R$$!).

Xét các đường kinh tuyến $$\varphi = \text{const}$$ (với tốc độ góc đều $$d^2\theta/dt^2 = 0$$): khi đó $$d\varphi/dt = 0$$ và $$d^2\varphi/dt^2 = 0$$, đồng thời $$\Gamma^\varphi_{\theta\theta} = 0$$ nên cả hai phương trình trắc địa đều thỏa mãn. Nhờ tính đối xứng quay của mặt cầu, mọi đường tròn lớn đều có thể đưa về một đường kinh tuyến bằng phép quay, do đó mọi đường tròn lớn đều là đường trắc địa trên mặt cầu.

## 5. Hình ảnh minh họa

![Đường Geodesic trên Mặt cầu](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Geodesic_problem_on_sphere.svg/640px-Geodesic_problem_on_sphere.svg.png)
*Hình 1: Đường trắc địa nối hai điểm trên mặt cầu là cung của đường tròn lớn đi qua hai điểm đó.*

![Vận chuyển Song song](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2: Vận chuyển song song một vector dọc theo một chu trình kín trên mặt cầu. Khi quay lại điểm xuất phát, vector bị lệch đi một góc so với hướng ban đầu — hệ quả trực tiếp của độ cong nội tại.*

## 6. Các Công trình Nền tảng & Tài liệu Tham khảo

1. **Gauss, Carl Friedrich (1827).** *Disquisitiones Generales Circa Superficies Curvas*.
   Nghiên cứu cổ điển về đường trắc địa và mối liên hệ với độ cong bề mặt.

2. **Riemann, Bernhard (1854).** *Über die Hypothesen, welche der Geometrie zu Grunde liegen*.
   Mở rộng khái niệm đường trắc địa lên các đa tạp Riemann nhiều chiều.

3. **do Carmo, Manfredo P. (1976).** *Differential Geometry of Curves and Surfaces*.
   Chương 4 trình bày chi tiết lý thuyết đường trắc địa cùng nhiều ví dụ.

4. **Pressley, Andrew (2010).** *Elementary Differential Geometry* (2nd Edition).
   Chương 10–11 tập trung vào đường trắc địa và phương trình trắc địa.

5. **O'Neill, Barrett (2006).** *Elementary Differential Geometry*.
   Trình bày theo hướng hiện đại kèm nhiều bài tập tính toán.

## 7. Ứng dụng và Kết nối Liên ngành

### 7.1. Hàng không và hàng hải: Đường cung lớn

Các tuyến bay thương mại đường dài bám theo cung tròn lớn trên mặt cầu để rút ngắn quãng đường và tiết kiệm nhiên liệu. Ví dụ, đường bay giữa San Francisco và Tokyo đi vòng lên gần Alaska dù trên bản đồ phẳng trông có vẻ dài hơn.

### 7.2. Vật lý: Nguyên lý tác dụng cực tiểu

Trong cơ học cổ điển, quỹ đạo chuyển động của hệ vật lý cực trị hóa phiếm hàm tác dụng (action). Trong thuyết tương đối rộng, các hạt chuyển động tự do dưới tác dụng của trường hấp dẫn đi theo đường trắc địa của không-thời gian cong.

### 7.3. Robotics và quy hoạch chuyển động

Khi robot di chuyển trên một bề mặt ràng buộc hoặc địa hình cong, bài toán tìm quỹ đạo ngắn nhất trên bề mặt chính là bài toán tìm đường trắc địa.

**Ví dụ cụ thể:** Khoảng cách trắc địa từ cực Bắc đến cực Nam trên mặt cầu bán kính $$R$$ là:

$$
d = \pi R,
$$

bằng đúng một nửa chu vi đường tròn lớn đi qua hai cực.

## Video tham khảo

- [Tensor Calculus 16: Geodesic Examples on Plane and Sphere](https://www.youtube.com/watch?v=8sVDceI70HM) — eigenchris, tiếng Anh. Nên xem trước để theo dõi các ví dụ trên mặt phẳng và mặt cầu, minh họa đường tròn lớn tương ứng với ví dụ đường bay New York–London trong bài.
- [Tensor Calculus 15: Geodesics and Christoffel Symbols (extrinsic geometry)](https://www.youtube.com/watch?v=1CuTNveXJRc) — eigenchris, tiếng Anh. Trình bày phương trình trắc địa và ký hiệu Christoffel, khớp với mục định nghĩa hình thức của bài.
- [Lecture 20: Geodesics (Discrete Differential Geometry)](https://www.youtube.com/watch?v=uojNGbVtlsQ) — Keenan Crane, tiếng Anh. Phân tách rõ hai góc nhìn — ngắn nhất cục bộ và thẳng nhất — cùng khái niệm vận chuyển song song; bài giảng đầy đủ tương ứng với toàn bộ nội dung bài học.

## 8. Bài tập và Suy ngẫm

**Bài tập 1:** Chứng minh rằng các đường thẳng là đường trắc địa trên mặt phẳng.

**Bài tập 2:** Phác họa một số đường trắc địa trên mặt cầu và quan sát rằng chúng đều là các đường tròn lớn.

**Bài tập 3:** Giải thích vì sao các đường xoắn ốc trên mặt trụ là đường trắc địa bằng cách trải mặt trụ ra mặt phẳng.

**Bài tập 4:** Tính các ký hiệu Christoffel cho mặt cầu trong tham số hóa tọa độ cầu chuẩn.

**Bài tập 5:** Một sinh vật sống trên bề mặt và di chuyển "thẳng" theo cảm nhận nội tại (không rẽ trái hay phải) sẽ đi theo đường trắc địa. Điều này cho thấy mối liên hệ gì giữa đường trắc địa và hình học nội tại?

**Bài tập 6:** Tìm hiểu sơ lược về *Định lý Gauss–Bonnet* — kết quả liên kết độ cong Gauss, độ cong trắc địa và đặc trưng tô-pô của bề mặt.

---

Trong bài giảng tiếp theo của khóa học, ta sẽ tiếp cận *Dạng vi phân và Giải tích ngoài* — ngôn ngữ của các dạng vi phân, tích ngoài và đạo hàm ngoài, mở đường sang hình học vi phân hiện đại và lý thuyết đa tạp.
