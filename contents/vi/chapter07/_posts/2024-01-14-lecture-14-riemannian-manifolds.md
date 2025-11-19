---
layout: post
lang: vi
title: "Bài 14: Đa tạp Riemann và Cấu trúc Hình học"
chapter: "07"
order: 2
owner: "Hình học Vi phân"
---

## Tổng quan

Cho đến nay, chúng ta đã nghiên cứu các mảnh ghép riêng lẻ: vector, covector, tensor, liên kết, độ cong. Bài giảng này là lúc chúng ta ghép tất cả lại thành một bức tranh hoàn chỉnh: *Đa tạp Riemann* (Riemannian Manifold).

Đa tạp Riemann là sân chơi chính của hình học hiện đại. Đó là một không gian topo trơn tru, được trang bị một công cụ đo lường (metric) tại mọi điểm. Chỉ cần có metric, toàn bộ cấu trúc hình học sẽ tự động xuất hiện:
- Chúng ta có thể đo độ dài đường cong.
- Chúng ta có thể xác định đường ngắn nhất (trắc địa).
- Chúng ta có một liên kết tự nhiên (Levi-Civita) để lấy đạo hàm.
- Chúng ta có độ cong Riemann để đo độ uốn của không gian.
- Chúng ta có thể đo thể tích (thông qua định thức của metric).

Trong bài giảng này, chúng ta sẽ định nghĩa chính thức Đa tạp Riemann, khái niệm đẳng cự (isometry - khi nào hai không gian là "giống nhau"), và tính đầy đủ (completeness) - một tính chất toàn cục quan trọng. Chúng ta cũng sẽ lướt qua Định lý Hopf-Rinow, một kết quả tuyệt đẹp liên kết tính đầy đủ metric với tính đầy đủ geodesic.

## 2. Giải thích Trực quan

### 2.1. Trang bị Metric cho Đa tạp

Hãy tưởng tượng một tấm vải cao su (đa tạp trơn). Nó có thể co giãn tùy ý, nên khái niệm "khoảng cách" chưa có ý nghĩa.
Bây giờ, tại mỗi điểm trên tấm vải, bạn vẽ một hình elip nhỏ (indicatrix). Hình elip này quy định "độ dài đơn vị" theo các hướng khác nhau tại điểm đó.
- Nếu các hình elip đều là hình tròn bằng nhau: Không gian phẳng đều (Euclid).
- Nếu các hình elip thay đổi kích thước và hình dạng từ điểm này sang điểm khác: Không gian bị cong và biến dạng.

Tập hợp toàn bộ các hình elip này chính là *Metric Riemann*. Khi đã có metric, tấm vải trở nên cứng cáp về mặt hình học: khoảng cách giữa hai điểm bất kỳ là cố định (là độ dài sợi dây ngắn nhất nối chúng trên bề mặt).

> [!TIP]
> **Hình dung "Địa hình Chi phí Biến đổi":**
> Hãy nghĩ về đa tạp như một bản đồ địa hình.
> - Có chỗ là đường nhựa (đi nhanh, chi phí thấp).
> - Có chỗ là đầm lầy (đi chậm, chi phí cao).
> - Metric $$g$$ tại mỗi điểm cho biết "chi phí" (độ dài) để đi một bước nhỏ theo một hướng nhất định.
> - Đường trắc địa là con đường tốn ít chi phí nhất để đi từ A đến B.

### 2.2. Đẳng cự: Hai thế giới hay Một?

Giả sử bạn có một tờ giấy phẳng và một hình trụ (cuộn từ tờ giấy đó).
Nếu bạn là một sinh vật 2D sống trên đó, liệu bạn có phân biệt được hai không gian này không?
Câu trả lời phụ thuộc vào việc bạn có đi một vòng quanh hình trụ hay không. Về mặt *cục bộ* (trong một vùng nhỏ), mọi phép đo độ dài và góc trên hình trụ y hệt như trên mặt phẳng. Ta nói mặt phẳng và mặt trụ là *đẳng cự cục bộ* (locally isometric).
Tuy nhiên, về mặt *toàn cục*, chúng khác nhau (hình trụ có vòng kín không co về 0 được). Hình học Riemann nghiên cứu cả tính chất cục bộ (độ cong) và toàn cục (tô pô, đường trắc địa đóng).

> [!NOTE]
> **Thế giới Pac-Man:**
> Hãy nhớ lại trò chơi Pac-Man. Khi Pac-Man đi ra khỏi mép phải màn hình, nó xuất hiện lại ở mép trái.
> - Về mặt cục bộ: Thế giới Pac-Man phẳng lì giống như màn hình máy tính.
> - Về mặt toàn cục: Nó thực chất là một cái bánh xe (torus) phẳng!
> - Một cư dân trong thế giới Pac-Man sẽ thấy không gian phẳng, nhưng nếu đi mãi về một hướng, anh ta sẽ quay lại chỗ cũ. Đó là sự khác biệt về tô pô dù metric là phẳng (đẳng cự cục bộ với mặt phẳng).

### 2.3. Tính Đầy đủ (Completeness)

