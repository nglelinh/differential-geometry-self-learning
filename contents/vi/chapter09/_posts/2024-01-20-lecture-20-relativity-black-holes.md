---
layout: post
lang: vi
title: "Bài 20: Thuyết Tương Đối và Lỗ Đen — Khi Không Gian Biết Uốn Cong"
chapter: "09"
order: 4
owner: "Hình học Vi phân"
---

## 1. Cú ngã của người thợ sơn

Năm 1907, Albert Einstein đang ngồi trong văn phòng cấp bằng sáng chế ở Bern, Thụy Sĩ. Bỗng nhiên, một ý nghĩ lóe lên trong đầu ông: *"Nếu một người ngã tự do từ trên mái nhà xuống, anh ta sẽ không cảm thấy trọng lượng của chính mình."*

Einstein sau này gọi đó là "ý tưởng hạnh phúc nhất đời tôi". Tại sao một ý nghĩ về tai nạn ngã lầu lại khiến ông hạnh phúc?
Bởi vì nó là chìa khóa để giải mã bí ẩn lớn nhất của vũ trụ: **Trọng lực thực chất là gì?**

Trong bài giảng này, chúng ta sẽ đi từ cú ngã tưởng tượng đó đến những hố đen quái vật nuốt chửng cả ánh sáng, và thấy rằng tất cả chỉ là những bài toán hình học trên một tấm vải cong vĩ đại.

*Nếu bạn muốn hiểu sâu về toán học của vũ trụ, hãy đọc [Bài giảng 13: Độ cong Riemann](/contents/vi/chapter07/2024-01-13-lecture-13-riemann-curvature/) và [Bài giảng 16: Hình học Không-Thời gian](/contents/vi/chapter08/2024-01-16-lecture-16-spacetime-geometry/).*

## 2. Newton sai ở đâu?

Trong hơn 200 năm, Isaac Newton là vua của vật lý. Ông bảo rằng:
1.  Không gian là một cái sân khấu cố định, phẳng lì và bất biến.
2.  Thời gian trôi đều đặn tích tắc như nhau cho tất cả mọi người.
3.  Trọng lực là một **lực** vô hình nối Trái Đất và Mặt Trăng, kéo chúng lại với nhau ngay lập tức.

Nhưng Einstein nhận ra một lỗ hổng. Nếu Mặt Trời đột ngột biến mất, theo Newton, Trái Đất sẽ văng ra khỏi quỹ đạo *ngay lập tức*. Nhưng ánh sáng từ Mặt Trời mất 8 phút mới đến được Trái Đất. Làm sao trọng lực có thể đi nhanh hơn ánh sáng? Điều này vi phạm thuyết Tương đối Hẹp.

Einstein phải viết lại luật chơi. Và ông đã dùng Hình học Vi phân để làm điều đó.

## 3. Tấm nệm cao su Không-Thời gian

Einstein đề xuất: **Không gian và Thời gian không tách rời. Chúng dệt lại với nhau thành một tấm vải 4 chiều gọi là Không-Thời gian (Spacetime).**

Và quan trọng nhất: **Tấm vải này không cứng. Nó mềm dẻo.**

### Thí nghiệm tư duy: Tấm nệm lò xo
Hãy tưởng tượng một tấm nệm lò xo căng phẳng.
- Nếu bạn lăn một viên bi nhỏ, nó đi thẳng.
- Nếu bạn đặt một quả bóng bowling nặng vào giữa, tấm nệm trũng xuống.
- Bây giờ lăn viên bi nhỏ qua. Nó sẽ không đi thẳng nữa mà bị cong về phía quả bóng bowling.
- Nếu lăn đúng tốc độ, viên bi sẽ chạy vòng tròn quanh quả bóng bowling.

