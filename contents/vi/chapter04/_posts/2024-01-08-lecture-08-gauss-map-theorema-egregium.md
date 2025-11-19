---
layout: post
lang: vi
title: "Bài 8: Ánh xạ Gauss và Định lý Theorema Egregium"
chapter: "04"
order: 1
owner: "Hình học Vi phân"
---

## 1. Tổng quan

Chúng ta bây giờ đến với một trong những kết quả đẹp đẽ và sâu sắc nhất của hình học vi phân: *Theorema Egregium* (Định lý Xuất sắc) của Carl Friedrich Gauss. Định lý này, được công bố năm 1827, đã làm thay đổi hoàn toàn cách chúng ta hiểu về hình học bề mặt.

Định lý khẳng định rằng độ cong Gauss $$K$$ — mặc dù được định nghĩa thông qua cách mà bề mặt nhúng trong không gian ba chiều — thực chất là một *bất biến nội tại*. Điều này có nghĩa là $$K$$ có thể được xác định chỉ từ dạng cơ bản thứ nhất, tức là từ các phép đo độ dài và góc trên bề mặt, mà không cần biết đến không gian xung quanh.

> [!NOTE]
> **Triết lý "Con Kiến trên Quả Bóng":**
> Hãy tưởng tượng một con kiến sống trên bề mặt quả bóng. Con kiến này là sinh vật 2 chiều, nó không biết "lên" hay "xuống" là gì, nó không thể nhìn thấy quả bóng từ bên ngoài.
> Tuy nhiên, Gauss khẳng định rằng con kiến **vẫn có thể tính được độ cong của quả bóng** chỉ bằng cách đo khoảng cách và góc tam giác ngay trên bề mặt nó sống. Nó không cần bay ra ngoài không gian để thấy quả bóng cong!

Hệ quả triết học và toán học của định lý này là sâu sắc: một sinh vật sống trên bề mặt, chỉ có thể đo lường bên trong bề mặt, vẫn có thể xác định được độ cong Gauss. Nói cách khác, độ cong Gauss là một tính chất "thực sự" của bề mặt, không phải là kết quả của cách chúng ta nhìn nó từ bên ngoài.

Để hiểu rõ định lý này, chúng ta sẽ nghiên cứu *ánh xạ Gauss* — ánh xạ gửi mỗi điểm trên bề mặt đến vector pháp tuyến đơn vị tại điểm đó (xem như điểm trên mặt cầu đơn vị). Độ cong Gauss chính là tỉ lệ biến đổi diện tích của ánh xạ này.

## 2. Giải thích Trực quan

### 2.1. Định lý Pizza: Tại sao bạn phải gập miếng Pizza?

Hãy bắt đầu với một ví dụ đời thường: ăn pizza. Khi bạn cầm một miếng pizza tam giác, đầu nhọn thường rũ xuống, làm rơi nhân bánh. Để ngăn điều này, bạn thường gập miếng pizza theo chiều dọc (tạo thành hình chữ V). Tại sao hành động này lại giúp miếng pizza đứng thẳng?

Câu trả lời nằm ở độ cong Gauss. Miếng pizza ban đầu phẳng ($$K=0$$). Khi bạn gập nó, bạn tạo ra độ cong theo một hướng (hướng ngang). Theo Theorema Egregium, độ cong Gauss $$K = \kappa_1 \kappa_2$$ phải được bảo toàn (vẫn bằng 0). Vì bạn đã tạo ra độ cong khác 0 theo phương ngang ($$\kappa_1 \neq 0$$), độ cong theo phương dọc ($$\kappa_2$$) bắt buộc phải bằng 0 để tích của chúng bằng 0. Điều này có nghĩa là miếng pizza không thể rũ xuống (uốn cong theo chiều dọc) khi đã bị gập theo chiều ngang!

### 2.2. Uốn cong vs Kéo dãn (Bending vs Stretching)

