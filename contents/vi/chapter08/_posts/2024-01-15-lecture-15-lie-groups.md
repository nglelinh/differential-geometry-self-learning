---
layout: post
lang: vi
title: "Bài 15: Nhóm Lie và Đối xứng trong Hình học Vi phân"
chapter: "08"
order: 1
owner: "Hình học Vi phân"
---

Cầm một cuốn sách trên bàn rồi thử hai thao tác: đầu tiên xoay cuốn sách $$90^\circ$$ quanh trục ngang (hướng mặt về phía bạn), sau đó xoay $$90^\circ$$ quanh trục thẳng đứng. Bây giờ đặt lại như cũ và làm **ngược thứ tự**: xoay trục thẳng đứng trước, rồi mới xoay trục ngang. Cuốn sách rơi vào hai tư thế khác hẳn nhau! Tập hợp tất cả các phép xoay 3D ấy ($$SO(3)$$) không chỉ là một nhóm đại số không giao hoán — nó còn là một **đa tạp trơn cong 3 chiều**, nơi ta có thể xoay liên tục từng phần nghìn độ một!

Vào cuối thế kỷ 19, nhà toán học Na Uy **Sophus Lie** đã phát hiện một bí mật làm chấn động cả đại số lẫn hình học: thay vì đánh vật trực tiếp với đa tạp cong phi tuyến $$G$$ (**Nhóm Lie**), ta chỉ cần nhìn sát vào **mặt phẳng tiếp tuyến tại đúng một điểm duy nhất** — phần tử đơn vị $$e$$ (**Đại số Lie** $$\mathfrak{g}$$)! Bằng một phép toán song tuyến tính đơn giản mang tên **dấu ngoặc Lie** $$[X, Y] = XY - YX$$ và cầu nối **ánh xạ mũ** $$\exp$$, không gian phẳng nhỏ bé ấy mã hóa gần như trọn vẹn cấu trúc của cả nhóm đối xứng khổng lồ!

**Mạch bài học:** Bản đồ kiến thức nền (cuộc hôn nhân Đại số + Đa tạp, Đại số Lie, Ánh xạ mũ & Định lý Noether) → Trực giác đối xứng liên tục, tuyến tính hóa và thí nghiệm cuốn sách → Định nghĩa hình thức → Ví dụ tính tay cầm tay chỉ việc: tính móc Lie $$[L_x, L_y] = L_z$$ của $$\mathfrak{so}(3)$$ và khai triển $$\exp(\theta L_z)$$ ra đúng ma trận quay $$R_z(\theta)$$ → Khung giải thích chậm: 4 bước nối Đại số Lie phẳng với Nhóm Lie cong (và phân biệt $$SU(2)$$ vs. $$SO(3)$$) → Ứng dụng, Video & Bài tập.

---

## Bản đồ kiến thức nền: Lý thuyết Nhóm Lie và Đại số Lie nghiên cứu gì?

### 1. Cuộc hôn nhân giữa Nhóm đại số và Đa tạp trơn
Trong toán học, **nhóm** mô tả đối xứng (có phép hợp và nghịch đảo), còn **đa tạp trơn** mô tả không gian cong khả vi. **Nhóm Lie** ghép cả hai lại làm một: phép nhân $$(g, h) \mapsto gh$$ và phép nghịch đảo $$g \mapsto g^{-1}$$ đều là ánh xạ trơn! Nhờ đó ta vừa có thể nhân các phép biến đổi, vừa có thể lấy đạo hàm vận tốc của chúng.

### 2. Đại số Lie $$\mathfrak{g} = T_e G$$ — "bộ điều khiển vận tốc" của nhóm
Tại phần tử đơn vị $$e \in G$$, không gian tiếp tuyến $$\mathfrak{g} = T_e G$$ là một **không gian vector phẳng** chứa các phép biến đổi vô cùng nhỏ (như vận tốc góc trong $$\mathfrak{so}(3)$$). Tuy mất đi phép nhân nhóm phi tuyến, $$\mathfrak{g}$$ giữ lại đúng phần "sai khác không giao hoán" thông qua **dấu ngoặc Lie** $$[X, Y]$$ thỏa tính phản đối xứng và đồng nhất thức Jacobi.

