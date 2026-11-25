---
layout: post
lang: vi
title: "Bài 0.1b: Covector — Hiểu Sâu về Không gian Đối ngẫu"
chapter: "00"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Tại sao "gradient" không phải lúc nào cũng là một vector?

Hầu hết sinh viên đại học đều lớn lên với thói quen đồng nhất vi phân $$df$$ với vector gradient $$\nabla f = (\partial f/\partial x, \partial f/\partial y)$$ — bởi trong hệ tọa độ Descartes vuông góc chuẩn, hai thứ ấy có chung một bộ tọa độ! Thế nhưng ngay khi bạn bước sang một hệ tọa độ cong (như tọa độ cực) hay một không gian cong (như bề mặt Trái Đất hay không-thời gian), hai đối tượng đó lập tức **tách rời nhau**: một thứ chỉ cần cấu trúc trơn là định nghĩa được (**covector** $$df$$), còn thứ kia bắt buộc phải có thước đo khoảng cách (**metric** $$g$$) mới dựng lên được (**vector** $$\nabla f$$).

Hiểu rõ **covector** (hay 1-dạng — 1-form) mở khóa đồng loạt năm cánh cửa lớn của hình học vi phân và vật lý lý thuyết:
- Vi phân của hàm số ($$df$$)
- Phân thớ đối tiếp tuyến (cotangent bundle, $$T^*M$$)
- Dạng vi phân (differential forms, $$dx, dy, dz$$)
- Hình học symplectic
- Cơ học Hamilton

**Mạch bài học:** Kiến thức cần nhớ (không gian đối ngẫu $$V^*$$, phân thớ đối tiếp tuyến $$T^*M$$, hình học symplectic) → Ba cách nhìn về covector → Cơ sở đối ngẫu và quy tắc biến đổi hiệp biến/phản biến → Vi phân vs. Gradient → Giải thích: tự tay tính $$df$$ và $$\nabla f$$ trong tọa độ cực tại $$(r, \theta) = (2, 0)$$ → Ứng dụng và Bài tập thực hành.

---

## Kiến thức cần nhớ: Không gian Đối ngẫu, Phân thớ $$T^*M$$ và Hình học Symplectic là gì?

Để nhìn rõ vị trí của covector trên bản đồ toán học và vật lý hiện đại, hãy nắm ba trụ cột sau:

### 1. Không gian Đối ngẫu ($$V^*$$) — Thế giới của các phép đo tuyến tính
Mọi không gian vector $$V$$ đều có một "bản sao soi gương" gọi là **không gian đối ngẫu $$V^*$$**, gồm mọi phiếm hàm tuyến tính $$\alpha: V \to \mathbb{R}$$. Điểm tinh tế bậc nhất: ta có thể đo một vector bằng một covector ($$\alpha(\mathbf{v}) \in \mathbb{R}$$) mà **không hề cần đến tích vô hướng hay góc vuông**! Chỉ khi có thêm tensor metric $$g$$, ta mới ghép đôi tự nhiên được vector với covector (phép *nâng–hạ chỉ số* trong đại số tensor).

### 2. Phân thớ Đối tiếp tuyến ($$T^*M$$) — Không gian pha của Cơ học Hamilton
Khi gắn không gian đối ngẫu $$T_p^*M$$ lên từng điểm $$p$$ của một đa tạp $$M$$, ta thu được **phân thớ đối tiếp tuyến $$T^*M$$**. Trong vật lý cổ điển, nếu đa tạp $$M$$ là không gian vị trí $$q^i$$ của một hệ cơ học, thì vận tốc $$\dot{q}^i$$ sống trong $$TM$$, còn **động lượng tổng quát $$p_i = \partial L / \partial \dot{q}^i$$** sống chính xác trong $$T^*M$$! Chính vì thế động lượng là một *covector*, còn vận tốc là một *vector*.

### 3. Dạng vi phân và Hình học Symplectic
Trên đa tạp $$M$$, một trường covector trơn gọi là **1-dạng** (thứ ta tích phân dọc theo đường cong: $$\int_\gamma \omega$$). Tổng quát lên $$k$$-dạng cho phép định nghĩa phép tích phân không phụ thuộc tọa độ và Định lý Stokes tổng quát. Riêng trên không gian pha $$T^*M$$, 2-dạng tự nhiên $$\omega = dp_i \wedge dq^i$$ khai sinh **Hình học Symplectic** — ngôn ngữ bảo toàn thể tích pha (Định lý Liouville) của cơ học Hamilton và lượng tử hóa hình học.

