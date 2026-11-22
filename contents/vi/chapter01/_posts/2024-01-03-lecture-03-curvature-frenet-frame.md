---
layout: post
lang: vi
title: "Bài 3: Vũ điệu của Hệ Frenet — Độ cong và Độ xoắn"
chapter: "01"
order: 3
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Cảm giác trên tàu lượn siêu tốc

Hãy tưởng tượng bạn đang ngồi trên một chiếc tàu lượn siêu tốc trong bóng tối hoàn toàn. Dù không nhìn thấy đường ray, cơ thể bạn vẫn cảm nhận được hai kiểu chuyển động cơ bản:
1.  Khi tàu đi vào khúc cua gấp sang trái, bạn bị ép sang phải. Lực ép này phản ánh việc đường ray đang **cong**; khúc cua càng gấp thì lực ép càng lớn.
2.  Khi tàu thực hiện đoạn xoắn ốc (corkscrew) xoay nghiêng trong không gian, bạn cảm thấy hướng mặt phẳng cua bị vặn xoay. Cảm giác này phản ánh việc đường ray đang **xoắn** ra khỏi mặt phẳng ban đầu.

Trong Hình học Vi phân, hai đại lượng tương ứng là:
- **Độ cong (Curvature — $$\kappa$$):** Đo mức độ uốn cong của đường ray (liên hệ với lực ly tâm).
- **Độ xoắn (Torsion — $$\tau$$):** Đo mức độ đường cong vặn rời khỏi mặt phẳng mật tiếp.

Hai hàm số $$\kappa(s)$$ và $$\tau(s)$$ chứa toàn bộ thông tin hình học nội tại về hình dáng của đường cong trong không gian: khi biết chúng tại mọi điểm, ta có thể dựng lại đường cong đó sai khác một phép dời hình.

## 2. Độ cong: Tốc độ quay của Tiếp tuyến

Nhắc lại từ bài trước: khi tham số hóa đường cong theo độ dài cung $$s$$, vector tiếp tuyến $$\mathbf{T}(s)$$ luôn có độ dài bằng 1. Ta có thể hình dung $$\mathbf{T}(s)$$ như kim của một chiếc la bàn: nếu đường cong là đường thẳng thì kim giữ nguyên hướng, còn nếu đường cong uốn lượn thì kim quay theo hướng rẽ.

<div class="textbook-definition" markdown="1">
**Định nghĩa:** Độ cong $$\kappa$$ là tốc độ quay (độ lớn đạo hàm theo độ dài cung) của vector tiếp tuyến đơn vị $$\mathbf{T}$$:
$$ \kappa(s) = \| \mathbf{T}'(s) \| = \| \gamma''(s) \| $$
</div>

Ý nghĩa của các giá trị độ cong:
- $$\kappa = 0$$: Đường thẳng.
- $$\kappa$$ lớn: Đường cong uốn gấp (bán kính cong nhỏ).
- $$\kappa$$ nhỏ: Đường cong thoải (bán kính cong lớn).
- Với đường tròn bán kính $$R$$, độ cong là hằng số $$\kappa = 1/R$$.

## 3. Hệ Frenet: Hệ quy chiếu gắn với chuyển động

Để mô tả đầy đủ hình học của một đường cong trong không gian 3 chiều, chỉ riêng vector tiếp tuyến $$\mathbf{T}$$ là chưa đủ. Ta xây dựng một hệ trục tọa độ trực chuẩn chuyển động dọc theo đường cong, gọi là **hệ Frenet-Serret** $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}\}$$ (xác định tại các điểm có $$\kappa(s) \neq 0$$):

1.  **Vector tiếp tuyến (Tangent — $$\mathbf{T}$$):** Chỉ hướng chuyển động phía trước.
2.  **Vector pháp tuyến chính (Normal — $$\mathbf{N}$$):** Chỉ hướng đường cong đang rẽ về phía tâm cong:
    $$ \mathbf{N}(s) = \frac{\mathbf{T}'(s)}{\|\mathbf{T}'(s)\|} $$
    Vector này vuông góc với $$\mathbf{T}$$. Vì $$\mathbf{T}'$$ có độ dài bằng độ cong $$\kappa$$, ta chia cho $$\|\mathbf{T}'(s)\|$$ để $$\mathbf{N}$$ là vector đơn vị chỉ phương thuần túy.
