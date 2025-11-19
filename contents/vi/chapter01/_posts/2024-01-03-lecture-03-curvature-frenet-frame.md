---
layout: post
lang: vi
title: "Bài 3: Vũ điệu của Hệ Frenet — Độ cong và Độ xoắn"
chapter: "01"
order: 3
owner: "Hình học Vi phân"
---

## 1. Lời mở đầu: Cảm giác trên Tàu lượn siêu tốc

Hãy tưởng tượng bạn đang ngồi trên một chiếc tàu lượn siêu tốc (roller coaster) trong bóng tối hoàn toàn. Bạn không nhìn thấy đường ray, nhưng cơ thể bạn cảm nhận được mọi chuyển động.

1.  Khi tàu lao vào một khúc cua gấp sang trái, bạn bị ép mạnh sang phải. Lực ép này cho bạn biết đường ray đang **cong**. Khúc cua càng gấp, lực ép càng mạnh.
2.  Khi tàu thực hiện một cú xoắn ốc (corkscrew) để lộn ngược đầu, bạn cảm thấy mình bị vặn đi. Cảm giác này cho bạn biết đường ray đang **xoắn** ra khỏi mặt phẳng.

Trong ngôn ngữ của Hình học Vi phân:
- Lực ép sang bên (lực ly tâm) tương ứng với **Độ cong (Curvature - $$\kappa$$)**.
- Cảm giác bị vặn xoắn tương ứng với **Độ xoắn (Torsion - $$\tau$$)**.

Hai con số này, $$\kappa$$ và $$\tau$$, là "mã gen" của mọi đường cong trong không gian. Nếu bạn biết chúng tại mọi thời điểm, bạn có thể tái tạo lại hoàn toàn đường cong đó.

## 2. Độ cong: Tốc độ quay của Tiếp tuyến

Hãy nhớ lại bài trước: Nếu chúng ta tham số hóa theo độ dài cung $$s$$, thì vector tiếp tuyến $$\mathbf{T}(s)$$ luôn có độ dài bằng 1.
Nó giống như kim của một chiếc la bàn.
- Nếu đường cong thẳng: Kim la bàn đứng yên.
- Nếu đường cong uốn lượn: Kim la bàn quay.

**Định nghĩa:** Độ cong $$\kappa$$ là tốc độ quay của vector tiếp tuyến $$\mathbf{T}$$.
$$ \kappa(s) = \| \mathbf{T}'(s) \| = \| \gamma''(s) \| $$

- $$\kappa = 0$$: Đường thẳng.
- $$\kappa$$ lớn: Đường cong gấp (bán kính cong nhỏ).
- $$\kappa$$ nhỏ: Đường cong thoải (bán kính cong lớn).
- Với đường tròn bán kính $$R$$, độ cong là hằng số $$\kappa = 1/R$$.

## 3. Hệ Frenet: Hệ tọa độ của Phi công

Để mô tả chuyển động trong không gian 3 chiều, một vector $$\mathbf{T}$$ là chưa đủ. Chúng ta cần một hệ tọa độ đầy đủ gắn liền với người lái (hoặc hạt chuyển động). Đó là **Hệ Frenet-Serret** $$\{\mathbf{T}, \mathbf{N}, \mathbf{B}\}$$.

1.  **Vector Tiếp tuyến (Tangent - $$\mathbf{T}$$):** Chỉ hướng trước mặt. "Tôi đang đi về đâu?"
2.  **Vector Pháp tuyến chính (Normal - $$\mathbf{N}$$):** Chỉ hướng rẽ. "Tôi đang bẻ lái về phía nào?"
    $$ \mathbf{N}(s) = \frac{\mathbf{T}'(s)}{\|\mathbf{T}'(s)\|} $$
    (Nó vuông góc với $$\mathbf{T}$$ và chỉ về phía tâm cong).
    *Tại sao phải chia cho $$\|\mathbf{T}'(s)\|$$?* Vì $$\mathbf{T}'$$ có độ dài bằng độ cong $$\kappa$$. Chúng ta muốn $$\mathbf{N}$$ là vector đơn vị (độ dài bằng 1) để chỉ hướng thuần túy, nên phải chia cho độ dài của nó.
3.  **Vector Phụ pháp tuyến (Binormal - $$\mathbf{B}$$):** Chỉ hướng vuông góc với mặt phẳng rẽ. "Tôi đang bay lên hay chúi xuống so với mặt phẳng cua?"
    $$ \mathbf{B}(s) = \mathbf{T}(s) \times \mathbf{N}(s) $$

> [!TIP]
> **Hình dung "Máy bay Nghiêng cánh":**
> Hãy tưởng tượng bạn là phi công lái máy bay chiến đấu.
> - **$$\mathbf{T}$$ (Mũi máy bay):** Hướng bạn đang bay tới.
> - **$$\mathbf{N}$$ (Cánh máy bay):** Khi bạn muốn rẽ trái, bạn phải nghiêng cánh sang trái. Vector $$\mathbf{N}$$ chỉ dọc theo cánh máy bay về phía tâm vòng cua.
> - **$$\mathbf{B}$$ (Đuôi đứng):** Vector $$\mathbf{B}$$ vuông góc với cả mũi và cánh, chỉ lên trời (so với máy bay). Nếu bạn kéo cần lái để bay vòng lên (loop), vector $$\mathbf{B}$$ sẽ thay đổi.

