---
layout: post
lang: vi
title: "Bài 18: Tại sao Máy bay không bay theo đường thẳng? — Nghệ thuật của Đường Trắc địa"
chapter: "09"
order: 2
owner: "Hình học Vi phân"
---

## 1. Bí ẩn trên Màn hình Máy bay

Hãy tưởng tượng bạn đang trên chuyến bay từ Hà Nội đến San Francisco. Bạn háo hức nhìn vào màn hình giải trí để xem đường bay. Bạn mong đợi một đường thẳng tắp băng qua Thái Bình Dương mênh mông.

Nhưng không.

Trên màn hình, chiếc máy bay nhỏ xíu đang vẽ một đường cong vồng lên phía Bắc, lướt qua sát Nhật Bản, vòng lên gần quần đảo Aleutian của Alaska đầy băng tuyết, rồi mới chịu vòng xuống bờ Tây nước Mỹ.
Thoạt nhìn, nó giống như một đường vòng vô lý. Tại sao phi công lại chọn con đường xa xôi và lạnh lẽo như vậy thay vì bay thẳng?

![Đường tròn lớn trên bản đồ phẳng](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Great_Circle_Flight_Path.svg/640px-Great_Circle_Flight_Path.svg.png)
*Hình 1: Đường màu đỏ (Great Circle) trông cong trên bản đồ phẳng nhưng thực chất ngắn hơn đường màu xanh (Rhumb Line) trông thẳng.*

Câu trả lời sẽ khiến bạn bất ngờ: **Đó chính là đường thẳng nhất có thể.**

Trong bài giảng này, chúng ta sẽ khám phá khái niệm **Đường Trắc địa (Geodesics)** - những "đường thẳng" của thế giới cong, và hiểu tại sao trực giác của chúng ta lại hay bị đánh lừa đến vậy.

*Để hiểu rõ cách tính toán các đường này, hãy xem [Bài giảng 9: Đường trắc địa](/contents/vi/chapter04/2024-01-09-lecture-09-geodesics/) và [Bài giảng 14: Đa tạp Riemann](/contents/vi/chapter07/2024-01-14-lecture-14-riemannian-manifolds/).*

## 2. Định nghĩa lại "Thẳng"

### Thí nghiệm tư duy: Con kiến và Quả táo
Hãy tưởng tượng một con kiến đang bò trên một quả táo. Nó muốn đi từ cuống táo đến một điểm nằm ngang hông quả táo.
- Đối với con kiến (vốn rất nhỏ bé), mặt quả táo trông như phẳng lì. Nó cứ thế bò "thẳng" tới trước.
- Nhưng đối với chúng ta (người khổng lồ nhìn từ ngoài), con kiến đang bò theo một đường cong bám sát vỏ quả táo.

Vậy ai đúng? Con kiến hay chúng ta?
Trong hình học vi phân, **con kiến đúng**.

Một đường được gọi là "thẳng" (hay trắc địa) nếu tại mọi thời điểm, bạn không hề "bẻ lái".
- Nếu bạn lái xe trên sân bay phẳng và giữ chặt vô lăng ở giữa: Bạn đi theo đường thẳng Euclid.
- Nếu bạn lái xe trên bề mặt Trái Đất (giả sử là mặt cầu trơn nhẵn) và giữ chặt vô lăng ở giữa: Bạn sẽ đi theo một vòng tròn lớn (Great Circle) bao quanh Trái Đất.

Về mặt toán học, điều này được mô tả bởi phương trình **Vận chuyển Song song** (Parallel Transport): Vectơ vận tốc của bạn luôn song song với chính nó qua thời gian.

$$ \nabla_{\dot{\gamma}} \dot{\gamma} = 0 $$

(Nghĩa là: Gia tốc theo phương tiếp tuyến bằng 0. Bạn không rẽ trái, không rẽ phải, không tăng tốc, không giảm tốc).

