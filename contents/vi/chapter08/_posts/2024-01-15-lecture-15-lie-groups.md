---
layout: post
lang: vi
title: "Bài 15: Nhóm Lie và Đối xứng trong Hình học Vi phân"
chapter: "08"
order: 1
owner: "Hình học Vi phân"
---

## Tổng quan

Trong tự nhiên và toán học, khái niệm "đối xứng" đóng vai trò trung tâm. Một quả cầu có tính đối xứng quay: dù bạn quay nó thế nào quanh tâm, nó vẫn trông y hệt. Một không gian phẳng có tính đối xứng tịnh tiến. Để mô tả các phép biến đổi liên tục giữ nguyên hình dáng này, chúng ta cần một công cụ toán học vừa có cấu trúc hình học (trơn tru, liên tục) vừa có cấu trúc đại số (phép nhân, nghịch đảo). Công cụ đó là *Nhóm Lie*.

Nhóm Lie (đặt theo tên nhà toán học Sophus Lie) là những đa tạp trơn mà trên đó ta có thể thực hiện các phép toán nhóm (nhân và nghịch đảo) một cách trơn tru. Ví dụ điển hình nhất là nhóm các ma trận quay $$SO(3)$$ hoặc nhóm các phép biến đổi Lorentz trong thuyết tương đối.

Một điều kỳ diệu của Nhóm Lie là chúng ta có thể nghiên cứu cấu trúc toàn cục phức tạp của chúng thông qua một không gian vector tuyến tính đơn giản hơn gọi là *Đại số Lie* (Lie Algebra). Mối liên hệ giữa Nhóm Lie (toàn cục, cong) và Đại số Lie (địa phương, phẳng) được thực hiện qua *Ánh xạ mũ* (Exponential map).

Bài giảng này sẽ giới thiệu các khái niệm cơ bản về Nhóm Lie, Đại số Lie, và các trường vector bất biến trái, mở ra cánh cửa vào lý thuyết đối xứng hiện đại.

## 2. Giải thích Trực quan

### 2.1. Đối xứng Liên tục

Hãy nghĩ về một hình vuông. Bạn có thể quay nó 90 độ, 180 độ... để nó trùng khít lại với chính nó. Đây là đối xứng rời rạc.
Bây giờ hãy nghĩ về một vòng tròn. Bạn có thể quay nó một góc bất kỳ $$\theta$$ (0.1 độ, 0.0001 độ...) và nó vẫn trùng khít. Đây là *đối xứng liên tục*. Tập hợp tất cả các góc quay này tạo thành một Nhóm Lie (nhóm đường tròn $$S^1$$ hay $$U(1)$$).

> [!TIP]
> **Hình dung "Bánh xe Quay":**
> - Một hình vuông chỉ có 4 vị trí đối xứng (0°, 90°, 180°, 270°).
> - Một bánh xe (vòng tròn) có vô số vị trí đối xứng - bạn có thể quay nó 1°, 0.5°, 0.001°... bất kỳ góc nào.
> - Nhóm Lie là tập hợp của tất cả các phép quay liên tục này. Nó vừa là một nhóm (có phép nhân, nghịch đảo) vừa là một đa tạp trơn (các tham số thay đổi liên tục).

Nhóm Lie chính là không gian chứa các tham số của các phép biến đổi liên tục. Nếu một hệ thống vật lý có đối xứng (ví dụ: định luật vật lý không đổi khi quay phòng thí nghiệm), thì nhóm Lie mô tả đối xứng đó sẽ quyết định các định luật bảo toàn (Định lý Noether).

### 2.2. Tuyến tính hóa: Từ Nhóm xuống Đại số

Nhóm Lie là một đa tạp cong. Nghiên cứu trực tiếp trên nó khá khó (giống như làm toán trên mặt cầu). Tuy nhiên, tại phần tử đơn vị (phép đồng nhất - không làm gì cả), không gian tiếp tuyến của Nhóm Lie là một không gian vector phẳng. Không gian này được gọi là *Đại số Lie*.

Đại số Lie chứa các "mầm mống" của phép biến đổi.
- Nhóm Lie $$SO(3)$$: Các ma trận quay 3D.
- Đại số Lie $$\mathfrak{so}(3)$$: Các ma trận phản đối xứng (đại diện cho vận tốc góc tức thời).

> [!NOTE]
> **Không gian Vận tốc:**
> Hãy nghĩ về Nhóm Lie như "không gian vị trí" và Đại số Lie như "không gian vận tốc".
> - Nếu bạn đang ở vị trí A và muốn đến vị trí B, bạn cần một vector vận tốc.
> - Đại số Lie chứa tất cả các "hướng di chuyển vô cùng nhỏ" từ phần tử đơn vị.
> - Thay vì nghiên cứu toàn bộ nhóm (cong, phức tạp), ta chỉ cần nghiên cứu đại số (phẳng, đơn giản) rồi "tích phân" lên.

Phép nhân trong Đại số Lie không phải là phép nhân số, mà là *Dấu ngoặc Lie* (Lie Bracket) $$[X, Y] = XY - YX$$. Nó đo lường mức độ không giao hoán của hai phép biến đổi vô cùng nhỏ.

