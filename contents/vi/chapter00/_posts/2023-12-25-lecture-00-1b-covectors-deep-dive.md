---
layout: post
lang: vi
title: "Bài 0.1b: Covector — Hiểu Sâu về Không gian Đối ngẫu"
chapter: "00"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Tại sao Covector lại Quan trọng?

Covector (hay 1-form) là một trong những khái niệm **khó hiểu nhất** nhưng cũng **quan trọng nhất** trong hình học vi phân hiện đại. Nếu bạn không hiểu covector, bạn sẽ không thể hiểu được:
- Gradient ($$df$$)
- Cotangent bundle ($$T^*M$$)
- Differential forms ($$dx, dy, dz$$)
- Symplectic geometry
- Hamiltonian mechanics

Bài giảng này sẽ giúp bạn **thực sự hiểu** covector, không chỉ ở mức định nghĩa mà còn ở mức trực giác hình học sâu sắc.

## 2. Ba cách Nhìn về Covector

### 2.1. Quan điểm 1: "Cái máy đo"

**Định nghĩa hình thức**: Một covector $$\alpha \in V^*$$ là một **hàm tuyến tính** từ không gian vector $$V$$ vào số thực $$\mathbb{R}$$:
$$ \alpha: V \to \mathbb{R} $$
$$ \alpha(a\mathbf{u} + b\mathbf{v}) = a\alpha(\mathbf{u}) + b\alpha(\mathbf{v}) $$

**Ví dụ thực tế**:
- **Vector** $$\mathbf{v} = (2, 3)$$: Bạn mua 2kg táo và 3kg cam.
- **Covector** $$\mathbf{p} = (20, 30)$$: Giá táo 20k/kg, giá cam 30k/kg.
- **Kết quả**: $$\mathbf{p}(\mathbf{v}) = 20 \cdot 2 + 30 \cdot 3 = 130$$ (nghìn đồng).

Covector "ăn" một vector và trả về một số thực. Nó là một "cái cân" đo trọng lượng của vector theo một quy tắc nhất định.

### 2.2. Quan điểm 2: "Các mặt phẳng song song"

Đây là cách hình dung **hình học** cực kỳ mạnh mẽ.

**Vector** $$\mathbf{v}$$: Là một mũi tên từ gốc tọa độ.

**Covector** $$\alpha$$: Là một tập hợp **vô số các mặt phẳng song song đều nhau** (như các tầng lầu của một tòa nhà vô tận). Mỗi mặt phẳng được gắn nhãn bởi một số thực.

**Tác động** $$\alpha(\mathbf{v})$$: Là **số lượng mặt phẳng** mà mũi tên $$\mathbf{v}$$ xuyên qua.

Ví dụ: Trong $$\mathbb{R}^2$$:
- Covector $$dx$$: Các mặt phẳng đứng song song với trục $$y$$ (vuông góc trục $$x$$).
- Covector $$dy$$: Các mặt phẳng nằm ngang song song với trục $$x$$ (vuông góc trục $$y$$).
- Vector $$\mathbf{v} = (3, 0)$$: Xuyên qua 3 mặt phẳng của $$dx$$, xuyên qua 0 mặt phẳng của $$dy$$.

**Khoảng cách giữa các mặt phẳng**: Xác định "độ mạnh" của covector.
- Nếu mặt phẳng dày đặc hơn → covector "mạnh" hơn.
- Trong không gian có metric, covector $$\alpha$$ có "độ dài" $$\|\alpha\| = \sqrt{g^{-1}(\alpha, \alpha)}$$.

### 2.3. Quan điểm 3: "Gradient của hàm số"

Trong giải tích, **vi phân** của một hàm số $$f: \mathbb{R}^n \to \mathbb{R}$$ là một covector:
$$ df = \frac{\partial f}{\partial x^1} dx^1 + \cdots + \frac{\partial f}{\partial x^n} dx^n $$

**Ý nghĩa hình học**: $$df$$ đo tốc độ thay đổi của $$f$$ theo hướng $$\mathbf{v}$$:
$$ df(\mathbf{v}) = \nabla f \cdot \mathbf{v} = \text{Đạo hàm có hướng của } f \text{ theo } \mathbf{v} $$

**Ví dụ**: 
- Hàm số $$f(x, y) = x^2 + y^2$$ (khoảng cách đến gốc bình phương).
- Vi phân: $$df = 2x \, dx + 2y \, dy$$.
- Tại điểm $$(1, 1)$$: $$df = 2 \, dx + 2 \, dy$$.
- Nếu đi theo hướng $$\mathbf{v} = (1, 0)$$: $$df(\mathbf{v}) = 2$$ (hàm số tăng với tốc độ 2).

