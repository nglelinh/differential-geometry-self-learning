---
layout: post
lang: vi
title: "Bài 0.2: Giải tích Đa biến — Nghệ thuật Xấp xỉ Tuyến tính"
chapter: "00"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Bản chất hình học của Đạo hàm

Ở đại học năm nhất, đạo hàm thường hiện lên như một danh sách công thức cần nhớ: $$(x^2)' = 2x$$, $$(\sin x)' = \cos x$$, hay quy tắc tích phân từng phần. Nhưng trong Hình học Vi phân, câu hỏi quan trọng nhất không phải là "đạo hàm tính ra bao nhiêu", mà là **"đạo hàm làm gì với không gian?"**

Câu trả lời gói gọn trong một ý tưởng duy nhất: **đạo hàm là xấp xỉ tuyến tính tốt nhất của một ánh xạ phi tuyến tại một điểm.** Đồ thị của một hàm cong có thể uốn lượn dữ dội ở quy mô lớn, nhưng khi phóng to quanh $$x_0$$, nó phẳng dần thành đường tiếp tuyến:

$$ f(x) \approx f(x_0) + f'(x_0)(x - x_0). $$

Chính tư tưởng "biến cái cong cục bộ thành ma trận tuyến tính" này — được gói trong **ma trận Jacobian**, **Định lý Hàm Ngược** và **Định lý Hàm Ẩn** — là cánh cửa cho phép ta đặt hệ tọa độ lên mặt cầu, mặt xuyến và những đa tạp nhiều chiều.

**Mạch bài học:** Bản đồ kiến thức nền (tuyến tính hóa, ma trận Jacobian & Hessian, hai định lý nền tảng) → Khai triển Taylor đa biến → Đạo hàm riêng, đạo hàm theo hướng và ma trận Jacobian → Khung giải thích chậm: tự tay tính Jacobian tọa độ cực tại $$(2, \pi/3)$$ và kiểm tra Định lý Hàm Ẩn trên đường tròn → Quy tắc chuỗi.

---

## Bản đồ kiến thức nền: Giải tích Đa biến cung cấp gì cho Hình học Vi phân?

Trước khi bước vào các công thức đạo hàm nhiều biến, hãy nhìn ba trụ cột mà giải tích đa biến đóng góp trực tiếp cho hình học vi phân:

### 1. Ma trận Jacobian ($$DF_p$$) — Đạo hàm như một ánh xạ tuyến tính
Với ánh xạ nhiều biến $$F: \mathbb{R}^n \to \mathbb{R}^m$$, đạo hàm tại điểm $$p$$ không còn là một con số mà là một **ánh xạ tuyến tính** giữa hai không gian tiếp tuyến (biểu diễn bởi ma trận Jacobian cỡ $$m \times n$$). Định thức $$\det(J)$$ (khi $$m = n$$) đo **hệ số co giãn thể tích** cục bộ — nền tảng của phép đổi biến tích phân và ánh xạ giữa các đa tạp.

### 2. Ma trận Hessian ($$H$$) — Độ cong bậc hai
Nếu gradient $$\nabla f$$ (đạo hàm cấp 1) cho ta *độ dốc* của mặt phẳng tiếp tuyến, thì ma trận đối xứng **Hessian** $$H_{ij} = \frac{\partial^2 f}{\partial x^i \partial x^j}$$ (đạo hàm cấp 2) mô tả *độ cong* của đồ thị quanh điểm dừng: tất cả trị riêng dương là đáy chảo (cực tiểu), tất cả âm là đỉnh đồi (cực đại), còn trái dấu là **điểm yên ngựa** — tiền thân trực tiếp của Dạng cơ bản thứ hai ở Chương 3!

### 3. Định lý Hàm Ngược và Định lý Hàm Ẩn — Chứng chỉ "hợp lệ" của bề mặt trơn
Làm sao biết một phương trình $$x^2 + y^2 + z^2 = 1$$ thực sự định nghĩa một bề mặt trơn không có góc nhọn, hay một hệ tọa độ cong không bị gấp nếp? Hai định lý này cho phép ta kết luận tính chất của ánh xạ *phi tuyến* cục bộ chỉ bằng cách kiểm tra xem **ma trận Jacobian tuyến tính** có khả nghịch hay không!

---

