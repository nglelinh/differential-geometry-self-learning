---
layout: post
lang: vi
title: "Bài 8: Ánh xạ Gauss và Định lý Theorema Egregium"
chapter: "04"
order: 1
owner: "Hình học Vi phân"
---

Vào năm 1827, sau nhiều năm vất vả đi đo đạc trắc địa khắp Vương quốc Hanover bằng kính kinh vĩ và tam giác lượng, Carl Friedrich Gauss công bố một chuyên khảo ngắn bằng tiếng Latin và gọi kết quả trung tâm trong đó bằng cái tên đầy tự hào hiếm thấy: *Theorema Egregium* — **Định lý Đáng kinh ngạc**. Điều gì đã khiến một nhà toán học cẩn trọng bậc nhất lịch sử phải thốt lên như vậy?

Ở Bài 7, ta vừa định nghĩa độ cong Gauss $$K = \kappa_1 \kappa_2$$ hoàn toàn bằng vector pháp tuyến $$\mathbf{n}$$ — một đại lượng chỉ tồn tại nhờ không gian 3 chiều bao quanh. Nếu bạn uốn một tờ giấy thành ống trụ, $$\kappa_1$$ đổi từ $$0$$ thành $$1/R$$, ma trận $$II$$ thay đổi hẳn. Thế nhưng Gauss chứng minh được một sự thật đảo lộn mọi trực giác: **tích $$K = \kappa_1 \kappa_2$$ lại hoàn toàn không phụ thuộc vào cách bề mặt nhúng trong $$\mathbb{R}^3$$!** Một sinh vật 2 chiều sống bẹp trên bề mặt, chưa từng biết tới chiều thứ ba, chỉ cần một sợi dây đo và một chiếc thước đo góc cũng có thể tính ra chính xác $$K$$ — và chứng minh được ngay rằng Trái Đất không thể trải phẳng thành bản đồ mà không méo.

**Mạch bài học:** Câu hỏi nội tại vs. ngoại tại → Kiến thức cần nhớ (Ánh xạ Gauss, Phép đẳng cự, Tính nội tại của $$K$$) → Trực giác lát pizza, uốn cong vs. kéo giãn, đèn pin pháp tuyến → Định nghĩa hình thức & Công thức Brioschi → Giải thích tính tay $$K = 1/R^2$$ của mặt cầu chỉ từ $$E, F, G$$ (không đụng tới $$L, M, N$$!) → Hình ảnh minh họa & Ứng dụng bản đồ học, tương đối rộng.

## Kiến thức cần nhớ: Từ hình học ngoại tại sang hình học nội tại của Gauss

### 1. Ánh xạ Gauss (Gauss Map)
- **Là gì:** Ánh xạ $$\mathcal{N}: S \to S^2$$ đưa mỗi điểm $$p$$ trên bề mặt định hướng tới đầu mút của vector pháp tuyến đơn vị $$\mathbf{n}(p)$$ đặt tại gốc tọa độ trên mặt cầu đơn vị $$S^2$$.
- **Nghiên cứu gì:** Biến bài toán "vector pháp tuyến quay nhanh đến mức nào?" thành bài toán đo **tỉ lệ co giãn diện tích** của một ánh xạ giữa hai mặt 2 chiều. Định thức Jacobian $$\det(d\mathcal{N}_p)$$ chính là độ cong Gauss $$K(p)$$.

### 2. Phép đẳng cự (Isometry) và Biến dạng uốn cong (Bending)
- **Là gì:** Một vi đồng phôi $$\varphi: S_1 \to S_2$$ bảo toàn độ dài mọi đường cong trên bề mặt — tương đương với việc hai bề mặt có cùng dạng cơ bản thứ nhất $$I$$ tại các điểm tương ứng.
- **Nghiên cứu gì:** Phân loại các bề mặt theo quan điểm *nội tại*: hai bề mặt đẳng cự cục bộ (như mặt phẳng và mặt trụ, hay mặt Helicoid và mặt Catenoid) là "giống hệt nhau" đối với cư dân sống trên bề mặt, dù nhìn từ $$\mathbb{R}^3$$ chúng có hình dáng khác hẳn nhau.