**Level sets (Đường mức)**: Các mặt phẳng của covector $$df$$ chính là các đường mức (level sets) của hàm $$f$$.

## 3. Không gian Đối ngẫu $$V^*$$

### 3.1. Định nghĩa

Cho không gian vector $$V$$ (chiều $$n$$). **Không gian đối ngẫu** $$V^*$$ (dual space) là tập hợp **tất cả** các covector trên $$V$$.

**Tính chất**:
- $$V^*$$ cũng là một không gian vector (có thể cộng covector, nhân vô hướng).
- $$\dim(V^*) = \dim(V) = n$$.
- $$(V^*)^* \cong V$$ (đối ngẫu của đối ngẫu là chính nó).

### 3.2. Cơ sở Đối ngẫu (Dual Basis)

Cho cơ sở $$\{\mathbf{e}_1, \ldots, \mathbf{e}_n\}$$ của $$V$$.

**Cơ sở đối ngẫu** $$\{\theta^1, \ldots, \theta^n\}$$ của $$V^*$$ được định nghĩa bởi:
$$ \theta^i(\mathbf{e}_j) = \delta^i_j = \begin{cases} 1 & \text{nếu } i = j \\ 0 & \text{nếu } i \neq j \end{cases} $$

**Ví dụ** trong $$\mathbb{R}^3$$:
- Cơ sở chuẩn: $$\mathbf{e}_1 = (1,0,0), \mathbf{e}_2 = (0,1,0), \mathbf{e}_3 = (0,0,1)$$.
- Cơ sở đối ngẫu: $$\theta^1 = dx, \theta^2 = dy, \theta^3 = dz$$.
- Kiểm tra: $$dx(\mathbf{e}_1) = dx(1,0,0) = 1$$, $$dx(\mathbf{e}_2) = 0$$.

**Biểu diễn tổng quát**:
- Vector: $$\mathbf{v} = v^i \mathbf{e}_i$$ (chỉ số trên).
- Covector: $$\alpha = \alpha_i \theta^i$$ (chỉ số dưới).
- Tác động: $$\alpha(\mathbf{v}) = \alpha_i v^i$$ (tổng theo quy ước Einstein).

## 4. Quy tắc Biến đổi: Covariant vs Contravariant

Đây là chìa khóa để hiểu tensor!

### 4.1. Đổi Cơ sở

Giả sử ta đổi từ cơ sở $$\{\mathbf{e}_i\}$$ sang cơ sở mới $$\{\tilde{\mathbf{e}}_i\}$$:
$$ \tilde{\mathbf{e}}_i = A^j_i \mathbf{e}_j $$

### 4.2. Vector (Contravariant)

Để biểu diễn cùng một vector vật lý $$\mathbf{v}$$, tọa độ phải biến đổi **ngược chiều**:
$$ \tilde{v}^i = (A^{-1})^i_j v^j $$

**Ví dụ**: Nếu cơ sở mới dài gấp đôi ($$A = 2I$$), thì tọa độ phải co lại một nửa ($$\tilde{v} = v/2$$).

### 4.3. Covector (Covariant)

Covector biến đổi **cùng chiều** với cơ sở:
$$ \tilde{\alpha}_i = A^j_i \alpha_j $$

**Lý do**: Để giá trị $$\alpha(\mathbf{v})$$ không đổi (là một đại lượng vật lý):
$$ \alpha(\mathbf{v}) = \alpha_i v^i = \tilde{\alpha}_i \tilde{v}^i $$

**Tên gọi**:
- **Contravariant (Phản biến)**: Biến đổi ngược chiều (vector).
- **Covariant (Hiệp biến)**: Biến đổi cùng chiều (covector).

## 5. Liên hệ với Gradient

### 5.1. Gradient là Covector

Cho hàm số $$f: \mathbb{R}^n \to \mathbb{R}$$.

**Vi phân** $$df$$ là một covector:
$$ df = \frac{\partial f}{\partial x^i} dx^i $$

**Gradient** $$\nabla f$$ là một vector được "nâng lên" từ $$df$$ bằng metric:
$$ \nabla f = g^{ij} \frac{\partial f}{\partial x^j} \mathbf{e}_i $$

**Trong không gian Euclid** ($$g^{ij} = \delta^{ij}$$):
$$ \nabla f = \left(\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z}\right) $$

**Sự khác biệt**:
- $$df$$: Covector (dạng 1, các mặt phẳng).
- $$\nabla f$$: Vector (mũi tên vuông góc với các mặt mức).

