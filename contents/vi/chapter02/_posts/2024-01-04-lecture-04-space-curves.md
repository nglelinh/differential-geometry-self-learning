---
layout: post
lang: vi
title: "Bài 4: Vũ điệu trong Không gian — Từ Lò xo đến DNA"
chapter: "02"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Tại sao từ chiếc lò xo bút bi đến chuỗi DNA đều chọn cùng một hình dáng?

Hãy nhìn quanh căn phòng của bạn: chiếc lò xo nhỏ trong cây bút bi, đường ren trên thân ốc vít, cầu thang xoắn ốc, cho đến phân tử DNA lưu giữ toàn bộ mã di truyền bên trong mỗi tế bào sống. Tất cả đều hội tụ về đúng một đường cong kinh điển của không gian ba chiều: **đường xoắn ốc (helix)**. Đó không phải sự trùng hợp thẩm mỹ — trong Bài 3 ta đã biết $$\kappa$$ và $$\tau$$ xác định hình dáng đường cong, và đường xoắn ốc tròn chính là đường cong **duy nhất** mà cả độ cong lẫn độ xoắn đều là hằng số khác không, giúp ứng suất cơ học phân bố đều tuyệt đối tại mọi điểm!

Nhưng bài học này còn mở ra một cánh cửa kỳ diệu hơn nhiều: **Hình học Vi phân Toàn cục (Global Differential Geometry)**. Khi ta cộng dồn (lấy tích phân) một đại lượng cục bộ như độ cong $$\kappa(s)$$ dọc theo cả một vòng dây khép kín, nó bỗng "nhìn thấy" tính chất tô-pô của sợi dây — thậm chí có thể phát hiện sợi dây có đang bị **thắt nút** hay không!

**Mạch bài học:** Kiến thức cần nhớ (hình học địa phương vs. toàn cục, lý thuyết nút thắt, đường cong giao tuyến) → Đường xoắn ốc tròn → Định lý Fenchel ($$\ge 2\pi$$) và Định lý Fáry–Milnor ($$> 4\pi$$ cho nút thắt) → Đường cong Viviani → Giải thích: tự tay tính tích phân tổng độ cong và kiểm chứng đường cong Viviani nằm trên cả mặt cầu lẫn mặt trụ → Bài tập.

---

## Kiến thức cần nhớ: Hình học Toàn cục của Đường cong và Lý thuyết Nút thắt là gì?

Trước khi đi vào các định lý nổi tiếng của Fenchel và Fáry–Milnor, hãy nhìn ba trụ cột kết nối Chương 1 (cục bộ) với Chương 2 (toàn cục):

### 1. Địa phương (Local) vs. Toàn cục (Global) trong Hình học Vi phân
- **Hình học địa phương** hỏi điều gì xảy ra tại *một điểm* (tiếp tuyến $$\mathbf{T}$$, độ cong $$\kappa(s)$$, độ xoắn $$\tau(s)$$).
- **Hình học toàn cục** hỏi điều gì xảy ra khi ghép tất cả các điểm lại thành một vòng khép kín: tổng độ cong $$\int_0^L \kappa(s)\,ds$$ bị chặn dưới bởi những hằng số tô-pô sắc nét như $$2\pi$$ hay $$4\pi$$!

### 2. Lý thuyết Nút thắt (Knot Theory)
Một **nút thắt** là một đường tròn $$S^1$$ được nhúng trơn vào $$\mathbb{R}^3$$. Hai nút thắt là tương đương nếu có thể biến dạng liên tục trong không gian mà không cắt dây. Nút đơn giản nhất không tháo ra thành vòng tròn được là **nút ba lá (trefoil knot)**. Định lý Fáry–Milnor chứng minh một cầu nối kinh ngạc: chỉ cần biết tổng độ cong $$\le 4\pi$$, ta chắc chắn sợi dây **không bị thắt nút**!

### 3. Đường cong như giao tuyến của hai bề mặt
Trong kỹ thuật cơ khí và kiến trúc, nhiều đường cong không gian sinh ra từ giao tuyến của hai mặt (như đường hàn ống giao nhau, hay **đường cong Viviani** là giao tuyến mặt cầu và mặt trụ). Đây cũng là bước đệm tự nhiên đưa ta từ thế giới 1 chiều sang lý thuyết **Bề mặt 2 chiều** ở Bài 5.

