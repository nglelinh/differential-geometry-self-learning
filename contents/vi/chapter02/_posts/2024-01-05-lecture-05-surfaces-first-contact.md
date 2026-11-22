---
layout: post
lang: vi
title: "Bài 5: Thế giới 2 Chiều — Bề mặt và Bản đồ"
chapter: "02"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Con kiến và Tấm bản đồ

Hãy quay lại hình ảnh con kiến ở Bài 1, nhưng lần này con kiến không còn đi dọc theo một sợi dây 1 chiều nữa mà đứng trên bề mặt của một quả cam lớn:
- Con kiến có thể di chuyển theo hai phương độc lập (trái–phải và trước–sau), tức có **2 bậc tự do**.
- Trong một vùng đủ nhỏ quanh vị trí đứng, bề mặt trông gần như phẳng.

Đây là trực giác cơ bản của một **bề mặt (surface)** hay **đa tạp 2 chiều (2-manifold)**: một không gian mà *cục bộ* giống như mặt phẳng Euclid $$\mathbb{R}^2$$.

Để mô tả toán học toàn bộ một bề mặt cong bằng tọa độ phẳng, ta sử dụng các **bản đồ tọa độ (maps/charts)**. Tương tự cách bản đồ địa lý biểu diễn từng vùng của bề mặt Trái Đất lên mặt phẳng giấy, ta dùng các ánh xạ để gán tọa độ phẳng $$(u, v)$$ cho từng mảnh của bề mặt.

## 2. Tham số hóa bề mặt

Một mảnh bề mặt trong không gian $$\mathbb{R}^3$$ được mô tả bằng một ánh xạ trơn:
$$ \mathbf{r}: U \subset \mathbb{R}^2 \to \mathbb{R}^3 $$
$$ (u, v) \mapsto \mathbf{r}(u, v) = (x(u,v), y(u,v), z(u,v)) $$

**Ý nghĩa:**
- $$(u, v)$$ là tọa độ trên miền phẳng $$U$$ (ví dụ: kinh độ và vĩ độ).
- $$\mathbf{r}(u, v)$$ là vị trí tương ứng của điểm đó trong không gian 3 chiều.
- Về trực giác, ánh xạ $$\mathbf{r}$$ giống như phép uốn cong một tấm cao su phẳng $$U$$ để tạo thành hình dạng bề mặt trong $$\mathbb{R}^3$$.

### Ví dụ 1: Mặt cầu (Quả địa cầu)
Cách phổ biến để gán tọa độ cho mặt cầu bán kính $$R$$ là dùng góc kinh độ $$\theta$$ và góc cực (colatitude) $$\varphi$$:
$$ \mathbf{r}(\theta, \varphi) = (R\sin\varphi\cos\theta, R\sin\varphi\sin\theta, R\cos\varphi) $$
Ở đây, lưới tọa độ hình chữ nhật trên mặt phẳng $$(\theta, \varphi)$$ được cuộn lại thành mặt cầu.

### Ví dụ 2: Mặt xuyến (Torus)
Mặt xuyến hình bánh donut có thể hình dung qua ba bước từ một hình chữ nhật phẳng:
1.  Lấy một hình chữ nhật phẳng.
2.  Cuộn hai cạnh đối diện lại thành một ống trụ.
3.  Uốn cong ống trụ đó để nối hai đầu tròn lại với nhau.

Hai tham số $$(u, v)$$ chính là hai góc quay: một góc quay quanh tiết diện ống và một góc quay quanh trục đối xứng của mặt xuyến.