Trong không gian cong, chúng **không giống** nhau! Metric $$g$$ quyết định mối quan hệ giữa chúng.

### 5.2. Ví dụ: Tọa độ Cực

Trong tọa độ cực $$(r, \theta)$$:
- Metric: $$ds^2 = dr^2 + r^2 d\theta^2$$.
- Vi phân của hàm $$f$$: $$df = \frac{\partial f}{\partial r} dr + \frac{\partial f}{\partial \theta} d\theta$$ (covector).
- Gradient: $$\nabla f = \frac{\partial f}{\partial r} \mathbf{e}_r + \frac{1}{r^2} \frac{\partial f}{\partial \theta} \mathbf{e}_\theta$$ (vector).

Chú ý: Hệ số $$1/r^2$$ xuất hiện vì $$g^{\theta\theta} = 1/r^2$$.

## 6. Ứng dụng trong Hình học Vi phân

### 6.1. Cotangent Bundle $$T^*M$$

Trên một đa tạp $$M$$, tại mỗi điểm $$p$$, chúng ta có:
- **Tangent space** $$T_pM$$: Không gian các vector tiếp tuyến.
- **Cotangent space** $$T^*_pM$$: Không gian các covector (không gian đối ngẫu của $$T_pM$$).

**Cotangent bundle** là hợp của tất cả các cotangent spaces:
$$ T^*M = \bigcup_{p \in M} T^*_pM $$

**Ví dụ**: 
- Trên mặt cầu $$S^2$$: Cotangent bundle là không gian 4 chiều (2 cho vị trí, 2 cho covector).
- Trong cơ học Hamilton, **pha không gian** (phase space) chính là cotangent bundle!

### 6.2. Symplectic Geometry

Cotangent bundle có cấu trúc **symplectic** tự nhiên:
$$ \omega = dp_i \wedge dq^i $$

Đây là nền tảng cho:
- Cơ học Hamilton
- Geometric quantization
- Mirror symmetry (lý thuyết dây)

### 6.3. Dạng Vi phân (Differential Forms)

**1-form** chính là covector field (trường covector).

Ví dụ:
- $$\omega = f \, dx + g \, dy$$ là một 1-form.
- Tích phân đường: $$\int_\gamma \omega = \int_\gamma f \, dx + g \, dy$$ (công thực hiện bởi trường lực).

## 7. Bài tập Thực hành

🧩 **Bài tập** 

1. **Kiểm tra tuyến tính**: Cho $$\alpha = 2dx + 3dy$$ trong $$\mathbb{R}^2$$. Tính $$\alpha(\mathbf{v})$$ với $$\mathbf{v} = (1, -1)$$.

2. **Cơ sở đối ngẫu**: Trong $$\mathbb{R}^3$$, tìm cơ sở đối ngẫu của cơ sở $$\{\mathbf{e}_1 = (1,1,0), \mathbf{e}_2 = (0,1,1), \mathbf{e}_3 = (1,0,1)\}$$.

3. **Gradient**: Cho $$f(x,y) = \sin(x) e^y$$. Tính $$df$$ và $$\nabla f$$.

4. **Biến đổi tọa độ**: Trong tọa độ cực, nếu $$\alpha = dr + r \, d\theta$$, hãy tính $$\alpha(\mathbf{e}_r)$$ và $$\alpha(\mathbf{e}_\theta)$$ với $$\mathbf{e}_r, \mathbf{e}_\theta$$ là cơ sở tọa độ cực.

5. **Suy ngẫm**: Tại sao trong cơ học cổ điển, động lượng (momentum) $$p$$ lại là một covector, không phải vector?

## 8. Tổng kết

**Covector không phải là vector!** Chúng là các đối tượng đối ngẫu, sống trong không gian khác, và biến đổi theo quy tắc khác.

**Ba cách hiểu covector**:
1. **Đại số**: Hàm tuyến tính $$V \to \mathbb{R}$$.
2. **Hình học**: Các mặt phẳng song song.
3. **Giải tích**: Gradient (vi phân) của hàm số.

**Vai trò trong Hình học Vi phân**:
- Cotangent bundle ($$T^*M$$)
- Differential forms
- Symplectic geometry
- Hamiltonian mechanics

**Quy tắc vàng**: 
- Vector: Chỉ số trên ($$v^i$$), biến đổi ngược với cơ sở.
- Covector: Chỉ số dưới ($$\alpha_i$$), biến đổi cùng với cơ sở.

---
*Bài tiếp theo sẽ khám phá Differential Forms — sự tổng quát hóa của covector lên các bậc cao hơn!*