### 3. Theorema Egregium — Cánh cửa sang hình học Riemann
- **Là gì:** Định lý khẳng định $$K$$ biểu diễn được hoàn toàn theo $$E, F, G$$ và các đạo hàm riêng đến cấp hai của chúng, không cần $$L, M, N$$.
- **Nghiên cứu gì:** Khai sinh **hình học nội tại (intrinsic geometry)**. Nhờ Gauss, học trò của ông là Bernhard Riemann nhận ra ta không cần nhúng vũ trụ 4 chiều vào một không gian 5 chiều nào cả — chỉ cần trang bị cho đa tạp một tensor metric $$g_{ij}$$ là đủ để định nghĩa độ cong ngay từ bên trong!

## 1. Tổng quan

Bài giảng này trình bày một trong những kết quả trung tâm của hình học vi phân: *Theorema Egregium* (Định lý Đáng chú ý / Định lý Xuất sắc) do Carl Friedrich Gauss công bố năm 1827. Định lý này thay đổi căn bản cách nhìn về hình học bề mặt.

Nội dung cốt lõi của định lý khẳng định rằng độ cong Gauss $$K$$ — mặc dù ban đầu được định nghĩa thông qua cách bề mặt nhúng trong không gian 3 chiều — thực chất là một *bất biến nội tại*. Nghĩa là $$K$$ hoàn toàn có thể tính được chỉ từ dạng cơ bản thứ nhất (các phép đo độ dài và góc ngay trên bề mặt) mà không cần biết bề mặt nằm trong không gian bao quanh như thế nào.

> [!NOTE]
> **Góc nhìn của con kiến trên bề mặt quả bóng:**
> Một con kiến sống trên bề mặt quả bóng là sinh vật 2 chiều: nó không quan sát được chiều thứ ba và không nhìn thấy quả bóng từ bên ngoài. Tuy nhiên, Theorema Egregium khẳng định rằng con kiến **vẫn có thể tính chính xác độ cong Gauss của quả bóng** chỉ bằng cách đo độ dài và góc của các hình vẽ ngay trên bề mặt.

Điều này cho thấy độ cong Gauss là một thuộc tính nội tại của bản thân bề mặt, chứ không phụ thuộc vào cách quan sát từ không gian ngoài. Để tiếp cận định lý, trước hết ta khảo sát *ánh xạ Gauss* — ánh xạ gán mỗi điểm trên bề mặt với vector pháp tuyến đơn vị tại điểm đó (xem như một điểm trên mặt cầu đơn vị). Độ cong Gauss chính là tỉ lệ biến đổi diện tích có dấu của ánh xạ này.

## 2. Giải thích Trực quan

### 2.1. Định lý Pizza: Tại sao gập ngang giúp lát pizza không bị rũ?

Khi cầm một lát pizza hình tam giác, phần đầu nhọn thường rũ xuống. Cách giữ cho lát bánh đứng thẳng là gập nhẹ theo chiều ngang thành hình chữ V.

Cơ sở hình học của hiện tượng này nằm ở độ cong Gauss. Lát pizza ban đầu phẳng nên có $$K=0$$. Khi gập mà không kéo giãn hay làm rách vỏ bánh (biến dạng đẳng cự), Theorema Egregium đảm bảo độ cong Gauss $$K = \kappa_1 \kappa_2$$ vẫn giữ bằng 0. Do ta đã tạo ra độ cong khác không theo phương ngang ($$\kappa_1 \neq 0$$), độ cong theo phương dọc ($$\kappa_2$$) bắt buộc phải bằng 0 để tích $$\kappa_1\kappa_2 = 0$$, nhờ đó lát bánh không thể cong rũ xuống theo chiều dọc.

### 2.2. Uốn cong và Kéo giãn (Bending vs. Stretching)

Có hai kiểu biến dạng cơ bản đối với một bề mặt:
1.  **Uốn cong (Bending):** Thay đổi hình dạng trong không gian nhưng bảo toàn độ dài mọi đường cong trên bề mặt (ví dụ: cuộn tờ giấy phẳng thành hình trụ). Đây là phép biến đổi *đẳng cự* (isometric), và độ cong Gauss **không đổi**.
2.  **Kéo giãn (Stretching):** Làm thay đổi khoảng cách giữa các điểm trên bề mặt (ví dụ: thổi phồng quả bóng cao su). Đây không phải phép đẳng cự, và độ cong Gauss **thay đổi**.

