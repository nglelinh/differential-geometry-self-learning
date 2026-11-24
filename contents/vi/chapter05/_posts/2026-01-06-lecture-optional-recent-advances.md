---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Dạng vi phân, đại số Clifford, và mạng đẳng biến"
chapter: "05"
order: 2
owner: "Hình học Vi phân"
lesson_type: optional
---

Nếu đưa tọa độ của một phân tử hay một cánh tay robot vào một mạng nơ-ron thông thường, rồi xoay toàn bộ căn phòng đi $$37^\circ$$, mạng nơ-ron sẽ "hoảng loạn" nhìn thấy một mảng số hoàn toàn xa lạ — trừ khi bạn ép nó học hàng triệu bản sao đã xoay. Tại sao lại như vậy? Bởi mạng nơ-ron cổ điển nhồi nhét mọi thứ — khối lượng (vô hướng bậc 0), vận tốc (vector bậc 1), mô-men xoắn hay diện tích có hướng (song vector / 2-form bậc 2) — vào chung một danh sách số phẳng lì, xóa sạch ký ức về hình học không gian!

Vào năm 2023, một làn sóng nghiên cứu nổi bật tại NeurIPS đã quay về tận gốc **dạng vi phân** và **đại số Clifford** (tích hình học thế kỷ 19) để giải bài toán đó: *Clifford Group Equivariant Neural Networks* (CGENN — Ruhe, Brandstetter, Forré, 2023) và *Geometric Algebra Transformer* (GATr — Brehmer, de Haan, Behrends, Cohen, 2023). Thay vì bắt mạng tự đoán lại định luật quay của không gian 3D, họ cấy thẳng cấu trúc phân bậc của đa vector vào từng lớp mạng!

**Mạch bài học:** Bản đồ kiến thức nền (từ tích nêm đến tích hình học Clifford và tính đẳng biến) → Trực giác đa vector & mạng đẳng biến → Định nghĩa hình thức đại số Clifford → Ví dụ tính tay cầm tay chỉ việc: nhân hai vector trong đại số Clifford $$\mathrm{Cl}(\mathbb{R}^2)$$ và kiểm tra phép quay/phản xạ → Khung giải thích chậm: 3 bước từ đại số Clifford đến CGENN và GATr → Ứng dụng, Video & Bài tập.

---

## Bản đồ kiến thức nền: Đại số Clifford và Tính đẳng biến trong Học sâu hình học là gì?

### 1. Từ Tích nêm $$\wedge$$ sang Tích hình học Clifford
Ở Bài 10, tích ngoài $$u \wedge v$$ chỉ giữ lại phần **phản đối xứng** (mảnh diện tích có hướng, bậc 2) và vứt bỏ độ dài/góc giữa hai vector. **Đại số Clifford** (William Kingdon Clifford, 1878) hợp nhất tích vô hướng đối xứng $$\langle u, v \rangle$$ (bậc 0) và tích nêm phản đối xứng $$u \wedge v$$ (bậc 2) vào một phép nhân duy nhất:

$$
uv = \langle u, v \rangle + u \wedge v.
$$

### 2. Không gian đa vector phân bậc (Graded Multivectors)
Trong không gian 3 chiều $$\mathbb{R}^3$$, một phần tử của đại số Clifford (gọi là **đa vector**) có đúng $$2^3 = 8$$ thành phần, chia rạch ròi thành 4 bậc: **1 vô hướng** (bậc 0), **3 vector** (bậc 1), **3 song vector / 2-form** (bậc 2), và **1 giả vô hướng / thể tích có hướng** (bậc 3). Khi bổ sung thêm tọa độ xạ ảnh (để biểu diễn cả phép tịnh tiến), **đại số hình học xạ ảnh** $$\mathbb{G}(3,0,1)$$ có $$2^4 = 16$$ chiều — chính là không gian biểu diễn lõi của **GATr**!

### 3. Tính đẳng biến (Equivariance) — lời hứa hình học của mạng nơ-ron
Một lớp mạng $$f$$ gọi là **đẳng biến** dưới nhóm đối xứng $$G$$ (như $$O(n)$$ hay $$E(3)$$) nếu quay/dịch đầu vào rồi cho qua mạng cho kết quả giống hệt việc cho qua mạng trước rồi mới quay/dịch đầu ra: $$f(\rho(g)x) = \rho(g)f(x)$$. Nhờ dùng đa vector, vô hướng tự động giữ nguyên, vector tự động quay theo $$g$$, còn 2-form tự động biến đổi như mặt phẳng có hướng!

---

## Tổng quan