3.  **Vector phụ pháp tuyến (Binormal — $$\mathbf{B}$$):** Vuông góc với mặt phẳng xác định bởi $$\mathbf{T}$$ và $$\mathbf{N}$$ (mặt phẳng mật tiếp):
    $$ \mathbf{B}(s) = \mathbf{T}(s) \times \mathbf{N}(s) $$

> [!TIP]
> **Hình dung bằng chuyển động của máy bay:**
> - **$$\mathbf{T}$$ (mũi máy bay):** Hướng bay tới.
> - **$$\mathbf{N}$$ (hướng cánh nghiêng về tâm cua):** Khi rẽ trái, máy bay nghiêng cánh sang trái; $$\mathbf{N}$$ hướng dọc theo cánh về phía tâm vòng cua.
> - **$$\mathbf{B}$$ (hướng vuông góc với mặt phẳng cánh và thân):** Vuông góc với cả $$\mathbf{T}$$ và $$\mathbf{N}$$. Khi máy bay chuyển từ vòng cua phẳng sang quỹ đạo xoắn lên hoặc chúi xuống khỏi mặt phẳng cua, phương của $$\mathbf{B}$$ sẽ thay đổi.

Ba vector $$\mathbf{T}, \mathbf{N}, \mathbf{B}$$ hợp thành một cơ sở trực chuẩn (tương tự hệ trục $$x, y, z$$), nhưng di chuyển và xoay liên tục dọc theo đường cong.