### 3. Cầu nối Ánh xạ mũ $$\exp : \mathfrak{g} \to G$$ và sức mạnh trong Vật lý–Kỹ thuật
Ánh xạ mũ biến một vận tốc không đổi $$X \in \mathfrak{g}$$ thành phép biến đổi hữu hạn $$\exp(tX) \in G$$. Trong vật lý, Định lý Noether gắn mỗi chiều của đại số Lie đối xứng với một **định luật bảo toàn** (đối xứng quay $$SO(3) \leftrightarrow$$ bảo toàn mô-men động lượng); trong robot và SLAM, tối ưu trên $$\mathfrak{se}(3)$$ giúp tránh hoàn toàn hiện tượng khóa khớp (*gimbal lock*)!

---

## Tổng quan

Trong toán học và vật lý, khái niệm *đối xứng* giữ vai trò trung tâm. Một mặt cầu có đối xứng quay: quay quanh tâm theo bất kỳ hướng nào, hình dạng của nó vẫn giữ nguyên. Một không gian phẳng có đối xứng tịnh tiến. Để mô tả các phép biến đổi liên tục bảo toàn cấu trúc hình học này, ta cần một đối tượng vừa có cấu trúc đa tạp trơn (liên tục, khả vi), vừa có cấu trúc nhóm đại số (có phép nhân và phép nghịch đảo). Đối tượng đó là *Nhóm Lie*.

Nhóm Lie (đặt theo tên nhà toán học Sophus Lie) là đa tạp trơn mà trên đó phép nhân nhóm và phép lấy nghịch đảo là các ánh xạ trơn. Những ví dụ quen thuộc gồm nhóm ma trận quay $$SO(3)$$ hay nhóm biến đổi Lorentz trong thuyết tương đối. Một đặc điểm quan trọng của nhóm Lie là ta có thể nghiên cứu cấu trúc toàn cục phi tuyến của nó thông qua *Đại số Lie* (Lie Algebra) thông qua *Ánh xạ mũ* (Exponential map). Bài giảng này trình bày các khái niệm cơ bản về nhóm Lie, đại số Lie và trường vector bất biến trái, đặt nền tảng cho lý thuyết đối xứng hiện đại.

## 2. Giải thích Trực quan

### 2.1. Đối xứng Liên tục

Xét một hình vuông: ta chỉ có thể quay nó một góc 90°, 180°, 270° hoặc 360° để nó trùng khít lại với chính mình — đó là *đối xứng rời rạc*. Ngược lại, với một đường tròn, ta có thể quay một góc $$\theta$$ bất kỳ (0,1°, 0,0001°...) mà hình vẫn không đổi — đó là *đối xứng liên tục*. Tập hợp mọi phép quay phẳng tạo thành một nhóm Lie (nhóm đường tròn $$S^1$$ hay $$U(1)$$).

> [!TIP]
> **Hình dung "Bánh xe quay":**
> - Một hình vuông chỉ có 4 phép quay đối xứng rời rạc (0°, 90°, 180°, 270°).
> - Một bánh xe tròn có vô số phép quay liên tục theo góc bất kỳ.
> - Nhóm Lie là tập hợp các phép biến đổi liên tục như vậy: vừa là nhóm (có phép hợp và nghịch đảo), vừa là đa tạp trơn (các tham số biến thiên liên tục).

Nhóm Lie là không gian tham số của các phép biến đổi liên tục. Trong vật lý, nếu một hệ có đối xứng liên tục (chẳng hạn các định luật vật lý bất biến dưới phép quay), nhóm Lie mô tả đối xứng đó sẽ tương ứng với các định luật bảo toàn theo Định lý Noether.

### 2.2. Tuyến tính hóa: Từ Nhóm xuống Đại số

Vì nhóm Lie là một đa tạp cong, việc thao tác trực tiếp trên toàn bộ nhóm thường phức tạp. Tuy nhiên, tại phần tử đơn vị $$e$$ (phép biến đổi đồng nhất), không gian tiếp tuyến của nhóm Lie là một không gian vector phẳng, gọi là *Đại số Lie*.

Đại số Lie chứa các phép biến đổi vô cùng nhỏ (vận tốc ban đầu của các phép biến đổi):
- Nhóm Lie $$SO(3)$$: các ma trận quay trong không gian 3D.
- Đại số Lie $$\mathfrak{so}(3)$$: các ma trận phản đối xứng $$3 \times 3$$ (biểu diễn vận tốc góc tức thời).

> [!NOTE]
> **Không gian vận tốc:**
> Có thể ví nhóm Lie như "không gian vị trí" và đại số Lie như "không gian vận tốc" tại phần tử đơn vị. Thay vì phân tích trực tiếp cấu trúc cong của cả nhóm, ta nghiên cứu không gian tuyến tính phẳng gồm các hướng dịch chuyển vô cùng nhỏ, rồi tích phân lên để thu được các phần tử của nhóm.