Dạng vi phân là công cụ hiện đại để lấy tích phân trên đa tạp: chúng tác động lên các bộ vector và trả về số thực, đồng thời xử lý tự nhiên định hướng và phép đổi biến. Tích nêm và đạo hàm ngoài dẫn tới công thức Stokes tổng quát. Bài tùy chọn này không trình bày lại $$d$$ và $$\wedge$$, mà giới thiệu cách học sâu khoảng năm 2023 tiếp thu đúng tinh thần này thông qua *đại số hình học* (Clifford) và *transformer đẳng biến*.

*Clifford Group Equivariant Neural Networks* (Ruhe, Brandstetter, Forré, NeurIPS 2023) xây dựng các lớp mạng đẳng biến với $$O(n)$$ và $$E(n)$$ dựa trên tích hình học của đa vector: vô hướng, vector, 2-form... cùng nằm trong một đại số. *Geometric Algebra Transformer* (GATr — Brehmer, de Haan, Behrends, Cohen, NeurIPS 2023) nhúng điểm, phương hướng, phép tịnh tiến và phép quay vào đại số hình học xạ ảnh 16 chiều, từ đó xây dựng kiến trúc transformer đẳng biến với $$E(3)$$. Cả hai công trình đều nhấn mạnh một nguyên lý mà bài học về dạng vi phân đã chuẩn bị sẵn: *các đối tượng hình học khác bậc không nên bị gộp chung thành một vector Euclid thuần túy*.

## Giải thích trực quan

Ta đã biết 1-form đo lưu lượng theo một phương, còn 2-form đo thông lượng qua một mảnh diện tích. Đại số Clifford bổ sung một phép nhân — gọi là tích hình học — kết hợp cả tích vô hướng lẫn tích nêm. Một đa vector có thể chứa đồng thời thành phần vô hướng (bậc 0), thành phần vector (bậc 1) và thành phần diện tích có hướng (bậc 2). Khi quay không gian, từng thành phần biến đổi đúng theo bậc của nó: vô hướng giữ nguyên, vector quay theo phép quay, còn 2-form biến đổi như một phần tử diện tích.

Mạng nơ-ron thông thường không có sẵn cấu trúc này: chúng xếp mọi đặc trưng thành một mảng số và kỳ vọng phép nhân ma trận tự học được tính đối xứng từ dữ liệu. Các kiến trúc năm 2023 tích hợp sẵn tính đối xứng: khi hệ tọa độ trong không gian quay, đầu ra của mạng cũng quay theo đúng quy luật tương ứng. Tính chất đó gọi là *đẳng biến* (equivariance), và đại số ngoài / đại số Clifford cung cấp ngôn ngữ tự nhiên cho quy luật ấy — cùng chung nền tảng với $$dx\wedge dy$$.

Các ứng dụng trong bài báo GATr trải từ bài toán $$n$$-vật, ước lượng ứng suất thành mạch máu trên lưới lớn cho đến quy hoạch chuyển động robot, cho thấy dạng vi phân và đại số hình học có mặt trực tiếp trong các bài toán ứng dụng thực tế.