Theorema Egregium khẳng định độ cong Gauss bất biến dưới mọi phép uốn cong đẳng cự.

### 2.3. Ánh xạ Gauss: Từ bề mặt đến mặt cầu đơn vị

Tại mỗi điểm $$p$$ trên bề mặt định hướng, ta dựng vector pháp tuyến đơn vị $$\mathbf{n}(p)$$, rồi tịnh tiến điểm gốc của mọi vector này về gốc tọa độ $$O$$. Đầu mút của chúng nằm trên mặt cầu đơn vị $$S^2$$ tâm $$O$$.

> [!TIP]
> **Hình dung bằng các đèn pin đặt vuông góc với bề mặt:**
> Giả sử tại mỗi điểm trên bề mặt có gắn một đèn pin nhỏ chiếu thẳng theo hướng pháp tuyến:
> - Nếu bề mặt **phẳng**, mọi đèn pin đều chiếu cùng một hướng; ảnh trên mặt cầu đơn vị thu về một điểm duy nhất.
> - Nếu bề mặt **cong lồi** (như mặt cầu), các tia chiếu tản ra mọi hướng và phủ rộng trên mặt cầu đơn vị.
> - Bề mặt cong càng mạnh, các vector pháp tuyến càng đổi hướng nhanh và ảnh trên mặt cầu đơn vị càng trải rộng.

Phép gán này định nghĩa ánh xạ:

$$
\mathcal{N}: S \to S^2,
$$

từ bề mặt $$S$$ vào mặt cầu đơn vị $$S^2$$, gọi là **ánh xạ Gauss**. Nó mã hóa hướng của bề mặt tại từng điểm.

### 2.4. Độ cong Gauss như Jacobian của ánh xạ Gauss

Xét một miền nhỏ $$\Delta A$$ trên bề mặt $$S$$ và ảnh $$\mathcal{N}(\Delta A)$$ của nó trên mặt cầu đơn vị $$S^2$$. Nếu bề mặt cong mạnh, vector pháp tuyến biến thiên nhanh và diện tích ảnh trên $$S^2$$ lớn; nếu bề mặt phẳng, diện tích ảnh bằng 0.

Độ cong Gauss $$K$$ (xét cả dấu theo định hướng) là giới hạn tỉ số giữa diện tích có dấu của ảnh trên mặt cầu và diện tích miền ban đầu trên bề mặt:

$$
K = \lim_{\Delta A \to 0} \frac{\text{diện tích có dấu của } \mathcal{N}(\Delta A)}{\text{diện tích của } \Delta A}.
$$

- Khi $$K > 0$$, ánh xạ Gauss bảo toàn định hướng (như trên mặt cầu lồi).
- Khi $$K < 0$$, ánh xạ Gauss đảo ngược định hướng (như trên mặt yên ngựa).
- Khi $$K = 0$$, ảnh trên mặt cầu bị suy biến diện tích về 0 (như trên mặt trụ hoặc mặt phẳng).

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Ánh xạ Gauss

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Cho bề mặt định hướng $$S$$ với trường vector pháp tuyến đơn vị trơn $$\mathbf{n}: S \to \mathbb{R}^3$$. *Ánh xạ Gauss* là ánh xạ

$$
\mathcal{N}: S \to S^2, \quad p \mapsto \mathbf{n}(p),
$$

trong đó $$S^2 = \{(x,y,z) : x^2 + y^2 + z^2 = 1\}$$ là mặt cầu đơn vị.
</div>

### 3.2. Độ cong Gauss từ ánh xạ Gauss

<div class="textbook-theorem" markdown="1">
**Định lý:**
Độ cong Gauss tại điểm $$p$$ bằng định thức Jacobian (định thức của ánh xạ tuyến tính tiếp tuyến) của ánh xạ Gauss:

$$
K(p) = \det(d\mathcal{N}_p).
$$
</div>

Dấu của $$K(p)$$ xác định ánh xạ Gauss bảo toàn hay đảo ngược định hướng cục bộ quanh $$p$$.

### 3.3. Theorema Egregium

