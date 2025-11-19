---
layout: post
lang: vi
title: "Bài 7: Độ cong của Bề mặt — Gauss và Bánh Pizza"
chapter: "03"
order: 2
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Độ cong là gì trong 2D?

Khi nói về một đường cong (1 chiều), "cong" rất dễ hiểu: nó là tốc độ quay của tiếp tuyến.
Nhưng với bề mặt (2 chiều), "cong" phức tạp hơn nhiều.
Tại một điểm trên yên ngựa, bề mặt cong lên theo hướng này nhưng lại cong xuống theo hướng kia. Vậy tóm lại nó cong hay lõm?

Để trả lời câu hỏi này, chúng ta cần **Dạng Cơ bản Thứ hai (Second Fundamental Form)**.
Nó không đo khoảng cách (như dạng 1), mà nó đo **sự tách biệt khỏi mặt phẳng tiếp tuyến**.

## 2. Toán tử Hình dáng (Shape Operator)

Hãy tưởng tượng bạn đang đi bộ trên bề mặt. Tại mỗi điểm, có một vector pháp tuyến $$\mathbf{n}$$ dựng đứng lên (như cột cờ).
- Nếu bạn đi trên mặt phẳng: Cột cờ luôn song song với nhau. $$\mathbf{n}$$ không đổi.
- Nếu bạn đi trên mặt cầu: Cột cờ nghiêng dần đi khi bạn di chuyển.
- Nếu bạn đi trên mặt trụ: Cột cờ nghiêng khi bạn đi vòng quanh, nhưng đứng yên khi bạn đi dọc trục.

**Toán tử Hình dáng ($$S$$ hoặc $$dN$$)** đo tốc độ nghiêng của vector pháp tuyến.
$$ S(\mathbf{v}) = -\nabla_{\mathbf{v}} \mathbf{n} $$
(Dấu trừ là quy ước để độ cong lồi là dương).

## 3. Dạng Cơ bản Thứ hai: II

Dạng cơ bản thứ hai là một cách khác để biểu diễn thông tin này dưới dạng số vô hướng:
$$ II(\mathbf{v}, \mathbf{v}) = \langle S(\mathbf{v}), \mathbf{v} \rangle $$

Trong tọa độ tham số $$(u, v)$$, nó được biểu diễn bởi các hệ số $$L, M, N$$:
$$ II = L du^2 + 2M du dv + N dv^2 $$
Với $$L = \mathbf{r}_{uu} \cdot \mathbf{n}$$, v.v.

**Ý nghĩa trực giác:**
Nếu bạn coi mặt phẳng tiếp tuyến là mặt đất ($$z=0$$), thì bề mặt ở lân cận điểm đó xấp xỉ là một paraboloid:
$$ h \approx \frac{1}{2} II(d\mathbf{r}) $$
$$II$$ cho biết độ cao $$h$$ của bề mặt so với mặt phẳng tiếp tuyến.

## 4. Hai loại Độ cong Chính

Tại mỗi điểm, luôn có một hướng mà bề mặt cong nhiều nhất ($$\kappa_1$$) và một hướng mà bề mặt cong ít nhất ($$\kappa_2$$).
Hai hướng này (thường) vuông góc với nhau.
$$\kappa_1, \kappa_2$$ được gọi là **Độ cong Chính (Principal Curvatures)**.

### Ví dụ:
- **Mặt cầu:** Mọi hướng đều cong như nhau. $$\kappa_1 = \kappa_2 = 1/R$$.
- **Mặt trụ:** Một hướng cong tròn ($$\kappa_1 = 1/R$$), một hướng thẳng ($$\kappa_2 = 0$$).
- **Yên ngựa:** Một hướng cong lên ($$\kappa_1 > 0$$), một hướng cong xuống ($$\kappa_2 < 0$$).

## 5. Gauss và Trung bình: Hai đứa con của Độ cong

Từ hai số $$\kappa_1, \kappa_2$$, chúng ta tạo ra hai chỉ số quan trọng nhất:

