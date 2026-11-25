---
layout: post
lang: vi
title: "Bài 13: Độ cong Riemann — Cái nhìn Tái ngộ"
chapter: "07"
order: 1
owner: "Hình học Vi phân"
---

Trên một mặt cong hai chiều như vỏ quả bóng hay yên ngựa, độ cong tại mỗi điểm chỉ cần đúng **một con số duy nhất**: độ cong Gauss $$K$$. Nhưng điều gì xảy ra khi bạn bước vào không gian 3 chiều, hay không-thời gian 4 chiều của vũ trụ? Lúc này, tại một điểm $$p$$ có vô số mặt phẳng cắt 2 chiều đi qua $$p$$ — và không gian có thể cong dương theo mặt phẳng Đông–Tây, nhưng lại cong âm theo mặt phẳng Bắc–Trên! Một con số $$K$$ đơn lẻ hoàn toàn bất lực trước sự giàu có đó.

Trong bài giảng nhậm chức chấn động năm 1854 trước Carl Friedrich Gauss (người thầy đã gần 80 tuổi), **Bernhard Riemann** đã đưa ra cỗ máy nắm bắt trọn vẹn độ cong ở mọi số chiều $$n$$: **Tensor độ cong Riemann** $$R^l_{ijk}$$. Đừng sợ 4 chỉ số của nó: ẩn sau công thức ấy là hai hình ảnh vật lý cực kỳ trực quan — góc xoay của cây gậy khi đi hết một vòng kín nhỏ, và **lực thủy triều** kéo hai quả táo rơi tự do xích lại gần nhau!

**Mạch bài học:** Kiến thức cần nhớ (từ độ cong Gauss sang độ cong mặt cắt, tensor Riemann, và hai lần nén thành Ricci & Vô hướng) → Trực giác vòng kín, không giao hoán đạo hàm và lực thủy triều → Định nghĩa hình thức & đối xứng Bianchi → Ví dụ tính tay làm từng bước: tính tường minh $$R^\theta_{\phi\theta\phi}$$, tensor Ricci và độ cong vô hướng $$S = 2/a^2$$ trên mặt cầu bán kính $$a$$ → Giải thích: 4 bước đọc hiểu các tầng độ cong (Riemann → Ricci → Vô hướng → Einstein) → Ứng dụng, Video & Bài tập.

---

## Kiến thức cần nhớ: Hình học độ cong nhiều chiều nghiên cứu những gì?

### 1. Từ một con số $$K$$ sang cỗ máy 4 chỉ số $$R^l_{ijk}$$
Trong không gian $$n$$ chiều, độ cong tại điểm $$p$$ được đo bằng cách chọn một mặt phẳng 2 chiều $$\sigma \subset T_p M$$ (sinh bởi hai vector $$X, Y$$) rồi xem một vector $$Z$$ bị xoay đi bao nhiêu khi vận chuyển song song quanh hình bình hành vô cùng nhỏ cạnh $$X, Y$$. Chính phép gán $$(X, Y, Z) \mapsto R(X, Y)Z$$ là **tensor độ cong Riemann** kiểu $$(1, 3)$$.

### 2. Hai phép "nén dữ liệu": Tensor Ricci và Độ cong Vô hướng
Tensor Riemann ở chiều 4 có tới 20 thành phần độc lập — chứa cả phần uốn cong thể tích lẫn phần kéo giãn biến dạng (tensor Weyl, mang sóng hấp dẫn!). Lấy vết một lần theo một cặp chỉ số cho ta **Tensor Ricci** $$R_{ij}$$ (chỉ còn 10 thành phần ở chiều 4, đo sự thay đổi thể tích của đám mây hạt rơi tự do); lấy vết thêm lần nữa với metric $$g^{ij}$$ cho ta **Độ cong vô hướng** $$S$$ (1 con số trung bình duy nhất).

