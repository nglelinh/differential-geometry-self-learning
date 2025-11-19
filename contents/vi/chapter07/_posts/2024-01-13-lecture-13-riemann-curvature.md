---
layout: post
lang: vi
title: "Bài 13: Độ cong Riemann — Cái nhìn Tái ngộ"
chapter: "07"
order: 1
owner: "Hình học Vi phân"
---

## Tổng quan

Trong các bài giảng về bề mặt (2D), chúng ta đã học về độ cong Gauss $$K$$. Đó là một con số duy nhất tại mỗi điểm, cho biết bề mặt lồi hay lõm. Nhưng khi bước sang các không gian có số chiều cao hơn (3 chiều, 4 chiều...), độ cong trở nên phức tạp hơn nhiều. Nó không thể được mô tả bởi một con số duy nhất nữa.

Tại sao? Vì trong không gian 3 chiều, một vật thể có thể cong theo nhiều cách khác nhau tùy thuộc vào mặt phẳng cắt mà bạn chọn. Để mô tả trọn vẹn sự cong này, chúng ta cần một đối tượng toán học mạnh mẽ hơn: *Tensor độ cong Riemann* (Riemann Curvature Tensor).

Tensor Riemann là "quái vật" của hình học vi phân. Nó là một tensor hạng 4 (có 4 chỉ số), chứa đựng mọi thông tin về độ cong của không gian. Từ tensor này, chúng ta có thể rút gọn (co thắt) để thu được các đại lượng đơn giản hơn nhưng vẫn quan trọng: *Độ cong Ricci* (quan trọng trong phương trình Einstein) và *Độ cong vô hướng* (Scalar curvature).

Bài giảng này sẽ giải mã ý nghĩa hình học của tensor Riemann: nó đo lường sự "không giao hoán" của các đạo hàm hiệp biến, hay nói cách khác, sự thất bại của việc quay về điểm xuất phát sau khi vận chuyển song song quanh một vòng kín nhỏ.

## 2. Giải thích Trực quan

### 2.1. Vận chuyển Song song quanh Vòng kín

Hãy tưởng tượng bạn đi một vòng tròn nhỏ trên mặt đất. Bạn cầm theo một vector và cố gắng giữ nó song song.
- Nếu mặt đất phẳng: Khi quay về điểm xuất phát, vector vẫn chỉ hướng cũ.
- Nếu mặt đất cong (mặt cầu): Khi quay về, vector bị lệch đi một góc $$\alpha$$.

Góc lệch này tỉ lệ thuận với diện tích của vòng tròn bạn đi và độ cong của mặt đất tại đó. Tensor Riemann chính là cỗ máy đo lường góc lệch này cho mọi hướng đi và mọi mặt phẳng định hướng có thể.

> [!TIP]
> **Hình dung "Đi bộ với La bàn":**
> Tưởng tượng bạn là một nhà thám hiểm cầm la bàn (vector).
> - Bạn đi từ Xích đạo lên Cực Bắc (kim chỉ Bắc).
> - Tại Cực Bắc, bạn rẽ phải 90 độ và đi xuống Xích đạo (kim vẫn chỉ hướng cũ trong không gian, nhưng so với đường kinh tuyến mới thì nó đã xoay).
> - Khi bạn quay về điểm xuất phát theo đường Xích đạo, kim la bàn của bạn sẽ chỉ khác so với lúc bắt đầu.
> - Sự "lệch kim" này chính là bằng chứng cho thấy bạn đang đi trên một mặt cong.

### 2.2. Sự Không Giao hoán của Đạo hàm

Trong giải tích phẳng, thứ tự đạo hàm không quan trọng: $$\frac{\partial^2 f}{\partial x \partial y} = \frac{\partial^2 f}{\partial y \partial x}$$.
Nhưng trên đa tạp cong, đạo hàm hiệp biến không giao hoán!
$$
\nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z \neq \nabla_{[X,Y]} Z
$$
Sự khác biệt giữa hai cách đi này chính là độ cong:
$$
R(X, Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z
$$
Độ cong là thước đo mức độ mà chúng ta không thể đóng kín một hình bình hành vi phân bằng cách vận chuyển song song.

> [!NOTE]
> **Sự phụ thuộc vào Đường đi (Path Dependence):**
> - Đi sang Đông 1km rồi đi về Bắc 1km.
> - Đi về Bắc 1km rồi đi sang Đông 1km.
> Trên mặt phẳng, bạn đến cùng một điểm. Trên mặt cầu, bạn đến hai điểm khác nhau!
> Tensor Riemann đo lường sự "thất bại" trong việc khép kín hình bình hành này.

### 2.3. Lực Thủy triều (Tidal Forces)

Trong vật lý Newton, trọng lực là một lực vector. Trong Thuyết tương đối rộng, trọng lực là độ cong. Biểu hiện vật lý của độ cong không-thời gian chính là *lực thủy triều*.
Hãy tưởng tượng hai hạt rơi tự do song song với nhau về phía Trái Đất. Vì cả hai đều hướng về tâm Trái Đất, chúng sẽ dần dần tiến lại gần nhau. Sự thay đổi khoảng cách tương đối giữa hai đường trắc địa (geodesic deviation) này được mô tả chính xác bởi phương trình chứa Tensor Riemann.
$$
\frac{D^2 J}{dt^2} = -R(T, J)T
$$
Trong đó $$J$$ là vector phân cách (deviation vector) và $$T$$ là vector vận tốc.

> [!IMPORTANT]
> **Hình dung "Hai Quả Táo Rơi":**
> Thả hai quả táo rơi tự do cạnh nhau phía trên Trái Đất.
> - Theo Newton: Có một "lực" hút chúng vào nhau.
> - Theo Einstein: Không có lực nào cả. Cả hai đều đang đi "thẳng" (trắc địa) trong không-thời gian cong. Vì không gian bị cong (do Trái Đất), hai đường thẳng song song ban đầu sẽ tự động hội tụ.
> - Tensor Riemann chính là công cụ toán học mô tả tốc độ hội tụ đó.

## 3. Định nghĩa Hình thức và Ký hiệu

### 3.1. Tensor Độ cong Riemann

**Định nghĩa:**
Cho $$M$$ là đa tạp Riemann với liên kết Levi-Civita $$\nabla$$. *Tensor độ cong Riemann* $$R$$ là một trường tensor kiểu (1, 3) được định nghĩa bởi:
$$
R(X, Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X, Y]} Z
$$
với $$X, Y, Z$$ là các trường vector.