> [!IMPORTANT]
> **Không giao hoán - Thí nghiệm Cuốn sách:**
> Lấy một cuốn sách:
> - **Thao tác A**: Quay 90° quanh trục X (ngang).
> - **Thao tác B**: Quay 90° quanh trục Y (dọc).
> - Làm A rồi B: Cuốn sách ở vị trí 1.
> - Làm B rồi A: Cuốn sách ở vị trí 2 (KHÁC vị trí 1!).
> Sự khác biệt này chính là $$[A, B] \neq 0$$ - Dấu ngoặc Lie đo lường mức độ "không giao hoán" của hai phép quay.

### 2.3. Ánh xạ Mũ: Đi từ Thẳng ra Cong

Làm sao để từ vector vận tốc (Đại số Lie) tạo ra chuyển động quay hữu hạn (Nhóm Lie)?
Câu trả lời là: cứ đi theo hướng vector đó mãi mãi! Trong ma trận, điều này chính là hàm mũ ma trận:
$$
\exp(A) = I + A + \frac{A^2}{2!} + \dots
$$
Ánh xạ mũ đưa một phần tử của Đại số Lie lên Nhóm Lie, giống như việc cuộn một đường thẳng lên đường tròn.

> [!TIP]
> **Đi theo Dòng chảy:**
> Tưởng tượng bạn đứng trên một dòng sông (Nhóm Lie).
> - Đại số Lie cho bạn "hướng dòng chảy" tại vị trí hiện tại (vector vận tốc).
> - Ánh xạ mũ $$\exp(tX)$$ là: "Hãy thả mình theo dòng chảy trong thời gian $$t$$".
> - Nếu $$t$$ nhỏ, bạn chỉ di chuyển một chút (gần như thẳng). Nếu $$t$$ lớn, bạn có thể đi một vòng quanh đa tạp.

## Định nghĩa Hình thức và Ký hiệu

### Nhóm Lie

**Định nghĩa:**
Một *Nhóm Lie* $$G$$ là một tập hợp vừa là một nhóm, vừa là một đa tạp trơn, sao cho các phép toán nhóm là trơn (smooth):
1.  Phép nhân: $$\mu: G \times G \to G, (g, h) \mapsto gh$$ là ánh xạ trơn.
2.  Phép nghịch đảo: $$\iota: G \to G, g \mapsto g^{-1}$$ là ánh xạ trơn.

**Ví dụ:**
- $$GL(n, \mathbb{R})$$: Nhóm các ma trận khả nghịch $$n \times n$$ (Đa tạp mở trong $$\mathbb{R}^{n^2}$$).
- $$SO(n)$$: Nhóm các ma trận trực giao có định thức bằng 1 (Nhóm quay).
- $$S^1$$: Nhóm các số phức có mô-đun bằng 1 (Đường tròn đơn vị).
- $$(\mathbb{R}^n, +)$$: Không gian Euclid với phép cộng vector.

### Trường Vector Bất biến Trái

Một trường vector $$X$$ trên $$G$$ được gọi là *bất biến trái* (left-invariant) nếu nó không thay đổi dưới phép tịnh tiến trái bởi bất kỳ phần tử nào của nhóm.
$$
(dL_g)_h (X_h) = X_{gh} \quad \forall g, h \in G
$$
Trong đó $$L_g(h) = gh$$ là phép tịnh tiến trái.

Tính chất quan trọng: Một trường vector bất biến trái được xác định hoàn toàn bởi giá trị của nó tại phần tử đơn vị $$e$$.

### Đại số Lie

**Định nghĩa:**
*Đại số Lie* $$\mathfrak{g}$$ của nhóm Lie $$G$$ là không gian tiếp tuyến tại đơn vị, $$\mathfrak{g} = T_eG$$, được trang bị phép toán song tuyến tính $$[\cdot, \cdot]: \mathfrak{g} \times \mathfrak{g} \to \mathfrak{g}$$ gọi là *dấu ngoặc Lie*.

Dấu ngoặc Lie trên $$\mathfrak{g}$$ được định nghĩa thông qua dấu ngoặc Lie của các trường vector bất biến trái tương ứng. Với ma trận, nó đơn giản là giao hoán tử:
$$
[A, B] = AB - BA
$$

### Ánh xạ Mũ (Exponential Map)

**Định nghĩa:**
Ánh xạ $$\exp: \mathfrak{g} \to G$$ được định nghĩa bởi:
$$
\exp(X) = \gamma_X(1)
$$
Trong đó $$\gamma_X(t)$$ là đường tích phân (integral curve) của trường vector bất biến trái sinh bởi $$X$$, đi qua đơn vị $$e$$. Với nhóm ma trận, đây chính là chuỗi lũy thừa ma trận.

## Hình ảnh minh họa