---

## 2. Đường Xoắn ốc (Helix)

Nếu đường tròn là đường cong phẳng có độ cong không đổi, thì đường xoắn ốc tròn là đường cong không gian có đồng thời **độ cong hằng số** và **độ xoắn hằng số**.

### 2.1. Phương trình tham số
Một đường xoắn ốc tròn xoay quanh trục $$z$$ có phương trình tham số:
$$ \gamma(t) = (a\cos t, a\sin t, bt) $$
trong đó:
- $$a > 0$$ là bán kính vòng quay (bán kính hình trụ chứa đường cong).
- $$b$$ là hệ số bước xoắn (độ cao tăng thêm sau mỗi radian).

### 2.2. Tính độ cong và độ xoắn
Tính trực tiếp các đại lượng đặc trưng của đường xoắn ốc:
1.  Vận tốc: $$\gamma'(t) = (-a\sin t, a\cos t, b)$$.
2.  Tốc độ: $$\|\gamma'(t)\| = \sqrt{a^2 + b^2} = c$$ (hằng số).
3.  Độ cong: $$\kappa = \frac{a}{a^2 + b^2}$$ (hằng số).
4.  Độ xoắn: $$\tau = \frac{b}{a^2 + b^2}$$ (hằng số).

**Kết luận:** Đường xoắn ốc tròn là đường cong duy nhất trong không gian (sai khác một phép dời hình) có cả $$\kappa$$ và $$\tau$$ đều là hằng số khác 0. Xét các trường hợp giới hạn:
- Khi $$\tau = 0$$ ($$b = 0$$): đường cong suy biến thành đường tròn có độ cong $$\kappa = 1/a$$.
- Khi $$\kappa = 0$$ ($$a = 0$$): đường cong suy biến thành đường thẳng.

Nhờ tính đồng nhất dọc theo toàn bộ chiều dài (mọi đoạn đều có cùng độ cong và độ xoắn), lò xo phân bố ứng suất cơ học đều đặn và cấu trúc DNA duy trì được hình học ổn định.

## 3. Định lý Fenchel: Tổng độ cong của đường cong đóng

Bây giờ, thay vì xét đường xoắn ốc kéo dài vô hạn, hãy xét một đường cong đóng đơn trong không gian (như một vòng dây khép kín). Một câu hỏi tự nhiên đặt ra: *Để đi trọn một vòng và quay về hướng ban đầu, vector tiếp tuyến phải quay tổng cộng một góc tối thiểu bao nhiêu?*

Với một đường tròn phẳng, tổng góc quay đúng bằng $$2\pi$$ ($$360^\circ$$). Với đường cong đóng bất kỳ trong không gian 3 chiều, kết quả được phát biểu qua định lý sau:

**Định lý Fenchel (1929):**
Tổng độ cong của bất kỳ đường cong đóng đơn, chính quy nào trong không gian luôn lớn hơn hoặc bằng $$2\pi$$:
$$ \int_0^L \kappa(s) ds \geq 2\pi $$
Dấu bằng xảy ra khi và chỉ khi đường cong đó là một đường cong phẳng và lồi (chẳng hạn đường tròn hoặc elip).

**Ý nghĩa:** Không có đường cong đóng nào có tổng độ cong nhỏ hơn $$2\pi$$; các đường cong phẳng lồi (như đường tròn) đạt giá trị cực tiểu này.

> [!NOTE]
> **Trực giác về tổng góc quay của vector tiếp tuyến:**
> Để đi trọn một vòng khép kín và quay về đúng hướng xuất phát, vector tiếp tuyến đơn vị phải quét ít nhất một vòng đầy đủ ($$360^\circ$$ hay $$2\pi$$).
> - Với đường cong phẳng và lồi, vector tiếp tuyến quay đơn điệu đúng một vòng.
> - Với đường cong uốn lượn trong không gian 3 chiều, vector tiếp tuyến có thể đổi hướng nhiều lần theo nhiều phương khác nhau, làm cho tổng độ cong tích lũy vượt quá $$2\pi$$.

## 4. Định lý Fáry–Milnor: Tổng độ cong của nút thắt