Một không gian được gọi là "đầy đủ" nếu bạn có thể đi mãi mãi theo bất kỳ hướng trắc địa nào mà không bao giờ "rơi ra khỏi mép" của không gian.
- Mặt phẳng $$\mathbb{R}^2$$: Đầy đủ.
- Hình tròn mở (không lấy biên): Không đầy đủ. Bạn đi đến biên và "hết đường" dù độ dài đường đi là hữu hạn.
- Mặt cầu: Đầy đủ (bạn đi vòng quanh và quay lại).

> [!IMPORTANT]
> **Hình dung "Con Kiến trên Bàn":**
> - Nếu con kiến bò trên một cái bàn vô hạn: Nó bò mãi không bao giờ dừng (Đầy đủ).
> - Nếu con kiến bò trên một cái bàn hữu hạn (có mép): Nó bò đến mép và... rơi xuống đất (Không đầy đủ).
> - Nếu con kiến bò trên một quả bóng: Nó bò mãi, vòng vo tam quốc nhưng không bao giờ rơi ra ngoài (Đầy đủ).
> Tính đầy đủ đảm bảo rằng "vũ trụ" của chúng ta không có "lỗ hổng" hay "biên giới" bất ngờ.

## Định nghĩa Hình thức và Ký hiệu

### Đa tạp Riemann

**Định nghĩa:**
Một *Đa tạp Riemann* là một cặp $$(M, g)$$, trong đó:
- $$M$$ là một đa tạp trơn $$n$$ chiều.
- $$g$$ là một metric Riemann trên $$M$$, tức là một trường tensor kiểu (0, 2) đối xứng, xác định dương tại mọi điểm.
$$
g_p: T_pM \times T_pM \to \mathbb{R}
$$
Trong tọa độ địa phương: $$g = g_{ij} dx^i \otimes dx^j$$.

### Khoảng cách Riemann

**Định nghĩa:**
Độ dài của một đường cong trơn từng khúc $$\gamma: [a, b] \to M$$ được tính bởi:
$$
L(\gamma) = \int_a^b \sqrt{g(\dot{\gamma}(t), \dot{\gamma}(t))} dt
$$
Khoảng cách giữa hai điểm $$p, q \in M$$, ký hiệu $$d(p, q)$$, là infimum (cận dưới lớn nhất) của độ dài tất cả các đường cong trơn nối $$p$$ và $$q$$.
$$
d(p, q) = \inf \{ L(\gamma) \mid \gamma(a)=p, \gamma(b)=q \}
$$
Với khoảng cách này, $$(M, d)$$ trở thành một không gian metric (theo nghĩa tô pô).

### Đẳng cự (Isometry)

**Định nghĩa:**
Một vi phôi (diffeomorphism) $$\varphi: (M, g) \to (N, h)$$ là một *đẳng cự* nếu nó bảo toàn metric:
$$
\varphi^* h = g
$$
Tức là với mọi $$u, v \in T_pM$$:
$$
h_{\varphi(p)}(d\varphi_p(u), d\varphi_p(v)) = g_p(u, v)
$$
Hai đa tạp Riemann được gọi là đẳng cự nếu tồn tại một phép đẳng cự giữa chúng. Về mặt hình học Riemann, chúng là một.

### Định lý Hopf-Rinow

**Định lý:**
Cho $$(M, g)$$ là một đa tạp Riemann liên thông. Các mệnh đề sau là tương đương:
1.  $$M$$ là một không gian metric đầy đủ (mọi dãy Cauchy đều hội tụ).
2.  $$M$$ là đầy đủ trắc địa (geodesically complete): mọi đường trắc địa $$\gamma(t)$$ đều có thể xác định với mọi $$t \in \mathbb{R}$$.
3.  Mọi tập con đóng và bị chặn của $$M$$ đều compact (tính chất Heine-Borel).

**Hệ quả quan trọng:**
Nếu $$M$$ đầy đủ, thì với bất kỳ hai điểm $$p, q \in M$$, luôn *tồn tại* một đường trắc địa nối chúng có độ dài bằng đúng khoảng cách $$d(p, q)$$ (đường ngắn nhất).

## Hình ảnh minh họa

![Đa tạp Riemann 2D](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)

*Mô tả:* Một bề mặt đồi núi mấp mô. Tại mỗi điểm có một cặp vector cơ sở trực giao (nhỏ xíu) biểu diễn metric. Lưới trắc địa bao phủ bề mặt.

![Đẳng cự cục bộ](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Cylinder_net.png/600px-Cylinder_net.png)

*Mô tả:* Hình ảnh một tờ giấy được uốn thành hình nón (trừ đỉnh). Một tam giác vẽ trên giấy vẫn giữ nguyên độ dài các cạnh và góc khi nằm trên hình nón. Minh họa cho việc hình nón có độ cong bằng 0 ở mọi nơi trừ đỉnh.

