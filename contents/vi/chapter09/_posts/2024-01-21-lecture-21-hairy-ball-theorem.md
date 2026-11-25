---
layout: post
lang: vi
title: "Bài 21: Định lý Cắt Tóc — Tại sao luôn có một xoáy tóc?"
chapter: "09"
order: 5
owner: "Hình học Vi phân"
---

## 1. Bài toán chải mượt một quả cầu lông

Hãy hình dung một quả cầu được phủ kín bởi các sợi lông (như bề mặt một quả dừa) và nhiệm vụ của bạn là chải toàn bộ các sợi lông nằm rạp, liên tục và trơn tru trên bề mặt mà không để sợi nào dựng đứng hay tạo xoáy. Dù bạn chải theo cách nào, luôn tồn tại ít nhất một điểm trên quả cầu mà hướng chải bị gián đoạn — tại đó sợi lông phải dựng đứng hoặc xoay quanh một tâm xoáy.

![Định lý Quả bóng lông](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Hairy_ball_theorem.jpg/640px-Hairy_ball_theorem.jpg)
*Hình 1: Không thể chải phẳng và liên tục toàn bộ lông trên một mặt cầu — luôn tồn tại ít nhất một điểm kỳ dị nơi lông dựng đứng hoặc tạo xoáy.*

Đây không phải hạn chế về kỹ thuật mà là một ràng buộc toán học, được gọi là **Định lý Quả bóng Lông (Hairy Ball Theorem)** — một kết quả kinh điển của tô pô đại số và tô pô vi phân.

*Để tìm hiểu thêm về trường vector và đa tạp, hãy xem [Bài giảng 10: Dạng vi phân]({{ '/contents/vi/chapter05/lecture-10-differential-forms/' | absolute_url }}) và [Bài giảng 11: Trường Tensor]({{ '/contents/vi/chapter06/lecture-11-tensors-and-fields/' | absolute_url }}).*

**Mạch bài học:** Kiến thức cần nhớ (tôpô vs. hình học, đặc trưng Euler $$\chi(M)$$, định lý Poincaré–Hopf) → Trường gió trên Trái Đất & Định lý Poincaré–Hopf → Ví dụ tính tay làm từng bước: tính tổng chỉ số của trường gió Đông trên mặt cầu $$S^2$$ ($$1 + 1 = 2$$) so với trường vector không triệt tiêu trên hình xuyến $$T^2$$ ($$0$$) → Giải thích: 3 bước giải mã chỉ số điểm kỳ dị và lý do lò phản ứng Tokamak có hình bánh vòng → Ứng dụng & Video.

---

## Kiến thức cần nhớ: Tôpô vi phân và Định lý Poincaré–Hopf nghiên cứu gì?

### 1. Đặc trưng Euler $$\chi(M)$$ — mã số tôpô bất biến của bề mặt
Nếu chia một bề mặt đóng thành lưới đa giác có $$V$$ đỉnh, $$E$$ cạnh và $$F$$ mặt, thì con số $$\chi(M) = V - E + F$$ **không hề phụ thuộc vào cách chia lưới hay độ méo của bề mặt**! Với một mặt kín có $$g$$ lỗ thủng (giống $$g$$), ta luôn có công thức tuyệt đẹp:

$$
\chi(\Sigma_g) = 2 - 2g.
$$

Cụ thể: mặt cầu ($$g = 0$$) có $$\chi = 2$$; hình xuyến/bánh vòng ($$g = 1$$) có $$\chi = 0$$; bánh vòng hai lỗ ($$g = 2$$) có $$\chi = -2$$.

### 2. Chỉ số (Index) của một điểm kỳ dị trường vector
Tại một điểm $$p_i$$ nơi trường vector tiếp tuyến triệt tiêu ($$X(p_i) = 0$$), hãy đi một vòng tròn nhỏ ngược chiều kim đồng hồ quanh $$p_i$$ và đếm xem mũi tên của trường vector xoay trọn mấy vòng:
- **Nguồn tỏa ra, hố hút vào, hoặc tâm xoáy tròn:** mũi tên quay đúng $$+1$$ vòng $$\implies \text{index} = +1$$.
- **Điểm yên ngựa (hai hướng đi vào, hai hướng đi ra):** mũi tên quay ngược $$1$$ vòng $$\implies \text{index} = -1$$.

### 3. Định lý Poincaré–Hopf — chiếc cầu giữa Giải tích (Trường vector) và Tôpô ($$\chi$$)
Tổng tất cả các chỉ số của mọi điểm triệt tiêu trên toàn bề mặt luôn **bằng chính xác đặc trưng Euler $$\chi(M)$$**! Do đó, một bề mặt có thể "chải mượt không điểm xoáy" (không có không điểm nào) **khi và chỉ khi $$\chi(M) = 0$$** — tức duy nhất hình xuyến trong số các mặt đóng định hướng 2 chiều!

---

## 2. Tô pô học: Những bất biến dưới phép biến dạng liên tục