---

## 2. Ba cách nhìn về Covector

### 2.1. Quan điểm 1: "Dụng cụ đo" tuyến tính

**Định nghĩa hình thức:** Một covector $$\alpha \in V^*$$ là một **hàm tuyến tính** từ không gian vector $$V$$ vào tập số thực $$\mathbb{R}$$:
$$ \alpha: V \to \mathbb{R} $$
$$ \alpha(a\mathbf{u} + b\mathbf{v}) = a\alpha(\mathbf{u}) + b\alpha(\mathbf{v}) $$

**Ví dụ thực tế:**
- **Vector** $$\mathbf{v} = (2, 3)$$: Số lượng hàng mua là 2 kg táo và 3 kg cam.
- **Covector** $$\mathbf{p} = (20, 30)$$: Đơn giá là 20 nghìn đồng/kg táo và 30 nghìn đồng/kg cam.
- **Kết quả:** $$\mathbf{p}(\mathbf{v}) = 20 \cdot 2 + 30 \cdot 3 = 130$$ (nghìn đồng).

Nói cách khác, covector nhận vào một vector và trả về một số thực theo một quy tắc tuyến tính xác định.

### 2.2. Quan điểm 2: Họ các mặt phẳng song song

Đây là cách hình dung trực quan về mặt hình học:
- **Vector** $$\mathbf{v}$$: Một mũi tên xuất phát từ gốc tọa độ.
- **Covector** $$\alpha$$: Một họ gồm **vô số mặt phẳng song song cách đều nhau**, mỗi mặt phẳng tương ứng với một giá trị thực (tập mức).
- **Tác động** $$\alpha(\mathbf{v})$$: **Số lượng mặt phẳng** mà mũi tên $$\mathbf{v}$$ xuyên qua.

Ví dụ trong $$\mathbb{R}^2$$:
- Covector $$dx$$ ứng với họ các đường thẳng đứng song song với trục $$y$$ (vuông góc với trục $$x$$).
- Covector $$dy$$ ứng với họ các đường thẳng nằm ngang song song với trục $$x$$ (vuông góc với trục $$y$$).
- Vector $$\mathbf{v} = (3, 0)$$ xuyên qua 3 đường mức của $$dx$$ và 0 đường mức của $$dy$$.

**Khoảng cách giữa các mặt phẳng** phản ánh độ lớn của covector: các mặt phẳng càng dày đặc thì giá trị covector đo được trên cùng một vector càng lớn. Trong không gian có trang bị metric, độ dài của covector $$\alpha$$ được xác định bởi $$\|\alpha\| = \sqrt{g^{-1}(\alpha, \alpha)}$$.

### 2.3. Quan điểm 3: Vi phân của hàm số

Trong giải tích, **vi phân** của một hàm khả vi $$f: \mathbb{R}^n \to \mathbb{R}$$ là một covector:
$$ df = \frac{\partial f}{\partial x^1} dx^1 + \cdots + \frac{\partial f}{\partial x^n} dx^n $$

**Ý nghĩa hình học:** $$df$$ đo tốc độ biến thiên của $$f$$ theo hướng vector $$\mathbf{v}$$:
$$ df(\mathbf{v}) = \nabla f \cdot \mathbf{v} = \text{Đạo hàm có hướng của } f \text{ theo } \mathbf{v} $$

**Ví dụ:**
- Xét hàm $$f(x, y) = x^2 + y^2$$ (bình phương khoảng cách đến gốc tọa độ).
- Vi phân của hàm là $$df = 2x \, dx + 2y \, dy$$.
- Tại điểm $$(1, 1)$$, ta có $$df = 2 \, dx + 2 \, dy$$.
- Nếu đi theo hướng $$\mathbf{v} = (1, 0)$$, thì $$df(\mathbf{v}) = 2$$ (hàm số tăng với tốc độ 2).

**Đường mức (Level sets):** Các mặt phẳng song song biểu diễn covector $$df$$ tại một điểm chính là xấp xỉ tuyến tính của các đường mức (mặt mức) của hàm $$f$$ quanh điểm đó.

