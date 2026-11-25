---
layout: post
lang: vi
title: "Bài 14: Đa tạp Riemann và Cấu trúc Hình học"
chapter: "07"
order: 2
owner: "Hình học Vi phân"
---

Hãy thử một thí nghiệm nhỏ trên mặt phẳng $$\mathbb{R}^2$$ bị khoét đúng một lỗ kim tại gốc tọa độ: $$M = \mathbb{R}^2 \setminus \{(0,0)\}$$. Chọn hai điểm đối xứng nhau qua gốc là $$p = (-1, 0)$$ và $$q = (1, 0)$$. Đường nối ngắn nhất giữa chúng *đáng lẽ* phải là đoạn thẳng nằm ngang dài $$2$$ — nhưng đoạn thẳng ấy lại vấp ngay vào lỗ thủng tại $$(0,0)$$! Bạn có thể vẽ những đường cong vòng tránh gốc tọa độ với độ dài $$2.1,\; 2.01,\; 2.0001,\; \ldots$$ tiến sát về $$2$$, nhưng **không bao giờ tồn tại** một đường ngắn nhất nào nằm hoàn toàn trong $$M$$ đạt được đúng độ dài $$2$$!

Câu chuyện giản dị ấy mở ra cánh cửa vào **hình học Riemann toàn cục**: chỉ riêng một **metric** $$g$$ trơn trên đa tạp $$M$$ đã tự động sinh ra độ dài, góc, liên kết Levi-Civita và độ cong Riemann — nhưng để đảm bảo giữa hai điểm bất kỳ *luôn tồn tại* một đường trắc địa ngắn nhất toàn cục, không gian cần thêm một điều kiện toàn cục cực kỳ đẹp gọi là **tính đầy đủ (completeness)**, được khẳng định qua **Định lý Hopf–Rinow** lừng danh!

**Mạch bài học:** Kiến thức cần nhớ (cỗ máy tự sinh từ $$(M,g)$$, đẳng cự cục bộ vs. toàn cục, tính đầy đủ) → Trực giác tấm màng cao su, thế giới Pac-Man & mặt bàn có biên → Định nghĩa hình thức & Định lý Hopf–Rinow → Ví dụ tính tay làm từng bước: so sánh mặt phẳng thủng lỗ $$\mathbb{R}^2\setminus\{0\}$$ (không đầy đủ) với nửa mặt phẳng Poincaré $$\mathbb{H}^2$$ (đầy đủ vì trục hoành bị đẩy ra vô cực!) → Giải thích: 4 bước nối Giải tích Cauchy với Hình học Trắc địa trong Định lý Hopf–Rinow → Ứng dụng, Video & Bài tập.

---

## Kiến thức cần nhớ: Hình học Đa tạp Riemann nghiên cứu những gì?

### 1. Một cặp $$(M, g)$$ duy nhất sinh ra toàn bộ hình học
Khi đặt một tensor metric $$g$$ xác định dương lên đa tạp trơn $$M$$, ta lập tức có miễn phí năm công cụ ăn khớp với nhau: (i) thước đo độ dài cung và góc; (ii) khoảng cách toàn cục $$d(p, q)$$ biến $$M$$ thành không gian metric; (iii) phần tử thể tích $$\sqrt{\det g}\,dx^1\cdots dx^n$$; (iv) liên kết Levi-Civita duy nhất $$\nabla$$; và (v) tensor độ cong Riemann $$R$$.

### 2. Phép đẳng cự (Isometry) — khi nào hai không gian là "một"?
Trong tôpô, hai không gian giống nhau nếu tồn tại đồng phôi (co giãn liên tục không xé rách). Trong hình học Riemann, tiêu chuẩn khắt khe hơn nhiều: hai đa tạp $$(M, g)$$ và $$(N, h)$$ là một nếu có một **phép đẳng cự** bảo toàn chính xác độ dài mọi vector tiếp tuyến. Mặt phẳng và mặt trụ **đẳng cự cục bộ** nhưng **không đẳng cự toàn cục** (vì mặt trụ có vòng tròn khép kín không co về điểm được).

