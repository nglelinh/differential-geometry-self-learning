---
layout: post
lang: vi
title: "Bài 18: Tại sao Máy bay không bay theo đường thẳng? — Nghệ thuật của Đường Trắc địa"
chapter: "09"
order: 2
owner: "Hình học Vi phân"
---

## 1. Đường bay trên màn hình hành khách

Trên một chuyến bay từ Hà Nội đến San Francisco, nếu quan sát bản đồ lộ trình trên màn hình máy bay, nhiều người thường kỳ vọng sẽ thấy một đường thẳng băng ngang Thái Bình Dương. Tuy nhiên, đường bay thực tế lại uốn cong lên phía Bắc, đi gần Nhật Bản, vòng sát quần đảo Aleutian của Alaska rồi mới hạ xuống bờ Tây nước Mỹ. Thoạt nhìn, lộ trình này có vẻ vòng xa hơn, nhưng thực chất **đó chính là đường ngắn nhất và thẳng nhất trên bề mặt hình cầu của Trái Đất**.

![Đường tròn lớn trên bản đồ phẳng](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Great_Circle_Flight_Path.svg/640px-Great_Circle_Flight_Path.svg.png)
*Hình 1: Đường màu đỏ (cung đường tròn lớn — Great Circle) trông cong trên bản đồ phẳng nhưng thực tế ngắn hơn đường màu xanh (Rhumb Line) trông thẳng.*

Trong bài giảng này, chúng ta tìm hiểu khái niệm **Đường trắc địa (Geodesics)** — sự mở rộng của khái niệm "đường thẳng" sang các bề mặt cong — và lý do trực giác quen với mặt phẳng thường đánh lừa chúng ta khi xem bản đồ.

*Để tìm hiểu cách thiết lập và giải phương trình đường trắc địa, hãy xem [Bài giảng 9: Đường trắc địa]({{ '/contents/vi/chapter04/lecture-09-geodesics/' | absolute_url }}) và [Bài giảng 14: Đa tạp Riemann]({{ '/contents/vi/chapter07/lecture-14-riemannian-manifolds/' | absolute_url }}).*

**Mạch bài học:** Kiến thức cần nhớ (đường trắc địa trên mặt cong, đường tròn lớn vs. đường loxodrome, ánh sáng trên không-thời gian cong) → Trực giác con kiến trên quả táo & hàng hải → Ví dụ tính số làm từng bước: so sánh bay dọc vĩ tuyến $$60^\circ\text{ N}$$ với bay vòng qua Bắc Cực (tiết kiệm đúng $$3{,}336\text{ km}$$!) → Giải thích: 3 bước hiểu vì sao đường tròn lớn vừa "thẳng nhất" vừa "ngắn nhất" → Ảo giác bản đồ, Ánh sáng vũ trụ & Video.

---

## Kiến thức cần nhớ: Đường Trắc địa trong Hình học cầu và Vũ trụ học là gì?

### 1. Hai gương mặt của "đường thẳng" trên mặt cong
Trong mặt phẳng Euclid, đoạn thẳng cùng lúc sở hữu hai tính chất: (a) **không bẻ lái** (gia tốc tiếp tuyến bằng 0, $$\nabla_{\dot\gamma}\dot\gamma = 0$$), và (b) **ngắn nhất** giữa hai điểm. Trên mặt cong (như Trái Đất), đường cong giữ nguyên hai đặc tính cục bộ đó gọi là **đường trắc địa (geodesic)** — và trên mặt cầu, chúng chính là các **đường tròn lớn** (giao tuyến của mặt cầu với mặt phẳng đi qua tâm Trái Đất)!

### 2. Đường Loxodrome (Rhumb Line) vs. Đường Trắc địa
Một đường thẳng kẻ bằng thước trên bản đồ Mercator giữ góc la bàn cố định (đường **Loxodrome**), rất tiện cho thủy thủ thế kỷ 16 nhưng thực chất lại uốn xoắn ốc về phía cực và **không phải** đường ngắn nhất (trừ kinh tuyến và Xích đạo). Ngược lại, **cung đường tròn lớn** cắt các kinh tuyến dưới góc thay đổi liên tục nhưng tiết kiệm hàng nghìn kilômét nhiên liệu!

