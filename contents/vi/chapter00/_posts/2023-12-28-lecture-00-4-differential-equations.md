---
layout: post
lang: vi
title: "Bài 0.4: Phương trình Vi phân — Quy luật của Chuyển động"
chapter: "00"
order: 4
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Từ quy luật biến thiên đến quỹ đạo

Cơ học cổ điển dựa trên nguyên lý: nếu biết trạng thái hiện tại của một hệ và quy luật biến thiên của nó, ta có thể xác định trạng thái của hệ ở các thời điểm tiếp theo. Công cụ toán học diễn đạt nguyên lý này chính là **Phương trình Vi phân Thường (ODE)**.

Trong Hình học Vi phân, đối tượng nghiên cứu là hình dạng của không gian chứ không chỉ là chuyển động cơ học, nhưng công cụ toán học hoàn toàn tương đồng:
- Đường trắc địa (geodesic) là nghiệm của một hệ phương trình vi phân.
- Dòng chảy (flow) của một trường vector là nghiệm của một hệ phương trình vi phân.
- Vận chuyển song song (parallel transport) cũng được xác định bởi một hệ phương trình vi phân.

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