![Định hướng trên một mặt — điều mà dạng vi phân ghi nhớ giúp ta.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Hình 1. Một mặt định hướng được (hình xuyến — torus): 2-form thể tích phân biệt rõ hai phía của mặt. Wikimedia Commons.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại.** Một $$k$$-form tại điểm $$p$$ là một ánh xạ đa tuyến tính phản đối xứng $$\omega_p:(T_pM)^k\to\mathbb{R}$$. Tích nêm thỏa mãn $$\alpha\wedge\beta = (-1)^{\deg\alpha\deg\beta}\beta\wedge\alpha$$, và định lý Stokes viết là
$$
\int_\Omega d\omega = \int_{\partial\Omega}\omega.
$$

**Đa vector Clifford (khái quát).** Đại số Clifford $$\mathrm{Cl}(\mathbb{R}^n)$$ được sinh bởi các vector với quan hệ
$$
v w + w v = 2\langle v,w\rangle.
$$
Phần bậc $$0$$ là đại lượng vô hướng, bậc $$1$$ là vector, còn bậc $$2$$ chứa các 2-form. Nhóm Clifford tác động lên đại số này bằng các tự đẳng cấu trực giao, bảo toàn bậc lẫn tích hình học. Nhờ đó, mọi đa thức theo đa vector (bao gồm cả phép chiếu theo từng bậc) đều đẳng biến — đây chính là cơ sở cho định lý thiết kế mạng của Ruhe và cộng sự.

---

## Ví dụ tính tay cầm tay chỉ việc: Tích hình học trong $$\mathrm{Cl}(\mathbb{R}^2)$$

Xét mặt phẳng Euclid $$\mathbb{R}^2$$ với cơ sở trực chuẩn $$\{e_1, e_2\}$$. Quy tắc Clifford $$vw + wv = 2\langle v, w \rangle$$ cho ta ngay bảng nhân cơ bản:

$$
e_1^2 = 1, \qquad e_2^2 = 1, \qquad e_1 e_2 = -e_2 e_1.
$$

Bây giờ lấy hai vector cụ thể $$u = 2e_1 + e_2$$ và $$v = e_1 + 3e_2$$ rồi nhân trực tiếp như đa thức (nhưng giữ đúng thứ tự!):

$$
\begin{aligned}
uv &= (2e_1 + e_2)(e_1 + 3e_2) \\
   &= 2 e_1^2 + 6 e_1 e_2 + e_2 e_1 + 3 e_2^2 \\
   &= (2 + 3) + (6 - 1)\, e_1 e_2 \\
   &= \underbrace{5}_{\text{vô hướng } \langle u,v \rangle} + \underbrace{5\, e_1 e_2}_{\text{diện tích có hướng } u \wedge v}!
\end{aligned}
$$

Hãy kiểm tra xem đa vector $$uv = 5 + 5\,e_1 e_2$$ ứng xử ra sao dưới hai phép biến đổi trực giao:
1. **Phép quay $$90^\circ$$** ($$e_1 \mapsto e_2,\; e_2 \mapsto -e_1$$): ta có $$e_1 e_2 \mapsto e_2(-e_1) = -e_2 e_1 = +e_1 e_2$$! Cả phần vô hướng $$5$$ lẫn phần 2-form $$5\,e_1 e_2$$ đều **bất biến** dưới phép quay 2D!
2. **Phép phản xạ qua trục $$e_1$$** ($$e_1 \mapsto e_1,\; e_2 \mapsto -e_2$$): phần vô hướng $$5$$ giữ nguyên, còn phần 2-form đổi dấu thành $$-5\,e_1 e_2$$ (vì lật ngược mặt phẳng làm đổi chiều diện tích!).

Chính sự phân biệt tự nhiên giữa bậc 0, bậc 1 và bậc 2 này giúp mạng Clifford tự động biết đại lượng nào đổi dấu khi soi gương, đại lượng nào không!

---

### Khung giải thích: Đại số Clifford tạo ra mạng nơ-ron đẳng biến (CGENN & GATr) như thế nào? (nên đọc chậm)

#### Bước 1: Định lý bảo toàn bậc của tác động nhóm trực giao
Nếu $$g \in O(n)$$ là một phép quay hay phản xạ, tác động của $$g$$ lên đại số Clifford $$\mathrm{Cl}(\mathbb{R}^n)$$ là một **tự đẳng cấu đại số** bảo toàn từng bậc: $$g(xy) = g(x)g(y)$$ và $$g(\langle x \rangle_k) = \langle g(x) \rangle_k$$ (trong đó $$\langle x \rangle_k$$ là phép chiếu lấy thành phần bậc $$k$$).

#### Bước 2: Xây lớp tuyến tính và phi tuyến đẳng biến trong CGENN (Ruhe et al., 2023)
Từ Bước 1, mọi tổ hợp tuyến tính giữa các kênh *cùng bậc* $$\sum_c W_{c}^{(k)} \langle x_c \rangle_k$$ và mọi tích hình học giữa hai đa vector $$x_a x_b$$ đều **tự động đẳng biến**! Còn hàm kích hoạt phi tuyến chỉ cần nhân mỗi thành phần bậc $$k$$ với một hàm trơn phụ thuộc vào **chuẩn vô hướng** $$\Vert \langle x \rangle_k \Vert$$ (vì chuẩn là bậc 0 bất biến) — vừa tạo độ phi tuyến mạnh, vừa không bao giờ phá vỡ đối xứng!

#### Bước 3: Mở rộng sang nhóm chuyển động cứng $$E(3)$$ với GATr (Brehmer et al., 2023)
Nhóm $$O(3)$$ chỉ chứa quay và phản xạ quanh gốc tọa độ, chưa có phép tịnh tiến. GATr nâng lên **đại số hình học xạ ảnh 16 chiều** $$\mathbb{G}(3,0,1)$$ (thêm một vector cơ sở $$e_0$$ thỏa $$e_0^2 = 0$$), nhờ đó **điểm, đường thẳng, mặt phẳng và phép tịnh tiến** đều trở thành các đa vector bình đẳng trong cùng một lớp Attention của Transformer!

Tóm tắt mạch chuyển hóa từ Bài 10 sang học sâu 2023:

$$
\text{Dạng vi phân } (\wedge)
\;\xrightarrow{+ \langle\cdot,\cdot\rangle}\;
\text{Đại số Clifford } (uv = \langle u,v\rangle + u\wedge v)
\;\xrightarrow{\text{Chiếu bậc + Tích}}\;
\text{CGENN / GATr đẳng biến } O(n), E(3).
$$

## Minh họa hình học

![Vận chuyển một vector quanh một vòng — cảm giác “dạng” nhớ định hướng.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2. Một vòng kín trên mặt cầu: định hướng của đường biên và phần diện tích bên trong là cặp đối tượng mà định lý Stokes liên kết với nhau. Fred the Oyster / Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Spivak, M.** *Calculus on Manifolds*. Định nghĩa $$d$$, $$\wedge$$ và định lý Stokes.

2. **Ruhe, D., Brandstetter, J., & Forré, P. (2023).** *Clifford Group Equivariant Neural Networks*. NeurIPS 2023. arXiv:2305.11141.

3. **Brehmer, J., de Haan, P., Behrends, S., & Cohen, T. (2023).** *Geometric Algebra Transformer*. NeurIPS 2023. arXiv:2305.18415.

4. **Cohen, T., Weiler, M., Kicanaoglu, B., & Welling, M. (2019).** *Gauge Equivariant Convolutional Networks and the Icosahedral CNN*. ICML 2019. Bài báo đặt nền cho khái niệm "gauge" trong học sâu, có thể đọc như tiền đề cho các công trình năm 2023.

## 🔗 Ứng dụng và kết nối liên ngành

Trong vật lý hạt, tính đẳng biến Lorentz bốn chiều được thử nghiệm trực tiếp trong bài báo về mạng Clifford. Trong y sinh, bài toán ước lượng ứng suất trên lưới động mạch tương ứng với việc tích phân một 2-form trên mặt, và GATr thực hiện việc này mà không phá vỡ đối xứng Euclid. Trong kỹ thuật robot, điểm, trục quay và mặt phẳng kẹp cần cùng tồn tại trong một kiến trúc thống nhất — đúng với mục đích của đại số hình học xạ ảnh.

## Video tham khảo

- [A Swift Introduction to Geometric Algebra](https://www.youtube.com/watch?v=60z_hpEAtD8) — sudgylacmoe, tiếng Anh. Xem trước: giới thiệu tích hình học, nơi đại lượng vô hướng, vector và diện tích có hướng cùng nằm trong một đại số, đúng tinh thần đại số Clifford của các mạng năm 2023.
- [Differential Forms \| What is a 1-form?](https://www.youtube.com/watch?v=Pw1ejJzsCPA) — Michael Penn, tiếng Anh. Nhắc lại 1-form và bậc của dạng vi phân, giúp thấy rõ vì sao các đối tượng khác bậc không nên bị gộp thành một danh sách số thông thường.
- [Siggraph2019 Geometric Algebra](https://www.youtube.com/watch?v=tX4H_ctggYo) — Bivector, tiếng Anh. Khóa ngắn tại SIGGRAPH về đại số hình học trong đồ họa máy tính, sử dụng cùng ngôn ngữ đa vector dưới góc nhìn trực quan.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Diễn đạt bằng lời sự khác nhau giữa một vector và một 2-form khi đảo định hướng không gian (phép phản xạ). Một mạng đẳng biến $$E(3)$$ cần xử lý từng loại đối tượng này như thế nào?

**Bài 2.** Định lý Stokes khẳng định tích phân $$d\omega$$ trên $$\Omega$$ bằng tích phân $$\omega$$ trên biên $$\partial\Omega$$. Giả sử một mạng nơ-ron học đại lượng thông lượng qua một mặt kín. Vì sao biểu diễn thông lượng như một 2-form (thay vì một kênh vô hướng) giúp mạng tôn trọng định hướng của bề mặt?

**Bài 3.** Suy ngẫm: tích nêm có tính phản giao hoán. Nếu một lớp mạng sử dụng tích hình học, phần nào trong quan hệ $$vw+wv=2\langle v,w\rangle$$ tương ứng với phần đối xứng (metric) và phần nào ứng với phần phản đối xứng (dạng vi phân)?

---

Ngôn ngữ dạng vi phân vẫn giữ nguyên cấu trúc nền tảng. Chương 6 sẽ chuyển sang tensor và liên kết; bài tùy chọn ở chương đó nhìn các mạng đẳng biến như những liên kết rời rạc.
