---
layout: post
lang: vi
title: "Bài 19: Bong bóng Xà phòng và Kiến trúc Tự nhiên — Bề mặt Tối thiểu"
chapter: "09"
order: 3
owner: "Hình học Vi phân"
---

## 1. Hình dạng tối ưu của bong bóng xà phòng

Bong bóng xà phòng và các màng xà phòng mỏng là những ví dụ trực quan gần gũi về bài toán tối ưu hình học trong tự nhiên.

![Bong bóng xà phòng](https://upload.wikimedia.org/wikipedia/commons/1/18/Soap_bubble_sky.jpg)
*Hình 1: Bong bóng xà phòng có dạng hình cầu — nghiệm tối ưu của bài toán đẳng chu.*

Mỗi khi hình thành trên một khung dây hay bao bọc một thể tích khí, màng xà phòng tự động sắp xếp thành hình dạng tối ưu diện tích — lời giải vật lý trực tiếp cho một bài toán biến phân kinh điển gọi là **Bề mặt cực tiểu (Minimal Surfaces)**. Trong bài giảng này, chúng ta tìm hiểu nguyên lý vật lý đứng sau hình dạng đó và cách các kiến trúc sư áp dụng nó vào kết cấu mái nhẹ hiện đại.

*Để tìm hiểu phần toán học nền tảng về các loại độ cong của mặt, hãy xem [Bài giảng 5: Bề mặt]({{ '/contents/vi/chapter02/lecture-05-surfaces-first-contact/' | absolute_url }}) và [Bài giảng 7: Dạng cơ bản thứ hai]({{ '/contents/vi/chapter03/lecture-07-second-fundamental-form/' | absolute_url }}).*

**Mạch bài học:** Bản đồ kiến thức nền (độ cong trung bình $$H$$ vs. độ cong Gauss $$K$$, bài toán đẳng chu, bài toán Plateau) → Nguyên lý cực tiểu năng lượng & Phương trình Young–Laplace → Ví dụ tính tay cầm tay chỉ việc: so sánh diện tích hình cầu vs. hình lập phương cùng thể tích $$V = 1$$ và kiểm chứng mặt Catenoid $$r(z) = \cosh z$$ có $$H \equiv 0$$ → Khung giải thích chậm: 3 bước từ sức căng bề mặt đến phương trình $$H = 0$$ và mái vòm Frei Otto → Kiến trúc mái căng & Video.

---

## Bản đồ kiến thức nền: Bề mặt Cực tiểu và Độ cong Trung bình nghiên cứu gì?

### 1. Độ cong Trung bình $$H$$ vs. Độ cong Gauss $$K$$
Nếu **độ cong Gauss** là *tích* hai độ cong chính $$K = k_1 k_2$$ (nội tại, điều khiển lát pizza và bản đồ ở Bài 17), thì **độ cong trung bình** là *trung bình cộng* của chúng: $$H = \frac{k_1 + k_2}{2}$$ (ngoại tại, điều khiển tốc độ thay đổi diện tích khi đẩy bề mặt theo phương pháp tuyến!).

### 2. Hai bài toán tối ưu diện tích kinh điển
- **Bài toán đẳng chu (Bong bóng kín):** Cố định thể tích $$V$$ bên trong, tìm mặt kín có diện tích nhỏ nhất $$\implies$$ độ cong trung bình là hằng số dương $$H = \text{const} > 0$$ (hình cầu!).
- **Bài toán Plateau (Màng xà phòng hở):** Cố định đường biên là khung dây $$\Gamma$$, tìm mặt căng qua $$\Gamma$$ có diện tích nhỏ nhất cục bộ $$\implies$$ độ cong trung bình bằng $$0$$ ở mọi điểm: **$$H = 0$$** (**bề mặt cực tiểu**)!

### 3. Mối nối giữa Giải tích biến phân, Vật lý và Kiến trúc
Bài toán Plateau mở ra cả một nhánh giải tích hình học thế kỷ 20 (Jesse Douglas và Tibor Radó nhận Huy chương Fields 1936 đầu tiên cho lời giải tổng quát!), đồng thời truyền cảm hứng trực tiếp cho kết cấu mái màng căng siêu nhẹ của kiến trúc sư Frei Otto.

---

## 2. Nguyên lý cực tiểu năng lượng

Các hệ vật lý ở trạng thái cân bằng bền có xu hướng đạt mức thế năng thấp nhất: hòn đá lăn xuống đáy thung lũng, lò xo co về chiều dài tự nhiên, còn màng xà phòng co lại để giảm diện tích bề mặt. Nguyên nhân là lực căng bề mặt (surface tension): các phân tử chất lỏng trên bề mặt bị hút vào phía trong, khiến năng lượng bề mặt tỉ lệ thuận với diện tích màng. Để cực tiểu hóa năng lượng này, màng xà phòng tự điều chỉnh để đạt diện tích nhỏ nhất có thể dưới các ràng buộc cho trước.

### Bài toán 1: Bong bóng kín
Khi một lượng khí cố định bị bao bọc bên trong bong bóng xà phòng, hình khối nào chứa được thể tích khí đó với diện tích bề mặt nhỏ nhất? Toán học chứng minh (bất đẳng thức đẳng chu) rằng nghiệm duy nhất là **hình cầu**: không có khối nào (lập phương, hình chóp, hình trụ...) có tỉ số diện tích trên thể tích nhỏ hơn hình cầu.

### Bài toán 2: Màng xà phòng hở (Bài toán Plateau)
Nếu uốn một sợi dây kim loại thành một vòng kín không phẳng (chẳng hạn hình yên ngựa) rồi nhúng vào dung dịch xà phòng, khi nhấc lên màng xà phòng sẽ căng kín khung dây đó. Do không giam giữ khí bên trong nên áp suất hai phía bằng nhau, màng không phồng lên thành hình cầu mà tạo thành một mặt trơn có diện tích nhỏ nhất cục bộ trong số mọi bề mặt có cùng đường biên là khung dây — đó gọi là **bề mặt cực tiểu** (hay bề mặt tối thiểu).

## 3. Đặc trưng hình học: Điểm yên ngựa và độ cong trung bình bằng 0

Quan sát kỹ màng xà phòng trên một khung dây không phẳng, ta thấy bề mặt không phẳng mà luôn uốn lượn theo kiểu yên ngựa: tại mỗi điểm, theo một phương chính bề mặt cong lên ($$k_1 > 0$$), còn theo phương vuông góc bề mặt cong xuống ($$k_2 < 0$$).

Theo phương trình Young–Laplace trong vật lý, hiệu áp suất $$\Delta P$$ giữa hai phía của một mặt phân cách tỉ lệ với **độ cong trung bình** $$H$$:

$$ \Delta P = 2\gamma H = 2\gamma \left( \frac{k_1 + k_2}{2} \right) $$

Đối với màng xà phòng hở tiếp xúc với khí quyển ở cả hai phía, $$\Delta P = 0$$, do đó $$H = 0$$, dẫn tới điều kiện:

$$ k_1 = -k_2 $$

Điều này có nghĩa là tại mọi điểm trên mặt cực tiểu, hai độ cong chính luôn bằng nhau về độ lớn và trái dấu nhau: độ cong lồi theo phương này cân bằng hoàn toàn với độ cong lõm theo phương kia.

![Biến đổi Helicoid thành Catenoid](https://upload.wikimedia.org/wikipedia/commons/f/f6/Catenoid_to_Helicoid_Transformation.gif)
*Hình 2: Phép biến đổi đẳng cự biến mặt xoắn ốc (Helicoid) thành mặt dây xích tròn xoay (Catenoid). Cả hai đều là bề mặt cực tiểu có độ cong trung bình bằng 0.*

---

## Ví dụ tính tay cầm tay chỉ việc: Hình cầu vs. Hình lập phương và Kiểm chứng Catenoid có $$H = 0$$

### Ví dụ 1: So sánh diện tích bao bọc cùng thể tích $$V = 1$$
- **Hình lập phương** cạnh $$a = 1$$ (thể tích $$V = 1$$): diện tích toàn phần $$A_{\text{lập phương}} = 6a^2 = 6.000$$.
- **Hình cầu** có cùng thể tích $$\frac{4}{3}\pi r^3 = 1 \implies r = \left(\frac{3}{4\pi}\right)^{1/3} \approx 0.6204$$: diện tích mặt cầu là:
  $$
  A_{\text{cầu}} = 4\pi r^2 = (36\pi)^{1/3} \approx 4.836!
  $$
  Hình cầu tiết kiệm tới **$$19.4\%$$ diện tích bề mặt** so với hình lập phương — đó là lý do bong bóng xà phòng tự nhiên tròn vo chứ không bao giờ vuông vức!

### Ví dụ 2: Kiểm tra trực tiếp mặt Catenoid $$r(z) = \cosh z$$ là bề mặt cực tiểu!
Nhúng hai vòng tròn đồng trục vào nước xà phòng rồi kéo nhẹ chúng ra xa nhau: màng xà phòng nối hai vòng tròn tạo thành **mặt Catenoid** (mặt tròn xoay của đường cong dây xích $$r(z) = \cosh z$$). Với $$r'(z) = \sinh z$$, $$r''(z) = \cosh z$$ và đồng nhất thức $$1 + \sinh^2 z = \cosh^2 z$$, hai độ cong chính tại độ cao $$z$$ bất kỳ là:
- Độ cong dọc theo đường sinh kinh tuyến (uốn lõm ra ngoài):
  $$
  k_1 = \frac{-r''}{(1 + r'^2)^{3/2}} = \frac{-\cosh z}{\cosh^3 z} = -\frac{1}{\cosh^2 z}.
  $$
- Độ cong theo vòng vĩ tuyến nằm ngang (uốn lồi vào trục):
  $$
  k_2 = \frac{1}{r\sqrt{1 + r'^2}} = \frac{1}{\cosh z \cdot \cosh z} = +\frac{1}{\cosh^2 z}.
  $$

Cộng hai độ cong chính lại:

$$
H = \frac{k_1 + k_2}{2} = \frac{-\frac{1}{\cosh^2 z} + \frac{1}{\cosh^2 z}}{2} = 0 \quad \forall z \in \mathbb{R}!
$$

Tại mọi điểm từ eo thắt ($$z = 0$$) ra hai mép vòng tròn, độ cong lồi và độ cong lõm triệt tiêu nhau hoàn hảo đến từng dấu trừ!

---

### Khung giải thích: Ba bước từ sức căng bề mặt đến phương trình $$H = 0$$ và mái vòm Frei Otto (nên đọc chậm)

#### Bước 1: Công thức biến phân bậc nhất của diện tích
Nếu đẩy nhẹ một mảnh bề mặt dọc theo vector pháp tuyến một đoạn vô cùng nhỏ $$\varepsilon \cdot \psi$$ (giữ cố định biên khung dây), tốc độ thay đổi diện tích tuân theo công thức kinh điển của hình học vi phân:
$$
\left.\frac{d}{d\varepsilon}\operatorname{Area}(S_\varepsilon)\right|_{\varepsilon=0} = -2\iint_S H\,\psi\,dA.
$$
Để diện tích đạt **điểm dừng** (cực tiểu) với mọi biến dạng $$\psi$$ nhỏ, điều kiện cần bắt buộc là **$$H \equiv 0$$** tại mọi điểm!

#### Bước 2: Ý nghĩa của $$K = k_1 k_2 = -k_1^2 \le 0$$ trên bề mặt cực tiểu
Vì $$k_2 = -k_1$$, mọi bề mặt cực tiểu khác mặt phẳng đều có **độ cong Gauss âm** ($$K \le 0$$) — tức mọi điểm đều mang dáng yên ngựa! Chính hình học cong hai chiều ngược dấu (anticlastic) này giúp màng căng không bao giờ bị phập phồng rung lắc trong gió như một tấm bạt phẳng!

#### Bước 3: Biến bài toán PDE phi tuyến thành thí nghiệm vật lý (Frei Otto)
Phương trình bề mặt cực tiểu dạng đồ thị $$z = u(x, y)$$ là một phương trình đạo hàm riêng phi tuyến phức tạp: $$(1 + u_y^2)u_{xx} - 2u_x u_y u_{xy} + (1 + u_x^2)u_{yy} = 0$$. Trước kỷ nguyên siêu máy tính, Frei Otto đã để chính tự nhiên "giải PDE" trong nháy mắt bằng màng xà phòng trên khung dây tỷ lệ nhỏ cho Sân vận động Olympic Munich 1972!

## 4. Từ màng xà phòng đến kiến trúc mái căng

Bề mặt cực tiểu không chỉ giúp giảm lượng vật liệu bao phủ nhờ diện tích nhỏ, mà cấu trúc cong hai chiều ngược dấu (dạng yên ngựa) còn giúp kết cấu màng căng ổn định hơn, phân bố đều tải trọng gió và tuyết lên hệ khung đỡ.

Kiến trúc sư người Đức **Frei Otto** (giải Pritzker năm 2015) là người tiên phong ứng dụng nguyên lý này vào kiến trúc. Khi thiết kế mái che cho **Sân vận động Olympic Munich 1972**, trong bối cảnh năng lực tính toán của máy tính thời đó còn hạn chế, ông đã dựng các mô hình khung dây tỉ lệ nhỏ, nhúng vào dung dịch xà phòng, chụp ảnh và đo đạc trực tiếp hình dạng màng xà phòng tạo thành để lập bản vẽ thiết kế. Kết quả là hệ mái kết cấu màng căng (tensile structure) nhẹ, bền và vẫn hoạt động tốt sau nhiều thập kỷ.

Ngày nay, phần mềm mô phỏng số đã thay thế mô hình xà phòng vật lý trong quá trình thiết kế, nhưng điều kiện hình học $$H = 0$$ vẫn là cơ sở cho nhiều công trình mái vòm màng căng hiện đại như Sân bay Quốc tế Denver.

## 5. Kết luận

Một màng xà phòng căng trên khung dây là lời giải vật lý trực tiếp cho bài toán biến phân cực tiểu hóa diện tích. Từ phương trình $$H = 0$$ của hình học vi phân đến các công trình mái căng ngoài đời thực, nguyên lý tối ưu năng lượng tạo nên mối liên hệ chặt chẽ giữa toán học, vật lý và kiến trúc.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [Minimal Surfaces—The Shapes That Help Us Understand Black Holes](https://www.youtube.com/watch?v=_t-3lCZXlPM) — The Action Lab, tiếng Anh. Xem trước: minh họa màng xà phòng như bề mặt cực tiểu diện tích; phần liên hệ với lỗ đen ở cuối video chỉ mang tính mở rộng, không phải trọng tâm của bài này.
- [Shape Analysis (Lecture 6): Second fundamental form and surface curvature](https://www.youtube.com/watch?v=UewzuzaPlxA) — Justin Solomon, tiếng Anh. Trình bày độ cong trung bình $$H$$ và mặt yên ngựa có hai độ cong chính trái dấu, đúng với điều kiện $$H=0$$ của màng xà phòng hở.
- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, tiếng Anh. Đối chiếu giữa mặt có độ cong Gauss bằng 0 (như miếng pizza uốn được từ mặt phẳng) với mặt yên ngựa có tích hai độ cong chính âm.