### 1.1. Chuỗi Taylor Đa biến (Multivariable Taylor Series)
Để xấp xỉ chính xác hơn ở bậc 2, ta cần dùng đạo hàm cấp 2 (biểu diễn qua ma trận Hessian). Khai triển Taylor bậc 2 của hàm $$f(x, y)$$ quanh điểm $$(a, b)$$ có dạng:
$$ f(x, y) \approx f(a, b) + \frac{\partial f}{\partial x}(x-a) + \frac{\partial f}{\partial y}(y-b) + \frac{1}{2} \left[ \frac{\partial^2 f}{\partial x^2}(x-a)^2 + 2\frac{\partial^2 f}{\partial x \partial y}(x-a)(y-b) + \frac{\partial^2 f}{\partial y^2}(y-b)^2 \right] $$

Viết gọn dưới dạng vector:
$$ f(\mathbf{x}) \approx f(\mathbf{a}) + \nabla f(\mathbf{a}) \cdot (\mathbf{x} - \mathbf{a}) + \frac{1}{2} (\mathbf{x} - \mathbf{a})^T H(\mathbf{a}) (\mathbf{x} - \mathbf{a}) $$
trong đó $$\nabla f$$ là vector gradient và $$H$$ là ma trận Hessian (ma trận đối xứng gồm các đạo hàm riêng cấp 2).

## 2. Đạo hàm trong Không gian Nhiều chiều

### 2.1. Đạo hàm riêng (Partial Derivative)
Xét hàm $$f: \mathbb{R}^n \to \mathbb{R}$$. Đạo hàm riêng $$\frac{\partial f}{\partial x^i}$$ đo tốc độ biến thiên của $$f$$ khi chỉ di chuyển dọc theo trục tọa độ $$x^i$$ và giữ cố định tất cả các biến còn lại.

### 2.2. Đạo hàm theo hướng (Directional Derivative)
Nếu ta di chuyển theo một hướng $$\mathbf{v}$$ bất kỳ thay vì dọc theo các trục tọa độ, đạo hàm theo hướng $$\mathbf{v}$$ của hàm $$f$$ tại điểm $$p$$ được định nghĩa là:
$$ \nabla_{\mathbf{v}} f(p) = df_p(\mathbf{v}) = \lim_{t \to 0} \frac{f(p + t\mathbf{v}) - f(p)}{t} $$
Trong không gian Euclid, đại lượng này liên hệ với gradient qua tích vô hướng: $$\nabla_{\mathbf{v}} f = \nabla f \cdot \mathbf{v}$$. Đây là mối liên hệ trực tiếp giữa vector (hướng di chuyển) và covector (vi phân $$df$$ đo tốc độ biến thiên).

### 2.3. Ma trận Jacobian (The Jacobian)
Xét một ánh xạ $$F: \mathbb{R}^n \to \mathbb{R}^m$$ cho bởi:
$$ F(x^1, \dots, x^n) = (f^1(x), \dots, f^m(x)) $$

Đạo hàm của ánh xạ này tại điểm $$p$$ không còn là một số đơn lẻ, mà là một **ma trận** kích thước $$m \times n$$, gọi là ma trận Jacobian $$J$$ (hay $$DF_p$$):

$$
J = \begin{pmatrix}
\frac{\partial f^1}{\partial x^1} & \cdots & \frac{\partial f^1}{\partial x^n} \\
\vdots & \ddots & \vdots \\
\frac{\partial f^m}{\partial x^1} & \cdots & \frac{\partial f^m}{\partial x^n}
\end{pmatrix}
$$

**Ý nghĩa hình học:** Ma trận Jacobian biểu diễn **ánh xạ tuyến tính tiếp tuyến** (tangent linear map). Nó biến một độ dịch chuyển vô cùng nhỏ $$\mathbf{v}$$ trong không gian nguồn thành độ dịch chuyển tương ứng $$J\mathbf{v}$$ trong không gian đích:
$$ F(p + \mathbf{v}) \approx F(p) + J \cdot \mathbf{v} $$

### 2.4. Ví dụ: Tọa độ Cực (Polar Coordinates)
Xét ánh xạ chuyển từ tọa độ cực $$(r, \theta)$$ sang tọa độ Descartes $$(x, y)$$:
$$ F(r, \theta) = (r \cos \theta, r \sin \theta) $$
Ma trận Jacobian tương ứng là:
$$
J = \begin{pmatrix}
\frac{\partial x}{\partial r} & \frac{\partial x}{\partial \theta} \\
\frac{\partial y}{\partial r} & \frac{\partial y}{\partial \theta}
\end{pmatrix}
= \begin{pmatrix}
\cos \theta & -r \sin \theta \\
\sin \theta & r \cos \theta
\end{pmatrix}
$$
Định thức Jacobian (Jacobian Determinant) bằng:
$$ \det(J) = r(\cos^2 \theta + \sin^2 \theta) = r $$
Chính vì vậy, trong tích phân bội, khi đổi sang tọa độ cực ta phải nhân thêm thừa số $$r$$ ($$dx dy = r dr d\theta$$) để phản ánh sự thay đổi diện tích của phần tử ô lưới.

