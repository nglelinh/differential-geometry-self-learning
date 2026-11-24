---
layout: post
lang: vi
title: "Bài 7: Độ cong của Bề mặt — Gauss và Bánh Pizza"
chapter: "03"
order: 2
owner: "Hình học Vi phân"
---

Bạn có bao giờ để ý cách hầu như ai cũng ăn một lát bánh pizza nóng mềm không? Nếu cứ cầm phẳng ra, đầu nhọn của lát bánh lập tức rũ xuống làm rơi sạch phô mai. Thế nhưng chỉ cần kẹp hai mép bánh uốn nhẹ thành hình chữ V theo chiều ngang, lát bánh bỗng dưng đứng thẳng tắp một cách kỳ diệu. Đó không phải là mẹo ẩm thực ngẫu nhiên — đó là một định lý sâu sắc của hình học bề mặt đang diễn ra ngay trên tay bạn.

Ở Bài 6, ta đã dùng dạng cơ bản thứ nhất $$I$$ để đo chiều dài và diện tích *ngay bên trong* bề mặt, như một con kiến không hề biết tới chiều thứ ba. Nhưng một tờ giấy phẳng và một ống trụ tròn có dạng cơ bản thứ nhất giống hệt nhau — con kiến không phân biệt nổi chúng! Vậy cái gì phân biệt mặt phẳng, mặt trụ, mặt cầu và mặt yên ngựa trong không gian $$\mathbb{R}^3$$? Câu trả lời nằm ở **Dạng Cơ bản Thứ hai ($$II$$)** và **Toán tử Hình dáng (Shape Operator)** — những công cụ đo cách bề mặt uốn cong và tách rời khỏi mặt phẳng tiếp tuyến của chính nó.

**Mạch bài học:** Từ phép đo nội tại $$I$$ sang độ lệch khỏi mặt phẳng tiếp tuyến → Toán tử hình dáng $$S = -d\mathcal{N}$$ → Dạng cơ bản thứ hai $$II = L\,du^2 + 2M\,du\,dv + N\,dv^2$$ → Hai độ cong chính $$\kappa_1, \kappa_2$$ → Độ cong Gauss $$K = \kappa_1\kappa_2$$ và độ cong trung bình $$H = \frac{\kappa_1+\kappa_2}{2}$$ → Kiểm tra bằng tay trên paraboloid, mặt yên ngựa và mặt trụ → Phân loại bốn loại điểm trên bề mặt.

## Bản đồ kiến thức nền: Hình học ngoại tại của bề mặt nghiên cứu điều gì?

Với đường cong 1 chiều, tại mỗi điểm chỉ có đúng một hướng để đi nên chỉ cần một con số độ cong $$\kappa$$. Nhưng trên một bề mặt 2 chiều, tại mỗi điểm có vô số hướng xuất phát trên mặt phẳng tiếp tuyến $$T_pS$$ — và bề mặt có thể uốn cong rất khác nhau theo từng hướng. Ba trụ cột sau đây định hình toàn bộ bức tranh của bài học:

### 1. Toán tử hình dáng (Shape Operator / Weingarten Map)
- **Là gì:** Một toán tử tuyến tính đối xứng $$S_p: T_pS \to T_pS$$ đo tốc độ nghiêng của trường vector pháp tuyến đơn vị $$\mathbf{n}$$ khi ta nhích một bước nhỏ theo hướng tiếp tuyến $$\mathbf{v}$$.
- **Nghiên cứu gì:** Chuyển bài toán hình học "bề mặt cong thế nào trong $$\mathbb{R}^3$$?" thành bài toán đại số tuyến tính quen thuộc: tìm trị riêng và vector riêng của một ma trận đối xứng $$2\times 2$$! Nhờ định lý phổ (Spectral Theorem) từ Bài 00.1, $$S_p$$ luôn chéo hóa được trực giao, sinh ra hai phương chính vuông góc nhau.