### 3. Tính đầy đủ (Completeness) — bảo hiểm chống "rơi khỏi mép vũ trụ"
Một đa tạp không đầy đủ có "lỗ thủng" hoặc "biên bị cắt mất" ở khoảng cách hữu hạn, khiến các đường trắc địa đứt gãy giữa chừng. **Định lý Hopf–Rinow** chứng minh sự tương đương ngoạn mục giữa ba thế giới: đầy đủ giải tích (mọi dãy Cauchy hội tụ) $$\iff$$ đầy đủ hình học (mọi đường trắc địa kéo dài vô hạn) $$\iff$$ tính chất Heine–Borel (mọi tập đóng và bị chặn đều compact).

---

## Tổng quan

Đến đây, chúng ta đã xây dựng lần lượt từng cấu trúc cơ bản: vector, covector, tensor, liên kết và độ cong. Bài giảng này ghép nối toàn bộ các thành phần đó vào một khung thống nhất: *Đa tạp Riemann* (Riemannian Manifold).

Đa tạp Riemann là đối tượng nghiên cứu trung tâm của hình học vi phân hiện đại. Đó là một đa tạp trơn được trang bị một metric (tích vô hướng biến thiên trơn) tại mọi điểm. Chỉ từ metric này, toàn bộ cấu trúc hình học tự động được xác định:
- Đo độ dài đường cong và góc giữa các vector tiếp tuyến.
- Xác định đường ngắn nhất cục bộ (đường trắc địa).
- Xác định duy nhất liên kết Levi-Civita để lấy đạo hàm hiệp biến.
- Xác định tensor độ cong Riemann để đo độ cong nội tại của không gian.
- Đo diện tích và thể tích thông qua định thức của ma trận metric.

Trong bài giảng này, chúng ta trình bày định nghĩa hình thức của đa tạp Riemann, khái niệm phép đẳng cự (isometry — khi nào hai không gian có cùng cấu trúc hình học) và tính đầy đủ (completeness) — một tính chất toàn cục quan trọng. Cuối bài, ta tìm hiểu Định lý Hopf–Rinow, kết quả nối liền tính đầy đủ theo nghĩa không gian metric với tính đầy đủ trắc địa.

## 2. Giải thích Trực quan

### 2.1. Trang bị Metric cho Đa tạp

Hãy hình dung một tấm màng cao su (đa tạp trơn): vì có thể co giãn tùy ý nên bản thân nó chưa có khái niệm khoảng cách cố định. Bây giờ, tại mỗi điểm trên tấm màng, ta đặt một hình elip nhỏ quy định "độ dài đơn vị" theo các hướng khác nhau tại điểm đó:
- Nếu mọi hình elip đều là hình tròn có cùng bán kính: không gian phẳng đều (Euclid).
- Nếu kích thước và hình dạng của các hình elip thay đổi từ điểm này sang điểm khác: không gian có hình học biến thiên và có thể bị cong.

Tập hợp toàn bộ quy tắc đo độ dài cục bộ này chính là *metric Riemann*. Khi đã có metric, khoảng cách giữa hai điểm bất kỳ được xác định cố định là cận dưới lớn nhất của độ dài các đường cong nối chúng.

> [!TIP]
> **Hình dung "Bản đồ địa hình có chi phí di chuyển":**
> Có thể xem đa tạp như một bản đồ địa hình có vùng đi nhanh (chi phí thấp) và vùng đầm lầy đi chậm (chi phí cao). Metric $$g$$ tại mỗi điểm xác định "chi phí" (độ dài) cho mỗi bước di chuyển nhỏ theo từng hướng, còn đường trắc địa là lộ trình có tổng chi phí nhỏ nhất (cục bộ) nối điểm A với điểm B.

### 2.2. Đẳng cự: Hai không gian hay một?

Xét một tờ giấy phẳng và một mặt trụ thu được khi cuộn tờ giấy đó lại (không kéo giãn hay làm rách). Nếu một sinh vật 2D sống trên mặt trụ chỉ quan sát trong một vùng nhỏ (tính chất *cục bộ*), mọi phép đo độ dài, góc và diện tích đều giống hệt trên mặt phẳng: ta nói mặt phẳng và mặt trụ *đẳng cự cục bộ* (locally isometric).

Tuy nhiên, về mặt *toàn cục*, hai không gian này khác nhau vì trên mặt trụ có những vòng kín không thể co liên tục về một điểm. Hình học Riemann nghiên cứu cả tính chất cục bộ (như độ cong) lẫn tính chất toàn cục (như tô pô và đường trắc địa đóng).