<div class="textbook-theorem" markdown="1">
**Định lý (Gauss, 1827):**
Độ cong Gauss $$K$$ của một bề mặt là một bất biến nội tại. Cụ thể, $$K$$ biểu diễn được hoàn toàn theo các hệ số $$E, F, G$$ của dạng cơ bản thứ nhất cùng các đạo hàm riêng cấp một và cấp hai của chúng.
</div>

**Công thức tường minh (Brioschi):**
Độ cong Gauss có thể tính trực tiếp từ $$E, F, G$$ như sau:

$$
K = \frac{1}{(EG - F^2)^2} \left( \det \begin{pmatrix} -\frac{1}{2} E_{vv} + F_{uv} - \frac{1}{2} G_{uu} & \frac{1}{2} E_u & F_u - \frac{1}{2} E_v \\ F_v - \frac{1}{2} G_u & E & F \\ \frac{1}{2} G_v & F & G \end{pmatrix} - \det \begin{pmatrix} 0 & \frac{1}{2} E_v & \frac{1}{2} G_u \\ \frac{1}{2} E_v & E & F \\ \frac{1}{2} G_u & F & G \end{pmatrix} \right).
$$

Dù biểu thức trên khá dài, ý nghĩa toán học của nó rất rõ ràng: **vế phải chỉ phụ thuộc vào $$E, F, G$$ và các đạo hàm của chúng**, hoàn toàn không chứa các hệ số $$L, M, N$$ của dạng cơ bản thứ hai.

> [!IMPORTANT]
> **Ý nghĩa của kết quả Gauss:**
> Trước Gauss, độ cong bề mặt thường được xem là đặc trưng gắn với cách bề mặt uốn cong trong không gian 3 chiều. Gauss chứng minh rằng chỉ cần biết thước đo khoảng cách nội tại ($$E, F, G$$) là đủ để xác định độ cong $$K$$. Kết quả này mở đường cho Riemann xây dựng lý thuyết độ cong trên các đa tạp nhiều chiều mà không cần nhúng chúng vào không gian Euclid lớn hơn.

Như vậy, một sinh vật hai chiều sống trên bề mặt, chỉ thực hiện các phép đo độ dài và góc nội tại, hoàn toàn có thể tính được $$K$$ mà không cần thông tin về không gian ba chiều bên ngoài.

## Giải thích: Tự tính độ cong mặt cầu bằng hai cách — ngoại tại và thuần nội tại

Để cảm nhận trọn vẹn phép màu của Theorema Egregium, hãy tính $$K$$ cho mặt cầu bán kính $$R$$ theo hai con đường hoàn toàn độc lập: một đường nhìn từ $$\mathbb{R}^3$$ qua ánh xạ Gauss, và một đường bịt mắt con kiến lại, **chỉ đưa cho nó $$E, F, G$$**.

### Cách 1 (Ngoại tại — qua tỉ số diện tích của ánh xạ Gauss)
Mặt cầu bán kính $$R$$ có diện tích toàn phần $$A(S_R^2) = 4\pi R^2$$. Vector pháp tuyến ngoài tại mỗi điểm chỉ thẳng ra từ tâm nên ánh xạ Gauss $$\mathcal{N}: S_R^2 \to S^2$$ là một song ánh bảo toàn định hướng phủ kín mặt cầu đơn vị (diện tích $$4\pi$$). Vì đối xứng cầu, độ cong $$K$$ là hằng số, nên tỉ số diện tích toàn phần cho ngay:
$$ K = \frac{\text{Diện tích}(S^2)}{\text{Diện tích}(S_R^2)} = \frac{4\pi}{4\pi R^2} = \frac{1}{R^2}. $$