### 2. Dạng cơ bản thứ hai (Second Fundamental Form)
- **Là gì:** Dạng toàn phương $$II(\mathbf{v}, \mathbf{v}) = \langle S(\mathbf{v}), \mathbf{v} \rangle = L\,du^2 + 2M\,du\,dv + N\,dv^2$$ đo độ lệch bậc hai của bề mặt so với mặt phẳng tiếp tuyến của nó.
- **Nghiên cứu gì:** Định lượng độ cong pháp tuyến $$\kappa_n(\mathbf{v}) = \frac{II(\mathbf{v}, \mathbf{v})}{I(\mathbf{v}, \mathbf{v})}$$ theo mọi hướng $$\mathbf{v}$$. Trong khi $$I$$ là thước đo nội tại (độ dài, góc, diện tích), $$II$$ là thước đo *ngoại tại* ghi lại cách bề mặt uốn mình trong không gian bao quanh $$\mathbb{R}^3$$.

### 3. Hai bất biến của toán tử hình dáng: Độ cong Gauss $$K$$ và Độ cong trung bình $$H$$
- **Là gì:** Mọi ma trận $$2\times 2$$ đối xứng đều có hai bất biến cơ bản không phụ thuộc cơ sở: **định thức** $$K = \det(S) = \kappa_1\kappa_2$$ và **nửa vết** $$H = \frac{1}{2}\operatorname{tr}(S) = \frac{\kappa_1 + \kappa_2}{2}$$.
- **Nghiên cứu gì:** $$K$$ phân loại hình dáng cục bộ (lồi như mặt cầu, yên ngựa, hay trải phẳng được như mặt trụ) và — điều kỳ diệu ở Bài 8 — hóa ra lại là bất biến *nội tại*. Còn $$H$$ điều khiển tốc độ biến đổi diện tích khi đẩy bề mặt theo phương pháp tuyến, nên phương trình $$H = 0$$ chính là phương trình của màng xà phòng và các bề mặt cực tiểu.

## 1. Lời mở đầu: Độ cong trong không gian 2 chiều

Với đường cong 1 chiều, độ cong được hiểu đơn giản là tốc độ quay của vector tiếp tuyến. Nhưng với bề mặt 2 chiều, độ cong phong phú hơn nhiều: tại một điểm trên mặt yên ngựa, bề mặt cong lên theo phương này nhưng lại cong xuống theo phương kia.

Để mô tả đầy đủ cách bề mặt uốn cong trong không gian 3 chiều, ta sử dụng **Dạng Cơ bản Thứ hai (Second Fundamental Form)**. Khác với dạng thứ nhất dùng để đo khoảng cách trên bề mặt, dạng thứ hai đo **mức độ bề mặt tách lệch khỏi mặt phẳng tiếp tuyến**.

## 2. Toán tử Hình dáng (Shape Operator)

Hãy hình dung tại mỗi điểm trên bề mặt có dựng một vector pháp tuyến đơn vị $$\mathbf{n}$$ (như một cột cờ thẳng đứng):
- Trên mặt phẳng: các vector pháp tuyến luôn song song với nhau, $$\mathbf{n}$$ không đổi.
- Trên mặt cầu: vector pháp tuyến nghiêng dần theo mọi hướng khi ta di chuyển.
- Trên mặt trụ: vector pháp tuyến nghiêng đi khi di chuyển vòng quanh trụ, nhưng giữ nguyên hướng khi di chuyển dọc theo đường sinh.

**Toán tử hình dáng ($$S$$, hay $$-d\mathcal{N}$$)** đo tốc độ biến thiên của vector pháp tuyến đơn vị theo một hướng tiếp tuyến $$\mathbf{v}$$:
$$ S(\mathbf{v}) = -\nabla_{\mathbf{v}} \mathbf{n} $$
(Dấu trừ là quy ước để bề mặt lồi theo hướng pháp tuyến ngoài có độ cong dương hoặc đồng nhất dấu theo lựa chọn pháp tuyến).

Vì $$\|\mathbf{n}\|^2 = 1$$ không đổi, đạo hàm theo hướng $$\mathbf{v}$$ cho $$\langle \nabla_{\mathbf{v}}\mathbf{n}, \mathbf{n} \rangle = 0$$, nghĩa là $$S(\mathbf{v})$$ luôn nằm gọn trong mặt phẳng tiếp tuyến $$T_pS$$.