Phép toán đặc trưng trên đại số Lie là *dấu ngoặc Lie* (Lie bracket), đối với ma trận có dạng $$[X, Y] = XY - YX$$, đo mức độ không giao hoán giữa hai phép biến đổi vô cùng nhỏ.

> [!IMPORTANT]
> **Tính không giao hoán — Thí nghiệm với cuốn sách:**
> Cầm một cuốn sách đặt trước mặt và xét hai thao tác:
> - **Thao tác A:** quay 90° quanh trục ngang $$X$$.
> - **Thao tác B:** quay 90° quanh trục dọc $$Y$$.
> Thực hiện A rồi B cho ra một tư thế khác hẳn so với thực hiện B rồi A. Sự khác biệt đó phản ánh tính không giao hoán của $$SO(3)$$, và ở mức vô cùng nhỏ được đo bằng dấu ngoặc Lie $$[A, B] \neq 0$$.

### 2.3. Ánh xạ Mũ: Đi từ Phẳng ra Cong

Làm thế nào để từ một vector vận tốc trong đại số Lie tạo ra một phép biến đổi hữu hạn trong nhóm Lie? Ta đi dọc theo dòng chảy sinh bởi vector đó. Với nhóm ma trận, phép toán này chính là hàm mũ ma trận:
$$
\exp(A) = I + A + \frac{A^2}{2!} + \dots
$$
Ánh xạ mũ đưa phần tử của đại số Lie lên nhóm Lie, tương tự cách cuộn một đường thẳng tiếp tuyến lên đường tròn.

> [!TIP]
> **Đi theo dòng chảy:**
> Có thể hình dung đại số Lie cung cấp "hướng dòng chảy" tại phần tử đơn vị. Ánh xạ mũ $$\exp(tX)$$ ứng với việc trôi theo dòng chảy đó trong khoảng thời gian $$t$$: khi $$t$$ nhỏ, chuyển động gần như thẳng; khi $$t$$ lớn, quỹ đạo uốn theo cấu trúc cong của nhóm Lie.

## Định nghĩa Hình thức và Ký hiệu

### Nhóm Lie

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Một *Nhóm Lie* $$G$$ là một tập hợp vừa mang cấu trúc nhóm, vừa mang cấu trúc đa tạp trơn sao cho hai phép toán nhóm là các ánh xạ trơn:
1. Phép nhân: $$\mu: G \times G \to G, (g, h) \mapsto gh$$ là ánh xạ trơn.
2. Phép nghịch đảo: $$\iota: G \to G, g \mapsto g^{-1}$$ là ánh xạ trơn.
</div>

**Ví dụ:**
- $$GL(n, \mathbb{R})$$: nhóm các ma trận thực khả nghịch cỡ $$n \times n$$ (một tập mở trong $$\mathbb{R}^{n^2}$$).
- $$SO(n)$$: nhóm các ma trận trực giao có định thức bằng 1 (nhóm quay).
- $$S^1$$: nhóm các số phức có mô-đun bằng 1 (đường tròn đơn vị).
- $$(\mathbb{R}^n, +)$$: không gian Euclid với phép cộng vector.

### Trường Vector Bất biến Trái

Một trường vector $$X$$ trên $$G$$ được gọi là *bất biến trái* (left-invariant) nếu nó bất biến dưới phép tịnh tiến trái $$L_g(h) = gh$$ với mọi $$g, h \in G$$:
$$
(dL_g)_h (X_h) = X_{gh} \quad \forall g, h \in G
$$

Một trường vector bất biến trái được xác định duy nhất bởi giá trị của nó tại phần tử đơn vị $$e$$.

### Đại số Lie

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
*Đại số Lie* $$\mathfrak{g}$$ của nhóm Lie $$G$$ là không gian tiếp tuyến tại phần tử đơn vị, $$\mathfrak{g} = T_eG$$, được trang bị phép toán song tuyến tính $$[\cdot, \cdot]: \mathfrak{g} \times \mathfrak{g} \to \mathfrak{g}$$ gọi là *dấu ngoặc Lie*.
</div>

Dấu ngoặc Lie trên $$\mathfrak{g}$$ được định nghĩa thông qua dấu ngoặc Lie của các trường vector bất biến trái tương ứng. Đối với các nhóm Lie ma trận, phép toán này chính là giao hoán tử ma trận:
$$
[A, B] = AB - BA
$$