### Cách 2 (Thuần nội tại — không hề dùng vector pháp tuyến $$\mathbf{n}$$ hay $$L, M, N$$!)
Khi hệ tọa độ $$(u, v)$$ trực giao ($$F = 0$$), công thức Brioschi rút gọn thành biểu thức cực kỳ đẹp mắt:
$$ K = -\frac{1}{\sqrt{EG}} \left[ \frac{\partial}{\partial u}\left(\frac{(\sqrt{G})_u}{\sqrt{E}}\right) + \frac{\partial}{\partial v}\left(\frac{(\sqrt{E})_v}{\sqrt{G}}\right) \right]. $$
Bây giờ đưa cho con kiến trên mặt cầu chỉ riêng metric từ Bài 6 ($$u = \varphi$$ là góc cực, $$v = \theta$$ là kinh độ):
$$ E = R^2, \qquad F = 0, \qquad G = R^2 \sin^2\varphi. $$
Tính từng bước bằng tay:
1. $$\sqrt{E} = R$$ (hằng số nên $$(\sqrt{E})_\theta = 0$$ — số hạng thứ hai biến mất ngay!).
2. $$\sqrt{G} = R\sin\varphi \implies (\sqrt{G})_\varphi = R\cos\varphi$$.
3. Chia cho $$\sqrt{E} = R$$: $$\frac{(\sqrt{G})_\varphi}{\sqrt{E}} = \frac{R\cos\varphi}{R} = \cos\varphi$$.
4. Lấy đạo hàm theo $$\varphi$$: $$\frac{\partial}{\partial \varphi}(\cos\varphi) = -\sin\varphi$$.
5. Nhân với $$-\frac{1}{\sqrt{EG}} = -\frac{1}{R^2\sin\varphi}$$:
   $$ K = -\frac{1}{R^2\sin\varphi}(-\sin\varphi) = \frac{1}{R^2}. $$

**Điều đáng suy ngẫm:** Trong cả 5 bước ở Cách 2, ta không hề viết ra tọa độ $$(x, y, z)$$ trong $$\mathbb{R}^3$$, không tính tích có hướng, không dựng pháp tuyến $$\mathbf{n}$$. Con kiến chỉ cần đo chu vi các vòng vĩ tuyến (biết $$\sqrt{G} = R\sin\varphi$$) và khoảng cách dọc kinh tuyến (biết $$\sqrt{E} = R$$) là đủ chứng minh mặt cầu cong với $$K = 1/R^2$$!

### 3.4. Phép Đẳng cự (Isometry)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Hai bề mặt $$S_1$$ và $$S_2$$ được gọi là *đẳng cự* (isometric) nếu tồn tại một vi đồng phôi $$\varphi: S_1 \to S_2$$ bảo toàn độ dài của mọi đường cong.
</div>

**Hệ quả trực tiếp của Theorema Egregium:** Nếu hai bề mặt đẳng cự (hoặc đẳng cự cục bộ), chúng phải có cùng độ cong Gauss tại các điểm tương ứng.

**Ví dụ:**
- Mặt phẳng và mặt trụ là đẳng cự cục bộ (có thể cuộn giấy phẳng thành mặt trụ), và cả hai đều có $$K = 0$$.
- Mặt phẳng và mặt cầu không đẳng cự cục bộ, vì $$K_{\text{plane}} = 0 \neq K_{\text{sphere}} = 1/R^2$$.

## 4. Hình ảnh minh họa

![Bề mặt Triển khai được (Developable Surfaces)](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Developable_surfaces.svg/640px-Developable_surfaces.svg.png)
*Hình 1: Các bề mặt triển khai được (developable surfaces) như mặt trụ, mặt nón và mặt tiếp tuyến. Tất cả đều có độ cong Gauss $$K=0$$ và có thể trải phẳng cục bộ mà không co giãn hay xé rách.*