### 3. Từ hàng không đến thiên văn học tương đối tính
Cùng một phương trình $$\nabla_{\dot\gamma}\dot\gamma = 0$$ không chỉ dẫn đường cho máy bay Boeing trên bề mặt Trái Đất 2 chiều, mà còn dẫn đường cho **tia sáng** và các hành tinh trong không-thời gian cong 4 chiều của Thuyết tương đối rộng (hiện tượng thấu kính hấp dẫn).

---

## 2. Định nghĩa lại khái niệm "thẳng"

### Thí nghiệm tư duy: Con kiến trên quả táo
Hãy hình dung một con kiến bò từ cuống táo xuống ngang thân quả táo. Với con kiến sống trên bề mặt, nó đi thẳng về phía trước mà không rẽ sang trái hay sang phải. Với người quan sát từ không gian ba chiều bên ngoài, quỹ đạo đó lại là một đường cong ôm theo vỏ quả táo.

Theo quan điểm nội tại của hình học vi phân, quỹ đạo của con kiến chính là "đường thẳng" của bề mặt đó. Một đường cong trên bề mặt được gọi là đường trắc địa nếu người di chuyển dọc theo nó không hề bẻ lái theo phương tiếp tuyến với bề mặt:
- Nếu lái xe trên một sân bay phẳng và giữ thẳng vô lăng, xe đi theo một đường thẳng Euclid.
- Nếu lái xe trên bề mặt hình cầu lý tưởng và giữ thẳng vô lăng, xe sẽ đi theo một **đường tròn lớn** (Great Circle — giao tuyến của mặt cầu với mặt phẳng đi qua tâm cầu).

Về mặt toán học, điều kiện này chính là phương trình **vận chuyển song song** đối với vector vận tốc:

$$ \nabla_{\dot{\gamma}} \dot{\gamma} = 0 $$

Phương trình này có nghĩa là gia tốc tiếp tuyến (nội tại trên bề mặt) bằng 0: bạn không rẽ trái, không rẽ phải và giữ nguyên độ lớn vận tốc.