## 3. Dạng Cơ bản Thứ hai: $$II$$

Dạng cơ bản thứ hai biểu diễn thông tin của toán tử hình dáng dưới dạng một dạng toàn phương vô hướng trên mặt phẳng tiếp tuyến:
$$ II(\mathbf{v}, \mathbf{v}) = \langle S(\mathbf{v}), \mathbf{v} \rangle $$

Trong hệ tọa độ tham số $$(u, v)$$, dạng này được viết qua ba hệ số $$L, M, N$$:
$$ II = L\,du^2 + 2M\,du\,dv + N\,dv^2 $$
với $$L = \mathbf{r}_{uu} \cdot \mathbf{n}$$, $$M = \mathbf{r}_{uv} \cdot \mathbf{n}$$ và $$N = \mathbf{r}_{vv} \cdot \mathbf{n}$$.

**Ý nghĩa hình học:** Nếu đặt mặt phẳng tiếp tuyến làm mặt tham chiếu $$z=0$$, thì trong lân cận điểm đang xét, độ cao $$h$$ của bề mặt so với mặt phẳng tiếp tuyến được xấp xỉ bậc hai bởi một paraboloid:
$$ h \approx \frac{1}{2} II(d\mathbf{r}) $$
Như vậy, $$II$$ đo trực tiếp độ lệch theo phương pháp tuyến của bề mặt so với mặt phẳng tiếp tuyến.

## 4. Hai Độ cong Chính

Tại mỗi điểm trên bề mặt, luôn tồn tại một phương mà độ cong pháp tuyến đạt giá trị lớn nhất ($$\kappa_1$$) và một phương đạt giá trị nhỏ nhất ($$\kappa_2$$). Khi $$\kappa_1 \neq \kappa_2$$, hai phương chính này luôn vuông góc với nhau. Hai giá trị $$\kappa_1, \kappa_2$$ được gọi là các **độ cong chính (principal curvatures)** — chính là hai trị riêng của toán tử hình dáng $$S$$.

Ma trận biểu diễn $$S$$ theo cơ sở $$\{\mathbf{r}_u, \mathbf{r}_v\}$$ được tính bằng công thức Weingarten:
$$ [S] = \begin{pmatrix} E & F \\ F & G \end{pmatrix}^{-1} \begin{pmatrix} L & M \\ M & N \end{pmatrix}. $$
Nhờ đó, ta có ngay hai công thức tính trực tiếp từ $$E, F, G$$ và $$L, M, N$$ mà không cần tìm trị riêng trước:
$$ K = \det(S) = \frac{LN - M^2}{EG - F^2}, \qquad H = \frac{1}{2}\operatorname{tr}(S) = \frac{EN - 2FM + GL}{2(EG - F^2)}. $$

### Ví dụ:
- **Mặt cầu bán kính $$R$$:** Mọi phương có cùng độ cong, $$\kappa_1 = \kappa_2 = 1/R$$.
- **Mặt trụ bán kính $$R$$:** Một phương cong tròn ($$\kappa_1 = 1/R$$), phương dọc trục thẳng ($$\kappa_2 = 0$$).
- **Mặt yên ngựa:** Một phương cong lên ($$\kappa_1 > 0$$), một phương cong xuống ($$\kappa_2 < 0$$).

## 5. Độ cong Gauss và Độ cong Trung bình

Từ hai độ cong chính $$\kappa_1, \kappa_2$$, ta xây dựng hai đại lượng đặc trưng quan trọng nhất của bề mặt:

### 5.1. Độ cong Gauss ($$K$$)
$$ K = \kappa_1 \cdot \kappa_2 $$
Tích của hai độ cong chính xác định hình dạng cục bộ của bề mặt:
- $$K > 0$$: Điểm dạng lồi (mặt cầu, elipsoid); thiết diện cắt bởi mặt phẳng song song gần mặt phẳng tiếp tuyến có dạng elip.
- $$K < 0$$: Điểm dạng yên ngựa (paraboloid hyperbolic); thiết diện gần mặt phẳng tiếp tuyến có dạng hyperbol.
- $$K = 0$$: Bề mặt triển khai được (mặt phẳng, mặt trụ, mặt nón); có ít nhất một phương cong bằng không.

**Ví dụ miếng bánh pizza:** Khi cầm một lát bánh pizza phẳng ($$K=0$$), nếu ta uốn cong nó theo chiều ngang ($$\kappa_1 \neq 0$$) mà không kéo giãn hay làm rách vỏ bánh (biến dạng đẳng cự), độ cong Gauss $$K = \kappa_1\kappa_2$$ vẫn phải giữ bằng 0. Do đó độ cong theo chiều dọc $$\kappa_2$$ buộc phải bằng 0, giúp lát bánh giữ thẳng theo chiều dọc thay vì bị rũ xuống.

### 5.2. Độ cong Trung bình ($$H$$)
$$ H = \frac{\kappa_1 + \kappa_2}{2} $$
Trung bình cộng của hai độ cong chính liên hệ trực tiếp với bài toán cực tiểu hóa diện tích và sức căng bề mặt:
- Một màng xà phòng căng trên khung dây (khi áp suất không khí hai phía bằng nhau) co về trạng thái có diện tích cực tiểu cục bộ, thỏa mãn điều kiện cân bằng $$H=0$$.
- Các bề mặt có $$H=0$$ tại mọi điểm được gọi là **bề mặt cực tiểu (minimal surfaces)**; tại mỗi điểm của chúng, $$\kappa_1 = -\kappa_2$$ (độ cong theo hai phương chính có độ lớn bằng nhau nhưng ngược dấu).

## Khung giải thích: Tính tay $$L, M, N$$, $$K$$ và $$H$$ trên ba bề mặt chuẩn (nên đọc chậm)

Đừng chỉ nhìn công thức trừu tượng — hãy lấy giấy bút kiểm tra trực tiếp ba bề mặt kinh điển để thấy ma trận $$[S] = I^{-1} II$$ hoạt động gọn gàng ra sao.

### Mẫu 1: Paraboloid tròn xoay $$z = x^2 + y^2$$ tại gốc $$(0, 0)$$
Tham số hóa $$\mathbf{r}(u, v) = (u, v, u^2 + v^2)$$. Tính các đạo hàm riêng tại $$(u, v) = (0, 0)$$:
- $$\mathbf{r}_u = (1, 0, 2u) \Big|_{(0,0)} = (1, 0, 0)$$, $$\quad \mathbf{r}_v = (0, 1, 2v) \Big|_{(0,0)} = (0, 1, 0)$$.
- Do đó $$E = 1, F = 0, G = 1$$, và vector pháp tuyến đơn vị hướng lên là $$\mathbf{n} = \frac{\mathbf{r}_u \times \mathbf{r}_v}{\|\mathbf{r}_u \times \mathbf{r}_v\|} = (0, 0, 1)$$.
- Đạo hàm cấp hai: $$\mathbf{r}_{uu} = (0, 0, 2)$$, $$\mathbf{r}_{uv} = (0, 0, 0)$$, $$\mathbf{r}_{vv} = (0, 0, 2)$$.
- Chiếu lên $$\mathbf{n} = (0, 0, 1)$$:
  $$ L = \mathbf{r}_{uu}\cdot\mathbf{n} = 2, \qquad M = \mathbf{r}_{uv}\cdot\mathbf{n} = 0, \qquad N = \mathbf{r}_{vv}\cdot\mathbf{n} = 2. $$
- Ma trận toán tử hình dáng tại gốc là $$[S] = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}^{-1}\begin{pmatrix} 2 & 0 \\ 0 & 2 \end{pmatrix} = \begin{pmatrix} 2 & 0 \\ 0 & 2 \end{pmatrix}$$.
- **Kết quả:** $$\kappa_1 = \kappa_2 = 2$$, $$K = 2 \cdot 2 = 4 > 0$$ (điểm **Elliptic**, cong lồi đều theo mọi hướng), và $$H = \frac{2+2}{2} = 2$$.

