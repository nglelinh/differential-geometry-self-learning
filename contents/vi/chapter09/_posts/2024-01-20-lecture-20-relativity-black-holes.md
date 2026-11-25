---
layout: post
lang: vi
title: "Bài 20: Thuyết Tương Đối và Lỗ Đen — Khi Không Gian Biết Uốn Cong"
chapter: "09"
order: 4
owner: "Hình học Vi phân"
---

## 1. Thí nghiệm tư duy của Einstein

Năm 1907, khi làm việc tại văn phòng sáng chế ở Bern (Thụy Sĩ), Albert Einstein nảy ra một nhận xét quan trọng: *"Nếu một người rơi tự do từ trên mái nhà xuống, anh ta sẽ không cảm thấy trọng lượng của chính mình."* Sau này, ông gọi đó là "ý tưởng hạnh phúc nhất đời tôi", vì nó đặt nền móng cho nguyên lý tương đương và mở đường để giải thích bản chất hình học của trường hấp dẫn.

Trong bài giảng này, chúng ta đi từ thí nghiệm tư duy đó đến các hiện tượng như lỗ đen và sự giãn nở thời gian do hấp dẫn, qua lăng kính trực quan của hình học vi phân.

*Nếu bạn muốn tìm hiểu phần toán học chi tiết, hãy đọc [Bài giảng 13: Độ cong Riemann]({{ '/contents/vi/chapter07/lecture-13-riemann-curvature/' | absolute_url }}) và [Bài giảng 16: Hình học Không-Thời gian]({{ '/contents/vi/chapter08/lecture-16-spacetime-geometry/' | absolute_url }}).*

**Mạch bài học:** Kiến thức cần nhớ (nguyên lý tương đương, không-thời gian cong vs. lực Newton, chân trời sự kiện) → Giới hạn mô hình Newton & Phương trình Einstein → Ví dụ tính số làm từng bước: độ chậm đồng hồ gần lỗ đen Schwarzschild và góc bẻ cong ánh sáng $$1.75''$$ qua Mặt Trời → Giải thích: 3 bước từ "người rơi tự do" đến lỗ đen và GPS → Thấu kính hấp dẫn & Video.

---

## Kiến thức cần nhớ: Hình học của Hấp dẫn và Lỗ đen dựa trên những trụ cột nào?

### 1. Nguyên lý tương đương — xóa bỏ "lực hút" bằng đường trắc địa
Nếu đứng trong một chiếc thang máy kín đang rơi tự do, bạn lơ lửng y hệt như đang ở ngoài vũ trụ không trọng lực. Einstein đẩy nhận xét đó thành tiên đề hình học: **hấp dẫn không phải lực kéo từ xa, mà là hình học cong của không-thời gian 4 chiều**, còn chuyển động rơi tự do chỉ đơn giản là đi dọc **đường trắc địa**!

### 2. Phương trình Einstein — vòng lặp tương tác giữa Vật chất và Độ cong
Phương trình trường Einstein đặt **độ cong Ricci** ở vế trái và **năng lượng–khối lượng** ở vế phải. Không giống lực Newton truyền tức thời, mọi biến động của khối lượng (như hai lỗ đen va chạm) làm gợn sóng độ cong lan truyền đúng bằng tốc độ ánh sáng $$c$$ (**sóng hấp dẫn**).

### 3. Chân trời sự kiện và Giãn nở thời gian hấp dẫn
Khi khối lượng bị nén chặt xuống dưới bán kính Schwarzschild $$r_s = \frac{2GM}{c^2}$$, độ cong không-thời gian mạnh đến mức mọi tia sáng đều bị bẻ quay vào trong — tạo ra **lỗ đen**. Ngay cả bên ngoài lỗ đen, càng lại gần vật thể nặng, nhịp trôi của thời gian riêng càng chậm lại!

---

## 2. Giới hạn của mô hình Newton

Trong hơn 200 năm, cơ học Newton mô tả vũ trụ dựa trên ba giả định:
1. Không gian là một nền Euclid 3 chiều cố định và phẳng.
2. Thời gian trôi đều đặn giống hệt nhau với mọi người quan sát.
3. Hấp dẫn là một lực tác dụng tức thời qua khoảng cách giữa các vật có khối lượng.

Tuy nhiên, giả định thứ ba mâu thuẫn với Thuyết tương đối hẹp: nếu Mặt Trời đột ngột biến mất, theo Newton quỹ đạo Trái Đất sẽ thay đổi ngay lập tức, trong khi ánh sáng từ Mặt Trời cần khoảng 8 phút mới tới Trái Đất — nghĩa là tương tác hấp dẫn sẽ truyền nhanh hơn ánh sáng. Để giải quyết mâu thuẫn này, Einstein đã xây dựng lại lý thuyết hấp dẫn bằng ngôn ngữ hình học vi phân.

## 3. Tấm vải không-thời gian cong

Theo Einstein, không gian và thời gian không tách rời mà hợp nhất thành một đa tạp 4 chiều gọi là **Không-Thời gian (Spacetime)**, và cấu trúc hình học của nó có thể bị uốn cong bởi vật chất và năng lượng.

