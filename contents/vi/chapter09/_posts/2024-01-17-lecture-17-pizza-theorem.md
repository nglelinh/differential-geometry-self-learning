---
layout: post
lang: vi
title: "Bài 17: Định lý Pizza và Bí mật của Bản đồ — Độ cong Gauss và Theorema Egregium"
chapter: "09"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời nói đầu: Từ Bữa trưa đến Vũ trụ

Bạn đã bao giờ rơi vào tình huống khó xử này chưa: Bạn đang cầm một lát pizza New York to bản, nóng hổi trên tay. Lớp vỏ bánh mỏng manh, phô mai chảy ra, và trọng lực đang làm việc của nó—kéo đầu nhọn của lát bánh rũ xuống, đe dọa làm rơi toàn bộ phần nhân ngon lành xuống sàn nhà.

Theo bản năng, bạn làm một động tác đơn giản: Bạn dùng ngón cái và các ngón còn lại bóp nhẹ phần vỏ bánh, tạo thành hình chữ U (hoặc chữ V). Kỳ diệu thay, lát bánh bỗng nhiên trở nên cứng cáp, đầu bánh vểnh lên thẳng tắp, thách thức trọng lực.

![Minh họa cách cầm Pizza](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Pizza_slice_folded.png/640px-Pizza_slice_folded.png)
*Hình 1: Gập vỏ bánh tạo ra độ cong ngang, buộc độ cong dọc phải bằng 0 để giữ nguyên độ cong Gauss bằng 0. (Ảnh minh họa)*

Bạn vừa thực hiện một phép tính vi phân phức tạp ngay trên bàn ăn. Hành động đơn giản đó là minh chứng sống động cho một trong những định lý đẹp nhất và sâu sắc nhất của toán học: **Theorema Egregium** (Định lý Tuyệt vời) của Carl Friedrich Gauss.

Trong bài giảng này, chúng ta sẽ đi từ miếng pizza trên tay bạn đến những tấm bản đồ thế giới, và cuối cùng là hiểu về bản chất của không gian mà chúng ta đang sống.

*Nếu bạn muốn tìm hiểu sâu về mặt toán học, hãy tham khảo [Bài giảng 7: Dạng cơ bản thứ hai và Độ cong Gauss](/contents/vi/chapter03/2024-01-07-lecture-07-second-fundamental-form/) và [Bài giảng 8: Theorema Egregium](/contents/vi/chapter04/2024-01-08-lecture-08-gauss-map-theorema-egregium/).*

## 2. Bí mật của Độ cong: Không chỉ là "Cong"

Trong ngôn ngữ đời thường, chúng ta nói một vật là "cong" nếu nó không phẳng. Nhưng trong toán học, "cong" có nhiều sắc thái hơn thế. Để hiểu tại sao miếng pizza lại cứng lại, chúng ta cần phân biệt các loại độ cong.

Hãy tưởng tượng bạn là một con kiến bò trên một bề mặt. Tại bất kỳ điểm nào bạn đứng, bề mặt có thể cong theo nhiều hướng khác nhau.
- Nếu bạn bò dọc theo vỏ bánh pizza, nó cong lên.
- Nếu bạn bò dọc theo chiều dài miếng bánh, nó có thể cong xuống.

Gauss định nghĩa **Độ cong Gauss** (\(K\)) là tích của hai độ cong cực trị này (gọi là độ cong chính \(k_1\) và \(k_2\)):

$$ K = k_1 \cdot k_2 $$

### Ba loại hình học cơ bản
Dựa vào dấu của \(K\), chúng ta có ba loại thế giới:

![Ba loại độ cong](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Minkowski_curvature.gif/400px-Minkowski_curvature.gif)
*Hình 2: Minh họa trực quan về độ cong. Bên trái: Độ cong âm (Yên ngựa). Ở giữa: Độ cong bằng 0 (Phẳng/Trụ). Bên phải: Độ cong dương (Cầu).*

1.  **Thế giới Phẳng (\(K = 0\)):** Mặt bàn, tờ giấy, hình trụ (ống nước). Tại sao hình trụ lại phẳng? Chúng ta sẽ bàn ngay sau đây.
2.  **Thế giới Lồi (\(K > 0\)):** Quả cam, quả bóng, vỏ trứng. Cả hai độ cong chính đều cùng dấu (cùng cong lên hoặc cùng cong xuống).
3.  **Thế giới Yên ngựa (\(K < 0\)):** Miếng khoai tây chiên Pringles, đèo núi. Một chiều cong lên, chiều kia cong xuống.

## 3. Định lý Pizza: Tại sao gập lại thì cứng?

Quay lại với miếng pizza.
Ban đầu, miếng pizza nằm phẳng trên đĩa.
- Độ cong ngang \(k_1 = 0\).
- Độ cong dọc \(k_2 = 0\).
- Độ cong Gauss \(K = 0 \times 0 = 0\).

Khi bạn cầm nó lên, trọng lực muốn bẻ cong nó theo chiều dọc (đầu bánh rũ xuống). Nếu điều này xảy ra, \(k_2\) sẽ khác 0, nhưng \(k_1\) vẫn bằng 0 (vỏ bánh phẳng). Lúc này \(K\) vẫn bằng 0. Điều này hoàn toàn được phép.

Tuy nhiên, Gauss đã phát hiện ra một quy luật tự nhiên bất di bất dịch: **Độ cong Gauss là bất biến dưới các phép uốn cong (isometry).**
Nghĩa là: Nếu bạn chỉ uốn một vật liệu (mà không co giãn, không làm rách nó), độ cong Gauss của nó **phải giữ nguyên**.