Có hai cách để thay đổi hình dạng của một bề mặt:
1.  **Uốn cong (Bending):** Thay đổi hình dạng trong không gian nhưng giữ nguyên khoảng cách giữa các điểm trên bề mặt. Ví dụ: cuộn tờ giấy thành hình trụ. Đây là phép biến đổi *đẳng cự* (isometric). Độ cong Gauss **không đổi**.
2.  **Kéo dãn (Stretching):** Thay đổi khoảng cách giữa các điểm. Ví dụ: thổi phồng quả bóng cao su. Đây không phải là phép đẳng cự. Độ cong Gauss **thay đổi**.

Theorema Egregium nói rằng độ cong Gauss là bất biến dưới các phép uốn cong.

### 2.3. Ánh xạ Gauss: Từ Bề mặt đến Mặt cầu

Hãy tưởng tượng tại mỗi điểm $$p$$ trên bề mặt, bạn vẽ một mũi tên vuông góc với bề mặt — đó là vector pháp tuyến đơn vị $$\mathbf{n}(p)$$. Bây giờ bạn lấy tất cả các mũi tên này và di chuyển điểm gốc của chúng về gốc tọa độ $$O$$. Đầu mút của các mũi tên sẽ nằm trên mặt cầu đơn vị tâm $$O$$.

> [!TIP]
> **Hình dung "Cây Đèn Pin":**
> Tưởng tượng bề mặt của bạn được gắn đầy những cây đèn pin nhỏ xíu, mỗi cây chiếu thẳng góc ra ngoài (theo hướng pháp tuyến).
> - Nếu bề mặt **phẳng** (như mặt bàn), tất cả đèn pin chiếu cùng một hướng. Ánh sáng gom lại một điểm trên trần nhà (mặt cầu đơn vị).
> - Nếu bề mặt **cong lồi** (như quả bóng), các đèn pin chiếu tản ra mọi hướng. Ánh sáng phủ kín cả căn phòng.
> - Độ cong càng lớn, ánh sáng càng tản rộng. Ánh xạ Gauss đo lường mức độ "tản ra" này của các vector pháp tuyến.

Quá trình này định nghĩa một ánh xạ

$$
\mathcal{N}: S \to S^2,
$$

từ bề mặt $$S$$ đến mặt cầu đơn vị $$S^2$$, được gọi là *ánh xạ Gauss*. Ánh xạ này liên kết mỗi điểm trên bề mặt với "hướng" mà bề mặt đang "hướng" tại điểm đó.

### 2.4. Độ cong Gauss như Jacobian của Ánh xạ Gauss

Khi chúng ta di chuyển một vùng nhỏ trên bề mặt, ánh xạ Gauss ánh xạ nó thành một vùng trên mặt cầu đơn vị. Nếu bề mặt uốn cong mạnh, vector pháp tuyến thay đổi nhanh, và vùng trên mặt cầu sẽ lớn. Nếu bề mặt phẳng, vector pháp tuyến thay đổi chậm hoặc không đổi, và vùng trên mặt cầu sẽ nhỏ hoặc bằng không.

Độ cong Gauss $$K$$ chính là tỉ lệ giữa diện tích trên mặt cầu và diện tích trên bề mặt:

$$
K = \lim_{\Delta A \to 0} \frac{\text{diện tích của } \mathcal{N}(\Delta A)}{\text{diện tích của } \Delta A}.
$$

Nếu $$K > 0$$, ánh xạ Gauss bảo toàn hướng (như trên mặt cầu lồi).  
Nếu $$K < 0$$, ánh xạ Gauss đảo ngược hướng (như trên yên ngựa).  
Nếu $$K = 0$$, ánh xạ Gauss "suy biến" diện tích về 0 (như trên mặt trụ).

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Ánh xạ Gauss

**Định nghĩa:**  
Cho bề mặt định hướng $$S$$ với vector pháp tuyến đơn vị $$\mathbf{n}: S \to \mathbb{R}^3$$. *Ánh xạ Gauss* là ánh xạ

$$
\mathcal{N}: S \to S^2, \quad p \mapsto \mathbf{n}(p),
$$