## 3. Không gian Đối ngẫu $$V^*$$

### 3.1. Định nghĩa

Cho không gian vector $$V$$ có số chiều hữu hạn $$n$$. **Không gian đối ngẫu** $$V^*$$ (dual space) là tập hợp tất cả các covector xác định trên $$V$$.

**Tính chất:**
- $$V^*$$ cũng là một không gian vector (với phép cộng covector và phép nhân vô hướng theo từng điểm).
- $$\dim(V^*) = \dim(V) = n$$.
- $$(V^*)^* \cong V$$ (với không gian hữu hạn chiều, không gian đối ngẫu của $$V^*$$ đẳng cấu tự nhiên với $$V$$).

### 3.2. Cơ sở Đối ngẫu (Dual Basis)

Cho cơ sở $$\{\mathbf{e}_1, \ldots, \mathbf{e}_n\}$$ của $$V$$. **Cơ sở đối ngẫu** $$\{\theta^1, \ldots, \theta^n\}$$ của $$V^*$$ được định nghĩa bởi:
$$ \theta^i(\mathbf{e}_j) = \delta^i_j = \begin{cases} 1 & \text{nếu } i = j \\ 0 & \text{nếu } i \neq j \end{cases} $$

**Ví dụ** trong $$\mathbb{R}^3$$:
- Cơ sở chuẩn: $$\mathbf{e}_1 = (1,0,0), \mathbf{e}_2 = (0,1,0), \mathbf{e}_3 = (0,0,1)$$.
- Cơ sở đối ngẫu: $$\theta^1 = dx, \theta^2 = dy, \theta^3 = dz$$.
- Kiểm tra: $$dx(\mathbf{e}_1) = dx(1,0,0) = 1$$, $$dx(\mathbf{e}_2) = 0$$.

**Biểu diễn tổng quát:**
- Vector: $$\mathbf{v} = v^i \mathbf{e}_i$$ (chỉ số trên).
- Covector: $$\alpha = \alpha_i \theta^i$$ (chỉ số dưới).
- Tác động: $$\alpha(\mathbf{v}) = \alpha_i v^i$$ (lấy tổng theo quy ước Einstein).

## 4. Quy tắc Biến đổi: Hiệp biến và Phản biến

Quy tắc biến đổi tọa độ khi đổi cơ sở là điểm chính để hiểu khái niệm tensor.

### 4.1. Đổi cơ sở

Giả sử ta đổi từ cơ sở $$\{\mathbf{e}_i\}$$ sang cơ sở mới $$\{\tilde{\mathbf{e}}_i\}$$ theo quan hệ:
$$ \tilde{\mathbf{e}}_i = A^j_i \mathbf{e}_j $$

### 4.2. Vector (Phản biến — Contravariant)

Để vẫn biểu diễn cùng một vector hình học $$\mathbf{v}$$, các thành phần tọa độ của nó phải biến đổi **ngược chiều** với cơ sở:
$$ \tilde{v}^i = (A^{-1})^i_j v^j $$

**Ví dụ:** Nếu cơ sở mới dài gấp đôi ($$A = 2I$$), thì tọa độ phải giảm đi một nửa ($$\tilde{v} = v/2$$).

### 4.3. Covector (Hiệp biến — Covariant)

Ngược lại, các thành phần của covector biến đổi **cùng chiều** với cơ sở:
$$ \tilde{\alpha}_i = A^j_i \alpha_j $$

**Lý do:** Giá trị tác động $$\alpha(\mathbf{v})$$ là một đại lượng vô hướng không phụ thuộc vào việc chọn cơ sở, nên phải thỏa mãn:
$$ \alpha(\mathbf{v}) = \alpha_i v^i = \tilde{\alpha}_i \tilde{v}^i $$

**Thuật ngữ:**
- **Phản biến (Contravariant):** Biến đổi ngược chiều với cơ sở (thành phần vector).
- **Hiệp biến (Covariant):** Biến đổi cùng chiều với cơ sở (thành phần covector).

## 5. Liên hệ giữa Vi phân và Gradient

### 5.1. Phân biệt Vi phân và Gradient

Cho hàm khả vi $$f: \mathbb{R}^n \to \mathbb{R}$$.

**Vi phân** $$df$$ là một covector:
$$ df = \frac{\partial f}{\partial x^i} dx^i $$