### 3. Hai bài toán lớn của Hình học Riemann
Một nửa hình học Riemann nghiên cứu câu hỏi **cục bộ**: metric $$g$$ sinh ra độ cong $$R$$ như thế nào (và khi nào $$R = 0 \iff$$ không gian phẳng cục bộ)? Nửa còn lại nghiên cứu câu hỏi **toàn cục**: nếu độ cong luôn dương (như $$K \ge c > 0$$) hoặc luôn âm ở mọi điểm, hình dáng tôpô toàn cục của cả vũ trụ bị ép thành gì (như Định lý Bonnet–Myers, Định lý Gauss–Bonnet tổng quát, hay dòng Ricci của Hamilton–Perelman)?

---

## Tổng quan

Trong các bài giảng về mặt cong hai chiều, chúng ta đã làm quen với độ cong Gauss $$K$$ — một số thực duy nhất tại mỗi điểm cho biết bề mặt cong dương, cong âm hay phẳng. Tuy nhiên, khi chuyển sang các không gian có số chiều cao hơn (3 chiều, 4 chiều...), độ cong tại một điểm phụ thuộc vào mặt phẳng cắt hai chiều mà ta chọn. Để mô tả trọn vẹn toàn bộ thông tin độ cong đó, ta cần một đối tượng tổng quát hơn: *Tensor độ cong Riemann* (Riemann Curvature Tensor).

Bằng phép rút gọn chỉ số (contraction), từ tensor hạng 4 này ta thu được *Tensor độ cong Ricci* (xuất hiện trực tiếp trong phương trình trường Einstein) và *Độ cong vô hướng* (Scalar curvature). Bài giảng này trình bày ý nghĩa hình học của tensor Riemann: nó đo mức độ không giao hoán của đạo hàm hiệp biến, tương đương với góc lệch của một vector khi được vận chuyển song song quanh một vòng kín vô cùng nhỏ.

## 2. Giải thích Trực quan

### 2.1. Vận chuyển Song song quanh Vòng kín

Giả sử bạn đi theo một vòng kín nhỏ trên bề mặt, mang theo một vector và giữ nó luôn song song với chính nó dọc đường đi:
- Nếu bề mặt phẳng: khi trở về điểm xuất phát, vector giữ nguyên hướng ban đầu.
- Nếu bề mặt cong (như mặt cầu): khi trở về, vector bị lệch đi một góc $$\alpha$$.

Góc lệch này tỉ lệ với diện tích của vòng kín và độ cong của bề mặt tại vùng đó. Tensor Riemann chính là ánh xạ đa tuyến tính đo độ lệch này đối với mọi hướng dịch chuyển và mọi mặt phẳng cắt có thể.

> [!TIP]
> **Hình dung "Đi bộ với la bàn":**
> Giả sử bạn cầm một mũi tên (vector) trên mặt cầu và vận chuyển song song nó:
> - Bạn đi từ Xích đạo lên Bắc Cực, giữ mũi tên luôn hướng dọc kinh tuyến.
> - Tại Bắc Cực, bạn rẽ 90 độ rồi đi xuống lại Xích đạo theo một kinh tuyến khác (mũi tên vẫn giữ song song nên nay tạo góc vuông với kinh tuyến mới).
> - Khi đi dọc Xích đạo quay về điểm xuất phát, hướng mũi tên đã xoay đi một góc so với lúc đầu.
> Độ lệch góc này là biểu hiện trực tiếp của độ cong bề mặt.

### 2.2. Sự Không Giao hoán của Đạo hàm Hiệp biến