trong đó $$S^2 = \{(x,y,z) : x^2 + y^2 + z^2 = 1\}$$ là mặt cầu đơn vị.

### 3.2. Độ cong Gauss từ Ánh xạ Gauss

**Định lý:**  
Độ cong Gauss tại điểm $$p$$ là Jacobian (determinant của ánh xạ tuyến tính tiếp tuyến) của ánh xạ Gauss:

$$
K(p) = \det(d\mathcal{N}_p).
$$

Dấu của $$K$$ cho biết ánh xạ Gauss bảo toàn hay đảo ngược hướng.

### 3.3. Theorema Egregium

**Định lý (Gauss, 1827):**  
Độ cong Gauss $$K$$ của một bề mặt là một bất biến nội tại. Cụ thể, $$K$$ có thể được biểu diễn chỉ qua dạng cơ bản thứ nhất $$E, F, G$$ và các đạo hàm bậc nhất và bậc hai của chúng.

**Công thức tường minh (Brioschi):**  
Độ cong Gauss có thể được tính bằng công thức chỉ phụ thuộc vào $$E, F, G$$:

$$
K = \frac{1}{(EG - F^2)^2} \left( \det \begin{pmatrix} -\frac{1}{2} E_{vv} + F_{uv} - \frac{1}{2} G_{uu} & \frac{1}{2} E_u & F_u - \frac{1}{2} E_v \\ F_v - \frac{1}{2} G_u & E & F \\ \frac{1}{2} G_v & F & G \end{pmatrix} - \det \begin{pmatrix} 0 & \frac{1}{2} E_v & \frac{1}{2} G_u \\ \frac{1}{2} E_v & E & F \\ \frac{1}{2} G_u & F & G \end{pmatrix} \right).
$$

Mặc dù công thức trông rất phức tạp, điều quan trọng nhất là nó **chỉ chứa E, F, G và đạo hàm của chúng**, không chứa L, M, N (các hệ số của dạng cơ bản thứ hai).

> [!IMPORTANT]
> **Tại sao điều này lại "Egregium" (Xuất sắc)?**
> Trước Gauss, người ta nghĩ độ cong là do cách bề mặt uốn lượn trong không gian 3D.
> Gauss chứng minh rằng không cần không gian 3D! Nếu bạn biết khoảng cách giữa mọi cặp điểm trên bề mặt (thông qua $$E, F, G$$), bạn đã biết độ cong.
> Điều này mở đường cho Riemann sau này định nghĩa độ cong cho các không gian 4 chiều, 10 chiều... mà không cần nhúng chúng vào không gian lớn hơn.

**Ý nghĩa:**  
Một sinh vật hai chiều sống trên bề mặt, chỉ có thể đo độ dài và góc, có thể tính được $$K$$ mà không cần biết đến không gian ba chiều bên ngoài.

### 3.4. Biến dạng Đẳng cự (Isometry)

**Định nghĩa:**  
Hai bề mặt $$S_1$$ và $$S_2$$ được gọi là *đẳng cự* (isometric) nếu tồn tại một song ánh $$\varphi: S_1 \to S_2$$ bảo toàn độ dài của mọi đường cong.

**Hệ quả của Theorema Egregium:**  
Nếu hai bề mặt đẳng cự, chúng có cùng độ cong Gauss tại các điểm tương ứng.

**Ví dụ:**  
Mặt phẳng và mặt trụ là đẳng cự (có thể cuộn giấy phẳng thành trụ). Cả hai đều có $$K = 0$$.  
Mặt phẳng và mặt cầu không đẳng cự (vì $$K_{\text{plane}} = 0 \neq K_{\text{sphere}} = 1/R^2$$).

## 4. Hình ảnh minh họa

![Bề mặt Triển khai được (Developable Surfaces)](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Developable_surfaces.svg/640px-Developable_surfaces.svg.png)
*Hình 1: Các bề mặt triển khai được (Developable Surfaces) như hình trụ, hình nón, và mặt tiếp tuyến. Tất cả chúng đều có độ cong Gauss $$K=0$$ và có thể được trải phẳng ra mặt phẳng mà không bị rách hay co giãn.*