---

## Khung giải thích: tự tay kiểm tra Jacobian và Định lý Hàm Ẩn (nên đọc chậm)

Để cảm nhận trực tiếp ma trận Jacobian và Định lý Hàm Ẩn hoạt động ra sao trên con số thật, hãy kiểm tra hai ví dụ ngắn bằng tay:

### Ví dụ cầm tay 1: Xấp xỉ tuyến tính bằng Jacobian tại $$(r, \theta) = (2, \pi/3)$$
Tại $$p = (2, \pi/3)$$, ta có $$\cos(\pi/3) = \frac{1}{2}$$ và $$\sin(\pi/3) = \frac{\sqrt{3}}{2}$$, nên:
$$
F(p) = \bigl(1,\ \sqrt{3}\bigr), \qquad J_p = \begin{pmatrix} 1/2 & -\sqrt{3} \\ \sqrt{3}/2 & 1 \end{pmatrix}, \qquad \det(J_p) = \frac{1}{2} + \frac{3}{2} = \mathbf{2} \neq 0.
$$
- Vì $$\det(J_p) = 2 \neq 0$$, **Định lý Hàm Ngược** bảo đảm tọa độ cực khả nghịch cục bộ quanh $$p$$ (ngược lại, tại gốc $$r = 0$$ thì $$\det(J) = 0$$ — tọa độ cực bị suy biến!).
- Bây giờ dịch nhẹ $$p$$ thêm $$\mathbf{v} = (0, 0.1)$$ (giữ nguyên bán kính $$r = 2$$, quay góc thêm $$0.1$$ radian):
  $$
  J_p \begin{pmatrix} 0 \\ 0.1 \end{pmatrix} = \begin{pmatrix} -0.1\sqrt{3} \\ 0.1 \end{pmatrix} \approx \begin{pmatrix} -0.1732 \\ 0.1000 \end{pmatrix}.
  $$
  Cộng vào $$F(p) = (1, 1.7321)$$ ta dự đoán $$F(2, \pi/3 + 0.1) \approx (0.8268,\ 1.8321)$$, rất sát giá trị thực $$(2\cos 1.1472,\ 2\sin 1.1472) \approx (0.8220,\ 1.8233)$$!

### Ví dụ cầm tay 2: Định lý Hàm Ẩn trên đường tròn $$F(x, y) = x^2 + y^2 - 1 = 0$$
Tính đạo hàm riêng $$\frac{\partial F}{\partial y} = 2y$$:
- Tại điểm $$A = (3/5, 4/5)$$: $$\frac{\partial F}{\partial y} = \frac{8}{5} \neq 0$$ → Định lý Hàm Ẩn bảo đảm ta viết được $$y = +\sqrt{1 - x^2}$$ trơn quanh $$A$$, với hệ số góc tiếp tuyến $$y'(x) = -\frac{F_x}{F_y} = -\frac{2x}{2y} = -\frac{3}{4}$$.
- Tại điểm $$B = (1, 0)$$: $$\frac{\partial F}{\partial y} = 0$$ → tiếp tuyến thẳng đứng, không thể viết $$y$$ như một hàm đơn trị của $$x$$ quanh $$B$$! Nhưng vì $$\frac{\partial F}{\partial x} = 2 \neq 0$$, ta vẫn viết được $$x = +\sqrt{1 - y^2}$$ trơn quanh $$B$$ — chứng tỏ đường tròn vẫn là một đa tạp 1 chiều trơn hoàn hảo tại mọi điểm!

---

## 3. Hai Định lý Nền tảng của Giải tích

Đây là hai kết quả cốt lõi thường dùng để chứng minh các tính chất hình học cục bộ.