Trong giải tích trên không gian phẳng, thứ tự lấy đạo hàm riêng không ảnh hưởng đến kết quả: $$\frac{\partial^2 f}{\partial x \partial y} = \frac{\partial^2 f}{\partial y \partial x}$$. Ngược lại, trên đa tạp cong, đạo hàm hiệp biến không giao hoán:
$$
\nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z \neq \nabla_{[X,Y]} Z
$$
Chính phần sai khác này định nghĩa tensor độ cong:
$$
R(X, Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z
$$
Về mặt hình học, độ cong đo mức độ không khép kín khi thực hiện vận chuyển song song theo hai thứ tự ngược nhau dọc các cạnh của một hình bình hành vô cùng nhỏ.

> [!NOTE]
> **Sự phụ thuộc vào đường đi (Path Dependence):**
> So sánh hai lộ trình: đi sang Đông 1 km rồi đi về Bắc 1 km, và đi về Bắc 1 km rồi đi sang Đông 1 km. Trên mặt phẳng, cả hai đưa bạn tới cùng một điểm; còn trên mặt cầu, bạn dừng ở hai vị trí khác nhau. Tensor Riemann định lượng đúng sự sai khác này ở cấp độ vi phân.

### 2.3. Lực Thủy triều (Tidal Forces)

Trong cơ học Newton, trọng lực được xem là một trường lực vector; trong Thuyết tương đối rộng, trọng lực là biểu hiện của độ cong không-thời gian, và dấu hiệu vật lý trực tiếp của độ cong là *lực thủy triều*. Xét hai hạt rơi tự do song song về phía Trái Đất: vì cả hai đều hướng về tâm Trái Đất nên khoảng cách giữa chúng giảm dần. Tốc độ biến đổi khoảng cách tương đối giữa hai đường trắc địa lân cận (độ lệch trắc địa — geodesic deviation) tuân theo phương trình chứa tensor Riemann:
$$
\frac{D^2 J}{dt^2} = -R(T, J)T
$$
trong đó $$J$$ là vector phân cách (deviation vector) và $$T$$ là vector vận tốc dọc đường trắc địa.

> [!IMPORTANT]
> **Hình dung "Hai quả táo rơi tự do":**
> Thả hai quả táo rơi tự do cạnh nhau phía trên Trái Đất:
> - Theo cơ học Newton: lực hấp dẫn hướng về tâm kéo hai quả táo lại gần nhau.
> - Theo thuyết tương đối rộng: không có lực nào tác dụng; cả hai quả táo chuyển động dọc theo đường trắc địa trong không-thời gian cong quanh Trái Đất, và chính độ cong khiến hai đường trắc địa ban đầu song song hội tụ lại.
> Tensor Riemann xác định chính xác tốc độ hội tụ này.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Tensor Độ cong Riemann

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Cho $$M$$ là một đa tạp Riemann với liên kết Levi-Civita $$\nabla$$. *Tensor độ cong Riemann* $$R$$ là một trường tensor kiểu $$(1, 3)$$ xác định bởi:
$$
R(X, Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X, Y]} Z
$$
với mọi trường vector $$X, Y, Z$$ trên $$M$$.
</div>

Trong một hệ tọa độ địa phương:
$$
R(\partial_i, \partial_j)\partial_k = R^l_{ijk} \partial_l
$$
Các thành phần $$R^l_{ijk}$$ được biểu diễn qua ký hiệu Christoffel theo công thức:
$$
R^l_{ijk} = \partial_i \Gamma^l_{jk} - \partial_j \Gamma^l_{ik} + \Gamma^l_{im} \Gamma^m_{jk} - \Gamma^l_{jm} \Gamma^m_{ik}
$$

### Các Tính chất Đối xứng

Khi hạ chỉ số trên xuống vị trí cuối thành tensor kiểu $$(0, 4)$$ là $$R_{ijkl} = g_{lm}R^m_{ijk}$$, tensor Riemann thỏa mãn các tính chất đối xứng sau:
1. **Phản đối xứng theo cặp chỉ số đầu:** $$R_{jikl} = -R_{ijkl}$$
2. **Phản đối xứng theo cặp chỉ số cuối:** $$R_{ijlk} = -R_{ijkl}$$
3. **Đối xứng khi hoán vị hai cặp chỉ số:** $$R_{klij} = R_{ijkl}$$
4. **Đồng nhất thức Bianchi thứ nhất:** $$R_{ijkl} + R_{iklj} + R_{iljk} = 0$$

Nhờ các ràng buộc đối xứng này, số thành phần độc lập của tensor Riemann giảm đáng kể: trong không gian 2 chiều chỉ còn 1 thành phần (chính là độ cong Gauss), trong 3 chiều có 6 thành phần, và trong 4 chiều (không-thời gian) có 20 thành phần.