### Ánh xạ Mũ (Exponential Map)

<div class="textbook-definition" markdown="1">
**Định nghĩa:**
Ánh xạ mũ $$\exp: \mathfrak{g} \to G$$ được xác định bởi:
$$
\exp(X) = \gamma_X(1)
$$
trong đó $$\gamma_X(t)$$ là đường tích phân (integral curve) xuất phát từ phần tử đơn vị $$e$$ của trường vector bất biến trái sinh bởi $$X$$. Với nhóm ma trận, ánh xạ này trùng với chuỗi lũy thừa hàm mũ ma trận.
</div>

---

## Ví dụ tính tay cầm tay chỉ việc: Móc Lie của $$\mathfrak{so}(3)$$ và Ánh xạ mũ ra ma trận quay $$R_z(\theta)$$

Ba ma trận cơ sở của đại số Lie $$\mathfrak{so}(3)$$ (ứng với vận tốc quay quanh trục $$x, y, z$$) là:

$$
L_x = \begin{pmatrix} 0 & 0 & 0 \\ 0 & 0 & -1 \\ 0 & 1 & 0 \end{pmatrix}, \qquad
L_y = \begin{pmatrix} 0 & 0 & 1 \\ 0 & 0 & 0 \\ -1 & 0 & 0 \end{pmatrix}, \qquad
L_z = \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}.
$$

1. **Tự tính móc Lie $$[L_x, L_y] = L_x L_y - L_y L_x$$:**
   $$
   L_x L_y = \begin{pmatrix} 0 & 0 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}, \qquad
   L_y L_x = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}
   \;\Longrightarrow\;
   [L_x, L_y] = \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix} = L_z!
   $$
   Móc Lie của $$\mathfrak{so}(3)$$ tái hiện chính xác quy tắc tích có hướng $$\mathbf{i} \times \mathbf{j} = \mathbf{k}$$!

2. **Tự tính ánh xạ mũ $$\exp(\theta L_z)$$ bằng chuỗi lũy thừa:**
   Nhân trực tiếp ta thấy $$L_z^2 = \mathrm{diag}(-1, -1, 0)$$, $$L_z^3 = -L_z$$, $$L_z^4 = -L_z^2$$, cứ thế lặp tuần hoàn! Tách các số hạng bậc chẵn và bậc lẻ của chuỗi $$\sum_{k=0}^\infty \frac{\theta^k}{k!}L_z^k$$:
   $$
   \exp(\theta L_z) = I + \underbrace{\left(\theta - \frac{\theta^3}{3!} + \cdots\right)}_{\sin\theta} L_z + \underbrace{\left(\frac{\theta^2}{2!} - \frac{\theta^4}{4!} + \cdots\right)}_{1 - \cos\theta} L_z^2 = \begin{pmatrix} \cos\theta & -\sin\theta & 0 \\ \sin\theta & \cos\theta & 0 \\ 0 & 0 & 1 \end{pmatrix}!
   $$
   Chỉ từ một ma trận phản đối xứng phẳng $$L_z$$, hàm mũ ma trận tự động "cuộn" nó thành đúng ma trận quay $$R_z(\theta) \in SO(3)$$ (công thức Rodrigues)!

---

### Khung giải thích: Vì sao Đại số Lie phẳng kiểm soát Nhóm Lie cong — và đâu là giới hạn? (nên đọc chậm)

#### Bước 1: Lấy đạo hàm đường cong qua đơn vị để tìm phương trình của $$\mathfrak{g}$$
Với mọi đường cong ma trận $$R(t) \in SO(n)$$ thỏa $$R(0) = I$$ và $$R(t)^T R(t) = I$$, lấy đạo hàm hai vế tại $$t = 0$$ cho ngay: $$R'(0)^T + R'(0) = 0$$ — tức mọi vector tiếp tuyến $$X = R'(0)$$ bắt buộc phải là **ma trận phản đối xứng** ($$X^T = -X$$)! Một ràng buộc bậc hai cong phức tạp lập tức biến thành hệ phương trình tuyến tính đơn giản!