### Mẫu 2: Mặt yên ngựa $$z = x^2 - y^2$$ tại gốc $$(0, 0)$$
Tham số hóa $$\mathbf{r}(u, v) = (u, v, u^2 - v^2)$$. Tại $$(0,0)$$, mặt phẳng tiếp tuyến vẫn là $$z = 0$$ nên $$E = 1, F = 0, G = 1$$ và $$\mathbf{n} = (0, 0, 1)$$.
- Đạo hàm cấp hai chỉ đổi dấu ở $$\mathbf{r}_{vv}$$:
  $$ \mathbf{r}_{uu} = (0, 0, 2), \qquad \mathbf{r}_{uv} = (0, 0, 0), \qquad \mathbf{r}_{vv} = (0, 0, -2). $$
- Chiếu lên $$\mathbf{n}$$ cho $$L = 2, M = 0, N = -2$$, suy ra $$[S] = \begin{pmatrix} 2 & 0 \\ 0 & -2 \end{pmatrix}$$.
- **Kết quả:** $$\kappa_1 = 2, \kappa_2 = -2$$, suy ra $$K = (2)(-2) = -4 < 0$$ (điểm **Hyperbolic**) và $$H = \frac{2 + (-2)}{2} = 0$$! Hai độ cong ngược dấu triệt tiêu nhau hoàn hảo tại gốc — đúng trạng thái cân bằng của màng xà phòng.

### Mẫu 3: Mặt trụ tròn bán kính $$R$$: $$\mathbf{r}(u, v) = (R\cos u, R\sin u, v)$$
- $$\mathbf{r}_u = (-R\sin u, R\cos u, 0)$$, $$\mathbf{r}_v = (0, 0, 1)$$ nên $$E = R^2, F = 0, G = 1$$.
- Chọn pháp tuyến hướng vào trong trục trụ $$\mathbf{n} = (-\cos u, -\sin u, 0)$$ (nếu chọn hướng ra ngoài, cả $$\kappa_1, H$$ chỉ đổi dấu còn $$K$$ giữ nguyên).
- Đạo hàm cấp hai: $$\mathbf{r}_{uu} = (-R\cos u, -R\sin u, 0)$$, $$\mathbf{r}_{uv} = (0,0,0)$$, $$\mathbf{r}_{vv} = (0,0,0)$$.
- Chiếu lên $$\mathbf{n}$$: $$L = R(\cos^2 u + \sin^2 u) = R$$, $$M = 0$$, $$N = 0$$.
- Ma trận toán tử hình dáng:
  $$ [S] = \begin{pmatrix} R^2 & 0 \\ 0 & 1 \end{pmatrix}^{-1}\begin{pmatrix} R & 0 \\ 0 & 0 \end{pmatrix} = \begin{pmatrix} 1/R & 0 \\ 0 & 0 \end{pmatrix}. $$
- **Kết quả:** $$\kappa_1 = \frac{1}{R}, \kappa_2 = 0$$, nên $$K = 0$$ nhưng $$H = \frac{1}{2R} \neq 0$$ (điểm **Parabolic**). Lưu ý một lỗi hay gặp: nếu quên nhân nghịch đảo $$I^{-1}$$ mà đọc thẳng từ $$L = R$$, ta sẽ nhầm độ cong là $$R$$ thay vì $$1/R$$!

## 6. Phân loại điểm trên bề mặt

Dựa vào dấu của $$K$$ và giá trị của $$H$$, mỗi điểm trên bề mặt được phân thành bốn loại:
1.  **Điểm Elliptic ($$K > 0$$):** Bề mặt nằm hoàn toàn về một phía của mặt phẳng tiếp tuyến (ví dụ: đỉnh núi).
2.  **Điểm Hyperbolic ($$K < 0$$):** Mặt phẳng tiếp tuyến cắt qua bề mặt, khiến bề mặt nằm ở cả hai phía (ví dụ: yên ngựa, đèo giữa hai đỉnh núi).
3.  **Điểm Parabolic ($$K = 0, H \neq 0$$):** Bề mặt cong theo một phương và thẳng theo phương còn lại (ví dụ: điểm trên mặt trụ).
4.  **Điểm Planar ($$K = 0, H = 0$$):** Cả hai độ cong chính đều bằng 0 (bề mặt phẳng cục bộ ở bậc hai).