> [!NOTE]
> **Vì sao các tính chất đối xứng giúp giảm số thành phần độc lập?**
> Có thể ví tensor Riemann như dữ liệu được nén không mất thông tin: một tensor hạng 4 tổng quát có $$n^4$$ thành phần (với $$n=4$$ là $$256$$ thành phần), nhưng các hệ thức đối xứng và đồng nhất thức Bianchi ràng buộc phần lớn các thành phần với nhau, nên trong 4 chiều chỉ cần 20 thành phần độc lập để xác định toàn bộ tensor độ cong.

### Tensor Ricci và Độ cong Vô hướng

Từ tensor Riemann, ta thu được các đại lượng độ cong gọn hơn nhờ phép rút gọn chỉ số (contraction):

1. **Tensor Ricci ($$\mathrm{Ric}$$):** Là tensor đối xứng kiểu $$(0, 2)$$, thu được bằng cách rút gọn chỉ số trên với chỉ số dưới thứ nhất của tensor Riemann:
   $$
   R_{ij} = R^k_{kij}
   $$
   Về mặt hình học, tensor Ricci đo sự thay đổi thể tích của một hình cầu vô cùng nhỏ khi biến dạng dọc theo các đường trắc địa.

2. **Độ cong Vô hướng (Scalar Curvature — $$R$$ hoặc $$S$$):** Là một hàm số thực tại mỗi điểm, thu được bằng cách rút gọn tensor Ricci với metric nghịch đảo:
   $$
   S = g^{ij} R_{ij}
   $$
   Đại lượng này phản ánh độ cong trung bình tại điểm đang xét.

### Độ cong Mặt cắt (Sectional Curvature)

Nếu $$K(p, \sigma)$$ là độ cong Gauss của mặt hai chiều sinh bởi các đường trắc địa tiếp xúc với mặt phẳng $$\sigma \subset T_pM$$ tại điểm $$p$$, thì tập hợp các giá trị $$K(p, \sigma)$$ trên mọi mặt phẳng $$\sigma$$ xác định hoàn toàn tensor Riemann. Đây là cầu nối trực tiếp giữa độ cong Gauss cổ điển trên mặt cong và tensor độ cong Riemann trong không gian nhiều chiều.

---

## Ví dụ tính tay làm từng bước: Tính toàn bộ Riemann, Ricci và Vô hướng trên mặt cầu $$S^2(a)$$

Xét mặt cầu bán kính $$a$$ với metric $$ds^2 = a^2(d\theta^2 + \sin^2\theta\,d\phi^2)$$, tức $$g_{\theta\theta} = a^2$$, $$g_{\phi\phi} = a^2\sin^2\theta$$. Các ký hiệu Christoffel khác $$0$$ duy nhất là:

$$
\Gamma^\theta_{\phi\phi} = -\sin\theta\cos\theta, \qquad \Gamma^\phi_{\theta\phi} = \Gamma^\phi_{\phi\theta} = \cot\theta.
$$

1. **Tính thành phần Riemann $$R^\theta_{\phi\theta\phi}$$** (chú ý đổi vai trò chỉ số theo quy ước $$R^l_{kij} = \partial_i\Gamma^l_{jk} - \partial_j\Gamma^l_{ik} + \Gamma^l_{im}\Gamma^m_{jk} - \Gamma^l_{jm}\Gamma^m_{ik}$$):
   $$
   \begin{aligned}
   R^\theta_{\phi\theta\phi}
   &= \partial_\theta \Gamma^\theta_{\phi\phi} - \partial_\phi \Gamma^\theta_{\theta\phi} + \Gamma^\theta_{\theta m}\Gamma^m_{\phi\phi} - \Gamma^\theta_{\phi m}\Gamma^m_{\theta\phi} \\
   &= \partial_\theta(-\sin\theta\cos\theta) - 0 + 0 - \Gamma^\theta_{\phi\phi}\Gamma^\phi_{\theta\phi} \\
   &= -(\cos^2\theta - \sin^2\theta) - (-\sin\theta\cos\theta)\left(\frac{\cos\theta}{\sin\theta}\right) \\
   &= -\cos^2\theta + \sin^2\theta + \cos^2\theta = \sin^2\theta!
   \end{aligned}
   $$