![Hệ Frenet trên đường xoắn ốc](https://upload.wikimedia.org/wikipedia/commons/f/f5/Frenet_frame_helix.gif)
*Hình 1: Hệ Frenet $$(\mathbf{T}, \mathbf{N}, \mathbf{B})$$ trượt dọc theo đường xoắn ốc, với các vector quay liên tục theo chuyển động.*

## 4. Độ xoắn: Mức độ rời khỏi mặt phẳng

Hãy xét sự biến thiên của vector phụ pháp tuyến $$\mathbf{B}$$:
- Nếu đường cong nằm hoàn toàn trong một mặt phẳng (như đường tròn hay parabol), vector $$\mathbf{B}$$ luôn vuông góc với mặt phẳng đó và không đổi hướng, tức $$\mathbf{B}' = 0$$.
- Nếu đường cong xoắn ra khỏi mặt phẳng (như lò xo), phương của $$\mathbf{B}$$ sẽ thay đổi theo $$s$$.

<div class="textbook-definition" markdown="1">
**Định nghĩa:** Độ xoắn $$\tau$$ đo tốc độ biến thiên của vector phụ pháp tuyến $$\mathbf{B}$$ dọc theo phương $$\mathbf{N}$$:
$$ \mathbf{B}'(s) = -\tau(s) \mathbf{N}(s) $$
</div>

- $$\tau = 0$$ (trên cả đoạn có $$\kappa > 0$$): Đường cong phẳng.
- $$\tau \neq 0$$: Đường cong xoắn trong không gian 3 chiều.

## 5. Công thức Frenet-Serret

Mối liên hệ vi phân giữa ba vector của hệ khung được tóm gọn trong hệ phương trình **Frenet-Serret**:

$$
\begin{aligned}
\mathbf{T}' &= \kappa \mathbf{N} \\
\mathbf{N}' &= -\kappa \mathbf{T} + \tau \mathbf{B} \\
\mathbf{B}' &= -\tau \mathbf{N}
\end{aligned}
$$

**Ý nghĩa từng phương trình:**
1.  $$\mathbf{T}' = \kappa \mathbf{N}$$: Vector tiếp tuyến quay về phía vector pháp tuyến chính với tốc độ $$\kappa$$ (định nghĩa độ cong).
2.  $$\mathbf{B}' = -\tau \mathbf{N}$$: Vector phụ pháp tuyến biến thiên dọc theo phương pháp tuyến chính với hệ số $$-\tau$$ (định nghĩa độ xoắn).
3.  $$\mathbf{N}' = -\kappa \mathbf{T} + \tau \mathbf{B}$$: Sự biến thiên của vector pháp tuyến chính là tổng hợp của hai thành phần — quay ngược về phương $$-\mathbf{T}$$ do độ cong $$\kappa$$ và xoay sang phương $$\mathbf{B}$$ do độ xoắn $$\tau$$.

## 6. Định lý Cơ bản của Đường cong Không gian

Định lý cơ bản của lý thuyết đường cong khẳng định: **Với hai hàm trơn cho trước $$\kappa(s) > 0$$ và $$\tau(s)$$, tồn tại duy nhất một đường cong trong $$\mathbb{R}^3$$ nhận $$\kappa$$ làm độ cong và $$\tau$$ làm độ xoắn, sai khác một phép dời hình (tịnh tiến và quay) trong không gian.**

Các trường hợp đặc biệt tiêu biểu:
- $$\kappa = 0, \tau = 0$$: Đường thẳng.
- $$\kappa = \text{const} > 0, \tau = 0$$: Đường tròn.
- $$\kappa = \text{const} > 0, \tau = \text{const} \neq 0$$: Đường xoắn ốc tròn (helix).

Như vậy, cặp hàm $$(\kappa(s), \tau(s))$$ xác định trọn vẹn hình dáng của đường cong không gian.

## Video tham khảo

- [Calculus 3 Lecture 12.3:  Arc Length/Parameterization, TNB (Frenet-Serret) Intro](https://www.youtube.com/watch?v=Hu72QVWsMlg) — Professor Leonard, tiếng Anh. Nên xem trước để thấy cách dựng bộ ba tiếp tuyến, pháp tuyến chính và phụ pháp tuyến trên một đường cong không gian, khớp với hệ Frenet trong bài.
- [Frenet-Serret formulas (proof)](https://www.youtube.com/watch?v=A8_SlWsQfzA) — bprp calculus basics, tiếng Anh. Trình bày chứng minh ngắn gọn các công thức Frenet–Serret để đối chiếu với hệ phương trình của $$\mathbf{T}', \mathbf{N}', \mathbf{B}'$$ trong bài.
- [Lecture 10: Smooth Curves (Discrete Differential Geometry)](https://www.youtube.com/watch?v=seLcPBax3OI) — Keenan Crane, tiếng Anh. Giải thích vai trò của độ cong và độ xoắn như dữ liệu đủ để tái dựng đường cong, tương ứng với định lý cơ bản ở mục 6.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Đường tròn:** Chứng minh rằng với đường tròn bán kính $$R$$, ta có $$\kappa = 1/R$$ và $$\tau = 0$$.
2.  **Đường xoắn ốc:** Cho đường cong $$\gamma(t) = (a\cos t, a\sin t, bt)$$. Hãy tính $$\kappa$$ và $$\tau$$, và kiểm chứng rằng cả hai đều là hằng số — điều giải thích tính đều đặn về mặt hình học của lò xo.
3.  **Suy ngẫm:** Vì sao $$\mathbf{T}'$$ luôn vuông góc với $$\mathbf{T}$$? (Gợi ý: Từ $$\|\mathbf{T}\|^2 = \mathbf{T} \cdot \mathbf{T} = 1$$, lấy đạo hàm hai vế sẽ thu được $$2\mathbf{T} \cdot \mathbf{T}' = 0$$). Đây là một quy tắc hữu ích thường gặp: *đạo hàm của một hàm vector có độ dài không đổi luôn vuông góc với chính vector đó.*

---
*Đến đây ta đã hoàn tất các khái niệm cơ bản về đường cong (1 chiều). Chương tiếp theo sẽ mở rộng sang các đối tượng 2 chiều: lý thuyết về Bề mặt.*