Trong hệ tọa độ địa phương:
$$
R(\partial_i, \partial_j)\partial_k = R^l_{ijk} \partial_l
$$
Các thành phần $$R^l_{ijk}$$ được tính qua các ký hiệu Christoffel:
$$
R^l_{ijk} = \partial_j \Gamma^l_{ik} - \partial_k \Gamma^l_{ij} + \Gamma^l_{jm} \Gamma^m_{ik} - \Gamma^l_{km} \Gamma^m_{ij}
$$

### Các Tính chất Đối xứng

Tensor Riemann (khi hạ chỉ số đầu tiên xuống thành $$R_{ijkl} = g_{lm}R^m_{ijk}$$) có các tính chất đối xứng rất đẹp:
1.  **Phản đối xứng cặp đầu:** $$R_{jikl} = -R_{ijkl}$$
2.  **Phản đối xứng cặp cuối:** $$R_{ijlk} = -R_{ijkl}$$
3.  **Đối xứng hoán vị cặp:** $$R_{klij} = R_{ijkl}$$
7.  **Đồng nhất thức Bianchi I:** $$R_{ijkl} + R_{iljk} + R_{iklj} = 0$$

Nhờ các đối xứng này, số thành phần độc lập của Riemann giảm đi rất nhiều. Trong 2D chỉ có 1 thành phần (Độ cong Gauss). Trong 3D có 6. Trong 4D (không-thời gian) có 20.

> [!NOTE]
> **Tại sao cần nhiều đối xứng thế? (Giảm dư thừa)**
> Hãy tưởng tượng Tensor Riemann như một file ảnh nén.
> - File gốc (không nén) có $$n^4$$ pixel (thành phần). Với $$n=4$$, đó là $$256$$ số! Quá nhiều để xử lý.
> - Các tính chất đối xứng giống như thuật toán nén: nó bảo rằng "pixel này giống pixel kia", "pixel này ngược dấu pixel nọ".
> - Kết quả: Chúng ta chỉ cần lưu trữ 20 số (trong 4D) để tái tạo lại toàn bộ bức tranh độ cong.

### Tensor Ricci và Độ cong Vô hướng

Từ Riemann, ta có thể lấy "trung bình" (co thắt) để được các đại lượng đơn giản hơn:

1.  **Tensor Ricci (Ric):** Là tensor hạng (0, 2) đối xứng, thu được bằng cách co thắt chỉ số đầu và thứ ba của Riemann:
    $$
    R_{ij} = R^k_{ikj}
    $$
    Nó đo lường sự thay đổi thể tích của một khối cầu nhỏ khi di chuyển dọc theo đường trắc địa.

2.  **Độ cong Vô hướng (Scalar Curvature - R hoặc S):** Là một số thực tại mỗi điểm, thu được bằng cách co thắt Ricci với metric:
    $$
    S = g^{ij} R_{ij}
    $$
    Đây là độ cong "trung bình" nhất.

### Độ cong Mặt cắt (Sectional Curvature)

Nếu $$K(p, \sigma)$$ là độ cong Gauss của một mặt cắt 2 chiều $$\sigma \subset T_pM$$ tại điểm $$p$$, thì $$K(p, \sigma)$$ xác định hoàn toàn tensor Riemann. Đây là cách kết nối độ cong Gauss cổ điển với tensor Riemann hiện đại.

## Hình ảnh minh họa

