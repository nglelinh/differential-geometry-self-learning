---
layout: post
lang: vi
title: "Bài 19: Bong bóng Xà phòng và Kiến trúc Tự nhiên — Bề mặt Tối thiểu"
chapter: "09"
order: 3
owner: "Hình học Vi phân"
---

## 1. Hình dạng tối ưu của bong bóng xà phòng

Bong bóng xà phòng và các màng xà phòng mỏng là những ví dụ trực quan gần gũi về bài toán tối ưu hình học trong tự nhiên.

![Bong bóng xà phòng](https://upload.wikimedia.org/wikipedia/commons/1/18/Soap_bubble_sky.jpg)
*Hình 1: Bong bóng xà phòng có dạng hình cầu — nghiệm tối ưu của bài toán đẳng chu.*

Mỗi khi hình thành trên một khung dây hay bao bọc một thể tích khí, màng xà phòng tự động sắp xếp thành hình dạng tối ưu diện tích — lời giải vật lý trực tiếp cho một bài toán biến phân kinh điển gọi là **Bề mặt cực tiểu (Minimal Surfaces)**. Trong bài giảng này, chúng ta tìm hiểu nguyên lý vật lý đứng sau hình dạng đó và cách các kiến trúc sư áp dụng nó vào kết cấu mái nhẹ hiện đại.

*Để tìm hiểu phần toán học nền tảng về các loại độ cong của mặt, hãy xem [Bài giảng 5: Bề mặt]({{ '/contents/vi/chapter02/lecture-05-surfaces-first-contact/' | absolute_url }}) và [Bài giảng 7: Dạng cơ bản thứ hai]({{ '/contents/vi/chapter03/lecture-07-second-fundamental-form/' | absolute_url }}).*

## 2. Nguyên lý cực tiểu năng lượng

Các hệ vật lý ở trạng thái cân bằng bền có xu hướng đạt mức thế năng thấp nhất: hòn đá lăn xuống đáy thung lũng, lò xo co về chiều dài tự nhiên, còn màng xà phòng co lại để giảm diện tích bề mặt. Nguyên nhân là lực căng bề mặt (surface tension): các phân tử chất lỏng trên bề mặt bị hút vào phía trong, khiến năng lượng bề mặt tỉ lệ thuận với diện tích màng. Để cực tiểu hóa năng lượng này, màng xà phòng tự điều chỉnh để đạt diện tích nhỏ nhất có thể dưới các ràng buộc cho trước.

### Bài toán 1: Bong bóng kín
Khi một lượng khí cố định bị bao bọc bên trong bong bóng xà phòng, hình khối nào chứa được thể tích khí đó với diện tích bề mặt nhỏ nhất? Toán học chứng minh (bất đẳng thức đẳng chu) rằng nghiệm duy nhất là **hình cầu**: không có khối nào (lập phương, hình chóp, hình trụ...) có tỉ số diện tích trên thể tích nhỏ hơn hình cầu.

### Bài toán 2: Màng xà phòng hở (Bài toán Plateau)
Nếu uốn một sợi dây kim loại thành một vòng kín không phẳng (chẳng hạn hình yên ngựa) rồi nhúng vào dung dịch xà phòng, khi nhấc lên màng xà phòng sẽ căng kín khung dây đó. Do không giam giữ khí bên trong nên áp suất hai phía bằng nhau, màng không phồng lên thành hình cầu mà tạo thành một mặt trơn có diện tích nhỏ nhất cục bộ trong số mọi bề mặt có cùng đường biên là khung dây — đó gọi là **bề mặt cực tiểu** (hay bề mặt tối thiểu).

## 3. Đặc trưng hình học: Điểm yên ngựa và độ cong trung bình bằng 0

Quan sát kỹ màng xà phòng trên một khung dây không phẳng, ta thấy bề mặt không phẳng mà luôn uốn lượn theo kiểu yên ngựa: tại mỗi điểm, theo một phương chính bề mặt cong lên (\(k_1 > 0\)), còn theo phương vuông góc bề mặt cong xuống (\(k_2 < 0\)).

Theo phương trình Young–Laplace trong vật lý, hiệu áp suất \(\Delta P\) giữa hai phía của một mặt phân cách tỉ lệ với **độ cong trung bình** \(H\):

$$ \Delta P = 2\gamma H = 2\gamma \left( \frac{k_1 + k_2}{2} \right) $$

Đối với màng xà phòng hở tiếp xúc với khí quyển ở cả hai phía, \(\Delta P = 0\), do đó \(H = 0\), dẫn tới điều kiện:

$$ k_1 = -k_2 $$

Điều này có nghĩa là tại mọi điểm trên mặt cực tiểu, hai độ cong chính luôn bằng nhau về độ lớn và trái dấu nhau: độ cong lồi theo phương này cân bằng hoàn toàn với độ cong lõm theo phương kia.

![Biến đổi Helicoid thành Catenoid](https://upload.wikimedia.org/wikipedia/commons/f/f6/Catenoid_to_Helicoid_Transformation.gif)
*Hình 2: Phép biến đổi đẳng cự biến mặt xoắn ốc (Helicoid) thành mặt dây xích tròn xoay (Catenoid). Cả hai đều là bề mặt cực tiểu có độ cong trung bình bằng 0.*

## 4. Từ màng xà phòng đến kiến trúc mái căng

Bề mặt cực tiểu không chỉ giúp giảm lượng vật liệu bao phủ nhờ diện tích nhỏ, mà cấu trúc cong hai chiều ngược dấu (dạng yên ngựa) còn giúp kết cấu màng căng ổn định hơn, phân bố đều tải trọng gió và tuyết lên hệ khung đỡ.

Kiến trúc sư người Đức **Frei Otto** (giải Pritzker năm 2015) là người tiên phong ứng dụng nguyên lý này vào kiến trúc. Khi thiết kế mái che cho **Sân vận động Olympic Munich 1972**, trong bối cảnh năng lực tính toán của máy tính thời đó còn hạn chế, ông đã dựng các mô hình khung dây tỉ lệ nhỏ, nhúng vào dung dịch xà phòng, chụp ảnh và đo đạc trực tiếp hình dạng màng xà phòng tạo thành để lập bản vẽ thiết kế. Kết quả là hệ mái kết cấu màng căng (tensile structure) nhẹ, bền và vẫn hoạt động tốt sau nhiều thập kỷ.

Ngày nay, phần mềm mô phỏng số đã thay thế mô hình xà phòng vật lý trong quá trình thiết kế, nhưng điều kiện hình học \(H = 0\) vẫn là cơ sở cho nhiều công trình mái vòm màng căng hiện đại như Sân bay Quốc tế Denver.

## 5. Kết luận

Một màng xà phòng căng trên khung dây là lời giải vật lý trực tiếp cho bài toán biến phân cực tiểu hóa diện tích. Từ phương trình \(H = 0\) của hình học vi phân đến các công trình mái căng ngoài đời thực, nguyên lý tối ưu năng lượng tạo nên mối liên hệ chặt chẽ giữa toán học, vật lý và kiến trúc.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [Minimal Surfaces—The Shapes That Help Us Understand Black Holes](https://www.youtube.com/watch?v=_t-3lCZXlPM) — The Action Lab, tiếng Anh. Xem trước: minh họa màng xà phòng như bề mặt cực tiểu diện tích; phần liên hệ với lỗ đen ở cuối video chỉ mang tính mở rộng, không phải trọng tâm của bài này.
- [Shape Analysis (Lecture 6): Second fundamental form and surface curvature](https://www.youtube.com/watch?v=UewzuzaPlxA) — Justin Solomon, tiếng Anh. Trình bày độ cong trung bình $$H$$ và mặt yên ngựa có hai độ cong chính trái dấu, đúng với điều kiện $$H=0$$ của màng xà phòng hở.
- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, tiếng Anh. Đối chiếu giữa mặt có độ cong Gauss bằng 0 (như miếng pizza uốn được từ mặt phẳng) với mặt yên ngựa có tích hai độ cong chính âm.