#### Bước 2: Công thức Baker–Campbell–Hausdorff (BCH) — khôi phục phép nhân nhóm chỉ từ dấu ngoặc Lie!
Khi nhân hai phép biến đổi gần đơn vị $$\exp(X)\exp(Y)$$, kết quả không bằng $$\exp(X+Y)$$ nếu $$X, Y$$ không giao hoán, mà tuân theo công thức BCH:
$$
\exp(X)\exp(Y) = \exp\!\left(X + Y + \frac{1}{2}[X, Y] + \frac{1}{12}[X,[X,Y]] - \frac{1}{12}[Y,[X,Y]] + \cdots\right).
$$
Mọi số hạng hiệu chỉnh bậc cao đều chỉ viết bằng **dấu ngoặc Lie lồng nhau**! Nghĩa là gần đơn vị, toàn bộ bảng nhân của nhóm Lie $$G$$ được mã hóa trọn vẹn trong $$[\cdot, \cdot]$$!

#### Bước 3: Điều gì mà Đại số Lie KHÔNG thấy được? Tôpô toàn cục!
Hai nhóm Lie có thể có **đại số Lie đẳng cấu hệt nhau** nhưng **tôpô toàn cục khác nhau**! Ví dụ kinh điển nhất trong vật lý lượng tử là $$\mathfrak{su}(2) \cong \mathfrak{so}(3)$$ (cả hai đều 3 chiều với cùng bảng móc Lie): nhưng $$SU(2)$$ là mặt cầu 3 chiều $$S^3$$ (đơn liên), còn $$SO(3) \cong S^3 / \{\pm 1\}$$ là không gian xạ ảnh $$\mathbb{RP}^3$$ — khiến một hạt spin-$$1/2$$ (electron) phải quay trọn **$$720^\circ$$** mới trở về đúng trạng thái ban đầu!

#### Bước 4: Định lý Lie thứ ba — phân loại mọi đối xứng liên tục
Nhờ cầu nối Nhóm $$\leftrightarrow$$ Đại số, việc phân loại mọi nhóm Lie đơn compact (những khối gạch cơ bản của vật lý hạt và hình học) quy về bài toán đại số tuyến tính phân loại đại số Lie đơn của Killing và Cartan (4 họ cổ điển $$A_n, B_n, C_n, D_n$$ cùng 5 ngoại lệ $$G_2, F_4, E_6, E_7, E_8$$)!

Tóm tắt từ điển Nhóm Lie – Đại số Lie:

$$
\text{Nhóm Lie cong } G
\;\xrightleftharpoons[\text{Ánh xạ mũ } \exp\ \&\ \text{BCH}]{\text{Đạo hàm tại } e}\;
\text{Đại số Lie phẳng } (\mathfrak{g}, [\cdot,\cdot])
\;\xrightarrow{\text{Tôpô phủ}}\;
SU(2) \xrightarrow{2:1} SO(3).
$$

## Hình ảnh minh họa