### Phép tương tự tấm nệm đàn hồi
Để hình dung trong 2 chiều không gian, hãy xét một tấm màng đàn hồi căng phẳng: khi không có vật nặng, viên bi nhỏ lăn theo đường thẳng; khi đặt một quả bóng nặng vào giữa, mặt màng trũng xuống, khiến viên bi lăn ngang qua bị uốn cong quỹ đạo hoặc quay quanh vùng lõm.

![Độ cong không thời gian](https://upload.wikimedia.org/wikipedia/commons/2/22/Spacetime_curvature.png)
*Hình 1: Minh họa khối lượng làm cong không-thời gian xung quanh. Các thiên thể chuyển động tự do dọc theo đường trắc địa trong hình học cong đó.*

Trong khi cơ học Newton diễn giải sự lệch quỹ đạo là kết quả của một lực hút tác dụng từ xa, thuyết tương đối rộng diễn giải rằng vật thể rơi tự do đơn giản chuyển động theo đường trắc địa ("thẳng nhất") trong không-thời gian cong. Ý tưởng này thường được tóm tắt bằng câu nói của nhà vật lý John Wheeler: **vật chất quyết định cách không-thời gian cong, còn độ cong không-thời gian quyết định cách vật chất chuyển động.**

## 4. Phương trình trường Einstein

Mối liên hệ định lượng giữa độ cong và vật chất được phát biểu qua Phương trình trường Einstein:

$$ R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu} $$

Ý nghĩa của hai vế phương trình:
- **Vế trái (Hình học):** chứa tensor Ricci $$R_{\mu\nu}$$, độ cong vô hướng $$R$$ và tensor metric $$g_{\mu\nu}$$, mô tả độ cong của không-thời gian.
- **Vế phải (Vật chất và năng lượng):** chứa tensor năng lượng – xung lượng $$T_{\mu\nu}$$, mô tả phân bố khối lượng, năng lượng và áp suất.
- **Dấu bằng (=):** khẳng định phân bố vật chất – năng lượng xác định trực tiếp độ cong của không-thời gian.

## 5. Lỗ đen và sự giãn nở thời gian do hấp dẫn

Nếu một lượng khối lượng rất lớn bị nén vào một vùng không gian cực nhỏ (chẳng hạn nén khối lượng Mặt Trời xuống bán kính vài kilômét), độ cong không-thời gian trở nên cực đoan đến mức hình thành **lỗ đen**. Tại ranh giới gọi là *chân trời sự kiện* (event horizon), độ cong lớn đến mức mọi đường trắc địa hướng về tương lai đều hướng vào trong, nên cả ánh sáng cũng không thể thoát ra ngoài.

Bên cạnh việc làm lệch đường đi của ánh sáng (hiện tượng *thấu kính hấp dẫn*), trường hấp dẫn còn ảnh hưởng đến nhịp trôi của thời gian: càng ở gần vật thể khối lượng lớn (nơi trường hấp dẫn mạnh), đồng hồ càng chạy chậm hơn so với người quan sát ở xa. Đối với người quan sát ở xa nhìn một vật rơi về phía chân trời sự kiện của lỗ đen, chuyển động của vật đó có vẻ chậm dần và gần như đóng băng ngay sát chân trời sự kiện, trong khi người rơi tự do lại đi qua ranh giới đó trong khoảng thời gian riêng hữu hạn.

