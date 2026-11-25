---
layout: post
lang: vi
title: "Bài 0.4: Phương trình Vi phân — Quy luật của Chuyển động"
chapter: "00"
order: 4
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Từ một mũi tên vận tốc đến cả một quỹ đạo vũ trụ

Hãy tưởng tượng bạn thả một chiếc lá nhỏ xuống mặt sông đang chảy xiết. Bạn không cần biết trước toàn bộ con đường dài hàng ki-lô-mét của chiếc lá; chỉ cần biết tại **mọi điểm** trên mặt nước dòng chảy hướng về đâu và nhanh cỡ nào (*trường vector*), thiên nhiên tự động dệt nên quỹ đạo duy nhất cho chiếc lá theo thời gian. Công cụ toán học diễn đạt quy luật "từ vận tốc cục bộ suy ra quỹ đạo toàn cục" ấy chính là **Phương trình Vi phân Thường (ODE)**.

Trong Hình học Vi phân, đối tượng nghiên cứu là hình dạng của không gian chứ không chỉ là chuyển động cơ học, nhưng cỗ máy toán học thì y hệt nhau:
- **Đường trắc địa (geodesic)** là nghiệm của một hệ ODE cấp hai.
- **Dòng chảy (flow)** của một trường vector là nghiệm của một hệ ODE cấp một.
- **Vận chuyển song song (parallel transport)** cũng được định nghĩa bởi một hệ ODE tuyến tính dọc theo đường cong.

**Mạch bài học:** Kiến thức cần nhớ (trường vector & phân thớ tiếp tuyến, định lý Picard–Lindelöf, dòng chảy một tham số) → Bài toán Cauchy và đường cong tích phân → Định lý Tồn tại & Duy nhất → Quy ODE cấp 2 về hệ cấp 1 trên $$TM$$ → Giải thích: tự tay giải dòng chảy trường quay $$X(x,y)=(-y,x)$$ và xem tính duy nhất gãy thế nào khi mất điều kiện Lipschitz → Tổng kết Chương 0.

---

## Kiến thức cần nhớ: Phương trình Vi phân đóng vai trò gì trong Hình học Vi phân?

Với sinh viên đại học đã từng giải ODE bằng tách biến hay phương trình đặc trưng, hình học vi phân nhìn ODE theo **ba trụ cột hình học**:

### 1. Trường Vector ($$X$$) và Đường cong Tích phân
Một **trường vector** gắn cho mỗi điểm $$p \in M$$ một mũi tên vận tốc $$X_p \in T_pM$$. Giải phương trình $$\dot{x}(t) = X(x(t))$$ có nghĩa hình học cực kỳ trong sáng: tìm đường cong mà tại mọi điểm, vector tiếp tuyến của nó **khớp khít** với mũi tên của trường gió $$X$$.

### 2. Định lý Picard–Lindelöf — Tấm vé bảo đảm cho Hình học
Tại sao từ một điểm $$p$$ trên mặt cầu, nếu bạn bắn một viên bi theo một hướng cố định thì chỉ có **duy nhất một** đường trắc địa đi ra mà không bao giờ bị "tách đôi"? Chính **Định lý Tồn tại và Duy nhất** (khi vế phải trơn / Lipschitz) bảo đảm các đường cong tích phân không bao giờ rẽ nhánh hay cắt nhau, biến bài toán vi phân thành những đối tượng hình học xác định duy nhất.

### 3. Dòng chảy ($$\Phi_t$$) và Không gian pha $$TM$$
Khi cho *tất cả* các điểm trên đa tạp cùng trôi theo trường gió trong khoảng thời gian $$t$$, ta thu được một phép biến dạng trơn cả không gian gọi là **dòng chảy $$\Phi_t$$** (thỏa mãn luật nhóm $$\Phi_{t+s} = \Phi_t \circ \Phi_s$$). Dòng chảy là nền tảng để định nghĩa **đạo hàm Lie** và nghiên cứu đối xứng liên tục (**nhóm Lie**).

---

### 1.1. Trường Vector (Vector Fields)
Một trường vector $$X$$ trên đa tạp $$M$$ là một quy tắc gán cho mỗi điểm $$p \in M$$ một vector tiếp tuyến $$X_p \in T_pM$$. Một cách hình thức, nó là một nhát cắt (section) của phân thớ tiếp tuyến (tangent bundle):
$$ X: M \to TM, \quad \pi \circ X = \text{id}_M $$
Ta có thể hình dung trường vector như một trường gió thổi trên bề mặt: tại mỗi điểm, gió có hướng và tốc độ xác định.

## 2. Bài toán Cauchy (Initial Value Problem)

Một phương trình vi phân cấp 1 tự trị có dạng tổng quát:
$$ \frac{dx}{dt} = X(x(t)) $$
kèm theo điều kiện ban đầu $$x(0) = x_0$$.

**Ý nghĩa hình học:**
- $$x(t)$$ là vị trí tại thời điểm $$t$$ của một hạt chuyển động theo trường gió.
- $$X(x(t))$$ là vector vận tốc của trường tại vị trí đó.
- Đường cong $$x(t)$$ được gọi là **đường cong tích phân (integral curve)** của trường vector $$X$$: tại mọi điểm trên quỹ đạo, vector tiếp tuyến của đường cong trùng với vector của trường $$X$$.

