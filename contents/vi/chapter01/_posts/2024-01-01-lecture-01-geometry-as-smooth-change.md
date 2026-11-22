---
layout: post
lang: vi
title: "Bài 1: Hình học như Nghiên cứu về Biến đổi Trơn — Từ Euclid đến Riemann"
chapter: "01"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Bước ra khỏi thế giới phẳng

Trong hơn hai nghìn năm, hình học Euclid là khuôn khổ quen thuộc nhất để mô tả không gian: một không gian phẳng, nơi đường thẳng kéo dài vô tận, tổng ba góc trong một tam giác luôn bằng $$180^\circ$$ và các hình khối có cấu trúc cứng.

Tuy nhiên, các đối tượng trong tự nhiên hiếm khi phẳng: những sườn đồi uốn lượn, dòng sông quanh co, đám mây liên tục biến dạng và chính bề mặt Trái Đất (gần đúng là một mặt cầu). Thế giới thực cong, xoắn và biến đổi liên tục.

> [!NOTE]
> **Không gian như một Đa tạp (Manifold):**
> Đây là khái niệm trung tâm của toàn bộ khóa học. Một **đa tạp** là một không gian có hai tính chất song song:
> - **Cục bộ (nhìn gần):** Giống như một mặt phẳng.
> - **Toàn cục (nhìn xa):** Có thể cong, xoắn và mang hình dạng phức tạp.
> Bề mặt Trái Đất là một ví dụ điển hình: trên một sân bóng nhỏ, mặt đất trông gần như phẳng, nhưng nếu đi thẳng mãi theo một hướng, ta sẽ quay trở lại điểm xuất phát.

**Hình học Vi phân (Differential Geometry)** kết hợp **Hình học** (nghiên cứu hình dạng) với **Giải tích** (nghiên cứu sự biến thiên liên tục) để mô tả các không gian cong đó. Trong khóa học này, bên cạnh các công thức tính toán, ta sẽ làm quen với cách tư duy hình học vi phân: xem xét bề mặt như một đối tượng trơn có thể biến dạng, tìm hiểu cách đo độ cong của không gian và mối liên hệ giữa hình học với lực hấp dẫn.

## 2. Trực giác: Con kiến và Quả táo

Hãy xét một thí nghiệm tư duy quen thuộc về một con kiến bò trên bề mặt một quả táo:
- Ở phạm vi rất nhỏ xung quanh mình, con kiến thấy bề mặt quả táo gần như phẳng. Nếu vẽ các tam giác nhỏ và đo góc, nó sẽ thấy các quy tắc của hình học Euclid gần như đúng.
- Nếu con kiến vẽ một tam giác rất lớn bao quanh quả táo (chẳng hạn từ cuống xuống đáy rồi vòng sang phía bên kia), nó sẽ nhận thấy tổng ba góc lớn hơn $$180^\circ$$.

Từ đó, con kiến có thể kết luận rằng bề mặt mình đang sống không phẳng. Ví dụ này minh họa sự phân biệt cốt lõi giữa hai góc nhìn:
1.  **Góc nhìn Ngoại tại (Extrinsic):** Quan sát quả táo từ bên ngoài, đặt trong không gian 3 chiều bao quanh, và nhận ra nó cong.
2.  **Góc nhìn Nội tại (Intrinsic):** Sống ngay *trên* bề mặt quả táo mà không thể rời khỏi nó, chỉ dùng các phép đo độ dài và góc trên chính bề mặt đó để phát hiện độ cong.

Hình học Vi phân hiện đại, đặc biệt từ công trình của Gauss và Riemann, đặt trọng tâm vào góc nhìn **nội tại**: tìm hiểu cấu trúc của không gian mà không cần giả định một không gian lớn hơn bao ngoài nó (tương tự việc ta khảo sát hình học của vũ trụ từ chính bên trong vũ trụ).

> [!TIP]
> **Trái Đất phẳng và Trái Đất tròn:**
> - Nếu chỉ căn cứ vào quan sát cục bộ ngay trước mắt (đường chân trời trông thẳng), ta dễ kết luận mặt đất phẳng.
> - Bằng cách thực hiện các phép đo hình học ở quy mô lớn hơn (như đo tổng ba góc của tam giác lớn hoặc khảo sát hành trình vòng quanh Trái Đất), ta có thể phát hiện độ cong mà không cần quan sát từ ngoài không gian.

## 3. Công cụ của chúng ta: Phép tính Vi phân