Khác với hình học vi phân quan tâm đến khoảng cách, góc và độ cong cục bộ, tô pô học nghiên cứu các tính chất không thay đổi khi co giãn hay uốn nắn vật thể một cách liên tục (không làm rách hay dán dính thêm):
- Về mặt tô pô, chiếc cốc có quai và chiếc bánh vòng (hình xuyến — torus) tương đương nhau vì cả hai đều có đúng một lỗ xuyên qua.
- Ngược lại, mặt cầu (không có lỗ) và hình xuyến (có một lỗ) khác nhau về mặt tô pô.

Chính cấu trúc tô pô toàn cục này — được đặc trưng bởi *đặc trưng Euler* $$\chi$$ — quyết định liệu bề mặt có thể chứa một trường vector tiếp tuyến liên tục không triệt tiêu ở mọi điểm hay không.

## 3. Hệ quả với trường gió trên Trái Đất

Nếu thay "lông" bằng hướng và tốc độ gió bề mặt, ta thu được một **trường vector tiếp tuyến** trên mặt cầu Trái Đất. Giả sử trường gió biến thiên liên tục trên toàn bộ bề mặt, Định lý Quả bóng Lông kéo theo một hệ quả trực tiếp: **tại mọi thời điểm, trên Trái Đất luôn tồn tại ít nhất một điểm lặng gió (vận tốc gió ngang bằng 0).**