![Độ cong không thời gian](https://upload.wikimedia.org/wikipedia/commons/2/22/Spacetime_curvature.png)
*Hình 1: Khối lượng của Trái Đất làm cong lưới không-thời gian xung quanh nó. Mặt Trăng không bị "kéo" bởi lực, mà nó đang lăn tự do trong cái hố cong này.*

Newton nhìn vào và bảo: *"Có một sợi dây vô hình (lực hấp dẫn) kéo viên bi lại."*
Einstein nhìn vào và bảo: *"Không có sợi dây nào cả. Viên bi chỉ đang cố đi thẳng trên một mặt cong."*

**Vật chất bảo không gian cách cong. Không gian bảo vật chất cách di chuyển.**
Đây là câu thần chú của Thuyết Tương đối Rộng.

## 4. Phương trình đẹp nhất Vật lý

Ý tưởng trên được gói gọn trong Phương trình trường Einstein:

$$ R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu} $$

Đừng sợ các ký hiệu. Hãy nhìn vào ý nghĩa của nó:
- **Vế Trái (Hình học):** \(R_{\mu\nu}\) là độ cong của không gian. Nó đo lường mức độ "lồi lõm" của tấm vải.
- **Vế Phải (Vật chất):** \(T_{\mu\nu}\) là năng lượng và khối lượng của vật thể (ngôi sao, hành tinh).
- **Dấu bằng (=):** Sự tương đương. Khối lượng chính là độ cong.

## 5. Lỗ Đen và Thời gian ngừng trôi

Điều gì xảy ra nếu bạn nén Trái Đất lại thành kích thước một viên bi? Hoặc nén Mặt Trời thành một quả bóng tennis?
Mật độ vật chất sẽ lớn đến mức tấm nệm không-thời gian không chỉ trũng xuống, mà nó bị thủng một lỗ sâu hun hút, dốc đứng.
Đó là **Lỗ Đen**.

Tại biên giới của cái hố này (Chân trời sự kiện), độ cong lớn đến mức ngay cả ánh sáng - vận động viên chạy nhanh nhất vũ trụ - cũng không đủ sức leo ra ngoài.

Nhưng điều kỳ lạ hơn là **Thời gian**.
Theo Einstein, trọng lực không chỉ bẻ cong không gian, nó còn **kéo giãn thời gian**.
- Bạn càng ở gần vật nặng (nơi không gian cong mạnh), thời gian trôi càng chậm.
- Tại chân trời sự kiện của lỗ đen, thời gian dường như **dừng lại hoàn toàn** đối với người quan sát từ xa.
Nếu bạn rơi vào lỗ đen, bạn thấy mình rơi bình thường. Nhưng bạn bè bạn ở xa nhìn thấy bạn rơi chậm dần, chậm dần, và mãi mãi dính chặt ở mép hố đen như một bức tượng vĩnh cửu.

![Thấu kính hấp dẫn](https://upload.wikimedia.org/wikipedia/commons/0/03/Black_hole_lensing_web.gif)
*Hình 2: Mô phỏng một lỗ đen đi ngang qua một thiên hà. Lỗ đen bẻ cong ánh sáng từ thiên hà phía sau, tạo ra hình ảnh méo mó và nhân đôi. Đây là hiện tượng Thấu kính hấp dẫn.*

### Ứng dụng: GPS
Bạn không cần đến lỗ đen để thấy điều này. Hệ thống định vị GPS trên điện thoại của bạn phải tính đến hiệu ứng này mỗi ngày.
Các vệ tinh GPS bay ở độ cao 20.000 km, nơi trọng lực yếu hơn mặt đất. Do đó, thời gian trên vệ tinh trôi **nhanh hơn** dưới mặt đất khoảng 38 micro giây mỗi ngày.
Nếu các kỹ sư không dùng công thức của Einstein để chỉnh lại đồng hồ, hệ thống GPS sẽ sai lệch hàng chục km chỉ sau một ngày!

## 6. Kết luận

Hình học Vi phân không chỉ là toán học trên giấy. Nó là phần mềm hệ điều hành của vũ trụ.
Từ việc quả táo rơi, đến chuyển động của các hành tinh, và cả sự trôi đi của thời gian, tất cả đều là những hệ quả của việc chúng ta đang sống trong một hình học Riemann cong, chứ không phải cái hộp phẳng của Newton.
Einstein đã cho chúng ta đôi mắt hình học để nhìn thấy vẻ đẹp thực sự của trọng lực.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" - dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*
