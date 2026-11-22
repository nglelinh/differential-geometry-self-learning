---
layout: post
lang: vi
title: "Bài 4: Vũ điệu trong Không gian — Từ Lò xo đến DNA"
chapter: "02"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Các đường cong xoắn trong tự nhiên và kỹ thuật

Trong bài trước, ta đã biết độ cong $$\kappa$$ và độ xoắn $$\tau$$ xác định hoàn toàn hình dáng của một đường cong không gian. Bài này khảo sát các đường cong không gian tiêu biểu cùng một số định lý toàn cục quan trọng về chúng.

Từ chiếc lò xo trong bút bi, rãnh ren của ốc vít, cầu thang xoắn ốc cho đến cấu trúc chuỗi xoắn DNA trong tế bào, nhiều vật thể trong kỹ thuật và tự nhiên đều mang cùng một hình dạng hình học: **đường xoắn ốc (helix)**. Tính đều đặn về hình học của đường xoắn ốc được giải thích trực tiếp bằng các công thức của hình học vi phân.

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