**Gradient** $$\nabla f$$ là một vector thu được bằng cách "nâng chỉ số" từ $$df$$ nhờ tensor metric $$g$$:
$$ \nabla f = g^{ij} \frac{\partial f}{\partial x^j} \mathbf{e}_i $$

**Trong không gian Euclid** với tọa độ Descartes ($$g^{ij} = \delta^{ij}$$):
$$ \nabla f = \left(\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z}\right) $$

**Sự khác biệt:**
- $$df$$ là covector (1-dạng, biểu diễn hình học bằng họ các mặt mức song song).
- $$\nabla f$$ là vector (mũi tên vuông góc với các mặt mức).

Trong không gian cong hoặc trong hệ tọa độ cong, hai đối tượng này không có cùng biểu thức tọa độ; chính metric $$g$$ quyết định phép chuyển đổi giữa chúng.

### 5.2. Giải thích: tự tay so sánh $$df$$ và $$\nabla f$$ trong tọa độ cực

Hãy tính trực tiếp bằng tay để thấy vì sao tọa độ của $$df$$ và $$\nabla f$$ **khác nhau rõ rệt** trong tọa độ cực $$(r, \theta)$$!

Xét hàm số cụ thể $$f(r, \theta) = r^2 + 4\theta$$ tại điểm $$p$$ có tọa độ $$(r, \theta) = (2, 0)$$.
1. **Metric và nghịch đảo của nó tại $$r = 2$$:**
   Vì $$ds^2 = dr^2 + r^2 d\theta^2$$, ma trận metric và nghịch đảo tại $$r = 2$$ là:
   $$
   g = \begin{pmatrix} 1 & 0 \\ 0 & r^2 \end{pmatrix} = \begin{pmatrix} 1 & 0 \\ 0 & 4 \end{pmatrix}, \qquad g^{-1} = \begin{pmatrix} 1 & 0 \\ 0 & 1/4 \end{pmatrix}.
   $$
2. **Tính covector vi phân $$df$$ (không cần metric!):**
   $$
   \frac{\partial f}{\partial r} = 2r = 4, \qquad \frac{\partial f}{\partial \theta} = 4 \implies df_p = 4\,dr + 4\,d\theta.
   $$
   Tọa độ hiệp biến của $$df$$ là $$(4, 4)$$.
3. **Tính vector gradient $$\nabla f$$ (phải nhân với $$g^{-1}$$ để nâng chỉ số):**
   $$
   (\nabla f)^r = g^{rr} \frac{\partial f}{\partial r} = 1 \cdot 4 = 4, \qquad (\nabla f)^\theta = g^{\theta\theta} \frac{\partial f}{\partial \theta} = \frac{1}{4} \cdot 4 = 1.
   $$
   Vậy $$\nabla f_p = 4\,\mathbf{e}_r + \mathbf{e}_\theta$$ — tọa độ phản biến là $$(4, 1)$$, **khác hẳn** $$(4, 4)$$!
4. **Kiểm tra khớp nối trên một vector thử $$\mathbf{v} = \mathbf{e}_r + \mathbf{e}_\theta$$ (tức $$v^r = 1, v^\theta = 1$$):**
   - Dùng covector $$df$$ (không cần metric):
     $$
     df_p(\mathbf{v}) = 4(1) + 4(1) = \mathbf{8}.
     $$
   - Dùng tích vô hướng $$g(\nabla f_p, \mathbf{v})$$:
     $$
     g(\nabla f_p, \mathbf{v}) = g_{rr} (\nabla f)^r v^r + g_{\theta\theta} (\nabla f)^\theta v^\theta = 1(4)(1) + 4(1)(1) = 4 + 4 = \mathbf{8}!
     $$

Nếu bạn nhầm lẫn bỏ quên hệ số $$g^{\theta\theta} = 1/r^2$$ mà lấy $$\nabla f = (4, 4)$$, tích vô hướng sẽ vọt lên thành $$1(4)(1) + 4(4)(1) = 20 \neq 8$$ — sai ngay lập tức! Chính phép kiểm tra tay này cho thấy vai trò của sự phân biệt vector và covector.

## 6. Ứng dụng trong Hình học Vi phân

### 6.1. Phân thớ Đối tiếp tuyến $$T^*M$$ (Cotangent Bundle)