2. **Kiểm tra độ cong Gauss $$K$$:** Hạ chỉ số bằng $$g_{\theta\theta} = a^2$$ được $$R_{\theta\phi\theta\phi} = a^2\sin^2\theta$$, suy ra:
   $$
   K = \frac{R_{\theta\phi\theta\phi}}{g_{\theta\theta}g_{\phi\phi} - g_{\theta\phi}^2} = \frac{a^2\sin^2\theta}{a^4\sin^2\theta} = \frac{1}{a^2}!
   $$
3. **Tính Tensor Ricci và Độ cong Vô hướng:** Lấy vết ra ngay $$R_{\theta\theta} = R^\phi_{\theta\phi\theta} = 1$$, $$R_{\phi\phi} = R^\theta_{\phi\theta\phi} = \sin^2\theta$$ (tức $$R_{ij} = \frac{1}{a^2} g_{ij}$$!), và độ cong vô hướng:
   $$
   S = g^{\theta\theta}R_{\theta\theta} + g^{\phi\phi}R_{\phi\phi} = \frac{1}{a^2}\cdot 1 + \frac{1}{a^2\sin^2\theta}\cdot\sin^2\theta = \frac{2}{a^2} = 2K!
   $$

Mọi công thức trừu tượng đều hội tụ về đúng con số $$K = 1/a^2$$ và $$S = 2/a^2$$ mà ta có thể tự kiểm tra trọn vẹn trong 4 dòng tính toán!

---

### Giải thích: Đọc hiểu 4 tầng của Độ cong (Riemann → Ricci → Vô hướng → Einstein)

#### Bước 1: Tại sao $$R^l_{ijk}$$ là một tensor thực sự dù được ghép từ $$\Gamma^l_{jk}$$ không phải tensor?
Khi đổi tọa độ, cả đạo hàm $$\partial_i \Gamma^l_{jk}$$ lẫn tích $$\Gamma\cdot\Gamma$$ đều xuất hiện các số hạng "rác" chứa đạo hàm bậc hai của tọa độ. Phép trừ phản đối xứng $$\partial_i\Gamma^l_{jk} - \partial_j\Gamma^l_{ik}$$ triệt tiêu chính xác toàn bộ phần rác đó, biến $$R^l_{ijk}$$ thành một **tensor thực sự**: nếu $$R = 0$$ trong một hệ tọa độ thì không gian phẳng trong mọi hệ tọa độ!

#### Bước 2: Ý nghĩa hình học của Tensor Ricci — "độ phồng/xẹp của thể tích"
Trong chiều $$n \ge 3$$, một chùm tia trắc địa xuất phát từ điểm $$p$$ có thể bị kéo dãn theo trục này và ép dẹt theo trục kia. **Tensor Ricci** $$R_{ij}$$ lấy trung bình độ cong mặt cắt qua mọi mặt phẳng chứa hướng $$i$$, nên nó đo chính xác **tỷ lệ co giãn thể tích** của một quả cầu nhỏ dọc theo dòng trắc địa (Ricci dương $$\implies$$ thể tích co lại nhanh hơn không gian Euclid).

#### Bước 3: Phần bị bỏ lại sau khi rút gọn — Tensor Weyl và sóng hấp dẫn
Ở chiều $$n = 4$$, tensor Riemann có 20 thành phần độc lập nhưng tensor Ricci chỉ giữ lại 10 thành phần. **10 thành phần còn lại** tạo thành **Tensor Weyl** $$C_{ijkl}$$ — đo sự biến dạng *hình dáng* mà vẫn giữ nguyên *thể tích*. Ngay cả trong chân không ngoài Trái Đất nơi $$T_{\mu\nu} = 0 \implies R_{\mu\nu} = 0$$ (Ricci-flat!), tensor Weyl vẫn khác $$0$$: đó chính là nguồn gốc của lực thủy triều chân không và sóng hấp dẫn!

