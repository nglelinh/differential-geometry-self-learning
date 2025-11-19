---
layout: post
lang: vi
title: "Bài 0.2: Giải tích Đa biến — Nghệ thuật Xấp xỉ Tuyến tính"
chapter: "00"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Bản chất của Đạo hàm

Nhiều người học đạo hàm như là một tập hợp các quy tắc tính toán: $$(x^2)' = 2x$$, $$(\sin x)' = \cos x$$.
Nhưng trong Hình học Vi phân, chúng ta cần một cái nhìn sâu sắc hơn.

**Đạo hàm là gì?**
Đạo hàm là **xấp xỉ tuyến tính tốt nhất** của một hàm số tại một điểm.
- Hàm số $$f(x)$$ có thể cong queo phức tạp.
- Nhưng nếu phóng to (zoom in) tại một điểm $$x_0$$, đồ thị của nó trông giống như một đường thẳng.
- Đường thẳng đó là tiếp tuyến. Hệ số góc của nó là đạo hàm $$f'(x_0)$$.

$$ f(x) \approx f(x_0) + f'(x_0)(x - x_0) $$

Tư tưởng này mở rộng hoàn hảo sang không gian nhiều chiều.

### 1.1. Chuỗi Taylor Đa biến (Multivariable Taylor Series)
Để xấp xỉ chính xác hơn (bậc 2), chúng ta cần đến đạo hàm cấp 2 (Ma trận Hessian).
Công thức khai triển Taylor cho hàm $$f(x, y)$$ quanh điểm $$(a, b)$$:
$$ f(x, y) \approx f(a, b) + \frac{\partial f}{\partial x}(x-a) + \frac{\partial f}{\partial y}(y-b) + \frac{1}{2} \left[ \frac{\partial^2 f}{\partial x^2}(x-a)^2 + 2\frac{\partial^2 f}{\partial x \partial y}(x-a)(y-b) + \frac{\partial^2 f}{\partial y^2}(y-b)^2 \right] $$

Trong ký hiệu vector gọn gàng:
$$ f(\mathbf{x}) \approx f(\mathbf{a}) + \nabla f(\mathbf{a}) \cdot (\mathbf{x} - \mathbf{a}) + \frac{1}{2} (\mathbf{x} - \mathbf{a})^T H(\mathbf{a}) (\mathbf{x} - \mathbf{a}) $$
Trong đó $$\nabla f$$ là Gradient (vector) và $$H$$ là Hessian (ma trận đối xứng).

## 2. Đạo hàm trong Không gian Nhiều chiều

### 2.1. Đạo hàm riêng (Partial Derivative)
Xét hàm $$f: \mathbb{R}^n \to \mathbb{R}$$.
Đạo hàm riêng $$\frac{\partial f}{\partial x^i}$$ đo tốc độ thay đổi của $$f$$ khi ta chỉ di chuyển dọc theo trục $$x^i$$ và giữ nguyên các biến khác.

### 2.2. Đạo hàm theo hướng (Directional Derivative)
Nếu chúng ta không di chuyển dọc theo trục $$x$$ hay $$y$$, mà di chuyển theo một hướng bất kỳ $$\mathbf{v}$$?
Đạo hàm theo hướng $$\mathbf{v}$$ của hàm $$f$$ tại $$p$$ là:
$$ \nabla_{\mathbf{v}} f(p) = df_p(\mathbf{v}) = \lim_{t \to 0} \frac{f(p + t\mathbf{v}) - f(p)}{t} $$
Mối liên hệ với Gradient: $$\nabla_{\mathbf{v}} f = \nabla f \cdot \mathbf{v}$$.
Đây là cầu nối giữa Vector (hướng di chuyển) và Covector (Gradient - máy đo sự thay đổi).

### 2.2. Ma trận Jacobian (The Jacobian)
Xét một ánh xạ $$F: \mathbb{R}^n \to \mathbb{R}^m$$.
$$ F(x^1, \dots, x^n) = (f^1(x), \dots, f^m(x)) $$

Đạo hàm của ánh xạ này tại điểm $$p$$ không phải là một số, mà là một **Ma trận** kích thước $$m \times n$$, gọi là Ma trận Jacobian $$J$$ (hoặc $$DF_p$$).

$$
J = \begin{pmatrix}
\frac{\partial f^1}{\partial x^1} & \cdots & \frac{\partial f^1}{\partial x^n} \\
\vdots & \ddots & \vdots \\
\frac{\partial f^m}{\partial x^1} & \cdots & \frac{\partial f^m}{\partial x^n}
\end{pmatrix}
$$