> [!NOTE]
> **Ví dụ thế giới Pac-Man:**
> Trong trò chơi Pac-Man, khi nhân vật đi qua mép phải màn hình, nó xuất hiện lại ở mép trái (và tương tự với mép trên – dưới). Về mặt cục bộ, không gian này phẳng hoàn toàn như mặt phẳng Euclid; nhưng về mặt toàn cục, nó có cấu trúc tô pô của một hình xuyến phẳng (flat torus). Điều này minh họa sự khác biệt giữa hình học cục bộ và cấu trúc toàn cục.

### 2.3. Tính Đầy đủ (Completeness)

Một đa tạp Riemann được gọi là "đầy đủ" nếu ta có thể đi mãi theo bất kỳ đường trắc địa nào với tham số độ dài cung tùy ý mà không bị dừng đột ngột tại một biên hay lỗ thủng:
- Mặt phẳng $$\mathbb{R}^2$$: đầy đủ.
- Hình tròn mở (không chứa đường biên): không đầy đủ, vì đường thẳng đi ra biên sẽ kết thúc sau một độ dài hữu hạn.
- Mặt cầu: đầy đủ, vì đường tròn lớn có thể kéo dài vô hạn bằng cách đi lặp vòng quanh mặt cầu.

> [!IMPORTANT]
> **Hình dung trực quan về tính đầy đủ:**
> - Trên một mặt bàn vô hạn, đường thẳng kéo dài mãi không bao giờ chạm mép (đầy đủ).
> - Trên một mặt bàn hữu hạn không tính biên, chuyển động thẳng sẽ dừng lại khi chạm mép trong thời gian hữu hạn (không đầy đủ).
> - Trên một quả cầu, dù diện tích hữu hạn, chuyển động theo đường tròn lớn vẫn kéo dài mãi mà không gặp biên hay điểm thủng (đầy đủ).
> Tính đầy đủ bảo đảm không gian không có các "lỗ thủng" hay "biên bị cắt mất" khiến đường trắc địa bị đứt đoạn.

## Định nghĩa Hình thức và Ký hiệu

### Đa tạp Riemann

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Một *Đa tạp Riemann* là một cặp $$(M, g)$$, trong đó:
- $$M$$ là một đa tạp trơn $$n$$ chiều.
- $$g$$ là một metric Riemann trên $$M$$, tức là một trường tensor kiểu $$(0, 2)$$ đối xứng và xác định dương tại mọi điểm:
$$
g_p: T_pM \times T_pM \to \mathbb{R}
$$
Trong hệ tọa độ địa phương: $$g = g_{ij} dx^i \otimes dx^j$$.
</div>

### Khoảng cách Riemann

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Độ dài của một đường cong trơn từng khúc $$\gamma: [a, b] \to M$$ được định nghĩa bởi:
$$
L(\gamma) = \int_a^b \sqrt{g(\dot{\gamma}(t), \dot{\gamma}(t))} dt
$$
Khoảng cách giữa hai điểm $$p, q \in M$$, ký hiệu $$d(p, q)$$, là infimum (cận dưới lớn nhất) của độ dài mọi đường cong trơn từng khúc nối $$p$$ và $$q$$:
$$
d(p, q) = \inf \{ L(\gamma) \mid \gamma(a)=p, \gamma(b)=q \}
$$
Với hàm khoảng cách này, $$(M, d)$$ trở thành một không gian metric theo nghĩa tô pô.
</div>

### Đẳng cự (Isometry)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Một vi phôi (diffeomorphism) $$\varphi: (M, g) \to (N, h)$$ được gọi là một *phép đẳng cự* nếu nó bảo toàn metric:
$$
\varphi^* h = g
$$
tức là với mọi $$u, v \in T_pM$$:
$$
h_{\varphi(p)}(d\varphi_p(u), d\varphi_p(v)) = g_p(u, v)
$$
Hai đa tạp Riemann được gọi là đẳng cự nếu tồn tại một phép đẳng cự giữa chúng; khi đó, về mặt hình học Riemann chúng đồng nhất với nhau.
</div>

### Định lý Hopf–Rinow