![Đường tròn và Đường thẳng](https://upload.wikimedia.org/wikipedia/commons/4/4f/Unit_circle.svg)

*Mô tả:* Nhóm Lie $$S^1$$ là đường tròn đơn vị, đại số Lie $$\mathbb{R}$$ là đường thẳng tiếp tuyến tại điểm 1, và ánh xạ mũ cuộn đường thẳng lên đường tròn thông qua ánh xạ $$x \mapsto e^{ix}$$.

![Mặt cầu quay](https://upload.wikimedia.org/wikipedia/commons/3/3a/Rotating_sphere.gif)

*Mô tả:* Chuyển động quay của mặt cầu quanh một trục: vector vận tốc góc dọc trục quay thuộc đại số Lie $$\mathfrak{so}(3)$$, còn phép quay hữu hạn một góc xác định thuộc nhóm Lie $$SO(3)$$.

![Không giao hoán](https://upload.wikimedia.org/wikipedia/commons/5/5b/Non-commutative_rotation_of_dice.png)

*Mô tả:* Minh họa tính không giao hoán của phép quay trong không gian 3D: quay 90° quanh trục $$x$$ rồi quanh trục $$y$$ cho kết quả khác với quay quanh $$y$$ trước rồi quanh $$x$$, phản ánh việc $$[X, Y] \neq 0$$.

## Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1. **Lie, Sophus (cuối thế kỷ 19).**  
   Người sáng lập lý thuyết nhóm biến đổi liên tục, phát hiện cách sử dụng đối xứng để phân tích và giải các phương trình vi phân.

2. **Chevalley, Claude (1946).** *Theory of Lie Groups*.  
   Công trình định hình ngôn ngữ hiện đại và trừu tượng cho lý thuyết nhóm Lie.

3. **Hall, Brian (2015).** *Lie Groups, Lie Algebras, and Representations*.  
   Giáo trình tiếp cận rõ ràng qua các nhóm Lie ma trận, phù hợp cho người mới học và sinh viên vật lý.

4. **Warner, Frank (1983).** *Foundations of Differentiable Manifolds and Lie Groups*.  
   Giáo trình kinh điển kết hợp chặt chẽ giữa lý thuyết đa tạp khả vi và nhóm Lie.

## Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### Vật lý Hạt cơ bản: Mô hình Chuẩn
Cấu trúc đối xứng của Mô hình Chuẩn dựa trên các nhóm Lie:
- $$U(1)$$: tương tác điện từ.
- $$SU(2)$$: tương tác yếu (và cấu trúc spin của electron).
- $$SU(3)$$: tương tác mạnh (sắc động lực học lượng tử — QCD).
Các hạt cơ bản như quark và lepton được phân loại thông qua các biểu diễn của những nhóm này.

### Kỹ thuật Robot (Robotics)
Tư thế (vị trí và hướng) của một vật rắn trong không gian 3D được mô tả bởi nhóm Euclid đặc biệt $$SE(3)$$, kết hợp phép quay và phép tịnh tiến. Đại số Lie $$\mathfrak{se}(3)$$ biểu diễn đồng thời vận tốc góc và vận tốc dài, được dùng rộng rãi trong động học robot và tính ma trận Jacobian.

### Thị giác Máy tính: SLAM
Trong bài toán định vị và dựng bản đồ đồng thời (SLAM), việc tối ưu hóa quỹ đạo camera (bundle adjustment) là bài toán tối ưu hóa trên nhóm Lie $$SE(3)$$. Làm việc trực tiếp trên đại số Lie và nhóm Lie giúp tránh các kỳ dị tọa độ như hiện tượng khóa khớp (gimbal lock) thường gặp khi dùng góc Euler.

## Video tham khảo

- [What is Lie theory? Here is the big picture. \| Lie groups, algebras, brackets #3](https://www.youtube.com/watch?v=ZRca3Ggpy_g) — Mathemaniac, tiếng Anh. Xem trước: bức tranh tổng thể về nhóm Lie như đa tạp mang phép nhân trơn, đại số Lie là không gian tiếp tuyến tại đơn vị và ánh xạ mũ đi từ phẳng ra cong.
- [how to understand all of lie algebras with one picture](https://www.youtube.com/watch?v=tY7jac-iPA4) — Michael Penn, tiếng Anh. Minh họa trực quan dấu ngoặc Lie và không gian tiếp tuyến tại phần tử đơn vị, tương ứng với bước tuyến tính hóa từ nhóm xuống đại số.

## Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đại số Lie của $$SO(2)$$**
Nhóm $$SO(2)$$ gồm các ma trận quay $$2 \times 2$$:
$$
R(\theta) = \begin{pmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{pmatrix}
$$
Tính đạo hàm của $$R(\theta)$$ tại $$\theta=0$$. Ma trận thu được thuộc không gian ma trận nào? Đó chính là cơ sở của đại số Lie $$\mathfrak{so}(2)$$.

**Bài tập 2: Tính dấu ngoặc Lie**
Cho hai ma trận $$A = \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix}$$ và $$B = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$$. Tính $$[A, B] = AB - BA$$.

**Bài tập 3: Tính ánh xạ mũ**
Tính $$\exp(tA)$$ với $$A = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}$$ bằng chuỗi lũy thừa ma trận. Kết quả có dạng gì? Đây là ví dụ đơn giản liên quan đến nhóm tịnh tiến (và nhóm Heisenberg).

**Bài tập 4: Suy ngẫm**
Vì sao việc nghiên cứu cấu trúc vô cùng nhỏ (đại số Lie) lại phản ánh được nhiều tính chất của cấu trúc toàn cục (nhóm Lie)? Trong trường hợp nào thông tin toàn cục không được xác định duy nhất bởi đại số Lie? (Gợi ý: $$SO(3)$$ và $$SU(2)$$ có cùng đại số Lie nhưng cấu trúc tô pô khác nhau — $$SU(2)$$ đơn liên còn $$SO(3)$$ thì không).

---

Trong bài giảng tiếp theo, chúng ta sẽ tiếp cận một ứng dụng lớn của hình học vi phân trong vật lý hiện đại: **Hình học của Không-Thời gian**, nơi độ cong của đa tạp Lorentz mô tả trực tiếp trường hấp dẫn.