### 5.1. Độ cong Gauss ($$K$$)
$$ K = \kappa_1 \cdot \kappa_2 $$
Đây là tích của hai độ cong.
- $$K > 0$$: Hình lồi (Mặt cầu, Elipsoid). Cắt bề mặt bởi mặt phẳng song song tiếp tuyến sẽ được hình Elip.
- $$K < 0$$: Hình yên ngựa (Hyperboloid). Cắt bề mặt sẽ được hình Hyperbol.
- $$K = 0$$: Hình trải được (Mặt trụ, Mặt nón, Mặt phẳng). Ít nhất một hướng phẳng.

**Định lý Pizza:** Khi bạn cầm miếng pizza, bạn uốn cong nó theo chiều ngang ($$\kappa_1 \neq 0$$). Vì miếng pizza phẳng ban đầu ($$K=0$$), và phép uốn là đẳng cự (không co giãn), $$K$$ phải giữ nguyên bằng 0. Do đó $$\kappa_2$$ (chiều dọc) bắt buộc phải bằng 0. Miếng pizza không thể gục đầu xuống!

### 5.2. Độ cong Trung bình ($$H$$)
$$ H = \frac{\kappa_1 + \kappa_2}{2} $$
Đây là trung bình cộng.
Nó liên quan đến sức căng bề mặt.
- Bong bóng xà phòng luôn cố gắng co lại diện tích nhỏ nhất. Điều kiện cân bằng là $$H=0$$.
- Bề mặt có $$H=0$$ gọi là **Bề mặt Tối thiểu (Minimal Surface)**. Tại đó, $$\kappa_1 = -\kappa_2$$ (cong lên bao nhiêu thì cong xuống bấy nhiêu, triệt tiêu nhau).

## 6. Phân loại Điểm trên Bề mặt

Dựa vào dấu của $$K$$, ta phân loại các điểm:
1.  **Điểm Elliptic ($$K > 0$$):** Bề mặt nằm về một phía của mặt phẳng tiếp tuyến. (Ví dụ: Đỉnh núi).
2.  **Điểm Hyperbolic ($$K < 0$$):** Bề mặt nằm về hai phía (giống yên ngựa). Mặt phẳng tiếp tuyến cắt bề mặt. (Ví dụ: Đèo giữa hai núi).
3.  **Điểm Parabolic ($$K = 0$$, nhưng không phẳng):** Giống cái máng xối. (Ví dụ: Điểm trên mặt trụ).
4.  **Điểm Planar ($$K = 0, H = 0$$):** Phẳng lì.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Mặt trụ:** Tính $$\kappa_1, \kappa_2$$ cho mặt trụ bán kính $$R$$. Kiểm tra rằng $$K=0$$.
2.  **Yên ngựa:** Xét bề mặt $$z = x^2 - y^2$$ (Yên ngựa khỉ).
    - Tại gốc $$(0,0)$$, cắt theo trục $$x$$: $$z=x^2$$ (cong lên, $$\kappa_1 = 2$$).
    - Cắt theo trục $$y$$: $$z=-y^2$$ (cong xuống, $$\kappa_2 = -2$$).
    - Tính $$K$$ và $$H$$.
3.  **Suy ngẫm:** Tại sao vỏ trứng (vốn mỏng manh) lại rất khó bóp vỡ nếu bạn nắm đều trong lòng bàn tay? (Gợi ý: Vỏ trứng có độ cong Gauss dương rất lớn. Muốn làm phẳng nó - để vỡ - cần thay đổi metric, tức là phải nén hoặc xé rách vật liệu, tốn rất nhiều lực. Trong khi tờ giấy ($$K=0$$) rất dễ bị uốn cong).

---
*Chúng ta đã biết cách đo độ cong từ bên ngoài (dùng $$\mathbf{n}$$). Nhưng liệu con kiến (không nhìn thấy $$\mathbf{n}$$) có thể biết bề mặt đang cong không? Bài tiếp theo sẽ tiết lộ bí mật lớn nhất của Gauss: Định lý Egregium.*