![Vận chuyển song song trên mặt cầu](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2: Vận chuyển song song một vector dọc theo một vòng kín trên mặt cầu. Khi trở về điểm xuất phát, hướng vector bị xoay đi một góc — dấu hiệu đặc trưng của không gian cong.*

## 3. Lựa chọn trong hàng hải: Đường Loxodrome và Đường Trắc địa

Trong lịch sử hàng hải, thủy thủ phải cân nhắc giữa tuyến đường dễ điều hướng và tuyến đường ngắn nhất.

### Đường Loxodrome (Rhumb Line) — Dễ điều hướng nhưng dài hơn
Vào thế kỷ 16, Gerardus Mercator xây dựng phép chiếu bản đồ mang tên ông, trong đó mọi đường thẳng kẻ trên bản đồ đều ứng với một **góc phương vị la bàn không đổi**. Để đi từ châu Âu sang châu Mỹ, thủy thủ chỉ cần đo góc trên bản đồ (chẳng hạn 250 độ) rồi giữ hướng la bàn cố định suốt hành trình. Tuy rất dễ lái tàu, đường này không phải đường ngắn nhất trên mặt cầu: về mặt hình học, nó là một đường xoắn ốc cắt các kinh tuyến dưới cùng một góc và dài hơn đáng kể so với cung đường tròn lớn.

### Đường Trắc địa (Cung đường tròn lớn) — Ngắn nhất nhưng đổi góc la bàn liên tục
Đường ngắn nhất giữa hai điểm trên mặt cầu là cung của đường tròn lớn đi qua hai điểm đó, giúp tiết kiệm thời gian và nhiên liệu. Tuy nhiên, góc phương vị so với hướng Bắc thay đổi liên tục dọc đường đi (chẳng hạn giảm dần từ 270° xuống 265°, 260°...), nên trước khi có hệ thống dẫn đường điện tử và GPS, việc bám sát cung đường tròn lớn đòi hỏi tính toán lại hướng đi thường xuyên.

![So sánh Great Circle và Rhumb Line](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Great_circle_hemispheres.png/640px-Great_circle_hemispheres.png)
*Hình 3: Đường màu đỏ là cung đường tròn lớn ngắn nhất (Great Circle); đường màu xanh là đường giữ góc la bàn cố định (Rhumb Line).*

Ngày nay, máy bay và tàu biển hiện đại có hệ thống định vị và máy tính hỗ trợ nên luôn ưu tiên đường trắc địa (kết hợp điều chỉnh theo gió và vùng trời). Trên chuyến bay Hà Nội – San Francisco, vì các đường vĩ tuyến có chu vi lớn nhất ở xích đạo và thu hẹp dần về phía hai cực, việc vòng lên vĩ độ cao thực chất rút ngắn đáng kể quãng đường so với việc bay ngang theo cùng một vĩ tuyến.

---

## Ví dụ tính số làm từng bước: Bay ngang vĩ tuyến $$60^\circ\text{ N}$$ vs. Bay thẳng qua Bắc Cực

Xét hai thành phố cùng nằm trên vĩ tuyến $$60^\circ\text{ N}$$ nhưng cách nhau đúng $$180^\circ$$ kinh độ (ví dụ Saint Petersburg ở $$30^\circ\text{ E}$$ và Anchorage, Alaska ở $$150^\circ\text{ W}$$), với bán kính Trái Đất $$R \approx 6{,}371\text{ km}$$:

1. **Lộ trình A — Bay thẳng ngang trên bản đồ Mercator (dọc vĩ tuyến $$60^\circ\text{ N}$$):**
   Vòng vĩ tuyến $$60^\circ\text{ N}$$ là một hình tròn nhỏ có bán kính $$r = R\cos 60^\circ = \frac{R}{2}$$. Đi nửa vòng tròn này tốn quãng đường:
   $$
   L_{\text{vĩ tuyến}} = \pi \cdot r = \pi \cdot \frac{R}{2} \approx 3.1416 \times 3{,}185.5 \approx 10{,}008\text{ km}.
   $$
2. **Lộ trình B — Bay theo đường tròn lớn (vòng thẳng qua Bắc Cực):**
   Từ vĩ độ $$60^\circ\text{ N}$$ lên Bắc Cực ($$90^\circ\text{ N}$$) là góc $$30^\circ$$, rồi đi xuống phía bên kia về $$60^\circ\text{ N}$$ thêm $$30^\circ$$ nữa — tổng góc ở tâm Trái Đất chỉ là $$60^\circ = \frac{\pi}{3}\text{ rad}$$! Quãng đường là:
   $$
   L_{\text{trắc địa}} = R \cdot \frac{\pi}{3} \approx 6{,}371 \times 1.0472 \approx 6{,}672\text{ km}!
   $$

Chỉ bằng cách bẻ lộ trình "vòng lên cực Bắc" trông thật vòng vèo trên bản đồ phẳng, máy bay rút ngắn được tới **$$3{,}336\text{ km}$$ — tức tròn $$1/3$$ tổng quãng đường bay!**

---

### Giải thích: Ba bước hiểu vì sao đường tròn lớn vừa "thẳng nhất" vừa "ngắn nhất"

#### Bước 1: Tại sao một vòng vĩ tuyến (khác Xích đạo) KHÔNG phải đường trắc địa?
Khi bạn lái xe chạy vòng quanh vĩ tuyến $$60^\circ\text{ N}$$, vector gia tốc hướng tâm trỏ thẳng vào tâm của vòng vĩ tuyến đó (nằm trên trục Trái Đất) — **không** trùng với phương vuông góc mặt cầu (trỏ về tâm Trái Đất)! Thành phần nằm ngang dọc mặt đất của gia tốc đó bắt buộc bạn phải **bẻ lái nhẹ về phía Bắc liên tục** để không bị trượt xuống Xích đạo!

#### Bước 2: Đường tròn lớn có gia tốc hướng tâm trỏ thẳng vào tâm Trái Đất
Ngược lại, trên một đường tròn lớn (đi qua tâm cầu), vector gia tốc hướng tâm trỏ **thẳng đứng về tâm Trái Đất**, tức vuông góc hoàn toàn với mặt đất! Thành phần gia tốc tiếp tuyến trên mặt đất bằng $$0$$ ($$\nabla_{\dot\gamma}\dot\gamma = 0$$): bạn chỉ việc giữ thẳng vô lăng!

#### Bước 3: Thận trọng giữa "ngắn nhất cục bộ" và "ngắn nhất toàn cục"
Giữa Hà Nội và San Francisco có tới **hai** cung đường tròn lớn nối chúng: cung ngắn (bay qua Bắc Thái Bình Dương) và cung dài đi vòng nửa sau Trái Đất. Cả hai đều thỏa $$\nabla_{\dot\gamma}\dot\gamma = 0$$ (đều là đường trắc địa), nhưng chỉ cung ngắn hơn (góc ở tâm $$\le 180^\circ$$) mới là đường ngắn nhất toàn cục!

## 4. Ảo giác của bản đồ phẳng

Đường bay trông như bị uốn cong đơn giản vì ta quan sát nó trên một **bản đồ phẳng**. Như đã thấy ở Bài 17, mọi phép chiếu từ mặt cầu lên mặt phẳng đều làm biến dạng hình học:
- Đường thẳng kẻ trên bản đồ Mercator (Loxodrome) thực chất là đường cong trên Trái Đất.
- Đường cong uốn lên phía Bắc trên bản đồ (cung đường tròn lớn) thực chất lại là đường thẳng nội tại (trắc địa) trên bề mặt Trái Đất.

Do mắt người quen với hình học Euclid trên mặt phẳng, não bộ mặc định coi đoạn thẳng kẻ bằng thước là ngắn nhất — một trực giác không còn đúng khi chuyển sang mặt cầu.

## 5. Mở rộng ra vũ trụ: Đường đi của ánh sáng

Khái niệm đường trắc địa không chỉ áp dụng cho bề mặt Trái Đất. Theo Thuyết tương đối rộng của Einstein, khối lượng và năng lượng làm cong không-thời gian, và ánh sáng truyền đi dọc theo các đường trắc địa kiểu ánh sáng trong không-thời gian cong đó. Ở xa các vật thể nặng, không-thời gian gần như phẳng nên tia sáng đi gần như thẳng; nhưng khi đi sát Mặt Trời hay lỗ đen, đường trắc địa bị uốn cong theo độ cong không-thời gian.

Năm 1919, đoàn thám hiểm do Arthur Eddington dẫn đầu đã chụp ảnh nhật thực toàn phần và quan sát thấy vị trí biểu kiến của các ngôi sao gần đĩa Mặt Trời bị dịch chuyển đúng như dự đoán của thuyết tương đối rộng — một xác nhận thực nghiệm quan trọng cho thấy hình học không-thời gian là hình học cong kiểu Riemann/Lorentz thay vì phẳng Euclid.

## 6. Kết luận

Đường bay vòng lên phía Bắc trên màn hình máy bay là minh họa trực quan cho sự khác biệt giữa hình học phẳng và hình học trên mặt cầu. Trên không gian cong, con đường ngắn nhất không phải là đoạn thẳng trên bản đồ phẳng mà là đường trắc địa tuân theo cấu trúc hình học của chính bề mặt đó.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [Tensor Calculus 16: Geodesic Examples on Plane and Sphere](https://www.youtube.com/watch?v=8sVDceI70HM) — eigenchris, tiếng Anh. Xem trước: trình bày đường trắc địa trên mặt cầu, cho thấy cung đường tròn lớn là đường ngắn nhất dù trên bản đồ phẳng nó trông cong về phía Bắc.
- [Lecture 20: Geodesics (Discrete Differential Geometry)](https://www.youtube.com/watch?v=uojNGbVtlsQ) — Keenan Crane, tiếng Anh. Phân biệt "thẳng nhất" và "ngắn nhất cục bộ", minh họa vì sao cung lớn đi vòng ngược vẫn là đường trắc địa nhưng không phải đường ngắn nhất toàn cục.
- [General Relativity & Curved Spacetime Explained! \| Space Time \| PBS Digital Studios](https://www.youtube.com/watch?v=AwhKZ3fd9JA) — PBS Space Time, tiếng Anh. Trình bày cách ánh sáng chuyển động dọc theo đường trắc địa của không-thời gian cong, tương ứng với phần cuối của bài.