Nếu lấy một sợi dây, thắt một nút đơn giản rồi nối hai đầu lại với nhau, ta thu được một **nút thắt (knot)**. Hãy đặt câu hỏi: nếu kéo giãn sợi dây cho thẳng nhất có thể mà không cắt dây để gỡ nút, tổng độ cong của nó ít nhất phải bằng bao nhiêu?

Năm 1949, István Fáry và năm 1950, John Milnor đã độc lập chứng minh kết quả sau:
**Nếu một đường cong đóng chính quy trong $$\mathbb{R}^3$$ bị thắt nút, tổng độ cong của nó phải lớn hơn hẳn $$4\pi$$:**
$$ \int_0^L \kappa(s) ds > 4\pi $$

![Nút hình xuyến Trefoil](https://upload.wikimedia.org/wikipedia/commons/4/46/Trefoil_knot_arb.png)
*Hình 1: Nút Trefoil (nút ba lá). Để tạo thành một nút thắt không tầm thường, tổng độ cong của sợi dây phải vượt quá $$4\pi$$ ($$720^\circ$$).*

Nói cách khác, để thắt được một nút, sợi dây phải chịu tổng độ cong lớn hơn gấp đôi so với một vòng tròn đơn giản. Đây là một ví dụ tiêu biểu cho mối liên hệ giữa **Hình học** (đo độ cong bằng các đại lượng giải tích cụ thể) và **Tô-pô** (tính chất bị thắt nút bất biến dưới phép biến dạng liên tục).

> [!IMPORTANT]
> **Hình học và Tô-pô:**
> - **Tô-pô** chỉ xét xem sợi dây có bị thắt nút hay không, không phụ thuộc vào chiều dài hay hình dạng méo tròn cụ thể.
> - **Hình học** đo trực tiếp độ cong tại từng điểm.
> Định lý Fáry–Milnor cho thấy **hình học ràng buộc tô-pô**: nếu tổng độ cong không vượt quá $$4\pi$$, đường cong không thể tạo thành một nút thắt.

## 5. Đường cong Viviani: Giao tuyến của hai mặt

Một ví dụ kinh điển khác là **đường cong Viviani**. Hãy hình dung một mặt trụ tròn có đường kính bằng bán kính của một mặt cầu, được đặt tiếp xúc trong với mặt cầu và xuyên qua tâm mặt cầu. Giao tuyến của mặt trụ và mặt cầu tạo thành một đường cong không gian hình số 8 nằm trên mặt cầu.

Phương trình tham số của đường cong Viviani (nằm trên mặt cầu bán kính $$2R$$):
$$ \gamma(t) = R(1+\cos t, \sin t, 2\sin(t/2)) $$

Đường cong này có ý nghĩa lịch sử vì là một trong những bài toán đầu tiên (do Viviani nêu ra vào thế kỷ 17) cho phép tính diện tích phần mặt cầu còn lại sau khi khoét bằng các phương pháp hình học cổ điển mà không cần kỹ thuật tích phân phức tạp.

---

## Giải thích: tự tay kiểm tra tổng độ cong và đường cong Viviani

Hãy tự tay thực hiện hai phép kiểm tra nhỏ để thấy con số thực tế đằng sau các định lý toàn cục:

### Ví dụ cầm tay 1: Tích phân tổng độ cong không phụ thuộc bán kính $$R$$!
- **Trên đường tròn bán kính $$R$$:** $$\kappa = 1/R$$, chu vi $$L = 2\pi R$$. Tổng độ cong là:
  $$
  \int_0^{2\pi R} \frac{1}{R}\,ds \;=\; \frac{1}{R}\cdot 2\pi R \;=\; \mathbf{2\pi}.
  $$
  Dù vòng tròn bé bằng chiếc nhẫn hay to bằng quỹ đạo Trái Đất, tổng độ cong vẫn bằng đúng $$2\pi$$ (đạt dấu bằng Fenchel)!
- **Trên một vòng xoắn ốc đúng 1 vòng** ($$\kappa = \frac{a}{a^2+b^2}$$, chiều dài 1 vòng $$L_1 = 2\pi\sqrt{a^2+b^2}$$):
  $$
  \int_0^{L_1} \kappa\,ds \;=\; \frac{2\pi a}{\sqrt{a^2 + b^2}} \;<\; 2\pi \quad (\text{khi } b \neq 0).
  $$
  Chú ý rằng một vòng xoắn ốc hở có tổng độ cong *nhỏ hơn* $$2\pi$$ vì hai đầu của nó không khép kín! Chỉ khi bạn uốn cong thêm để nối kín hai đầu lại, tổng độ cong mới nhảy vượt qua ngưỡng $$2\pi$$ của Fenchel.

### Ví dụ cầm tay 2: Kiểm chứng đại số đường cong Viviani (đặt $$R = 1$$)
Với $$\gamma(t) = \bigl(1 + \cos t,\ \sin t,\ 2\sin(t/2)\bigr)$$, hãy kiểm tra hai phương trình bề mặt:
1. **Có nằm trên mặt cầu bán kính $$2$$ ($$x^2 + y^2 + z^2 = 4$$) không?**
   $$
   (1 + \cos t)^2 + \sin^2 t + 4\sin^2(t/2) = \bigl(1 + 2\cos t + \cos^2 t + \sin^2 t\bigr) + 2(1 - \cos t) = (2 + 2\cos t) + (2 - 2\cos t) = \mathbf{4}!
   $$
2. **Có nằm trên mặt trụ $$(x - 1)^2 + y^2 = 1$$ không?**
   $$
   \bigl((1 + \cos t) - 1\bigr)^2 + \sin^2 t = \cos^2 t + \sin^2 t = \mathbf{1}!
   $$
Tại $$t = 0$$ và $$t = 2\pi$$, $$\gamma(0) = \gamma(2\pi) = (2, 0, 0)$$ — đường cong tự cắt nhau tại điểm $$(2, 0, 0)$$ tạo thành hình số 8 ôm sát mặt cầu!

---

## Video tham khảo

- [Lecture 10: Smooth Curves (Discrete Differential Geometry)](https://www.youtube.com/watch?v=seLcPBax3OI) — Keenan Crane, tiếng Anh. Nên xem trước để thấy đường cong không gian được xác định bởi độ cong và độ xoắn, giải thích vì sao đường xoắn ốc có $$\kappa$$ và $$\tau$$ là hằng số.
- [Calculus 3 Lecture 12.3:  Arc Length/Parameterization, TNB (Frenet-Serret) Intro](https://www.youtube.com/watch?v=Hu72QVWsMlg) — Professor Leonard, tiếng Anh. Minh họa khung TNB trên đường xoắn ốc, giúp hình dung bước xoắn qua sự quay của vector phụ pháp tuyến trước khi đọc các định lý Fenchel và Fáry–Milnor.
- [Frenet-Serret formulas (proof)](https://www.youtube.com/watch?v=A8_SlWsQfzA) — bprp calculus basics, tiếng Anh. Trình bày nguồn gốc các công thức dùng để tính $$\kappa = a/(a^2+b^2)$$ và $$\tau = b/(a^2+b^2)$$ cho đường xoắn ốc.

## 6. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Thiết kế lò xo:** Giả sử bạn cần thiết kế một lò xo có bán kính $$5\,\text{cm}$$ và sau 10 vòng xoắn thì đạt chiều cao $$100\,\text{cm}$$. Hãy xác định các tham số $$a$$, $$b$$ và tính độ cong $$\kappa$$ của sợi dây thép.
2.  **Thử thách Fenchel:** Uốn một sợi dây mềm thành một vòng tròn phẳng (tổng độ cong $$2\pi$$), sau đó uốn thành hình số 8 nằm trên cùng mặt phẳng. Tổng độ cong lúc này là bao nhiêu? (Gợi ý: So sánh số vòng quay của vector tiếp tuyến khi đi hết hình số 8).
3.  **Suy ngẫm:** Ngoài yếu tố tiết kiệm không gian, cấu trúc xoắn của DNA liên hệ như thế nào với tính chất cơ học và sự ổn định hình học của đường có $$\kappa, \tau$$ không đổi?

---
*Đến đây ta kết thúc phần khảo sát đường cong 1 chiều. Bài tiếp theo sẽ mở đầu cho lý thuyết về đối tượng 2 chiều: Bề mặt và tham số hóa bề mặt.*