Ba vector này tạo thành một bộ khung trực chuẩn (giống như trục x, y, z) nhưng nó **di chuyển và xoay** theo đường cong.

![Hệ Frenet trên đường xoắn ốc](https://upload.wikimedia.org/wikipedia/commons/f/f5/Frenet_frame_helix.gif)
*Hình 1: Hệ Frenet $$(\mathbf{T}, \mathbf{N}, \mathbf{B})$$ trượt dọc theo đường xoắn ốc. Hãy chú ý cách các vector quay liên tục.*

## 4. Độ xoắn: Khi đường cong muốn bay lên

Bây giờ, hãy nhìn vào vector $$\mathbf{B}$$.
- Nếu đường cong nằm hoàn toàn trên mặt phẳng (như đường tròn, parabol), thì $$\mathbf{B}$$ luôn hướng thẳng đứng lên trời (vuông góc với mặt giấy). Nó không đổi. $$\mathbf{B}' = 0$$.
- Nhưng nếu đường cong bắt đầu xoắn ốc bay lên (như lò xo), vector $$\mathbf{B}$$ sẽ bị nghiêng đi.

**Định nghĩa:** Độ xoắn $$\tau$$ đo tốc độ thay đổi của vector $$\mathbf{B}$$.
$$ \mathbf{B}'(s) = -\tau(s) \mathbf{N}(s) $$

- $$\tau = 0$$: Đường cong phẳng.
- $$\tau \neq 0$$: Đường cong không gian.

## 5. Công thức Frenet-Serret: Bản giao hưởng của 3 Vector

Mối quan hệ giữa 3 vector này được gói gọn trong hệ phương trình vi phân đẹp nhất của lý thuyết đường cong:

$$
\begin{aligned}
\mathbf{T}' &= \kappa \mathbf{N} \\
\mathbf{N}' &= -\kappa \mathbf{T} + \tau \mathbf{B} \\
\mathbf{B}' &= -\tau \mathbf{N}
\end{aligned}
$$

**Giải mã ý nghĩa:**
1.  $$\mathbf{T}' = \kappa \mathbf{N}$$: Tiếp tuyến quay về hướng pháp tuyến với tốc độ $$\kappa$$. (Định nghĩa độ cong).
2.  $$\mathbf{B}' = -\tau \mathbf{N}$$: Phụ pháp tuyến quay về hướng pháp tuyến với tốc độ $$\tau$$. (Định nghĩa độ xoắn).
3.  $$\mathbf{N}' = -\kappa \mathbf{T} + \tau \mathbf{B}$$: Pháp tuyến bị giằng xé giữa hai xu hướng: bị kéo ngược lại bởi độ cong và bị vặn đi bởi độ xoắn.

## 6. Định lý Cơ bản của Đường cong Không gian

Đây là đỉnh cao của lý thuyết này.
Định lý phát biểu rằng: **Nếu bạn cho tôi hai hàm số $$\kappa(s)$$ và $$\tau(s)$$, tôi có thể vẽ lại chính xác đường cong đó (sai khác một phép dời hình).**

- $$\kappa = 0, \tau = 0$$: Đường thẳng.
- $$\kappa = const > 0, \tau = 0$$: Đường tròn.
- $$\kappa = const > 0, \tau = const \neq 0$$: Đường xoắn ốc (Helix).

Điều này giống như việc nói rằng DNA của một sinh vật xác định hình dáng của nó. $$\kappa$$ và $$\tau$$ chính là DNA của đường cong.

## 7. Bài tập và Suy ngẫm

🧩 **Bài tập Thực hành**

1.  **Đường tròn:** Chứng minh rằng với đường tròn bán kính $$R$$, $$\kappa = 1/R$$ và $$\tau = 0$$.
2.  **Đường xoắn ốc:** Cho đường $$\gamma(t) = (a\cos t, a\sin t, bt)$$. Hãy tính $$\kappa$$ và $$\tau$$. Bạn sẽ thấy chúng là hằng số. Điều này giải thích tại sao lò xo trông "đều đặn" như vậy.
3.  **Suy ngẫm:** Tại sao $$\mathbf{T}'$$ luôn vuông góc với $$\mathbf{T}$$? (Gợi ý: Vì $$\|\mathbf{T}\|^2 = \mathbf{T} \cdot \mathbf{T} = 1$$. Đạo hàm hai vế sẽ cho $$2\mathbf{T} \cdot \mathbf{T}' = 0$$). Đây là một mẹo toán học cực kỳ quan trọng: *Đạo hàm của một vector có độ dài không đổi luôn vuông góc với chính nó.*

---
*Chúng ta đã chinh phục xong lý thuyết về đường cong (1 chiều). Trong chương tiếp theo, chúng ta sẽ bước sang một thế giới rộng lớn hơn và phức tạp hơn nhiều: Bề mặt (2 chiều).*