Phép tính vi phân đóng vai trò trung tâm vì một đối tượng cong dù phức tạp ở quy mô toàn cục vẫn trở nên đơn giản khi xét cục bộ:
- Một đường cong uốn lượn, khi phóng to đủ gần tại một điểm, trông gần như một **đường thẳng**.
- Một mặt cầu, mặt yên ngựa hay bề mặt Trái Đất, khi phóng to đủ gần tại một điểm, trông gần như một **mặt phẳng**.

Ý tưởng cốt lõi ở đây là **xấp xỉ tuyến tính (linear approximation)**. Ta dùng đạo hàm để xác định đường thẳng tiếp tuyến (tangent line) hoặc mặt phẳng tiếp tuyến (tangent plane) — bản xấp xỉ phẳng của đối tượng hình học tại điểm đang xét. Bằng cách theo dõi các không gian tiếp tuyến này biến đổi ra sao từ điểm này sang điểm khác, ta khôi phục được thông tin về độ cong của đối tượng.

Ta có thể hình dung một người trượt ván trên một ống cong: tại mỗi thời điểm, chiếc ván tiếp xúc với mặt ống tại một điểm và nằm dọc theo một phương thẳng. Phương đó chính là tiếp tuyến, và đạo hàm là công cụ xác định hướng tiếp tuyến tại mọi điểm.