<div class="textbook-theorem" markdown="1">
**Định lý:**
Cho $$(M, g)$$ là một đa tạp Riemann liên thông. Ba mệnh đề sau là tương đương:
1. $$M$$ là một không gian metric đầy đủ (mọi dãy Cauchy đều hội tụ).
2. $$M$$ đầy đủ trắc địa (geodesically complete): mọi đường trắc địa $$\gamma(t)$$ đều kéo dài xác định được với mọi $$t \in \mathbb{R}$$.
3. Mọi tập con đóng và bị chặn của $$M$$ đều compact (tính chất Heine–Borel).
</div>

**Hệ quả quan trọng:**
Nếu $$M$$ đầy đủ và liên thông, thì với hai điểm bất kỳ $$p, q \in M$$, luôn *tồn tại* ít nhất một đường trắc địa nối $$p$$ và $$q$$ có độ dài bằng đúng khoảng cách $$d(p, q)$$ (đường ngắn nhất toàn cục).

---

## Ví dụ tính tay làm từng bước: So sánh không gian không đầy đủ vs. Nửa mặt phẳng Poincaré $$\mathbb{H}^2$$

Cùng một tập hợp điểm mở $$H = \{(x, y) \in \mathbb{R}^2 : y > 0\}$$, nhưng chỉ cần thay đổi metric $$g$$ là tính đầy đủ đảo ngược hoàn toàn!

1. **Với metric Euclid thường $$g_{\text{Euc}} = dx^2 + dy^2$$:**
   Xét đường trắc địa thẳng đứng đi xuống biên $$\gamma(t) = (0, 1 - t)$$ với tốc độ đơn vị. Tại đúng thời điểm hữu hạn $$t = 1$$, đường đi đâm vào trục hoành $$y = 0 \notin H$$ và bị đứt đoạn! Tương tự, dãy $$p_k = (0, 1/k)$$ là dãy Cauchy nhưng không có giới hạn trong $$H$$ $$\implies$$ **$$(H, g_{\text{Euc}})$$ không đầy đủ**.

2. **Với metric hyperbolic Poincaré $$g_{\text{hyp}} = \frac{dx^2 + dy^2}{y^2}$$:**
   Tính lại độ dài của đúng đoạn thẳng đứng đi từ $$(0, 1)$$ xuống $$(0, \varepsilon)$$ ($$0 < \varepsilon < 1$$):
   $$
   L(\varepsilon) = \int_\varepsilon^1 \frac{dy}{y} = \bigl[\ln y\bigr]_\varepsilon^1 = \ln\!\left(\frac{1}{\varepsilon}\right) \xrightarrow{\varepsilon \to 0^+} +\infty!
   $$
   Metric $$\frac{1}{y^2}$$ phóng to khoảng cách gần trục hoành mạnh đến mức **biên $$y = 0$$ bị đẩy ra tận vô cực**! Không một đường trắc địa nào chạm tới $$y = 0$$ trong thời gian hữu hạn — do đó **$$(H, g_{\text{hyp}})$$ hoàn toàn đầy đủ** (và theo Định lý Hopf–Rinow, mọi cặp điểm đều nối được bằng một đường trắc địa ngắn nhất — là các nửa đường tròn vuông góc với trục hoành)!

---

### Giải thích: Định lý Hopf–Rinow nối dãy Cauchy với đường trắc địa như thế nào?

#### Bước 1: Hình cầu trắc địa nhỏ luôn tồn tại cục bộ
Tại mọi điểm $$p \in M$$, ánh xạ mũ $$\exp_p : T_p M \to M$$ (bắn tia trắc địa từ $$p$$ theo vận tốc ban đầu $$v$$) là một vi phôi trên một quả cầu nhỏ bán kính $$\delta > 0$$. Trong quả cầu nhỏ ấy, mọi điểm $$q$$ đều nối với $$p$$ bằng **duy nhất** một đường trắc địa ngắn nhất.

#### Bước 2: Đầy đủ trắc địa $$\implies$$ tồn tại đường ngắn nhất nối hai điểm bất kỳ $$p, q$$
Muốn nối $$p$$ với một điểm $$q$$ ở xa ($$r = d(p, q)$$), ta đặt mặt cầu trắc địa nhỏ $$S_\delta(p)$$ quanh $$p$$ (compact!) và tìm điểm $$x_0 \in S_\delta(p)$$ sao cho khoảng cách tới $$q$$ nhỏ nhất. Bắn đường trắc địa $$\gamma(t)$$ từ $$p$$ xuyên qua $$x_0$$. Vì $$M$$ **đầy đủ trắc địa**, ta kéo dài $$\gamma(t)$$ mãi tới tận $$t = r$$ mà không sợ đứt gãy — và chứng minh bằng phương pháp mở–đóng rằng $$\gamma(r)$$ chạm đúng vào $$q$$!