![Sự lệch của đường trắc địa](https://upload.wikimedia.org/wikipedia/commons/a/a2/Geodesic_deviation_on_a_sphere.svg)

*Mô tả:* Hai đường kinh tuyến trên mặt cầu xuất phát song song tại xích đạo nhưng hội tụ gặp nhau tại cực. Hình ảnh minh họa phương trình độ lệch geodesic và ý nghĩa của độ cong dương.

![Giao hoán tử của đạo hàm](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Parallel_transport.png/600px-Parallel_transport.png)

*Mô tả:* Một sơ đồ minh họa con đường đi: Đi theo X rồi Y ($$\nabla_Y \nabla_X$$) so với đi theo Y rồi X ($$\nabla_X \nabla_Y$$). Sự khác biệt ở điểm đích chính là vector độ cong.

![Lực thủy triều](https://upload.wikimedia.org/wikipedia/commons/5/56/Tidal-forces.svg)

*Mô tả:* Trái Đất làm cong không gian xung quanh. Một đám mây các hạt hình cầu rơi xuống Trái Đất sẽ bị kéo dãn dọc (theo hướng rơi) và nén ngang. Đây là tác dụng của tensor Riemann (cụ thể là thành phần tensor Weyl).

## Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1.  **Riemann, Bernhard (1854).** *Über die Hypothesen, welche der Geometrie zu Grunde liegen*.
    Bài giảng huyền thoại nơi Riemann giới thiệu tensor độ cong lần đầu tiên (dưới dạng lời văn, chưa phải công thức tensor hiện đại), tổng quát hóa khái niệm độ cong của Gauss cho $$n$$ chiều.

2.  **Einstein, Albert (1915).**
    Sử dụng tensor Ricci và độ cong vô hướng để viết nên phương trình trường hấp dẫn.

3.  **Milnor, John (1963).** *Morse Theory*.
    Sử dụng độ cong để nghiên cứu tô pô của đa tạp, cho thấy mối liên hệ sâu sắc giữa hình học vi phân (cục bộ) và tô pô (toàn cục).

4.  **Petersen, Peter (2016).** *Riemannian Geometry*.
    Sách giáo khoa chuyên sâu về các loại độ cong và ý nghĩa hình học của chúng.

## Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### Vật lý: Phương trình Einstein
Phương trình trung tâm của Thuyết tương đối rộng:
$$
R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu}
$$
Vế trái hoàn toàn là hình học (Ricci, Scalar curvature, Metric). Vế phải là vật chất (Năng lượng - Xung lượng). Câu nói nổi tiếng của John Wheeler: *"Vật chất bảo không gian cong thế nào, không gian bảo vật chất di chuyển thế nào"*.

### Tô pô: Định lý Gauss-Bonnet Tổng quát
Tích phân của độ cong (cụ thể là một dạng gọi là lớp Euler hoặc lớp Chern-Gauss-Bonnet) trên toàn bộ đa tạp cho ta một số nguyên: Đặc trưng Euler $$\chi(M)$$. Đây là cầu nối tuyệt vời giữa hình học và tô pô.

### Phân tích Dữ liệu: Manifold Learning
Trong học máy, khái niệm độ cong được dùng để hiểu cấu trúc của dữ liệu. Nếu dữ liệu nằm trên một đa tạp có độ cong lớn, các thuật toán tuyến tính (như PCA) sẽ hoạt động kém. Các metric độ cong giúp đánh giá độ phức tạp của mô hình dữ liệu.

## Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Số thành phần**
Tensor Riemann trong không gian $$n$$ chiều có $$n^4$$ thành phần. Nhưng nhờ các đối xứng, số thành phần độc lập là $$n^2(n^2-1)/12$$.
- Với $$n=2$$ (mặt phẳng, mặt cầu): Có bao nhiêu thành phần độc lập? (Đáp án: 1 - chính là $$K$$).
- Với $$n=3$$: Có bao nhiêu? (Đáp án: 6 - tương đương với số thành phần của Ricci).
- Với $$n=4$$: Có bao nhiêu? (Đáp án: 20).

**Bài tập 2: Độ cong của không gian phẳng**
Chứng minh rằng nếu không gian là phẳng (Euclid), tức là tồn tại hệ tọa độ sao cho $$g_{ij} = \text{const}$$, thì tensor Riemann bằng 0 tại mọi điểm.

**Bài tập 3: Tính độ cong (Thử thách)**
Cho mặt cầu đơn vị $$S^2$$ với metric $$ds^2 = d\theta^2 + \sin^2\theta d\phi^2$$. Tính một thành phần khác không của tensor Riemann, ví dụ $$R^\theta_{\phi \theta \phi}$$. (Sử dụng công thức Christoffel từ bài trước).

**Bài tập 4: Suy ngẫm**
Nếu Tensor Ricci bằng 0 tại mọi điểm (Ricci-flat), liệu không gian có nhất thiết phải phẳng (Riemann = 0) không?
(Gợi ý: Trong 2D và 3D thì có, nhưng từ 4D trở lên thì không. Đây là cơ sở cho sự tồn tại của sóng hấp dẫn trong chân không).

---

Trong bài giảng tiếp theo, chúng ta sẽ tổng hợp lại tất cả các cấu trúc đã học để có cái nhìn toàn cảnh về một **Đa tạp Riemann**: một không gian được trang bị đầy đủ các công cụ để đo đạc và tính toán.