![Minh họa đạo hàm như tiếp tuyến](https://upload.wikimedia.org/wikipedia/commons/7/7a/Graph_of_sliding_derivative_line.gif)
*Hình 1: Đạo hàm tại một điểm là hệ số góc của đường tiếp tuyến — xấp xỉ tuyến tính tốt nhất của đường cong tại điểm đó.*

## 4. Định nghĩa Hình thức: Đường cong Tham số hóa

Để tính toán chính xác, ta không mô tả đường cong bằng phương trình đồ thị $$y=f(x)$$ (vốn bị giới hạn bởi tính đơn trị), mà bằng **tham số hóa (parametrization)**.

### 4.1. Định nghĩa
Một *đường cong tham số hóa* trong không gian $$\mathbb{R}^3$$ là một ánh xạ trơn (khả vi vô hạn lần):
$$ \gamma: I \to \mathbb{R}^3 $$
$$ t \mapsto \gamma(t) = (x(t), y(t), z(t)) $$
trong đó $$I \subset \mathbb{R}$$ là một khoảng mở (hoặc một khoảng thời gian).

**Trực giác:** Có thể xem $$\gamma(t)$$ là vị trí của một hạt chuyển động tại thời điểm $$t$$, khi đó quỹ đạo của hạt chính là hình ảnh của đường cong.

### 4.2. Các ví dụ cơ bản

**Ví dụ 1: Đường thẳng**
Một hạt chuyển động thẳng đều xuất phát từ điểm $$p$$ với vector vận tốc $$\mathbf{v}$$:
$$ \gamma(t) = p + t\mathbf{v} $$
Đây là đường cong đơn giản nhất, có đạo hàm không đổi $$\gamma'(t) = \mathbf{v}$$.

**Ví dụ 2: Đường tròn**
Một hạt chuyển động tròn quanh gốc tọa độ trong mặt phẳng $$xy$$:
$$ \gamma(t) = (R\cos t, R\sin t, 0) $$
trong đó tham số $$t$$ đóng vai trò góc quay.

**Ví dụ 3: Đường xoắn ốc (Helix)**
Một đường cong không gian kinh điển, trong đó hạt vừa quay tròn quanh trục $$z$$ vừa tịnh tiến lên theo chiều cao:
$$ \gamma(t) = (a\cos t, a\sin t, bt) $$
- $$a$$: Bán kính hình trụ chứa đường xoắn ốc.
- $$b$$: Tốc độ tăng độ cao theo tham số $$t$$ (liên quan đến bước xoắn).

![Đường xoắn ốc Helix](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Helix_parametric.svg/640px-Helix_parametric.svg.png)
*Hình 2: Đường xoắn ốc Helix — mô hình hình học của lò xo và chuỗi xoắn DNA.*

### 4.3. Vector Tiếp tuyến (Vận tốc)

Tại mỗi thời điểm $$t$$, vector vận tốc tức thời của hạt là đạo hàm theo $$t$$ của vị trí:
$$ \gamma'(t) = \left( \frac{dx}{dt}, \frac{dy}{dt}, \frac{dz}{dt} \right) $$

Về mặt hình học, $$\gamma'(t)$$ nằm trên đường tiếp tuyến của đường cong tại điểm $$\gamma(t)$$:
- Hướng của $$\gamma'(t)$$ chỉ hướng chuyển động.
- Độ dài $$\|\gamma'(t)\|$$ chỉ tốc độ chuyển động.

Một đường cong được gọi là **chính quy (regular)** nếu vận tốc luôn khác không ($$\gamma'(t) \neq 0$$ với mọi $$t \in I$$). Điều kiện này loại trừ các điểm dừng đột ngột, nơi đường cong có thể tạo thành góc nhọn hoặc điểm lùi.

## 5. Lược sử: Từ phép tính vi phân đến độ cong nội tại

Hình học vi phân phát triển trực tiếp từ phép tính vi tích phân thế kỷ 17:
- **Newton và Leibniz** xây dựng vi tích phân để giải các bài toán về chuyển động và tiếp tuyến.
- **Euler** (thế kỷ 18) là một trong những người đầu tiên vận dụng vi tích phân để nghiên cứu độ cong của bề mặt.
- **Monge** (người đặt nền móng cho hình học họa hình) gắn kết lý thuyết hình học với các bài toán kỹ thuật.
- **Gauss** trong chuyên khảo *Disquisitiones Generales Circa Superficies Curvas* (1827) đã thiết lập khái niệm **độ cong nội tại**, đặt nền tảng cho hình học vi phân hiện đại.

Đóng góp cốt lõi của Gauss là chỉ ra rằng ta không cần nhúng một bề mặt vào không gian bao ngoài mới nghiên cứu được hình học của nó, mà có thể xác định độ cong hoàn toàn từ các phép đo ngay trên bề mặt. Tư tưởng này sau đó được Riemann mở rộng lên nhiều chiều và trở thành nền tảng toán học cho Thuyết Tương đối rộng của Einstein.

## 6. Một số ứng dụng thực tế

1.  **Đồ họa máy tính và trò chơi điện tử:** Các mô hình 3D và bề mặt vật thể được xây dựng từ lưới đa giác xấp xỉ mặt trơn. Vector pháp tuyến (normal vector) là đại lượng cốt lõi để tính toán chiếu sáng và tô bóng (shading).
2.  **Robotics:** Việc tìm quỹ đạo tối ưu về năng lượng hoặc độ mượt cho cánh tay robot liên hệ chặt chẽ với bài toán tìm đường trắc địa (geodesic) và kiểm soát độ cong.
3.  **Vật lý lý thuyết và vũ trụ học:** Thuyết Tương đối rộng mô tả lực hấp dẫn thông qua độ cong của không-thời gian.
4.  **Kiến trúc:** Nhiều kết cấu mái vòm nhẹ (như mái sân vận động Olympic Munich) sử dụng các mặt cực tiểu (minimal surfaces) để phân bố ứng suất hiệu quả.

## Video tham khảo

- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, tiếng Anh. Nên xem trước để thấy vì sao hình học vi phân đo hình dạng bằng đạo hàm và cách xấp xỉ mặt cong bằng các mảnh phẳng.
- [The paradox of the derivative \| Chapter 2, Essence of calculus](https://www.youtube.com/watch?v=9vKqVkMQHKk) — 3Blue1Brown, tiếng Anh. Minh họa đạo hàm như đường tiếp tuyến khi phóng to đồ thị, tương ứng với mục phép tính vi phân và Hình 1.
- [Introduction to Differential Geometry: Curves](https://www.youtube.com/watch?v=4fB0VfKZRXM) — Faculty of Khan, tiếng Anh. Giới thiệu đường cong tham số $$\gamma(t)$$ như quỹ đạo của một hạt và điều kiện chính quy ở phần cuối bài.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập Tư duy**

1.  **Vẽ và quan sát:** Vẽ một đường cong bất kỳ trên giấy. Đặt một cây bút chì tiếp xúc với đường cong tại một điểm. Cây bút chì đó đại diện cho đối tượng toán học nào, và hướng của nó thay đổi ra sao khi bạn trượt điểm tiếp xúc dọc theo đường cong?
2.  **Tham số hóa:** Viết phương trình tham số cho đường thẳng đi qua hai điểm $$A(1, 2, 3)$$ và $$B(4, 5, 6)$$. (Gợi ý: $$\gamma(t) = A + t(B-A)$$).
3.  **Suy ngẫm:** Vì sao ta cần điều kiện $$\gamma'(t) \neq 0$$? Hãy hình dung một hạt chuyển động, dừng lại tại một điểm rồi đổi hướng đi ngược lại: tại điểm dừng đó, hình dạng đường cong có thể xảy ra hiện tượng gì? (Nó có thể tạo thành một điểm lùi — cusp).

---
*Trong bài tiếp theo, ta sẽ tìm hiểu cách chuẩn hóa tốc độ của hạt thông qua khái niệm Độ dài cung để tách biệt hình dạng đường cong khỏi cách tham số hóa.*