#### Bước 3: Ánh xạ mũ phủ kín toàn bộ $$M$$ $$\implies$$ tính chất Heine–Borel
Khi mọi điểm $$q$$ cách $$p$$ không quá $$R$$ đều nằm trên một tia trắc địa dài không quá $$R$$, hình cầu đóng $$\overline{B_R(p)}$$ chính là ảnh liên tục của quả cầu đóng compact $$\overline{B_R(0)} \subset T_p M$$ qua ánh xạ $$\exp_p$$ — nên $$\overline{B_R(p)}$$ lập tức **compact**!

#### Bước 4: Khép vòng tương đương với tính đầy đủ metric (Cauchy)
Mọi dãy Cauchy đều bị chặn nên nằm gọn trong một quả cầu đóng compact $$\overline{B_R(p)}$$, do đó chắc chắn có dãy con hội tụ — và dãy Cauchy có dãy con hội tụ thì chính nó hội tụ! Ba khái niệm tưởng chừng từ ba môn học khác nhau khép chặt thành một vòng tròn tương đương hoàn hảo.

Tóm tắt vòng tròn Hopf–Rinow:

$$
\text{Đầy đủ trắc địa } (\exp_p \text{ toàn cục})
\;\Longrightarrow\;
\overline{B_R(p)} \text{ compact (Heine–Borel)}
\;\Longrightarrow\;
\text{Đầy đủ metric (Cauchy)}
\;\Longrightarrow\;
\exists\,\text{trắc địa ngắn nhất } p \to q.
$$

## Hình ảnh minh họa

![Đa tạp Riemann 2D](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)

*Mô tả:* Đường trắc địa trên mặt cầu — ví dụ kinh điển của một đa tạp Riemann compact và đầy đủ, nơi mọi đường trắc địa là đường tròn lớn.

![Đẳng cự cục bộ](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Cylinder_net.png/600px-Cylinder_net.png)

*Mô tả:* Minh họa tính đẳng cự cục bộ giữa mặt phẳng và mặt khai triển được: các độ dài cạnh và góc trên tờ giấy phẳng được bảo toàn khi cuộn lại mà không kéo giãn.