![Biến dạng Helicoid thành Catenoid](https://upload.wikimedia.org/wikipedia/commons/0/02/Helicoid.svg)
*Hình 2: Mặt Helicoid có thể biến dạng liên tục thành mặt Catenoid qua một họ các phép đẳng cự cục bộ; dù hình dáng ngoại tại thay đổi, độ cong Gauss tại các điểm tương ứng vẫn được bảo toàn.*

## 5. Các Công trình Nền tảng & Tài liệu Tham khảo

1. **Gauss, Carl Friedrich (1827).** *Disquisitiones Generales Circa Superficies Curvas*.
   Chuyên khảo gốc công bố Theorema Egregium — nền tảng của hình học nội tại bề mặt.

2. **do Carmo, Manfredo P. (1976).** *Differential Geometry of Curves and Surfaces*.
   Chương 4 trình bày chứng minh chi tiết và các ví dụ minh họa cho Theorema Egregium.

3. **Pressley, Andrew (2010).** *Elementary Differential Geometry* (2nd Edition).
   Chương 9 phân tích ánh xạ Gauss và ý nghĩa hình học của nó.

4. **Spivak, Michael (1979).** *A Comprehensive Introduction to Differential Geometry* (Volume 2).
   Phân tích kỹ bối cảnh lịch sử và ý nghĩa toán học của Theorema Egregium.

5. **Struik, Dirk J. (1961).** *Lectures on Classical Differential Geometry*.
   Tài liệu cổ điển về độ cong Gauss và tính nội tại.

## 6. Ứng dụng và Kết nối Liên ngành

### 6.1. Bản đồ học: Giới hạn không thể tránh của phép chiếu bản đồ

Theorema Egregium chứng minh rằng không tồn tại bản đồ phẳng nào biểu diễn bề mặt Trái Đất mà không có biến dạng. Mọi ánh xạ từ mặt cầu ($$K > 0$$) xuống mặt phẳng ($$K = 0$$) đều không thể là phép đẳng cự.

### 6.2. Vật lý: Không-thời gian cong

Trong thuyết tương đối rộng, lực hấp dẫn được mô tả qua độ cong của không-thời gian. Khái niệm độ cong nội tại của Gauss là tiền đề trực tiếp cho tensor độ cong Riemann trong hình học Riemann.

### 6.3. Kỹ thuật kết cấu: Vỏ và màng

Khi chế tạo các kết cấu vỏ từ tấm vật liệu phẳng ($$K=0$$), không thể tạo hình mặt cầu ($$K > 0$$) chỉ bằng cách uốn thuần túy mà không kéo giãn hoặc nén biến dạng vật liệu. Nguyên lý này ảnh hưởng trực tiếp đến thiết kế khuôn dập và gia công tấm.

**Ví dụ cụ thể:** Khi lập bản đồ phẳng cho vùng Nam Cực, do mặt cầu có $$K = 1/R^2 > 0$$ còn mặt phẳng có $$K = 0$$ nên không tồn tại ánh xạ đẳng cự; mọi phép chiếu đều phải đánh đổi giữa biến dạng góc, khoảng cách hoặc diện tích.

## Video tham khảo

- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, tiếng Anh. Nên xem trước để thấy phép uốn không kéo giãn bảo toàn độ cong Gauss, tương ứng với ví dụ lát pizza và sự phân biệt giữa uốn cong và kéo giãn.
- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, tiếng Anh. Trình bày ánh xạ Gauss–Rodrigues đưa vector pháp tuyến lên mặt cầu đơn vị và giới thiệu Theorema Egregium ở phần cuối.
- [La manera más matemática de comerse una pizza](https://www.youtube.com/watch?v=1mVTp-8Zmok) — Lemnismath, tiếng Tây Ban Nha. Giải thích cùng định lý và phân tích thêm vì sao không có bản đồ phẳng nào bảo toàn đồng thời cả góc và diện tích của mặt cầu.

## 7. Bài tập và Suy ngẫm

**Bài tập 1:** Giải thích vì sao mặt phẳng và mặt trụ là đẳng cự cục bộ với nhau.

**Bài tập 2:** Một mặt nón (bỏ đỉnh) có thể cắt dọc theo một đường sinh và trải phẳng. Điều này suy ra gì về độ cong Gauss của mặt nón?

**Bài tập 3:** Phác họa ảnh của ánh xạ Gauss đối với một số điểm trên mặt cầu và trên mặt yên ngựa.

**Bài tập 4:** Nếu sống trên một bề mặt hai chiều và chỉ có thể đo độ dài cùng góc nội tại, bạn có thể phân biệt bề mặt đó phẳng, cong dương hay cong âm hay không? Giải thích.

**Bài tập 5:** Tìm hiểu thêm về khái niệm "bề mặt triển khai được" (developable surfaces) — lớp các bề mặt có $$K = 0$$ tại mọi điểm.

---

Trong bài giảng tiếp theo, ta sẽ khảo sát *đường trắc địa (geodesics)* — những đường cong đóng vai trò tương tự đường thẳng trên bề mặt cong và giữ vị trí trung tâm trong hình học nội tại.