![Bão xoáy trên Trái Đất](https://upload.wikimedia.org/wikipedia/commons/b/bc/Low_pressure_system_over_Iceland.jpg)
*Hình 2: Một cơn bão xoáy nhìn từ vệ tinh. Mắt bão là ví dụ cho điểm kỳ dị nơi vận tốc gió ngang triệt tiêu.*

Trong thực tế khí tượng, các điểm vận tốc gió ngang bằng 0 này thường tương ứng với tâm xoáy thuận (mắt bão) hoặc tâm vùng áp cao. Cấu trúc tô pô hình cầu của Trái Đất không cho phép tồn tại một dòng gió liên tục thổi đều khắp nơi mà không có điểm triệt tiêu nào.

## 4. Nền tảng toán học: Định lý Poincaré–Hopf

Cơ sở định lượng đằng sau hiện tượng này là **Định lý Poincaré–Hopf** cho trường vector tiếp tuyến có các không điểm cô lập trên một mặt compact định hướng $$M$$:

$$ \sum_{i} \text{index}(X, p_i) = \chi(M) $$

trong đó:
- **Vế trái:** tổng các chỉ số (index) của tất cả các điểm triệt tiêu $$p_i$$ (chẳng hạn một tâm xoáy hoặc nguồn đơn giản có chỉ số $$+1$$, còn một điểm yên ngựa có chỉ số $$-1$$).
- **Vế phải:** đặc trưng Euler $$\chi(M)$$ của bề mặt.

Xét hai ví dụ tiêu biểu:
- **Mặt cầu $$S^2$$:** có đặc trưng Euler $$\chi(S^2) = 2$$. Do đó tổng chỉ số các điểm triệt tiêu phải bằng 2 (ví dụ hai xoáy chỉ số $$+1$$, hoặc một điểm kỳ dị chỉ số $$+2$$), nên không thể có 0 điểm triệt tiêu.
- **Hình xuyến $$T^2$$ (dạng bánh vòng):** có đặc trưng Euler $$\chi(T^2) = 0$$. Vì tổng chỉ số bằng 0, ta hoàn toàn có thể xây dựng trường vector tiếp tuyến liên tục không triệt tiêu tại bất kỳ điểm nào (chẳng hạn chải các sợi lông chạy vòng đều quanh thân bánh).

---

## Ví dụ tính tay làm từng bước: So sánh trường gió trên Mặt cầu $$S^2$$ và Hình xuyến $$T^2$$

1. **Trường gió thổi theo vĩ tuyến trên mặt cầu $$S^2$$:**
   Xét trường vector tiếp tuyến $$X(\theta, \phi) = \sin\theta\,\hat{e}_\phi$$ (tại Xích đạo $$\theta = \pi/2$$ gió thổi mạnh nhất về hướng Đông với tốc độ $$1$$; càng lên gần hai cực tốc độ giảm theo $$\sin\theta$$).
   - **Tìm điểm triệt tiêu:** $$\sin\theta = 0 \iff \theta = 0$$ (Bắc Cực) và $$\theta = \pi$$ (Nam Cực).
   - **Đếm chỉ số:** Nhìn từ trên xuống Bắc Cực, gió xoáy tròn ngược chiều kim đồng hồ $$\implies \text{index}(\text{Bắc Cực}) = +1$$. Nhìn từ ngoài vào Nam Cực, gió xoáy tròn theo chiều kim đồng hồ (nhưng vẫn là tâm xoáy xoay 1 vòng theo hướng đi quanh tâm) $$\implies \text{index}(\text{Nam Cực}) = +1$$.
   - **Kiểm chứng Poincaré–Hopf:** $$\text{index}(\text{Bắc Cực}) + \text{index}(\text{Nam Cực}) = (+1) + (+1) = 2 = \chi(S^2)$$!

2. **Trường vector "chải mượt tuyệt đối" trên hình xuyến $$T^2$$:**
   Tham số hóa mặt xuyến bằng hai góc $$(\theta, \phi) \in [0, 2\pi)^2$$. Chọn trường vector tiếp tuyến chạy đều dọc theo vòng tròn lớn của bánh vòng: $$Y(\theta, \phi) = \frac{\partial}{\partial \phi}$$. Độ dài của $$Y$$ luôn lớn hơn $$0$$ tại **mọi** điểm trên $$T^2$$ — tức có đúng **0 điểm triệt tiêu**, khớp tuyệt đối với $$\sum \text{index} = 0 = \chi(T^2)$$!

---

### Giải thích: Ba bước giải mã Định lý Quả bóng Lông và Lò Tokamak

#### Bước 1: Tại sao bạn không thể "giấu" hai xoáy trên mặt cầu bằng cách đẩy chúng nhập lại?
Giả sử bạn cố gắng vuốt dồn hai điểm xoáy (mỗi điểm chỉ số $$+1$$) trên quả cầu lại sát nhau để xóa chúng đi. Vì tổng chỉ số là bất biến tôpô ($$= 2$$), khi hai điểm $$+1$$ chạm vào nhau chúng không hề biến mất mà hợp thành **một điểm lưỡng cực kỳ dị có chỉ số $$+2$$** (giống hình các đường sức từ trường lưỡng cực)!

#### Bước 2: Định lý Gauss–Bonnet — người anh em song sinh của Poincaré–Hopf
Đáng kinh ngạc hơn nữa, đặc trưng Euler $$\chi(M)$$ còn bằng tích phân toàn bộ độ cong Gauss: $$\frac{1}{2\pi}\iint_M K\,dA = \chi(M)$$! Như vậy ba thế giới tưởng chừng tách biệt — **trường gió (giải tích)**, **độ cong bề mặt (hình học)** và **số lỗ thủng (tôpô)** — bị trói chặt vào cùng một con số nguyên $$\chi(M)$$!

#### Bước 3: Hệ quả kỹ thuật quan trọng trong vật lý nhiệt hạch
Muốn giam plasma nóng $$150$$ triệu độ bằng từ trường mà không để bất kỳ "lỗ rò" nào nơi từ trường tiếp tuyến triệt tiêu, kỹ sư không có lựa chọn nào khác ngoài việc chế tạo buồng phản ứng có $$\chi(M) = 0$$ — chính là hình bánh vòng của lò phản ứng nhiệt hạch **Tokamak**!

## 5. Ứng dụng trong thiết kế lò phản ứng nhiệt hạch

Sự khác biệt tô pô giữa mặt cầu và hình xuyến có ý nghĩa thực tiễn quan trọng trong vật lý plasma. Để duy trì phản ứng nhiệt hạch có kiểm soát, người ta phải giam giữ plasma ở nhiệt độ hàng triệu độ bằng từ trường thay vì để nó tiếp xúc với thành lò. Các đường sức từ trên bề mặt từ trường đóng vai trò tương tự một trường vector tiếp tuyến.

- Nếu buồng giam giữ có dạng hình cầu ($$\chi = 2$$), Định lý Quả bóng Lông cho thấy chắc chắn tồn tại điểm triệt tiêu hoặc điểm kỳ dị của từ trường tiếp tuyến trên mặt biên, nơi plasma có thể thoát ra và làm hư hại thành lò.
- Nếu buồng giam giữ có dạng hình xuyến ($$\chi = 0$$) như cấu hình **Tokamak** (ví dụ dự án ITER), ta có thể tạo ra hệ đường sức từ khép kín, trơn tru quanh toàn bộ mặt xuyến mà không xuất hiện điểm triệt tiêu bắt buộc do tô pô.

## 6. Kết luận

Từ xoáy tóc trên đỉnh đầu, mắt bão trong khí quyển Trái Đất cho đến hình dáng hình xuyến của lò phản ứng nhiệt hạch Tokamak, cả ba đều liên hệ với cùng một kết quả tô pô: đặc trưng Euler của bề mặt quy định sự tồn tại bắt buộc của các điểm kỳ dị trong trường vector tiếp tuyến.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [Why you can't comb a hairy ball, and why we care](https://www.youtube.com/watch?v=BHdbsHFs2P0) — 3Blue1Brown, tiếng Anh. Xem trước: trình bày trực quan Định lý Quả bóng Lông cùng các hệ quả đối với trường gió trên Trái Đất và trường vector tiếp tuyến trên mặt cầu.
- [A Hairy Problem (and a Feathery Solution) - Numberphile](https://www.youtube.com/watch?v=NdnByi_tK6Q) — Numberphile, tiếng Anh. Cách giải thích ngắn gọn dưới góc nhìn tô pô, bổ trợ cho mục Định lý Poincaré–Hopf trong bài.
