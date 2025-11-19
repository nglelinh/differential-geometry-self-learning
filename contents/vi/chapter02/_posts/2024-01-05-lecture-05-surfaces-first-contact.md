---
layout: post
lang: vi
title: "Bài 5: Thế giới 2 Chiều — Bề mặt và Bản đồ"
chapter: "02"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Con kiến và Tấm bản đồ

Hãy quay lại với người bạn nhỏ của chúng ta: Con kiến.
Lần này, nó không bò trên một sợi dây mảnh mai nữa. Nó đang đứng giữa sa mạc Sahara mênh mông, hoặc trên bề mặt của một quả cam khổng lồ.

Đối với con kiến:
- Nó có thể đi sang trái, sang phải, đi lên, đi xuống. Nó có **2 bậc tự do**.
- Thế giới xung quanh nó trông phẳng lì (nếu nó không đi quá xa).

Đây chính là định nghĩa trực giác của một **Bề mặt (Surface)** hay **Đa tạp 2 chiều (2-Manifold)**: Một không gian mà *cục bộ* trông giống như mặt phẳng Euclid $$\mathbb{R}^2$$.

Nhưng làm sao để mô tả toàn bộ quả cam (vốn cong queo) bằng ngôn ngữ phẳng của toán học?
Chúng ta dùng **Bản đồ (Maps/Charts)**.
Giống như Google Maps trải phẳng bề mặt Trái Đất lên màn hình điện thoại, chúng ta dùng các hàm số để "trải" các vùng của bề mặt lên mặt phẳng tọa độ $$(u, v)$$.

## 2. Tham số hóa: Nghệ thuật dán nhãn

Một bề mặt trong không gian $$\mathbb{R}^3$$ được định nghĩa bởi một ánh xạ:
$$ \mathbf{r}: U \subset \mathbb{R}^2 \to \mathbb{R}^3 $$
$$ (u, v) \mapsto \mathbf{r}(u, v) = (x(u,v), y(u,v), z(u,v)) $$

**Ý nghĩa:**
- $$(u, v)$$ là tọa độ trên bản đồ phẳng (ví dụ: Kinh độ và Vĩ độ).
- $$\mathbf{r}(u, v)$$ là vị trí thực tế trong không gian 3 chiều.
- Ánh xạ $$\mathbf{r}$$ giống như việc bạn lấy một tấm cao su phẳng và uốn nắn nó thành hình dạng mong muốn.

### Ví dụ 1: Quả Địa Cầu (Mặt cầu)
Cách phổ biến nhất để dán nhãn Trái Đất là dùng Kinh độ ($$\theta$$) và Vĩ độ ($$\varphi$$).
$$ \mathbf{r}(\theta, \varphi) = (R\sin\varphi\cos\theta, R\sin\varphi\sin\theta, R\cos\varphi) $$
Ở đây, lưới kinh vĩ tuyến hình chữ nhật trên bản đồ giấy được "cuộn" lại thành hình cầu.

### Ví dụ 2: Cái Bánh Donut (Mặt xuyến - Torus)
Làm sao để tạo ra một cái bánh Donut toán học?
1.  Lấy một hình chữ nhật phẳng.
2.  Cuộn nó lại thành một cái ống (hình trụ).
3.  Uốn cong cái ống đó để nối hai đầu lại với nhau.
Tham số hóa $$(u, v)$$ chính là hai góc quay: một góc quay quanh ống, một góc quay quanh tâm bánh.