#### Bước 4: Vì sao Einstein chọn tổ hợp $$G_{\mu\nu} = R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu}$$ chứ không phải $$R_{\mu\nu}$$?
Trong vật lý, năng lượng–xung lượng bảo toàn đòi hỏi đạo hàm hiệp biến $$\nabla^\mu T_{\mu\nu} = 0$$. Nhờ **đồng nhất thức Bianchi thứ hai**, tổ hợp duy nhất từ Ricci có phân kỳ hiệp biến tự động bằng $$0$$ ($$\nabla^\mu G_{\mu\nu} \equiv 0$$) chính là **tensor Einstein** $$G_{\mu\nu} = R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu}$$!

Tóm tắt chuỗi phân tầng độ cong:

$$
\text{Riemann } R^l_{ijk}\ (20\text{ TP})
\;\xrightarrow{\text{Rút gọn vết}}\;
\text{Ricci } R_{ij}\ (10\text{ TP}) + \text{Weyl } C_{ijkl}\ (10\text{ TP})
\;\xrightarrow{\text{Bianchi II}}\;
G_{\mu\nu} = 8\pi T_{\mu\nu}.
$$

## Hình ảnh minh họa

![Sự lệch của đường trắc địa](https://upload.wikimedia.org/wikipedia/commons/a/a2/Geodesic_deviation_on_a_sphere.svg)

*Mô tả:* Hai đường kinh tuyến trên mặt cầu xuất phát song song tại Xích đạo nhưng hội tụ gặp nhau tại cực, minh họa phương trình độ lệch trắc địa và ý nghĩa của độ cong dương.

![Giao hoán tử của đạo hàm](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Parallel_transport.png/600px-Parallel_transport.png)

*Mô tả:* Sơ đồ so sánh hai thứ tự lấy đạo hàm: đi theo $$X$$ rồi $$Y$$ ($$\nabla_Y \nabla_X$$) so với đi theo $$Y$$ rồi $$X$$ ($$\nabla_X \nabla_Y$$). Sự sai khác ở kết quả cuối chính là đóng góp của độ cong.

![Lực thủy triều](https://upload.wikimedia.org/wikipedia/commons/5/56/Tidal-forces.svg)

*Mô tả:* Trái Đất làm cong không-thời gian xung quanh. Một đám mây hạt hình cầu rơi tự do về phía Trái Đất bị kéo giãn theo phương hướng tâm và nén lại theo phương ngang — biểu hiện của tensor Riemann (cụ thể là thành phần tensor Weyl).

## Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Riemann, Bernhard (1854).** *Über die Hypothesen, welche der Geometrie zu Grunde liegen*.  
   Bài giảng nổi tiếng nơi Riemann lần đầu đề xuất khái niệm độ cong trong không gian $$n$$ chiều, tổng quát hóa độ cong Gauss.

2. **Einstein, Albert (1915).**  
   Sử dụng tensor Ricci và độ cong vô hướng để xây dựng phương trình trường hấp dẫn.

3. **Milnor, John (1963).** *Morse Theory*.  
   Sử dụng độ cong để nghiên cứu cấu trúc tô pô của đa tạp, làm nổi bật mối liên hệ giữa hình học vi phân cục bộ và tô pô toàn cục.

4. **Petersen, Peter (2016).** *Riemannian Geometry*.  
   Giáo trình chuyên sâu về các đại lượng độ cong và ý nghĩa hình học của chúng.

## Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### Vật lý: Phương trình Einstein
Phương trình trung tâm của Thuyết tương đối rộng có dạng:
$$
R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu}
$$
Vế trái hoàn toàn thuộc về hình học (tensor Ricci, độ cong vô hướng, tensor metric), còn vế phải biểu diễn phân bố vật chất và năng lượng (tensor năng lượng – xung lượng). Như John Wheeler từng tóm tắt: *"Vật chất bảo không gian cong thế nào, không gian bảo vật chất di chuyển thế nào"*.

### Tô pô: Định lý Gauss–Bonnet Tổng quát
Tích phân của dạng độ cong (lớp Euler hay dạng Chern–Gauss–Bonnet) trên toàn bộ đa tạp compact định hướng chẵn chiều cho ra một số nguyên là đặc trưng Euler $$\chi(M)$$, kết nối trực tiếp hình học vi phân với tô pô.

### Phân tích Dữ liệu: Học Đa tạp (Manifold Learning)
Trong học máy, độ cong giúp đánh giá cấu trúc hình học của tập dữ liệu. Khi dữ liệu nằm trên một đa tạp có độ cong lớn, các phương pháp tuyến tính như PCA thường kém chính xác; các đại lượng đo độ cong hỗ trợ đánh giá độ phức tạp và chọn mô hình phù hợp.

## Video tham khảo

- [Tensor Calculus 22: Riemann Curvature Tensor Geometric Meaning (Holonomy + Geodesic Deviation)](https://www.youtube.com/watch?v=-Il2FrmJtcQ) — eigenchris, tiếng Anh. Xem trước: giải thích ý nghĩa hình học của độ cong Riemann qua holonomy quanh vòng kín nhỏ và độ lệch giữa hai đường trắc địa.
- [Tensor Calculus 18: Covariant Derivative (extrinsic) and Parallel Transport](https://www.youtube.com/watch?v=Af9JUiQtV1k) — eigenchris, tiếng Anh. Vận chuyển song song trên mặt cầu cho thấy vector không trở lại hướng ban đầu, đúng phần mở đầu của bài.
- [Relativity 107c: General Relativity Basics - Curvature, Riemann Tensor, Ricci Tensor, Ricci Scalar](https://www.youtube.com/watch?v=0e3h9w9ldaA) — eigenchris, tiếng Anh. Trình bày các phép rút gọn chỉ số từ tensor Riemann sang tensor Ricci và độ cong vô hướng trong ngữ cảnh thuyết tương đối rộng.

## Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đếm số thành phần độc lập**
Tensor Riemann trong không gian $$n$$ chiều có $$n^4$$ thành phần, nhưng nhờ các tính chất đối xứng, số thành phần độc lập chỉ còn $$n^2(n^2-1)/12$$:
- Với $$n=2$$ (mặt phẳng, mặt cầu): có bao nhiêu thành phần độc lập? (Đáp án: 1 — chính là $$K$$).
- Với $$n=3$$: có bao nhiêu thành phần độc lập? (Đáp án: 6 — bằng số thành phần độc lập của tensor Ricci).
- Với $$n=4$$: có bao nhiêu thành phần độc lập? (Đáp án: 20).

**Bài tập 2: Độ cong của không gian phẳng**
Chứng minh rằng nếu không gian là phẳng (Euclid), tức là tồn tại hệ tọa độ sao cho $$g_{ij} = \text{const}$$, thì tensor Riemann bằng 0 tại mọi điểm.

**Bài tập 3: Tính độ cong (Thử thách)**
Cho mặt cầu đơn vị $$S^2$$ với metric $$ds^2 = d\theta^2 + \sin^2\theta d\phi^2$$. Tính một thành phần khác 0 của tensor Riemann, chẳng hạn $$R^\theta_{\phi \theta \phi}$$ (sử dụng các ký hiệu Christoffel đã tính ở bài trước).

**Bài tập 4: Suy ngẫm**
Nếu tensor Ricci bằng 0 tại mọi điểm (Ricci-flat), không gian có nhất thiết phẳng (tensor Riemann bằng 0) không?
(Gợi ý: Trong 2 và 3 chiều thì có, nhưng từ 4 chiều trở lên thì không — đó là cơ sở toán học cho sự tồn tại của sóng hấp dẫn trong chân không).

---

Trong bài giảng tiếp theo, chúng ta sẽ tổng hợp toàn bộ các cấu trúc đã học để trình bày trọn vẹn khái niệm **Đa tạp Riemann**: không gian được trang bị đầy đủ công cụ đo đạc và phép tính vi phân.