**Ý nghĩa hình học:**
Ma trận Jacobian biểu diễn **ánh xạ tuyến tính tiếp xúc** (tangent linear map). Nó biến một vector dịch chuyển nhỏ $$\mathbf{v}$$ trong không gian nguồn thành vector dịch chuyển nhỏ $$J\mathbf{v}$$ trong không gian đích.
$$ F(p + \mathbf{v}) \approx F(p) + J \cdot \mathbf{v} $$

### 2.3. Ví dụ: Tọa độ Cực (Polar Coordinates)
Xét ánh xạ chuyển từ tọa độ cực $$(r, \theta)$$ sang tọa độ Descartes $$(x, y)$$:
$$ F(r, \theta) = (r \cos \theta, r \sin \theta) $$
Ma trận Jacobian là:
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
Định thức Jacobian (Jacobian Determinant):
$$ \det(J) = r(\cos^2 \theta + \sin^2 \theta) = r $$
Đây chính là lý do tại sao trong tích phân bội, ta phải nhân thêm $$r$$ khi đổi sang tọa độ cực ($$dx dy = r dr d\theta$$). Nó đo sự thay đổi diện tích của ô lưới.

## 3. Hai Định lý Vĩ đại của Giải tích

Đây là hai công cụ mạnh mẽ nhất để chứng minh các tính chất hình học cục bộ.

### 3.1. Định lý Hàm Ngược (Inverse Function Theorem)
**Câu hỏi:** Khi nào thì một ánh xạ $$F$$ có thể đảo ngược được (có hàm ngược $$F^{-1}$$)?
**Trả lời:** Nếu tại điểm $$p$$, đạo hàm $$DF_p$$ là một ánh xạ tuyến tính khả nghịch (tức là $$\det(J) \neq 0$$), thì $$F$$ sẽ khả nghịch **trong một vùng lân cận nhỏ** quanh $$p$$.

**Ý nghĩa:**
Nếu thế giới phẳng (đạo hàm) là "đẹp" (khả nghịch), thì thế giới cong (hàm số gốc) cũng "đẹp" (khả nghịch) ở phạm vi cục bộ.
Định lý này cho phép chúng ta dùng tọa độ cong (như tọa độ cực) thay cho tọa độ Descartes.

### 3.2. Định lý Hàm Ẩn (Implicit Function Theorem)
**Câu hỏi:** Khi nào phương trình $$F(x, y) = 0$$ xác định $$y$$ như một hàm của $$x$$? (Ví dụ: $$x^2 + y^2 - 1 = 0 \Rightarrow y = \pm\sqrt{1-x^2}$$).
**Trả lời:** Nếu đạo hàm riêng theo $$y$$ khác 0 ($$\frac{\partial F}{\partial y} \neq 0$$), thì ta có thể giải được $$y$$ theo $$x$$ cục bộ.

**Ý nghĩa:**
Định lý này cho phép chúng ta định nghĩa các bề mặt (manifold) dưới dạng phương trình ẩn (level sets). Ví dụ, mặt cầu là tập hợp các điểm thỏa mãn $$x^2+y^2+z^2 = R^2$$. Định lý hàm ẩn đảm bảo rằng mặt cầu là trơn tru (smooth).

## 4. Quy tắc Chuỗi (Chain Rule)

Trong giải tích 1 biến: $$(f(g(x)))' = f'(g(x)) \cdot g'(x)$$.
Trong giải tích đa biến, quy tắc chuỗi trở thành **phép nhân ma trận**.

Nếu $$F: \mathbb{R}^n \to \mathbb{R}^m$$ và $$G: \mathbb{R}^m \to \mathbb{R}^k$$.
Đạo hàm của hàm hợp $$H = G \circ F$$ là:
$$ D(G \circ F)_p = DG_{F(p)} \cdot DF_p $$

Đây là lý do tại sao Đại số Tuyến tính lại quan trọng đến thế. Việc tính đạo hàm của các hàm hợp phức tạp quy về việc nhân các ma trận Jacobian với nhau.

## 5. Tổng kết

Giải tích Đa biến cung cấp cho chúng ta:
1.  **Jacobian:** Cách tuyến tính hóa một ánh xạ bất kỳ.
2.  **Định lý Hàm Ngược/Hàm Ẩn:** Cơ sở pháp lý để chuyển đổi tọa độ và định nghĩa đa tạp.
3.  **Quy tắc Chuỗi:** Công cụ để tính toán sự thay đổi qua nhiều lớp ánh xạ.

Trong Hình học Vi phân, chúng ta sẽ áp dụng những công cụ này không phải trên không gian phẳng $$\mathbb{R}^n$$, mà trên các bề mặt cong. Nhưng nhờ tư tưởng "cục bộ là phẳng", mọi công thức trên vẫn giữ nguyên giá trị.