![Biến dạng Helicoid thành Catenoid](https://upload.wikimedia.org/wikipedia/commons/0/02/Helicoid.svg)
*Hình 2: Mặt Helicoid (trái) có thể biến dạng liên tục thành mặt Catenoid (phải) thông qua một phép đẳng cự cục bộ. Mặc dù hình dạng thay đổi, độ cong Gauss tại các điểm tương ứng vẫn được bảo toàn.*

## 5. Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Gauss, Carl Friedrich (1827).** *Disquisitiones Generales Circa Superficies Curvas*.  
   Công trình nguyên gốc chứa Theorema Egregium — một trong những định lý quan trọng nhất của hình học vi phân.

2. **do Carmo, Manfredo P. (1976).** *Differential Geometry of Curves and Surfaces*.  
   Chương 4 cung cấp chứng minh chi tiết và các ví dụ về Theorema Egregium.

3. **Pressley, Andrew (2010).** *Elementary Differential Geometry* (2nd Edition).  
   Chương 9 về ánh xạ Gauss và ý nghĩa của nó.

4. **Spivak, Michael (1979).** *A Comprehensive Introduction to Differential Geometry* (Volume 2).  
   Phân tích sâu về lịch sử và ý nghĩa triết học của Theorema Egregium.

5. **Struik, Dirk J. (1961).** *Lectures on Classical Differential Geometry*.  
   Giới thiệu cổ điển về độ cong Gauss và tính nội tại.

## 6. Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### 6.1. Bản đồ học: Định lý Không thể của Gauss

Theorema Egregium giải thích tại sao không thể tạo bản đồ phẳng hoàn hảo của Trái Đất. Mọi phép chiếu từ mặt cầu (K > 0) xuống mặt phẳng (K = 0) đều phải có biến dạng.

### 6.2. Vật lý: Không gian-thời gian Cong

Trong thuyết tương đối rộng, không gian-thời gian có thể có độ cong. Khái niệm "độ cong nội tại" của Gauss là tiền thân của tensor Riemann trong hình học Riemann, công cụ toán học của thuyết tương đối.

### 6.3. Kỹ thuật: Vỏ và Màng

Khi thiết kế các cấu trúc vỏ, kỹ sư phải hiểu rằng không thể uốn một tấm phẳng thành hình cầu mà không kéo dãn hoặc nén vật liệu. Điều này ảnh hưởng đến thiết kế và chế tạo.

**Ví dụ cụ thể:**  
Một nhà bản đồ muốn tạo bản đồ phẳng của Nam Cực (vùng xung quanh cực nam). Vì mặt cầu có $$K = 1/R^2 > 0$$ và mặt phẳng có $$K = 0$$, không thể có phép ánh xạ đẳng cự. Mọi bản đồ đều phải chấp nhận hoặc biến dạng góc, hoặc biến dạng khoảng cách, hoặc biến dạng diện tích.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1:** Giải thích tại sao mặt phẳng và mặt trụ đẳng cự với nhau.

**Bài tập 2:** Một hình nón có thể được cắt dọc và trải phẳng. Điều này cho biết gì về độ cong Gauss của hình nón?

**Bài tập 3:** Vẽ ánh xạ Gauss cho một vài điểm trên mặt cầu và mặt yên ngựa.

**Bài tập 4:** Suy ngẫm: Nếu bạn sống trên một bề mặt hai chiều và chỉ có thể đo độ dài và góc, bạn có thể xác định được bề mặt đó là phẳng, cong dương, hay cong âm không?

**Bài tập 5:** Nghiên cứu khái niệm "developable surfaces" (bề mặt triển khai được) — các bề mặt có K = 0 tại mọi điểm.

---

Trong bài giảng tiếp theo, chúng ta sẽ khám phá *geodesics* — những đường đi "thẳng nhất" trên bề mặt. Geodesics đóng vai trò tương tự như đường thẳng trong hình học Euclid và là chìa khóa để hiểu cấu trúc hình học nội tại của bề mặt.
