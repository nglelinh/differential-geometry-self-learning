---
layout: post
lang: vi
title: "Bài 7: Độ cong của Bề mặt — Gauss và Bánh Pizza"
chapter: "03"
order: 2
owner: "Hình học Vi phân"
---

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

## 3. Dạng Cơ bản Thứ hai: $$II$$

Dạng cơ bản thứ hai biểu diễn thông tin của toán tử hình dáng dưới dạng một dạng toàn phương vô hướng trên mặt phẳng tiếp tuyến:
$$ II(\mathbf{v}, \mathbf{v}) = \langle S(\mathbf{v}), \mathbf{v} \rangle $$

Trong hệ tọa độ tham số $$(u, v)$$, dạng này được viết qua ba hệ số $$L, M, N$$:
$$ II = L du^2 + 2M du dv + N dv^2 $$
với $$L = \mathbf{r}_{uu} \cdot \mathbf{n}$$, $$M = \mathbf{r}_{uv} \cdot \mathbf{n}$$ và $$N = \mathbf{r}_{vv} \cdot \mathbf{n}$$.

**Ý nghĩa hình học:** Nếu đặt mặt phẳng tiếp tuyến làm mặt tham chiếu $$z=0$$, thì trong lân cận điểm đang xét, độ cao $$h$$ của bề mặt so với mặt phẳng tiếp tuyến được xấp xỉ bậc hai bởi một paraboloid:
$$ h \approx \frac{1}{2} II(d\mathbf{r}) $$
Như vậy, $$II$$ đo trực tiếp độ lệch theo phương pháp tuyến của bề mặt so với mặt phẳng tiếp tuyến.

## 4. Hai Độ cong Chính

Tại mỗi điểm trên bề mặt, luôn tồn tại một phương mà độ cong pháp tuyến đạt giá trị lớn nhất ($$\kappa_1$$) và một phương đạt giá trị nhỏ nhất ($$\kappa_2$$). Khi $$\kappa_1 \neq \kappa_2$$, hai phương chính này luôn vuông góc với nhau. Hai giá trị $$\kappa_1, \kappa_2$$ được gọi là các **độ cong chính (principal curvatures)** — chính là hai trị riêng của toán tử hình dáng $$S$$.

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

## 6. Phân loại điểm trên bề mặt

Dựa vào dấu của $$K$$ và giá trị của $$H$$, mỗi điểm trên bề mặt được phân thành bốn loại:
1.  **Điểm Elliptic ($$K > 0$$):** Bề mặt nằm hoàn toàn về một phía của mặt phẳng tiếp tuyến (ví dụ: đỉnh núi).
2.  **Điểm Hyperbolic ($$K < 0$$):** Mặt phẳng tiếp tuyến cắt qua bề mặt, khiến bề mặt nằm ở cả hai phía (ví dụ: yên ngựa, đèo giữa hai đỉnh núi).
3.  **Điểm Parabolic ($$K = 0, H \neq 0$$):** Bề mặt cong theo một phương và thẳng theo phương còn lại (ví dụ: điểm trên mặt trụ).
4.  **Điểm Planar ($$K = 0, H = 0$$):** Cả hai độ cong chính đều bằng 0 (bề mặt phẳng cục bộ ở bậc hai).

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