### 3.1. Định lý Hàm Ngược (Inverse Function Theorem)
**Câu hỏi:** Khi nào một ánh xạ khả vi liên tục $$F$$ có thể đảo ngược (tồn tại hàm ngược $$F^{-1}$$) quanh một điểm?
**Trả lời:** Nếu tại điểm $$p$$, đạo hàm $$DF_p$$ là một ánh xạ tuyến tính khả nghịch (tức là $$\det(J) \neq 0$$), thì $$F$$ khả nghịch **trong một lân cận mở đủ nhỏ** quanh $$p$$.

**Ý nghĩa:** Nếu xấp xỉ tuyến tính tại $$p$$ là khả nghịch, thì bản thân ánh xạ phi tuyến $$F$$ cũng khả nghịch ở phạm vi cục bộ. Định lý này là cơ sở cho phép ta sử dụng các hệ tọa độ cong (như tọa độ cực) thay cho tọa độ Descartes.

### 3.2. Định lý Hàm Ẩn (Implicit Function Theorem)
**Câu hỏi:** Khi nào phương trình $$F(x, y) = 0$$ xác định cục bộ $$y$$ như một hàm của $$x$$? (Ví dụ: $$x^2 + y^2 - 1 = 0 \Rightarrow y = \pm\sqrt{1-x^2}$$).
**Trả lời:** Nếu tại điểm nghiệm xét đến, đạo hàm riêng theo $$y$$ khác 0 ($$\frac{\partial F}{\partial y} \neq 0$$), thì ta có thể giải được $$y$$ theo $$x$$ trong một lân cận của điểm đó.

**Ý nghĩa:** Định lý này cho phép định nghĩa các mặt và đa tạp dưới dạng tập mức của phương trình ẩn (level sets). Chẳng hạn, mặt cầu là tập hợp các điểm thỏa mãn $$x^2+y^2+z^2 = R^2$$; định lý hàm ẩn đảm bảo mặt cầu có cấu trúc trơn (smooth) tại mọi điểm.

## 4. Quy tắc Chuỗi (Chain Rule)

Trong giải tích một biến, quy tắc chuỗi viết là $$(f(g(x)))' = f'(g(x)) \cdot g'(x)$$. Trong giải tích đa biến, quy tắc chuỗi trở thành **phép nhân ma trận**.

Nếu $$F: \mathbb{R}^n \to \mathbb{R}^m$$ và $$G: \mathbb{R}^m \to \mathbb{R}^k$$ là các ánh xạ khả vi, thì đạo hàm của ánh xạ hợp $$H = G \circ F$$ tại $$p$$ là:
$$ D(G \circ F)_p = DG_{F(p)} \cdot DF_p $$

Nhờ đó, việc tính đạo hàm của các ánh xạ hợp phức tạp quy về phép nhân các ma trận Jacobian tương ứng.

## 5. Tổng kết

Giải tích Đa biến cung cấp ba công cụ trọng tâm:
1.  **Ma trận Jacobian:** Tuyến tính hóa một ánh xạ khả vi bất kỳ tại một điểm.
2.  **Định lý Hàm Ngược và Định lý Hàm Ẩn:** Cơ sở toán học để đổi hệ tọa độ và định nghĩa đa tạp.
3.  **Quy tắc Chuỗi:** Tính tốc độ biến thiên qua nhiều phép ánh xạ nối tiếp nhau.

Trong Hình học Vi phân, các công cụ này được áp dụng trên các không gian cong thay vì chỉ trong $$\mathbb{R}^n$$. Nhờ tính chất cục bộ xấp xỉ phẳng của đa tạp, toàn bộ cấu trúc vi phân trên vẫn giữ nguyên vai trò nền tảng.


## Video tham khảo

- [The paradox of the derivative \| Chapter 2, Essence of calculus](https://www.youtube.com/watch?v=9vKqVkMQHKk) — 3Blue1Brown, tiếng Anh. Nên xem trước để nắm trực giác "đạo hàm là xấp xỉ tuyến tính tốt nhất": khi phóng to đồ thị, cung cong trông gần như tiếp tuyến.
- [The Jacobian matrix](https://www.youtube.com/watch?v=bohL918kXQk) — Khan Academy, tiếng Anh. Trình bày ma trận các đạo hàm riêng của một ánh xạ nhiều biến, tương ứng với phần định nghĩa Jacobian trong bài.
- [Change of Variables & The Jacobian \| Multi-variable Integration](https://www.youtube.com/watch?v=wUF-lyyWpUc) — Dr. Trefor Bazett, tiếng Anh. Giải thích định thức Jacobian như hệ số thay đổi diện tích, bao gồm lý do xuất hiện thừa số $$r$$ khi chuyển sang tọa độ cực.