![Thấu kính hấp dẫn](https://upload.wikimedia.org/wikipedia/commons/0/03/Black_hole_lensing_web.gif)
*Hình 2: Mô phỏng lỗ đen đi ngang qua phía trước một thiên hà. Trường hấp dẫn làm cong đường truyền ánh sáng từ thiên hà phía sau, tạo nên hình ảnh biến dạng gọi là thấu kính hấp dẫn.*

---

## Ví dụ tính số làm từng bước: Đồng hồ gần lỗ đen & Góc bẻ cong ánh sáng qua Mặt Trời

### Ví dụ 1: Thời gian trôi chậm cỡ nào gần chân trời sự kiện $$r_s$$?
Với một phi hành gia lơ lửng ở khoảng cách $$r > r_s$$ quanh lỗ đen Schwarzschild, tỷ lệ nhịp đồng hồ riêng $$d\tau$$ so với đồng hồ ở rất xa $$dt$$ tuân theo công thức đơn giản từ thành phần $$g_{00}$$ của metric:

$$
\frac{d\tau}{dt} = \sqrt{1 - \frac{r_s}{r}}.
$$

Thử thay hai khoảng cách cụ thể:
- **Tại $$r = 1.25\,r_s$$:** $$\frac{d\tau}{dt} = \sqrt{1 - 0.8} = \sqrt{0.2} \approx 0.447$$ $$\implies$$ **1 giờ** của phi hành gia tương đương **$$2.24$$ giờ** ngoài vũ trụ xa!
- **Tại $$r = 1.01\,r_s$$** (sát mép chân trời sự kiện $$1\%$$): $$\frac{d\tau}{dt} = \sqrt{1 - \frac{1}{1.01}} \approx 0.0995 \approx \frac{1}{10}$$ $$\implies$$ **1 giờ** ở đó bằng **10 giờ** ở xa (đúng như cảnh hành tinh Miller trong phim *Interstellar*!).

### Ví dụ 2: Tính góc bẻ cong tia sáng lướt sát Mặt Trời (Thí nghiệm Eddington 1919)
Theo thuyết tương đối rộng, một tia sáng đi sát rìa Mặt Trời (bán kính $$R_\odot \approx 6.96 \times 10^5\text{ km}$$, bán kính Schwarzschild $$r_s = \frac{2GM_\odot}{c^2} \approx 2.95\text{ km}$$) bị bẻ cong một góc:

$$
\Delta\theta = \frac{2 r_s}{R_\odot} \approx \frac{5.90}{6.96 \times 10^5} \approx 8.48 \times 10^{-6}\text{ rad} \approx 1.75\text{ giây cung}!
$$

Con số $$1.75''$$ này **lớn gấp đúng hai lần** dự đoán của cơ học Newton ($$0.875''$$), bởi ngoài độ cong thời gian, **độ cong không gian 3 chiều** đóng góp thêm đúng một nửa nữa — và đoàn thám hiểm nhật thực năm 1919 của Eddington đã đo được kết quả khớp sát với Einstein!

---

### Giải thích: Ba bước từ "Người rơi tự do" đến Lỗ đen và GPS

#### Bước 1: Tại sao mô hình tấm bạt 2D chỉ kể một nửa sự thật?
Trong đời sống hàng ngày (như quả táo rơi xuống đất), nguyên nhân chính khiến vật rơi xuống **không phải** độ cong không gian 3D mà là **độ cong của chiều thời gian** (đồng hồ trên đỉnh tòa nhà chạy nhanh hơn đồng hồ ở tầng trệt một chút xíu!). Đường thế giới muốn cực đại hóa thời gian riêng tự nhiên uốn cong về phía mặt đất!

#### Bước 2: Độ cong không gian thể hiện rõ nhất ở tốc độ ánh sáng
Ánh sáng di chuyển cực nhanh nên "cảm nhận" đồng đều cả độ cong thời gian lẫn độ cong không gian — đó là lý do góc lệch ánh sáng quanh Mặt Trời bằng đúng $$2 \times$$ dự đoán Newton!

#### Bước 3: Từ chân trời sự kiện đến đồng hồ vệ tinh GPS
Cùng một hệ số metric $$\sqrt{1 - r_s/r}$$ giải thích cả hai thái cực: ở sát lỗ đen nó làm thời gian gần như đóng băng đối với người quan sát từ xa; còn ở độ cao $$20{,}200\text{ km}$$ của vệ tinh GPS, nó tạo ra sai lệch $$+38\,\mu\text{s/ngày}$$ buộc mọi điện thoại thông minh phải áp dụng công thức hình học vi phân của Einstein mỗi giây!

### Ứng dụng thực tế: Hệ thống định vị GPS
Hiệu ứng giãn nở thời gian tương đối tính không chỉ xuất hiện quanh lỗ đen mà ảnh hưởng trực tiếp đến hệ thống định vị GPS hằng ngày. Các vệ tinh GPS bay ở độ cao khoảng 20.000 km; khi tổng hợp hiệu ứng trường hấp dẫn yếu hơn (làm đồng hồ chạy nhanh hơn) và vận tốc quỹ đạo (làm đồng hồ chạy chậm đi), đồng hồ trên vệ tinh chạy **nhanh hơn** đồng hồ dưới mặt đất khoảng 38 microgiây mỗi ngày. Nếu không hiệu chỉnh sai lệch này theo công thức tương đối tính, sai số định vị sẽ tích lũy hàng kilômét chỉ sau một ngày.

## 6. Kết luận

Thuyết tương đối rộng cho thấy hình học vi phân không chỉ là công cụ toán học trừu tượng mà là khung ngôn ngữ mô tả trực tiếp cấu trúc không-thời gian. Từ chuyển động quỹ đạo của hành tinh, hiệu chỉnh đồng hồ vệ tinh GPS cho đến lỗ đen và thấu kính hấp dẫn, tất cả đều bắt nguồn từ độ cong của không-thời gian 4 chiều.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [General Relativity & Curved Spacetime Explained! \| Space Time \| PBS Digital Studios](https://www.youtube.com/watch?v=AwhKZ3fd9JA) — PBS Space Time, tiếng Anh. Xem trước: trình bày không-thời gian cong và đường trắc địa, tương ứng với phần minh họa trực quan ở đầu bài.
- [Einstein's Field Equations of General Relativity Explained](https://www.youtube.com/watch?v=UfThVvBWZxM) — Physics Videos by Eugene Khutoryansky, tiếng Anh. Giải thích trực quan ý nghĩa hai vế của phương trình trường Einstein.
- [Relativity 107c: General Relativity Basics - Curvature, Riemann Tensor, Ricci Tensor, Ricci Scalar](https://www.youtube.com/watch?v=0e3h9w9ldaA) — eigenchris, tiếng Anh. Trình bày vai trò của tensor Ricci ở vế hình học của phương trình Einstein, kết nối trực tiếp với Bài 13.