| Loại điểm | Dấu của $$K = \kappa_1\kappa_2$$ | Giá trị $$H = \frac{\kappa_1+\kappa_2}{2}$$ | Hình dáng cục bộ | Ví dụ chuẩn |
| :--- | :--- | :--- | :--- | :--- |
| **Elliptic** | $$K > 0$$ | $$H \neq 0$$ | Nằm một phía mặt phẳng tiếp tuyến | Mặt cầu, đỉnh paraboloid $$z = x^2 + y^2$$ |
| **Hyperbolic** | $$K < 0$$ | Bất kỳ (có thể $$= 0$$) | Cắt xuyên qua mặt phẳng tiếp tuyến | Yên ngựa $$z = x^2 - y^2$$, mặt catenoid |
| **Parabolic** | $$K = 0$$ | $$H \neq 0$$ | Cong một phương, thẳng phương còn lại | Mặt trụ, mặt nón (bỏ đỉnh) |
| **Planar** | $$K = 0$$ | $$H = 0$$ | Phẳng tới bậc hai | Mặt phẳng, điểm gốc của $$z = x^3 + y^3$$ |

## Video tham khảo

- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, tiếng Anh. Nên xem trước (dài khoảng vài phút): giải thích độ cong Gauss là tích hai độ cong chính và lý do một lát bánh phẳng không thể vừa cong ngang vừa gục dọc.
- [Shape Analysis (Lecture 6): Second fundamental form and surface curvature](https://www.youtube.com/watch?v=UewzuzaPlxA) — Justin Solomon, tiếng Anh. Trình bày dạng cơ bản thứ hai, độ cong Gauss, độ cong trung bình và cách phân loại điểm elliptic, parabolic, hyperbolic trên lưới bề mặt.
- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, tiếng Anh. Liên kết dạng cơ bản thứ hai với đạo hàm của ánh xạ pháp tuyến, khớp với định nghĩa toán tử hình dáng ở đầu bài.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Mặt trụ:** Tính hai độ cong chính $$\kappa_1, \kappa_2$$ cho mặt trụ bán kính $$R$$ và kiểm tra rằng $$K=0$$.
2.  **Mặt yên ngựa:** Xét bề mặt $$z = x^2 - y^2$$ (paraboloid hyperbolic — mặt yên ngựa):
    - Tại gốc $$(0,0)$$, cắt theo trục $$x$$ được parabol $$z=x^2$$ (cong lên, $$\kappa_1 = 2$$).
    - Cắt theo trục $$y$$ được parabol $$z=-y^2$$ (cong xuống, $$\kappa_2 = -2$$).
    - Tính độ cong Gauss $$K$$ và độ cong trung bình $$H$$ tại gốc tọa độ.
3.  **Suy ngẫm:** Vì sao vỏ trứng dù rất mỏng nhưng khó bị bóp vỡ khi chịu lực ép đều trong lòng bàn tay? (Gợi ý: Vỏ trứng có độ cong Gauss dương; muốn làm phẳng nó phải làm thay đổi metric, tức nén hoặc kéo rách vật liệu, đòi hỏi lực lớn hơn nhiều so với việc uốn một tờ giấy có $$K=0$$).

---
*Ta đã định nghĩa độ cong bề mặt dựa trên vector pháp tuyến $$\mathbf{n}$$ trong không gian bao quanh. Liệu một sinh vật sống ngay trên bề mặt (không quan sát được $$\mathbf{n}$$) có thể xác định độ cong hay không? Bài tiếp theo sẽ trả lời câu hỏi này qua Định lý Theorema Egregium của Gauss.*
