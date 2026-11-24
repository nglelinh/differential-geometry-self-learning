---
layout: post
lang: vi
title: "Bài 3: Vũ điệu của Hệ Frenet — Độ cong và Độ xoắn"
chapter: "01"
order: 3
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Cảm giác trên tàu lượn siêu tốc trong bóng tối

Hãy tưởng tượng bạn đang ngồi trên một chiếc tàu lượn siêu tốc lao đi trong một đường hầm tối đen như mực. Dù mắt không nhìn thấy một tấc đường ray nào, hệ tiền đình của bạn vẫn đọc ra gần như trọn vẹn hình dạng ba chiều của đường ray qua đúng hai cảm giác:
1.  Khi tàu lao vào khúc cua gấp sang trái, cơ thể bạn bị ép mạnh sang phải. Lực ép đó đo mức độ đường ray đang **cong** ($$\kappa$$).
2.  Khi tàu bước vào vòng xoắn vặn ốc (corkscrew) nghiêng sang một mặt phẳng khác, bạn cảm thấy chính "mặt phẳng của khúc cua" đang xoay vặn trong không gian. Cảm giác đó đo mức độ đường ray đang **xoắn** ($$\tau$$).

Điều kỳ diệu bậc nhất của hình học vi phân đường cong là: **bạn không cần bất kỳ thông số thứ ba nào!** Chỉ cần ghi lại hai con số $$\kappa(s)$$ và $$\tau(s)$$ dọc theo hành trình, bạn đã nắm trọn "mã DNA" xác định duy nhất hình dáng của đường cong trong không gian $$\mathbb{R}^3$$.

**Mạch bài học:** Bản đồ kiến thức nền (khung chuyển động trực chuẩn, ma trận phản đối xứng Frenet–Serret, Định lý cơ bản của đường cong) → Độ cong $$\kappa$$ → Hệ Frenet $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}\}$$ → Độ xoắn $$\tau$$ và hệ phương trình Frenet–Serret → Khung giải thích chậm: tự tay tính đủ bộ $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}, \kappa, \tau\}$$ cho đường xoắn ốc $$(3\cos t, 3\sin t, 4t)$$ → Định lý cơ bản và Bài tập.

---

## Bản đồ kiến thức nền: Hệ khung chuyển động, Ma trận phản đối xứng và Mã DNA của đường cong

Trước khi đi vào các công thức đạo hàm của $$\mathbf{T}, \mathbf{N}, \mathbf{B}$$, hãy nhìn cấu trúc đại số và hình học sâu bên dưới:

### 1. Phương pháp Hệ khung chuyển động (Moving Frames)
Thay vì đứng cố định ở gốc tọa độ $$Oxyz$$ để quan sát đường cong từ xa, hình học vi phân gắn một **hệ trục tọa độ trực chuẩn nhỏ $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}\}$$** trực tiếp lên chính hạt đang chuyển động. Cách nhìn "từ buồng lái phi công" này sau này được Élie Cartan tổng quát hóa thành lý thuyết khung chuyển động trên đa tạp Riemann nhiều chiều.

### 2. Tại sao ma trận Frenet–Serret lại phản đối xứng?
Khi viết ba phương trình Frenet–Serret dưới dạng ma trận:
$$
\frac{d}{ds}\begin{pmatrix} \mathbf{T} \\ \mathbf{N} \\ \mathbf{B} \end{pmatrix} = \begin{pmatrix} 0 & \kappa & 0 \\ -\kappa & 0 & \tau \\ 0 & -\tau & 0 \end{pmatrix} \begin{pmatrix} \mathbf{T} \\ \mathbf{N} \\ \mathbf{B} \end{pmatrix},
$$
hãy để ý ma trận $$3 \times 3$$ ở giữa **phản đối xứng** ($$A^T = -A$$)! Đó không phải ngẫu nhiên: vì khung $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}\}$$ luôn là ma trận trực giao $$Q(s) \in \mathrm{SO}(3)$$ ($$Q Q^T = I$$), lấy đạo hàm hai vế lập tức cho $$Q' Q^T + Q (Q')^T = 0 \implies A = Q' Q^T$$ bắt buộc phản đối xứng — tức là thuộc về **đại số Lie $$\mathfrak{so}(3)$$** của các vận tốc góc quay!