Trên một đa tạp $$M$$, tại mỗi điểm $$p$$ ta có hai không gian đối ngẫu với nhau:
- **Không gian tiếp tuyến** $$T_pM$$: Không gian các vector tiếp tuyến tại $$p$$.
- **Không gian đối tiếp tuyến** $$T^*_pM$$: Không gian các covector tại $$p$$ (không gian đối ngẫu của $$T_pM$$).

**Phân thớ đối tiếp tuyến** là hợp rời của tất cả các không gian đối tiếp tuyến tại mọi điểm trên $$M$$:
$$ T^*M = \bigcup_{p \in M} T^*_pM $$

**Ví dụ:**
- Trên mặt cầu $$S^2$$, phân thớ đối tiếp tuyến là một đa tạp 4 chiều (2 chiều cho vị trí và 2 chiều cho thành phần covector).
- Trong cơ học Hamilton, **không gian pha** (phase space) chính là phân thớ đối tiếp tuyến của không gian cấu hình.

### 6.2. Hình học Symplectic

Phân thớ đối tiếp tuyến mang một cấu trúc **symplectic** tự nhiên, biểu diễn bởi 2-dạng:
$$ \omega = dp_i \wedge dq^i $$

Cấu trúc này là nền tảng cho:
- Cơ học Hamilton
- Lượng tử hóa hình học (geometric quantization)
- Đối xứng gương (mirror symmetry) trong lý thuyết dây

### 6.3. Dạng Vi phân (Differential Forms)

Một **1-dạng** (1-form) chính là một trường covector trơn trên đa tạp.

Ví dụ:
- $$\omega = f \, dx + g \, dy$$ là một 1-dạng trên $$\mathbb{R}^2$$.
- Tích phân đường $$\int_\gamma \omega = \int_\gamma f \, dx + g \, dy$$ biểu diễn công thực hiện bởi một trường lực dọc theo đường cong $$\gamma$$.

## 7. Bài tập Thực hành

🧩 **Bài tập**

1. **Kiểm tra tính tuyến tính:** Cho $$\alpha = 2dx + 3dy$$ trong $$\mathbb{R}^2$$. Tính $$\alpha(\mathbf{v})$$ với $$\mathbf{v} = (1, -1)$$.

2. **Cơ sở đối ngẫu:** Trong $$\mathbb{R}^3$$, tìm cơ sở đối ngẫu của cơ sở $$\{\mathbf{e}_1 = (1,1,0), \mathbf{e}_2 = (0,1,1), \mathbf{e}_3 = (1,0,1)\}$$.

3. **Vi phân và Gradient:** Cho $$f(x,y) = \sin(x) e^y$$. Tính $$df$$ và $$\nabla f$$.

4. **Biến đổi tọa độ:** Trong tọa độ cực, cho $$\alpha = dr + r \, d\theta$$. Hãy tính $$\alpha(\mathbf{e}_r)$$ và $$\alpha(\mathbf{e}_\theta)$$ với $$\mathbf{e}_r, \mathbf{e}_\theta$$ là cơ sở tọa độ cực.

5. **Suy ngẫm:** Tại sao trong cơ học cổ điển, động lượng (momentum) $$p$$ lại là một covector thay vì một vector?

## 8. Tổng kết

Covector không đồng nhất với vector: chúng thuộc về không gian đối ngẫu $$V^*$$ và biến đổi theo quy tắc khác khi đổi cơ sở.

**Ba cách hiểu covector:**
1. **Đại số:** Hàm tuyến tính $$V \to \mathbb{R}$$.
2. **Hình học:** Họ các mặt phẳng song song cách đều nhau.
3. **Giải tích:** Vi phân của một hàm số.

**Vai trò trong Hình học Vi phân:**
- Phân thớ đối tiếp tuyến ($$T^*M$$)
- Dạng vi phân (differential forms)
- Hình học symplectic
- Cơ học Hamilton

**Quy tắc cần nhớ:**
- Vector: Chỉ số trên ($$v^i$$), biến đổi ngược chiều với cơ sở.
- Covector: Chỉ số dưới ($$\alpha_i$$), biến đổi cùng chiều với cơ sở.

---
*Bài tiếp theo sẽ khám phá Differential Forms — sự tổng quát hóa của covector lên các bậc cao hơn!*