![Tính đầy đủ](https://upload.wikimedia.org/wikipedia/commons/5/5a/Riemannian_manifold_completeness.png)

*Mô tả:* So sánh một không gian đầy đủ (mặt phẳng nguyên vẹn) với một không gian không đầy đủ (mặt phẳng bị khoét lỗ, nơi đường trắc địa bị gián đoạn).

## Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Riemann, Bernhard (1854).**  
   Bài giảng nền tảng đề xuất khái niệm đa tạp có độ đo độ dài — tiền thân trực tiếp của đa tạp Riemann hiện đại.

2. **Nash, John (1956).** *The Imbedding Problem for Riemannian Manifolds*.  
   Định lý nhúng đẳng cự Nash: mọi đa tạp Riemann đều có thể nhúng đẳng cự vào không gian Euclid $$\mathbb{R}^N$$ với số chiều $$N$$ đủ lớn. Dù hình học Riemann chủ yếu nghiên cứu các tính chất nội tại, kết quả này khẳng định đa tạp trừu tượng luôn có thể hình dung như một mặt con trong không gian Euclid.

3. **Gromov, Mikhael (1981).** *Metric Structures for Riemannian and Non-Riemannian Spaces*.  
   Cách tiếp cận hiện đại và tổng quát hơn về hình học metric, mở rộng vượt ra ngoài khuôn khổ đa tạp Riemann trơn.

4. **Jost, Jürgen (2011).** *Riemannian Geometry and Geometric Analysis*.  
   Tài liệu chuyên sâu về mối liên hệ giữa giải tích (phương trình đạo hàm riêng) và hình học trên đa tạp.

## Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### Thị giác Máy tính: So khớp và Biến dạng Hình dạng 3D
Khi so sánh hai hình dạng 3D (chẳng hạn hai tư thế khác nhau của cơ thể người), bề mặt cơ thể được mô hình hóa như một đa tạp Riemann. Sự thay đổi tư thế là một phép biến đổi gần như đẳng cự (giữ gần nguyên khoảng cách dọc bề mặt da). Do đó, khoảng cách trắc địa trên bề mặt ổn định và đặc trưng hơn khoảng cách Euclid trong $$\mathbb{R}^3$$.

### Kỹ thuật Robot: Không gian Cấu hình
Không gian cấu hình của robot (tập hợp mọi trạng thái khớp) là một đa tạp. Bằng cách trang bị metric Riemann dựa trên ma trận khối lượng – quán tính của cơ hệ, bài toán lập quỹ đạo tiêu tốn ít năng lượng động học nhất trở thành bài toán tìm đường trắc địa trên đa tạp này.

### Thống kê: Hình học Thông tin (Information Geometry)
Một họ tham số các phân bố xác suất (ví dụ họ phân bố chuẩn với tham số $$\mu, \sigma$$) tạo thành một đa tạp Riemann với *metric thông tin Fisher* (Fisher–Rao metric). Khoảng cách hình học giữa hai phân bố được đo bằng khoảng cách trắc địa trên đa tạp thống kê thay vì khoảng cách Euclid giữa các tham số.

## Video tham khảo

- [Tensor Calculus 12: The Metric Tensor in Curved Spaces for Measuring Arc Length](https://www.youtube.com/watch?v=SmjbpIgVKFs) — eigenchris, tiếng Anh. Xem trước: trình bày metric Riemann như quy tắc đo độ dài cung thay đổi theo vị trí, tương ứng trực tiếp với định nghĩa $$(M,g)$$.
- [Tensor Calculus 16: Geodesic Examples on Plane and Sphere](https://www.youtube.com/watch?v=8sVDceI70HM) — eigenchris, tiếng Anh. Đường trắc địa trên mặt cầu là các đường tròn lớn có thể kéo dài vô hạn — hình ảnh trực quan cho tính đầy đủ trước khi đọc Định lý Hopf–Rinow.
- [Optimization on Manifolds](https://www.youtube.com/watch?v=UjaoZE0GBpg) — Simons Institute for the Theory of Computing, tiếng Anh. Bài giảng định nghĩa đa tạp nhúng, không gian tiếp tuyến và metric Riemann hướng tới các thuật toán tối ưu; có thể xem lướt phần retraction.

## Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Metric của nửa mặt phẳng trên Poincaré**
Xét nửa mặt phẳng trên $$H = \{(x, y) \in \mathbb{R}^2 \mid y > 0\}$$ trang bị metric:
$$
g = \frac{dx^2 + dy^2}{y^2}
$$
Tính độ dài của đoạn thẳng đứng nối $$(0, 1)$$ với $$(0, y_0)$$. Khi $$y_0 \to 0^+$$, độ dài này tiến tới đâu? Điều đó cho biết gì về khoảng cách tới trục hoành? (Gợi ý: trục hoành nằm ở vô cực theo metric này).

**Bài tập 2: Kiểm tra phép đẳng cự**
Chứng minh rằng phép tịnh tiến $$(x, y) \to (x+a, y)$$ và phép vị tự $$(x, y) \to (kx, ky)$$ (với $$k > 0$$) là các phép đẳng cự của nửa mặt phẳng Poincaré ở trên bằng cách thay trực tiếp vào biểu thức metric.

**Bài tập 3: Tính diện tích Riemann**
Thể tích (hoặc diện tích trong 2D) trên đa tạp Riemann được tính bằng $$\int \sqrt{\det(g)} dx^1 \dots dx^n$$. Hãy tính diện tích của hình chữ nhật $$0 \le x \le 1, 1 \le y \le A$$ trong nửa mặt phẳng Poincaré.

**Bài tập 4: Suy ngẫm**
Vì sao Định lý Hopf–Rinow có ý nghĩa quan trọng? Nếu một mô hình không-thời gian không đầy đủ về mặt trắc địa (chẳng hạn có điểm kỳ dị như Big Bang hay lỗ đen), điều đó hàm ý gì về quỹ đạo quá khứ và tương lai của các hạt vật chất?

---

Trong bài giảng tiếp theo, chúng ta sẽ tìm hiểu về **Nhóm Lie**: các cấu trúc toán học vừa là đa tạp trơn vừa là nhóm đại số, đóng vai trò công cụ chính để mô tả tính đối xứng liên tục trong hình học và vật lý.