![Mặt xuyến Torus](https://upload.wikimedia.org/wikipedia/commons/8/81/Torus_cycles.svg)
*Hình 1: Mặt xuyến được tạo ra từ hai vòng tròn. Tọa độ $$(u, v)$$ tương ứng với vị trí trên hai vòng tròn này.*

## 3. Điều kiện Chính quy: Đừng làm rách bản đồ

Không phải ánh xạ nào cũng tạo ra một bề mặt đẹp.
Nếu bạn bóp nát tấm bản đồ lại thành một điểm, hoặc gấp nếp nó lại, nó không còn là bề mặt trơn nữa.

Để đảm bảo bề mặt trơn tru, chúng ta cần hai vector vận tốc riêng phần:
$$ \mathbf{r}_u = \frac{\partial \mathbf{r}}{\partial u} \quad \text{và} \quad \mathbf{r}_v = \frac{\partial \mathbf{r}}{\partial v} $$
phải **độc lập tuyến tính**.

Nghĩa là tích có hướng của chúng phải khác 0:
$$ \mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v \neq \mathbf{0} $$

**Tại sao?**
- $$\mathbf{r}_v$$ là vector tiếp tuyến khi bạn đi dọc theo lưới $$v$$.
- Nếu chúng cùng phương (hoặc bằng 0), lưới tọa độ bị "xẹp" lại thành một đường thẳng hoặc một điểm. Bề mặt mất đi tính chất 2 chiều của nó.

> [!NOTE]
> **Chính quy = Không có nếp gấp nhọn:**
> Điều kiện $$\mathbf{r}_u \times \mathbf{r}_v \neq \mathbf{0}$$ đảm bảo rằng tại mọi điểm, bề mặt luôn trải ra thành một mặt phẳng nhỏ (có vector pháp tuyến xác định).
> Hãy tưởng tượng một tờ giấy bị gấp nếp. Tại đường nếp gấp, bạn không thể đặt một cây bút chì vuông góc với tờ giấy một cách duy nhất (nó có thể nghiêng sang trái hoặc phải). Đó là điểm kỳ dị (singular point). Hình học vi phân chỉ chơi với những bề mặt trơn tru, không có nếp gấp như vậy.

## 4. Mặt phẳng Tiếp tuyến: Sàn nhà của con kiến

Tại mỗi điểm $$P$$ trên bề mặt, hai vector $$\mathbf{r}_u$$ và $$\mathbf{r}_v$$ tạo thành một mặt phẳng. Đó là **Mặt phẳng Tiếp tuyến (Tangent Plane - $$T_P S$$)**.

Đây là khái niệm cực kỳ quan trọng.
- Đối với con kiến, mặt phẳng tiếp tuyến chính là "thế giới phẳng" mà nó cảm nhận được ngay dưới chân.
- Trong giải tích, đây là **xấp xỉ tuyến tính tốt nhất** của bề mặt tại điểm đó.

> [!TIP]
> **Thế giới Tuyến tính hóa (Linearized World):**
> Hình học vi phân là nghệ thuật biến cái cong thành cái phẳng.
> - Bề mặt cong rất khó làm việc.
> - Mặt phẳng tiếp tuyến là một không gian vector (đại số tuyến tính). Chúng ta có thể cộng vector, nhân với số, tính tích vô hướng...
> Hầu hết các phép tính vi phân thực chất là làm việc trên mặt phẳng tiếp tuyến này, sau đó "chiếu" kết quả trở lại bề mặt cong.

**Vector Pháp tuyến (Normal Vector - $$\mathbf{n}$$):**
Vector $$\mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v$$ vuông góc với mặt phẳng tiếp tuyến. Nó chỉ hướng "lên trời".
Vector pháp tuyến đơn vị $$\mathbf{n} = \mathbf{N} / \|\mathbf{N}\|$$ đóng vai trò quan trọng trong việc định hướng bề mặt và tính toán ánh sáng trong đồ họa máy tính.

## 5. Ẩn hay Hiện? (Implicit vs Parametric)

Có hai cách để mô tả bề mặt:
1.  **Tham số (Parametric):** $$\mathbf{r}(u, v)$$. Giống như vẽ bản đồ. Dễ dàng để sinh ra các điểm trên bề mặt (dùng trong game, vẽ lưới).
2.  **Ẩn (Implicit):** $$F(x, y, z) = 0$$. Ví dụ: $$x^2 + y^2 + z^2 - 1 = 0$$. Giống như điêu khắc (cắt bỏ phần thừa). Dễ dàng để kiểm tra một điểm có nằm trên bề mặt hay không (dùng trong va chạm vật lý, Ray tracing).

Trong khóa học này, chúng ta chủ yếu dùng dạng **Tham số** vì nó cho phép chúng ta làm giải tích (đạo hàm, tích phân) trên bề mặt dễ dàng hơn.

## 6. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Mặt cầu:** Tính $$\mathbf{r}_\theta$$ và $$\mathbf{r}_\varphi$$ cho mặt cầu. Tính tích có hướng của chúng. Bạn sẽ thấy độ lớn của nó là $$R^2\sin\varphi$$. Tại sao nó lại bằng 0 tại cực Bắc và cực Nam ($$\varphi = 0, \pi$$)? Điều này có nghĩa là gì về tấm bản đồ của chúng ta tại các cực? (Gợi ý: Các đường kinh tuyến hội tụ lại một điểm).
2.  **Mặt trụ:** Viết tham số hóa cho một hình trụ đứng. Tính vector pháp tuyến của nó. Nó luôn chỉ theo hướng nào? (Gợi ý: Vuông góc với trục z).
3.  **Suy ngẫm:** Tại sao chúng ta cần ít nhất 2 tấm bản đồ để phủ kín mặt cầu mà không có điểm kỳ dị? (Gợi ý: Bạn không thể chải mượt quả bóng lông - Định lý Hairy Ball liên quan đến việc không thể có hệ tọa độ toàn cục trơn tru trên mặt cầu).

---
*Chúng ta đã có bề mặt. Chúng ta đã có bản đồ. Nhưng làm sao để đo khoảng cách trên bản đồ đó? 1 cm trên bản đồ bằng bao nhiêu km ngoài thực tế? Bài tiếp theo sẽ trả lời câu hỏi đó với khái niệm: Dạng Cơ bản Thứ nhất (First Fundamental Form).*