## 3. Định lý Tồn tại và Duy nhất (Picard-Lindelöf)

Đây là kết quả trung tâm của lý thuyết phương trình vi phân thường, đảm bảo tính xác định cục bộ của nghiệm.

<div class="textbook-theorem" markdown="1">
**Định lý:**
Nếu hàm $$F(t, x)$$ liên tục và thỏa mãn điều kiện Lipschitz địa phương theo biến $$x$$ (chẳng hạn khả vi liên tục) trong một lân cận của $$(t_0, x_0)$$, thì:
1.  **Tồn tại:** Có một nghiệm $$x(t)$$ thỏa mãn phương trình và điều kiện ban đầu trong một khoảng thời gian đủ nhỏ $$(t_0 - \epsilon, t_0 + \epsilon)$$.
2.  **Duy nhất:** Mọi cặp nghiệm thỏa mãn cùng điều kiện ban đầu đều trùng nhau trên khoảng xác định chung của chúng.
</div>

**Ý nghĩa trong Hình học Vi phân:**
- **Đường trắc địa không rẽ nhánh:** Nhờ tính duy nhất, khi xuất phát từ một điểm theo một hướng xác định, chỉ có duy nhất một đường trắc địa đi qua điểm đó theo hướng ấy; một đường trắc địa không thể tự tách thành hai nhánh khác nhau.
- **Các đường cong tích phân không cắt nhau:** Với một trường vector tự trị, nếu hai đường cong tích phân cắt nhau tại một điểm, thì tại giao điểm đó cùng một điều kiện ban đầu sẽ có hai quỹ đạo khác nhau, mâu thuẫn với tính duy nhất.

## 4. Phương trình Cấp 2 và Hệ Phương trình

Nhiều phương trình quan trọng trong vật lý (như định luật II Newton $$F = ma$$) và phương trình trắc địa trong hình học đều là phương trình vi phân cấp 2:
$$ \frac{d^2x}{dt^2} = G\left(t, x, \frac{dx}{dt}\right) $$

Để áp dụng định lý Picard-Lindelöf, ta quy phương trình về cấp 1 bằng cách đặt $$v = \frac{dx}{dt}$$. Khi đó phương trình trở thành hệ cấp 1:
$$
\begin{cases}
\frac{dx}{dt} = v \\
\frac{dv}{dt} = G(t, x, v)
\end{cases}
$$
Đây là một hệ phương trình cấp 1 đối với cặp biến $$(x, v)$$. Điều này giải thích vì sao trạng thái của một hệ cơ học được xác định đồng thời bởi **vị trí** và **vận tốc**: không gian trạng thái có số chiều gấp đôi không gian cấu hình. Trong Hình học Vi phân, phép chuyển này tương ứng với việc chuyển từ đa tạp $$M$$ sang phân thớ tiếp tuyến $$TM$$.

## 5. Sự phụ thuộc vào Tham số và Dòng chảy

Nghiệm $$x(t)$$ không chỉ phụ thuộc vào thời gian $$t$$ mà còn phụ thuộc vào điều kiện ban đầu $$x_0$$; ta viết nghiệm dưới dạng hàm $$\Phi(t, x_0)$$. Định lý về sự phụ thuộc trơn khẳng định rằng nếu trường vector $$F$$ trơn, thì ánh xạ $$\Phi$$ cũng trơn theo cả hai biến $$t$$ và $$x_0$$. Kết quả này là cơ sở để định nghĩa **dòng chảy (flow)** và **đạo hàm Lie**, cho phép khảo sát sự biến dạng của cả một miền không gian khi nó dịch chuyển theo trường vector.

### 5.1. Dòng chảy (Flow)
Họ tất cả các nghiệm tạo thành dòng chảy $$\Phi_t$$, trong đó $$\Phi_t(p)$$ là vị trí của điểm $$p$$ sau khoảng thời gian $$t$$ trôi theo trường vector. Dòng chảy thỏa mãn tính chất nhóm một tham số:
$$ \Phi_{t+s}(p) = \Phi_t(\Phi_s(p)) $$
Nghĩa là dịch chuyển trong thời gian $$s$$ rồi tiếp tục dịch chuyển thêm thời gian $$t$$ cho cùng kết quả với việc dịch chuyển liên tục trong thời gian $$t+s$$. Ngoài ra:
- $$\Phi_0(p) = p$$ (không dịch chuyển).
- $$\Phi_{-t} = (\Phi_t)^{-1}$$ (dịch chuyển ngược thời gian là ánh xạ ngược của dịch chuyển xuôi).

---

## Giải thích: tự tay tính dòng chảy trường quay và xem điều kiện Lipschitz bảo vệ ta khỏi điều gì

Để hai khái niệm *dòng chảy $$\Phi_t$$* và *tính duy nhất Picard–Lindelöf* trở nên sống động, hãy tự tay kiểm tra hai ví dụ nhỏ sau:

### Ví dụ cầm tay 1: Dòng chảy của trường gió xoay tròn $$X(x, y) = (-y, x)$$
Xét hệ ODE tự trị trên mặt phẳng $$\mathbb{R}^2$$:
$$
\begin{cases} \dot{x} = -y \\ \dot{y} = x \end{cases}, \qquad (x(0), y(0)) = (x_0, y_0).
$$
1. **Lấy đạo hàm lần 2:** $$\ddot{x} = -\dot{y} = -x \implies x(t) = x_0\cos t - y_0\sin t$$, và từ $$y = -\dot{x}$$ suy ra $$y(t) = x_0\sin t + y_0\cos t$$.
2. **Viết dưới dạng dòng chảy ma trận quay:**
   $$
   \Phi_t(x_0, y_0) = \begin{pmatrix} \cos t & -\sin t \\ \sin t & \cos t \end{pmatrix} \begin{pmatrix} x_0 \\ y_0 \end{pmatrix}.
   $$
   Mỗi đường cong tích phân là một đường tròn đồng tâm quanh gốc tọa độ!
3. **Kiểm tra luật nhóm $$\Phi_{t+s} = \Phi_t \circ \Phi_s$$ tại điểm $$p = (1, 0)$$ với $$s = \pi/2,\ t = \pi/2$$:**
   - Quay lần 1: $$\Phi_{\pi/2}(1, 0) = (0, 1)$$.
   - Quay lần 2: $$\Phi_{\pi/2}(0, 1) = (-1, 0)$$.
   - Quay thẳng một lần: $$\Phi_{\pi}(1, 0) = (-1, 0)$$ — khớp tuyệt đối!

### Ví dụ cầm tay 2: Điều gì xảy ra khi vi phạm điều kiện Lipschitz?
Xét phương trình rất đơn giản $$\frac{dx}{dt} = 2\sqrt{\vert x\vert}$$ với điều kiện đầu $$x(0) = 0$$. Hàm $$F(x) = 2\sqrt{\vert x\vert}$$ liên tục nhưng có đạo hàm $$F'(x) = 1/\sqrt{\vert x\vert} \to \infty$$ tại $$x = 0$$ (không thỏa điều kiện Lipschitz!). Kết quả là **tính duy nhất sụp đổ**:
- Nghiệm 1: $$x_1(t) = 0$$ với mọi $$t$$ (kiểm tra: $$\dot{x}_1 = 0 = 2\sqrt{0}$$).
- Nghiệm 2: $$x_2(t) = t^2$$ với $$t \ge 0$$ (kiểm tra: $$\dot{x}_2 = 2t = 2\sqrt{t^2}$$!).
Cùng xuất phát tại $$x(0) = 0$$ nhưng quỹ đạo bị **rẽ thành vô số nhánh** (chờ một thời gian $$c$$ bất kỳ rồi mới nhảy lên $$(t-c)^2$$)! Đó là lý do hình học vi phân luôn yêu cầu trường vector và metric phải **trơn**.

---

## 6. Tổng kết

Phương trình Vi phân cung cấp ba điểm tựa quan trọng cho Hình học Vi phân:
1.  **Tính tồn tại và duy nhất:** Đảm bảo các đối tượng như đường trắc địa và phép vận chuyển song song xác định rõ ràng.
2.  **Công cụ tính toán:** Cho phép tìm quỹ đạo và nghiệm cụ thể bằng cách giải phương trình.
3.  **Cách nhìn động:** Diễn giải các cấu trúc hình học thông qua quá trình biến đổi liên tục (dòng chảy).

Đến đây ta đã hoàn thành Chương 0 với bốn trụ cột nền tảng:
- **Đại số Tuyến tính:** Khảo sát cấu trúc của không gian phẳng.
- **Giải tích Đa biến:** Xấp xỉ cục bộ cái cong bằng cái phẳng.
- **Tô-pô:** Nắm bắt hình dạng tổng thể và định nghĩa đa tạp.
- **Phương trình Vi phân:** Mô tả sự vận động và liên kết giữa các điểm.

Với các công cụ này, ta đã sẵn sàng bước vào nội dung chính của Hình học Vi phân.

---
*Quay lại Bài 1: Hình học như Nghiên cứu về Biến đổi Trơn.*

## Video tham khảo

- [Differential equations, a tourist's guide \| DE1](https://www.youtube.com/watch?v=p_di4Zn4wz4) — 3Blue1Brown, tiếng Anh. Nên xem trước để hình dung trường mũi tên và đường cong tích phân, khớp với bài toán Cauchy "biết vận tốc tại từng điểm thì xác định được quỹ đạo".
- [Tensor Calculus 15: Geodesics and Christoffel Symbols (extrinsic geometry)](https://www.youtube.com/watch?v=1CuTNveXJRc) — eigenchris, tiếng Anh. Trình bày phương trình trắc địa dưới dạng hệ phương trình vi phân cấp hai; nên xem sau khi đã quen với trường vector, nối tiếp nhận xét ở phần mở đầu về vai trò của ODE đối với đường trắc địa.