### 3. Định lý Cơ bản — Cầu nối với Phương trình Vi phân (Bài 0.4)
Vì hệ Frenet–Serret là một hệ ODE tuyến tính cấp 1 đối với $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}\}$$, Định lý Tồn tại và Duy nhất Picard–Lindelöf (Bài 0.4) bảo đảm rằng cho trước $$\kappa(s) > 0, \tau(s)$$ cùng vị trí và hướng xuất phát ban đầu, tồn tại **duy nhất** một đường cong không gian khớp với cặp $$(\kappa, \tau)$$ đó!

---

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

---

## Khung giải thích: tự tay tính trọn bộ $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}, \kappa, \tau\}$$ cho đường xoắn ốc (nên đọc chậm)

Hãy tính tay toàn bộ hệ Frenet cho đường xoắn ốc cụ thể $$\alpha(s) = \left(3\cos\frac{s}{5},\ 3\sin\frac{s}{5},\ \frac{4s}{5}\right)$$ (đã chuẩn hóa theo độ dài cung $$s$$ ở Bài 2, với $$a = 3, b = 4, c = 5$$):

1. **Bước 1 — Tiếp tuyến đơn vị $$\mathbf{T}(s)$$:**
   $$
   \mathbf{T}(s) = \alpha'(s) = \frac{1}{5}\left(-3\sin\frac{s}{5},\ 3\cos\frac{s}{5},\ 4\right).
   $$
2. **Bước 2 — Độ cong $$\kappa$$ và Pháp tuyến chính $$\mathbf{N}(s)$$:**
   Lấy đạo hàm $$\mathbf{T}(s)$$ theo $$s$$:
   $$
   \mathbf{T}'(s) = \frac{3}{25}\left(-\cos\frac{s}{5},\ -\sin\frac{s}{5},\ 0\right).
   $$
   Độ lớn của vector trong ngoặc bằng $$\sqrt{\cos^2 + \sin^2} = 1$$, nên ta đọc ra ngay:
   $$
   \kappa = \|\mathbf{T}'(s)\| = \mathbf{\frac{3}{25} = 0.12}, \qquad \mathbf{N}(s) = \left(-\cos\frac{s}{5},\ -\sin\frac{s}{5},\ 0\right).
   $$
   (Để ý $$\mathbf{N}$$ luôn nằm ngang và chỉ thẳng vào trục $$z$$!)
3. **Bước 3 — Phụ pháp tuyến $$\mathbf{B}(s) = \mathbf{T}(s) \times \mathbf{N}(s)$$:**
   Tính tích có hướng từng tọa độ:
   $$
   \mathbf{B}(s) = \frac{1}{5}\left(4\sin\frac{s}{5},\ -4\cos\frac{s}{5},\ 3\right).
   $$
   Kiểm tra nhanh: $$\|\mathbf{B}\|^2 = \frac{16 + 9}{25} = 1$$ và $$\mathbf{B} \cdot \mathbf{N} = 0$$.
4. **Bước 4 — Độ xoắn $$\tau$$ từ $$\mathbf{B}'(s) = -\tau \mathbf{N}(s)$$:**
   Lấy đạo hàm $$\mathbf{B}(s)$$ theo $$s$$:
   $$
   \mathbf{B}'(s) = \frac{4}{25}\left(\cos\frac{s}{5},\ \sin\frac{s}{5},\ 0\right) = -\frac{4}{25}\mathbf{N}(s) \implies \tau = \mathbf{\frac{4}{25} = 0.16}!
   $$
5. **Kiểm tra chéo phương trình thứ hai $$\mathbf{N}' = -\kappa\mathbf{T} + \tau\mathbf{B}$$ tại $$s = 0$$:**
   - Vế trái: $$\mathbf{N}'(0) = (0, -1/5, 0) = (0, -0.20, 0)$$.
   - Vế phải: $$-\frac{3}{25}(0, \frac{3}{5}, \frac{4}{5}) + \frac{4}{25}(0, -\frac{4}{5}, \frac{3}{5}) = \left(0,\ \frac{-9-16}{125},\ \frac{-12+12}{125}\right) = (0, -\frac{25}{125}, 0) = (0, -0.20, 0)$$ — khớp tuyệt đối từng con số!

---

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