Miếng pizza bắt đầu với \(K=0\). Dù bạn uốn nó thế nào, nó vẫn phải giữ \(K=0\).

Khi bạn chủ động gập vỏ bánh lại (tạo hình chữ U):
- Bạn ép độ cong ngang \(k_1\) trở nên rất lớn (khác 0).
- Theo định lý Gauss: \(K = k_1 \cdot k_2 = 0\).
- Vì \(k_1 \neq 0\), toán học bắt buộc **\(k_2\) phải bằng 0**.

\(k_2 = 0\) nghĩa là gì? Nghĩa là miếng bánh **không thể cong theo chiều dọc**. Nó bắt buộc phải thẳng tắp! Bằng cách tạo ra độ cong ở phương này, bạn đã triệt tiêu khả năng cong ở phương kia. Bạn đã "khóa" hình dáng của miếng bánh lại.

### Ứng dụng: Tôn lợp nhà và Lon nước ngọt
Nguyên lý này không chỉ dùng cho pizza.
- **Tôn lợp mái nhà:** Tại sao người ta không dùng tấm kim loại phẳng để lợp nhà? Vì nó sẽ oặt xuống ngay lập tức. Người ta dập nó thành hình lượn sóng. Những nếp sóng này tạo ra độ cong \(k_1 \neq 0\), buộc tấm tôn phải thẳng tắp theo chiều kia (\(k_2 = 0\)), giúp nó chịu lực cực tốt mà không cần xà gồ dày đặc.
- **Cọng rau muống:** Cọng rau muống hình ống (hình trụ). Hình trụ có \(K=0\) (vì một chiều cong tròn, chiều kia thẳng). Cấu trúc ống giúp cọng rau vươn thẳng đứng lên trời mà không bị gãy gập.

## 4. Nỗi đau của những người làm bản đồ

Nếu định lý Gauss giúp chúng ta ăn pizza ngon lành, thì nó lại là cơn ác mộng đối với những người làm bản đồ suốt hàng ngàn năm qua.

Vấn đề là: **Trái Đất hình cầu (\(K > 0\)), còn tờ giấy bản đồ thì phẳng (\(K = 0\)).**

Gauss chứng minh rằng: **Không thể biến đổi một bề mặt có \(K > 0\) thành bề mặt có \(K = 0\) mà không làm biến dạng khoảng cách.**
Bạn không thể trải vỏ cam ra bàn mà không làm nó rách hoặc nát. Tương tự, bạn không thể vẽ một bản đồ thế giới chính xác hoàn toàn.

![Sự biến dạng của phép chiếu Mercator](https://upload.wikimedia.org/wikipedia/commons/8/87/Tissot_mercator.png)
*Hình 3: Các vòng tròn Tissot minh họa sự biến dạng của phép chiếu Mercator. Hãy chú ý các vòng tròn ở gần cực bị phóng đại khủng khiếp như thế nào so với ở xích đạo.*

### Sự đánh đổi vĩ đại
Mọi tấm bản đồ đều là một sự dối trá. Bạn chỉ có thể chọn "nói dối" về cái gì:
1.  **Bản đồ Mercator (Google Maps dùng):**
    - *Ưu điểm:* Giữ đúng hình dáng và góc (Conformal). Nếu bạn vẽ một góc 90 độ trên bản đồ, nó là 90 độ ngoài thực tế. Rất tốt cho hàng hải.
    - *Nhược điểm:* Sai lệch diện tích kinh khủng. Càng về cực, diện tích càng bị phóng đại. Greenland trông to bằng Châu Phi, nhưng thực tế Châu Phi lớn gấp 14 lần Greenland!
2.  **Bản đồ Gall-Peters:**
    - *Ưu điểm:* Giữ đúng diện tích. Các nước nghèo ở xích đạo được thể hiện đúng kích thước thật so với các nước phương Tây.
    - *Nhược điểm:* Sai lệch hình dáng. Châu Phi trông như bị kéo dài ra như giọt nước, rất xấu xí.

Không có giải pháp hoàn hảo. Đó là giới hạn toán học mà Gauss đã vạch ra.

## 5. Giai thoại: Gauss và những ngọn núi

Làm thế nào Gauss phát hiện ra điều này? Không phải khi ngồi trong tháp ngà.
Vào những năm 1820, Gauss được vua Hanover thuê làm trắc địa viên để đo đạc vương quốc. Ông đã dành nhiều năm lội bùn, cưỡi ngựa đi khắp các đỉnh núi để đo đạc tam giác đạc.

Chính trong lúc đo các góc của những tam giác khổng lồ nối các đỉnh núi (như đỉnh Brocken, Hohenhagen và Inselberg), Gauss nhận ra một điều kỳ lạ: **Tổng ba góc của tam giác thực tế lớn hơn 180 độ.**
Sai số này không phải do dụng cụ đo, mà do bề mặt Trái Đất bị cong.

Ông nhận ra rằng độ cong không phải là thứ gì đó bạn nhìn thấy từ bên ngoài (như nhìn quả địa cầu từ vũ trụ). Độ cong là thứ bạn có thể cảm nhận được từ **bên trong**, bằng cách đo đạc các góc và khoảng cách ngay tại nơi bạn đứng. Đây là nội dung cốt lõi của *Theorema Egregium* - Độ cong là một thuộc tính nội tại.

## 6. Kết luận

Lần tới khi bạn gập miếng pizza, hay nhìn vào sự méo mó của Greenland trên bản đồ, hãy nhớ rằng bạn đang tương tác với những quy luật sâu sắc của vũ trụ. Hình học Vi phân không xa vời; nó nằm ngay trong cấu trúc của vật chất, quy định cái gì có thể phẳng, cái gì phải cong, và cái gì bền vững.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" - dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*