![Mặt xuyến Torus](https://upload.wikimedia.org/wikipedia/commons/8/81/Torus_cycles.svg)
*Hình 1: Mặt xuyến được tạo thành từ tích của hai đường tròn; cặp tọa độ $$(u, v)$$ xác định vị trí dọc theo hai vòng tròn này.*

## 3. Điều kiện Chính quy: Tránh nếp gấp và điểm kỳ dị

Không phải mọi ánh xạ $$\mathbf{r}(u, v)$$ đều tạo ra một bề mặt trơn đúng nghĩa: nếu một vùng của miền phẳng bị bóp thành một điểm hoặc bị gấp nếp sắc cạnh, bề mặt sẽ mất tính trơn tại đó.

Để bề mặt là **chính quy (regular)**, hai vector đạo hàm riêng:
$$ \mathbf{r}_u = \frac{\partial \mathbf{r}}{\partial u} \quad \text{và} \quad \mathbf{r}_v = \frac{\partial \mathbf{r}}{\partial v} $$
phải **độc lập tuyến tính** tại mọi điểm. Trong $$\mathbb{R}^3$$, điều kiện này tương đương với việc tích có hướng của chúng khác vector không:
$$ \mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v \neq \mathbf{0} $$

**Lý do:**
- $$\mathbf{r}_u$$ và $$\mathbf{r}_v$$ lần lượt là các vector tiếp tuyến dọc theo các đường tọa độ $$u$$ và $$v$$.
- Nếu chúng cùng phương (hoặc một trong hai bằng $$\mathbf{0}$$), lưới tọa độ tại điểm đó bị suy biến thành một đường thẳng hoặc một điểm, làm mất cấu trúc 2 chiều cục bộ.

> [!NOTE]
> **Tính chính quy và sự vắng mặt của nếp gấp nhọn:**
> Điều kiện $$\mathbf{r}_u \times \mathbf{r}_v \neq \mathbf{0}$$ đảm bảo rằng tại mỗi điểm, bề mặt có một mặt phẳng tiếp xúc và một phương pháp tuyến xác định duy nhất.
> Hãy hình dung một tờ giấy bị gấp nếp: dọc theo nếp gấp, không có một phương vuông góc duy nhất với tờ giấy. Những vị trí như vậy gọi là điểm kỳ dị (singular point). Hình học vi phân tập trung nghiên cứu các bề mặt chính quy, không có nếp gấp như vậy.

## 4. Mặt phẳng Tiếp tuyến và Vector Pháp tuyến

Tại mỗi điểm $$P$$ trên bề mặt chính quy, hai vector độc lập tuyến tính $$\mathbf{r}_u$$ và $$\mathbf{r}_v$$ sinh ra một mặt phẳng gọi là **mặt phẳng tiếp tuyến (tangent plane)**, ký hiệu $$T_P S$$:
- Theo góc nhìn nội tại, mặt phẳng tiếp tuyến là không gian phẳng cục bộ ngay dưới chân con kiến.
- Theo giải tích, đây là **xấp xỉ tuyến tính tốt nhất** của bề mặt tại điểm $$P$$.

> [!TIP]
> **Tuyến tính hóa bề mặt cong:**
> - Làm việc trực tiếp trên bề mặt cong là bài toán phi tuyến và phức tạp.
> - Mặt phẳng tiếp tuyến $$T_P S$$ là một không gian vector 2 chiều, nơi ta có thể áp dụng trọn vẹn Đại số Tuyến tính (cộng vector, nhân vô hướng, tính tích vô hướng).
> Do đó, phần lớn các phép tính trong hình học vi phân được thực hiện trên mặt phẳng tiếp tuyến rồi liên kết trở lại với bề mặt cong.

**Vector pháp tuyến (Normal Vector — $$\mathbf{n}$$):**
Vector $$\mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v$$ vuông góc với mặt phẳng tiếp tuyến $$T_P S$$. Sau khi chuẩn hóa, ta thu được **vector pháp tuyến đơn vị**:
$$ \mathbf{n} = \frac{\mathbf{N}}{\|\mathbf{N}\|} $$
Vector $$\mathbf{n}$$ giữ vai trò then chốt trong việc định hướng bề mặt, định nghĩa độ cong và tính toán ánh sáng trong đồ họa máy tính.

## 5. Hai cách biểu diễn bề mặt: Tham số và Ẩn

Có hai cách chính để mô tả một bề mặt trong $$\mathbb{R}^3$$:
1.  **Dạng tham số (Parametric):** $$\mathbf{r}(u, v)$$. Tương tự việc vẽ bản đồ, thuận tiện để sinh điểm và dựng lưới bề mặt (thường dùng trong đồ họa và mô phỏng).
2.  **Dạng ẩn (Implicit):** $$F(x, y, z) = 0$$ (ví dụ: $$x^2 + y^2 + z^2 - 1 = 0$$). Thuận tiện để kiểm tra nhanh một điểm nằm trong, ngoài hay trên bề mặt (thường dùng trong phát hiện va chạm và dò tia — ray tracing).

Trong khóa học này, ta chủ yếu sử dụng dạng **tham số** vì nó cho phép tính đạo hàm, tích phân và các dạng cơ bản trên bề mặt một cách trực tiếp.

## Video tham khảo

- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, tiếng Anh. Nên xem trước để nắm tham số hóa bề mặt, mặt phẳng tiếp tuyến và vector pháp tuyến đơn vị, khớp với ba mục giữa bài; phần ánh xạ Gauss ở cuối video có thể để dành cho Bài 8.
- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, tiếng Anh. Giải thích vì sao đối tượng trung tâm của cả hình học và đồ họa máy tính là bề mặt 2 chiều trơn chứ không chỉ là tập hợp tam giác rời rạc.
- [Shape Analysis (Lecture 6): Second fundamental form and surface curvature](https://www.youtube.com/watch?v=UewzuzaPlxA) — Justin Solomon, tiếng Anh. Sau khi đã có khái niệm pháp tuyến, bài giảng này cho thấy bề mặt cong lệch khỏi mặt phẳng tiếp tuyến như thế nào, tạo cầu nối sang dạng cơ bản thứ hai.

## 6. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Mặt cầu:** Tính $$\mathbf{r}_\theta$$, $$\mathbf{r}_\varphi$$ và tích có hướng $$\mathbf{r}_\theta \times \mathbf{r}_\varphi$$ cho mặt cầu. Kiểm chứng rằng độ lớn của tích có hướng bằng $$R^2\sin\varphi$$. Giải thích vì sao biểu thức này triệt tiêu tại cực Bắc và cực Nam ($$\varphi = 0, \pi$$), và điều đó nói lên hạn chế gì của hệ tọa độ kinh–vĩ độ tại hai cực? (Gợi ý: Mọi đường kinh tuyến đều hội tụ về cùng một điểm).
2.  **Mặt trụ:** Viết một tham số hóa cho mặt trụ tròn đứng và tính vector pháp tuyến đơn vị của nó. Vector pháp tuyến này luôn vuông góc với trục nào? (Gợi ý: Trục $$z$$).
3.  **Suy ngẫm:** Vì sao cần ít nhất 2 bản đồ tọa độ để phủ kín toàn bộ mặt cầu mà không xuất hiện điểm kỳ dị? (Gợi ý: Liên hệ với định lý Quả bóng có lông — Hairy Ball Theorem — về việc không tồn tại trường vector tiếp tuyến liên tục khác không ở mọi điểm trên mặt cầu).

---
*Sau khi đã có cách tham số hóa bề mặt, câu hỏi tiếp theo là làm thế nào để đo khoảng cách, góc và diện tích thực tế trên bề mặt thông qua tọa độ bản đồ $$(u, v)$$. Bài tiếp theo sẽ trả lời câu hỏi này bằng khái niệm Dạng Cơ bản Thứ nhất (First Fundamental Form).*