![Vận chuyển song song trên mặt cầu](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2: Vận chuyển song song một vector dọc theo một vòng kín trên mặt cầu. Khi quay về điểm xuất phát, vector đã bị xoay đi một góc! Đây là dấu hiệu đặc trưng của không gian cong.*

## 3. Cuộc chiến Hàng hải: Đường Loxodrome vs. Đường Geodesic

Trong lịch sử hàng hải, các thủy thủ đã phải đối mặt với sự lựa chọn khó khăn giữa "dễ đi" và "đi nhanh".

### Đường Loxodrome (Rhumb Line) - Dễ nhưng Xa
Vào thế kỷ 16, Gerardus Mercator phát minh ra bản đồ Mercator. Trên bản đồ này, mọi đường thẳng kẻ bằng thước đều là đường có **góc la bàn không đổi**.
Ví dụ: Nếu bạn muốn đi từ Châu Âu sang Châu Mỹ, bạn chỉ cần đặt thước kẻ, đo góc là "Tây - Tây Nam" (ví dụ 250 độ), và cứ thế giữ bánh lái tàu ở góc 250 độ.
- *Ưu điểm:* Cực kỳ dễ lái. Thủy thủ không cần tính toán gì cả, chỉ cần nhìn la bàn.
- *Nhược điểm:* Đây **không phải** là đường ngắn nhất. Trên mặt cầu, đường này xoắn ốc và dài hơn đáng kể.

### Đường Geodesic (Great Circle) - Khó nhưng Gần
Đường ngắn nhất thực sự trên mặt cầu là cung của một vòng tròn lớn (vòng tròn đi qua tâm Trái Đất).
- *Ưu điểm:* Tiết kiệm nhiên liệu và thời gian nhất.
- *Nhược điểm:* Góc la bàn thay đổi liên tục! Để đi theo đường này, thủy thủ phải chỉnh bánh lái liên tục từng giờ. Lúc đầu hướng 270 độ, sau đó 265, rồi 260... Rất vất vả nếu không có GPS.

![So sánh Great Circle và Rhumb Line](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Great_circle_hemispheres.png/640px-Great_circle_hemispheres.png)
*Hình 3: Đường màu đỏ là đường ngắn nhất (Great Circle). Đường màu xanh là đường đi theo hướng la bàn cố định (Rhumb Line).*

Ngày nay, máy bay và tàu biển hiện đại đều có máy tính hỗ trợ, nên họ luôn chọn bay theo Đường Geodesic.
Đó là lý do chuyến bay Hà Nội - San Francisco bay vòng lên phương Bắc. Vì Trái Đất phình ra ở xích đạo và thu hẹp ở các vĩ độ cao, việc đi vòng lên vĩ độ cao (nơi chu vi Trái Đất nhỏ hơn) thực chất lại ngắn hơn là đi ngang qua vùng vĩ độ thấp phình to.

## 4. Ảo ảnh của Bản đồ Phẳng

Tại sao chúng ta lại thấy đường bay bị cong?
Đơn giản vì chúng ta đang nhìn vào một **bản đồ phẳng**.
Như đã học ở Bài 17, bản đồ phẳng làm méo mó sự thật.
- Đường thẳng trên bản đồ phẳng (Loxodrome) thực ra là đường cong trên thực tế.
- Đường cong trên bản đồ phẳng (Geodesic) thực ra là đường thẳng trên thực tế.

Mắt chúng ta quen với hình học phẳng của tờ giấy, nên não bộ tự động cho rằng "đường kẻ thước là ngắn nhất". Đây là một ảo giác hình học mà chúng ta phải học cách vượt qua.

## 5. Vũ trụ: Khi Ánh sáng cũng "Bẻ lái"

Câu chuyện không dừng lại ở Trái Đất. Toàn bộ vũ trụ của chúng ta cũng là một "mặt cong" khổng lồ.
Theo Thuyết Tương đối rộng của Einstein, khối lượng làm cong không-thời gian.
Ánh sáng, giống như con kiến trên quả táo, luôn cố gắng đi theo đường ngắn nhất (trắc địa).
- Trong không gian phẳng (xa các ngôi sao), đường ngắn nhất là đường thẳng tắp.
- Nhưng khi đi gần Mặt Trời hay Hố Đen, không gian bị cong đi. Đường ngắn nhất bây giờ là một đường cong.

Năm 1919, Arthur Eddington đã chụp ảnh nhật thực và thấy các ngôi sao bị lệch vị trí so với bình thường. Ánh sáng từ chúng đã bị Mặt Trời bẻ cong. Đây là bằng chứng hùng hồn nhất cho thấy: **Chúng ta đang sống trong một hình học Riemann, không phải hình học Euclid.**

## 6. Kết luận

Lần tới khi bạn ngồi trên máy bay, hãy nhìn ra cửa sổ và tưởng tượng về đường cong vĩ đại mà bạn đang đi. Bạn không chỉ đang di chuyển từ điểm A đến điểm B. Bạn đang lướt đi trên bề mặt cong của hành tinh, tuân theo quy luật tối ưu hóa năng lượng của tự nhiên.
Đường thẳng nhất không phải lúc nào cũng là đường kẻ thước. Đôi khi, để đi đến đích nhanh nhất, ta phải biết nương theo độ cong của thế giới.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" - dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*