![Đường tròn và Đường thẳng](https://upload.wikimedia.org/wikipedia/commons/4/4f/Unit_circle.svg)

*Mô tả:* Nhóm Lie $$S^1$$ là đường tròn. Đại số Lie $$\mathbb{R}$$ là đường thẳng tiếp tuyến tại điểm 1. Ánh xạ mũ cuộn đường thẳng quanh đường tròn (hàm $$x \mapsto e^{ix}$$).

![Mặt cầu quay](https://upload.wikimedia.org/wikipedia/commons/3/3a/Rotating_sphere.gif)

*Mô tả:* Một quả cầu với trục quay. Vector chỉ phương trục quay thuộc đại số Lie $$\mathfrak{so}(3)$$. Phép quay một góc cụ thể quanh trục đó là phần tử của nhóm Lie $$SO(3)$$.

![Không giao hoán](https://upload.wikimedia.org/wikipedia/commons/5/5b/Non-commutative_rotation_of_dice.png)

*Mô tả:* Minh họa việc quay một cuốn sách: Quay 90 độ quanh trục x rồi quay 90 độ quanh trục y KHÁC với quay y rồi quay x. Sự khác biệt này liên quan đến dấu ngoặc Lie $$[X, Y] \neq 0$$.

## Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1.  **Lie, Sophus (Cuối thế kỷ 19).**
    Người sáng lập lý thuyết các nhóm biến đổi liên tục. Ông nhận ra rằng việc nghiên cứu các phương trình vi phân có thể được đơn giản hóa nhờ các đối xứng của chúng.

2.  **Chevalley, Claude (1946).** *Theory of Lie Groups*.
    Cuốn sách định hình ngôn ngữ hiện đại và trừu tượng cho lý thuyết nhóm Lie.

3.  **Hall, Brian (2015).** *Lie Groups, Lie Algebras, and Representations*.
    Sách giáo khoa cực kỳ dễ hiểu, tập trung vào nhóm ma trận, rất tốt cho người mới bắt đầu và dân vật lý.

4.  **Warner, Frank (1983).** *Foundations of Differentiable Manifolds and Lie Groups*.
    Sách kinh điển kết hợp chặt chẽ giữa lý thuyết đa tạp và nhóm Lie.

## Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### Vật lý Hạt cơ bản: Mô hình Chuẩn
Toàn bộ vật lý hạt hiện đại dựa trên lý thuyết nhóm Lie.
- $$U(1)$$: Điện từ lực.
- $$SU(2)$$: Lực tương tác yếu (và spin của electron).
- $$SU(3)$$: Lực tương tác mạnh (sắc động học lượng tử - QCD).
Các hạt cơ bản (quark, lepton) được phân loại dựa trên "biểu diễn" của các nhóm này.

### Robotics: Kỹ thuật Robot
Trạng thái của một vật rắn trong không gian 3D được mô tả bởi nhóm $$SE(3)$$ (Special Euclidean group) - bao gồm quay và tịnh tiến. Đại số Lie $$\mathfrak{se}(3)$$ (gồm vận tốc góc và vận tốc dài) được dùng để tính toán động học robot (Jacobian robot).

### Thị giác Máy tính: SLAM
Trong bài toán định vị và lập bản đồ (SLAM), camera di chuyển trong không gian. Việc tối ưu hóa quỹ đạo camera (bundle adjustment) thực chất là tối ưu hóa trên đa tạp nhóm Lie $$SE(3)$$. Việc hiểu sai cấu trúc hình học (ví dụ dùng góc Euler thay vì Lie algebra) có thể gây ra lỗi "Gimbal lock".

## Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Đại số Lie của $$SO(2)$$**
Nhóm $$SO(2)$$ là các ma trận quay 2x2:
$$
R(\theta) = \begin{pmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{pmatrix}
$$
Tính đạo hàm của $$R(\theta)$$ tại $$\theta=0$$. Ma trận kết quả thuộc không gian nào? Đó chính là đại số Lie $$\mathfrak{so}(2)$$.

**Bài tập 2: Dấu ngoặc Lie**
Cho hai ma trận $$A = \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix}$$ và $$B = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$$. Tính $$[A, B] = AB - BA$$.

**Bài tập 3: Ánh xạ mũ**
Tính $$\exp(tA)$$ với $$A = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}$$ bằng chuỗi lũy thừa. Kết quả là ma trận gì? Đây là ví dụ về nhóm tịnh tiến (hoặc nhóm Heisenberg).

**Bài tập 4: Suy ngẫm**
Tại sao nghiên cứu "vô cùng nhỏ" (đại số Lie) lại cho ta biết thông tin về cái "toàn cục" (nhóm Lie)? Có trường hợp nào thông tin bị mất không? (Gợi ý: Nhóm $$SO(3)$$ và $$SU(2)$$ có cùng đại số Lie nhưng cấu trúc tô pô khác nhau - một cái liên thông đơn, một cái không).

---

Trong bài giảng cuối cùng, chúng ta sẽ nhìn lại toàn bộ hành trình dưới lăng kính của vật lý hiện đại: **Hình học của Không gian - Thời gian**, nơi mà hình học vi phân không chỉ là công cụ mô tả, mà chính là bản chất của vũ trụ.