![Tính đầy đủ](https://upload.wikimedia.org/wikipedia/commons/5/5a/Riemannian_manifold_completeness.png)

*Mô tả:* So sánh mặt phẳng (đầy đủ - người đi bộ đi mãi) và mặt phẳng thủng một lỗ (không đầy đủ - người đi bộ rơi vào hố đen).

## Các Công trình Nền tảng & Tài liệu Tham khảo

🧠 **Các Công trình Nền tảng & Tài liệu Tham khảo**

1.  **Riemann, Bernhard (1854).**
    Vẫn là bài giảng nền tảng của Riemann, nơi ông đề xuất khái niệm "đa tạp lượng" (measure manifold) mà sau này gọi là đa tạp Riemann.

2.  **Nash, John (1956).** *The Imbedding Problem for Riemannian Manifolds*.
    Định lý nhúng Nash nổi tiếng: Mọi đa tạp Riemann đều có thể nhúng đẳng cự vào một không gian Euclid $$\mathbb{R}^N$$ với số chiều đủ lớn. (Dù chúng ta thường nghiên cứu nội tại, nhưng định lý này bảo đảm chúng ta không đang nghiên cứu thứ gì đó quá trừu tượng).

3.  **Gromov, Mikhael (1981).** *Metric Structures for Riemannian and Non-Riemannian Spaces*.
    Một cái nhìn hiện đại và tổng quát hơn về hình học metric, vượt ra ngoài khuôn khổ Riemann trơn.

4.  **Jost, Jürgen (2011).** *Riemannian Geometry and Geometric Analysis*.
    Tài liệu tham khảo sâu sắc về mối liên hệ giữa giải tích (phương trình đạo hàm riêng) và hình học trên đa tạp.

## Ứng dụng và Kết nối Liên ngành

🔗 **Ứng dụng và Kết nối Liên ngành**

### Thị giác Máy tính: Biến dạng Hình ảnh
Khi so sánh hai hình dạng 3D (ví dụ: hai tư thế của một người), chúng ta coi bề mặt cơ thể người là một đa tạp Riemann. Sự thay đổi tư thế là một phép biến đổi "gần như đẳng cự" (giữ nguyên độ dài da, chỉ thay đổi độ uốn các khớp). Khoảng cách trắc địa trên bề mặt là thước đo tốt hơn khoảng cách Euclid trong không gian để nhận dạng đặc trưng.

### Robot: Không gian Cấu hình
Không gian cấu hình của một robot (tập hợp tất cả các trạng thái khớp nối) là một đa tạp. Để điều khiển robot di chuyển mượt mà và tốn ít năng lượng nhất, ta định nghĩa một metric Riemann trên không gian cấu hình này (dựa trên ma trận khối lượng/quán tính). Bài toán điều khiển trở thành bài toán tìm đường trắc địa trên đa tạp này.

### Thống kê: Hình học Thông tin (Information Geometry)
Tập hợp các phân bố xác suất (ví dụ: họ phân bố Gauss với tham số $$\mu, \sigma$$) tạo thành một đa tạp Riemann. Metric trên đa tạp này gọi là *Metric Fisher-Information*. Khoảng cách giữa hai phân bố xác suất được đo bằng khoảng cách trắc địa trên đa tạp thống kê này, không phải là khoảng cách Euclid giữa các tham số.

## Bài tập và Suy ngẫm

🧩 **Bài tập và Suy ngẫm**

**Bài tập 1: Metric của Nửa mặt phẳng trên (Poincaré Half-plane)**
Xét nửa mặt phẳng trên $$H = \{(x, y) \in \mathbb{R}^2 \mid y > 0\}$$ với metric:
$$
g = \frac{dx^2 + dy^2}{y^2}
$$
Hãy tính độ dài của đoạn thẳng đứng nối $$(0, 1)$$ và $$(0, y_0)$$.
Khi $$y \to 0$$, độ dài này tiến tới đâu? Điều này có ý nghĩa gì về "khoảng cách" tới trục hoành? (Gợi ý: Trục hoành ở "vô cực").

**Bài tập 2: Đẳng cự**
Chứng minh rằng phép tịnh tiến $$(x, y) \to (x+a, y)$$ và phép vị tự $$(x, y) \to (kx, ky)$$ là các phép đẳng cự của nửa mặt phẳng Poincaré ở trên? (Thay vào công thức metric để kiểm tra).

**Bài tập 3: Thể tích**
Thể tích (hoặc diện tích trong 2D) trên đa tạp Riemann được tính bằng $$\int \sqrt{\det(g)} dx^1 \dots dx^n$$.
Hãy tính diện tích của một hình chữ nhật $$0 \le x \le 1, 1 \le y \le A$$ trong nửa mặt phẳng Poincaré.

**Bài tập 4: Suy ngẫm**
Tại sao Định lý Hopf-Rinow lại quan trọng? Nếu vũ trụ của chúng ta không đầy đủ về mặt trắc địa (ví dụ có các điểm kỳ dị không thời gian - Big Bang hoặc Hố đen), điều đó có ý nghĩa gì đối với quá khứ và tương lai của các hạt vật chất?

---

Trong bài giảng tiếp theo, chúng ta sẽ tìm hiểu về **Nhóm Lie**: những đối tượng toán học đẹp đẽ vừa là đa tạp trơn, vừa là nhóm đại số. Chúng là công cụ chính để mô tả tính đối xứng trong hình học và vật lý.

