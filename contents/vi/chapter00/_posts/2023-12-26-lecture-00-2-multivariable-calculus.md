---
layout: post
lang: vi
title: "Bài 0.2: Giải tích Đa biến — Nghệ thuật Xấp xỉ Tuyến tính"
chapter: "00"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Bản chất của Đạo hàm

Đạo hàm thường được tiếp cận như một tập hợp quy tắc tính toán, chẳng hạn $$(x^2)' = 2x$$ hay $$(\sin x)' = \cos x$$. Tuy nhiên, trong Hình học Vi phân, điều quan trọng nhất là ý nghĩa hình học của nó.

**Đạo hàm là gì?** Đạo hàm là **xấp xỉ tuyến tính tốt nhất** của một hàm số tại một điểm:
- Đồ thị của hàm $$f(x)$$ nói chung có thể cong phức tạp.
- Khi phóng to đủ gần quanh điểm $$x_0$$, đồ thị đó trông gần như một đường thẳng.
- Đường thẳng ấy chính là tiếp tuyến tại $$x_0$$, và hệ số góc của nó là đạo hàm $$f'(x_0)$$:

$$ f(x) \approx f(x_0) + f'(x_0)(x - x_0) $$

Tư tưởng xấp xỉ tuyến tính này mở rộng tự nhiên sang không gian nhiều chiều.

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
