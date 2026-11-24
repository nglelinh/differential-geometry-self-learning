---
layout: post
lang: vi
title: "Bài 17: Định lý Pizza và Bí mật của Bản đồ — Độ cong Gauss và Theorema Egregium"
chapter: "09"
order: 1
owner: "Hình học Vi phân"
---

## 1. Lời nói đầu: Từ miếng pizza đến tấm bản đồ

Khi cầm một lát pizza New York bản rộng và mỏng trên tay, trọng lực kéo đầu nhọn của lát bánh rũ xuống, dễ làm phần nhân trượt khỏi đế bánh. Theo phản xạ quen thuộc, ta dùng các ngón tay uốn nhẹ phần vỏ bánh thành hình chữ U (hoặc chữ V). Ngay lập tức, lát bánh trở nên cứng cáp hơn và giữ thẳng theo chiều dọc mà không còn gập xuống.

![Minh họa cách cầm Pizza](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Pizza_slice_folded.png/640px-Pizza_slice_folded.png)
*Hình 1: Uốn cong vỏ bánh theo phương ngang buộc độ cong theo phương dọc phải bằng 0 để bảo toàn độ cong Gauss bằng 0. (Ảnh minh họa)*

Thao tác quen thuộc đó là một minh họa trực tiếp cho một kết quả nền tảng của hình học vi phân: **Theorema Egregium** (Định lý Đáng chú ý) của Carl Friedrich Gauss. Trong bài giảng này, chúng ta sẽ đi từ lát bánh pizza đến bài toán vẽ bản đồ thế giới để hiểu bản chất nội tại của độ cong.

*Nếu bạn muốn tìm hiểu phần toán học chi tiết, hãy tham khảo [Bài giảng 7: Dạng cơ bản thứ hai và Độ cong Gauss]({{ '/contents/vi/chapter03/lecture-07-second-fundamental-form/' | absolute_url }}) và [Bài giảng 8: Theorema Egregium]({{ '/contents/vi/chapter04/lecture-08-gauss-map-theorema-egregium/' | absolute_url }}).*

**Mạch bài học:** Bản đồ kiến thức nền (độ cong nội tại vs. ngoại tại, Theorema Egregium, phép chiếu bản đồ) → Ba loại độ cong bề mặt & Định lý Pizza → Ví dụ tính số cầm tay chỉ việc: tính độ cong Gauss của lát pizza, mặt cầu và hệ số phóng đại diện tích $$\sec^2\phi$$ của Greenland trên bản đồ Mercator → Khung giải thích chậm: 3 bước giải mã Theorema Egregium → Giai thoại đo đạc Hanover & Video.

---

## Bản đồ kiến thức nền: Độ cong Nội tại và Theorema Egregium nói lên điều gì?

### 1. Độ cong ngoại tại vs. Độ cong nội tại
Một tờ giấy phẳng cuộn thành ống trụ trông "cong" dưới mắt chúng ta trong không gian 3D — đó là **độ cong ngoại tại** (phụ thuộc vào cách nhúng vào $$\mathbb{R}^3$$). Nhưng với một chú kiến bò trên mặt trụ, tổng ba góc của mọi tam giác vẫn bằng đúng $$180^\circ$$ và chu vi vòng tròn bán kính $$r$$ vẫn bằng đúng $$2\pi r$$ — tức mặt trụ **phẳng hoàn toàn về mặt nội tại** ($$K = 0$$)!

### 2. Theorema Egregium (Gauss, 1827) — "Định lý Đáng chú ý"
Carl Friedrich Gauss chứng minh rằng dù độ cong chính $$k_1$$ và $$k_2$$ từng cái một đều phụ thuộc vào cách uốn bề mặt trong không gian 3D, **tích của chúng $$K = k_1 \cdot k_2$$** lại chỉ phụ thuộc hoàn toàn vào **metric nội tại** (khoảng cách đo dọc trên bề mặt)! Do đó mọi phép uốn không kéo giãn, không xé rách (phép đẳng cự) đều **bảo toàn tuyệt đối $$K$$**.

### 3. Bản đồ học — bài toán không thể có lời giải hoàn hảo
Bởi mặt cầu Trái Đất có $$K = 1/R^2 > 0$$ còn tờ giấy bản đồ có $$K = 0$$, *Theorema Egregium* đóng sập mọi hy vọng tìm một phép chiếu bản đồ bảo toàn đồng thời cả khoảng cách, góc và diện tích. Mọi tấm bản đồ thế giới đều là một sự đánh đổi có tính toán!

---

## 2. Phân loại độ cong bề mặt

Trong đời thường, ta gọi một vật là "cong" khi nó không phẳng. Tuy nhiên, trong toán học, độ cong của một bề mặt có nhiều dạng khác nhau. Để hiểu vì sao miếng pizza cứng lại khi uốn vỏ, ta cần phân biệt các hướng cong tại một điểm.

Hãy hình dung một con kiến bò trên bề mặt: tại mỗi điểm, bề mặt có thể uốn theo các hướng khác nhau — chẳng hạn cong lên dọc theo mép vỏ bánh nhưng lại cong xuống dọc theo chiều dài lát bánh. Gauss định nghĩa **độ cong Gauss** ($$K$$) là tích của hai độ cong chính $$k_1$$ và $$k_2$$ (hai giá trị độ cong cực trị theo hai phương vuông góc tại điểm đó):

$$ K = k_1 \cdot k_2 $$

### Ba loại hình học bề mặt cơ bản
Dựa vào dấu của $$K$$, ta phân biệt ba trường hợp:

![Ba loại độ cong](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Minkowski_curvature.gif/400px-Minkowski_curvature.gif)
*Hình 2: Minh họa trực quan ba loại độ cong. Bên trái: độ cong âm (yên ngựa). Ở giữa: độ cong bằng 0 (mặt phẳng hoặc mặt trụ). Bên phải: độ cong dương (mặt cầu).*

1. **Bề mặt phẳng nội tại ($$K = 0$$):** Mặt bàn, tờ giấy hay mặt trụ (ống nước). Lý do mặt trụ có $$K = 0$$ sẽ được giải thích ngay dưới đây.
2. **Bề mặt cong dương ($$K > 0$$):** Quả cam, quả bóng, vỏ trứng. Cả hai độ cong chính đều cùng dấu (cùng uốn về một phía).
3. **Bề mặt cong âm hay dạng yên ngựa ($$K < 0$$):** Miếng khoai tây chiên Pringles, đèo núi. Một phương cong lên và phương vuông góc với nó cong xuống.

## 3. Định lý Pizza: Vì sao gập lại thì bánh cứng hơn?

Khi lát pizza nằm phẳng trên đĩa, cả độ cong ngang $$k_1 = 0$$ và độ cong dọc $$k_2 = 0$$, nên độ cong Gauss $$K = 0 \times 0 = 0$$. Khi bạn nhấc lát bánh lên mà giữ phẳng phần vỏ ($$k_1 = 0$$), trọng lực có thể uốn lát bánh cong xuống theo chiều dọc ($$k_2 \neq 0$$) mà tích $$K = 0 \cdot k_2 = 0$$ vẫn được bảo toàn.

Theo *Theorema Egregium* của Gauss, **độ cong Gauss là bất biến dưới các phép uốn đẳng cự (isometry)**: nếu chỉ uốn một vật liệu mà không kéo giãn hay làm rách nó, độ cong Gauss tại mọi điểm phải giữ nguyên.

Vì miếng pizza ban đầu phẳng nên có $$K = 0$$; miễn là đế bánh không bị kéo giãn hoặc rách, nó vẫn phải giữ $$K = 0$$. Khi bạn chủ động bóp vỏ bánh tạo hình chữ U, bạn làm cho độ cong ngang $$k_1 \neq 0$$. Vì tích $$K = k_1 \cdot k_2 = 0$$, điều kiện toán học buộc **$$k_2 = 0$$**. Điều này có nghĩa là lát bánh không thể cong theo chiều dọc được nữa — nó giữ thẳng theo phương dọc nhờ sự ràng buộc hình học giữa hai phương cong.

### Các ứng dụng quen thuộc
Nguyên lý bảo toàn độ cong Gauss xuất hiện rộng rãi trong kỹ thuật và tự nhiên:
- **Tôn lợp mái nhà:** Tấm kim loại phẳng rất dễ bị võng dưới trọng lượng của chính nó. Khi được cán dập thành các nếp lượn sóng ($$k_1 \neq 0$$), tấm tôn buộc phải giữ thẳng theo phương vuông góc ($$k_2 = 0$$), nhờ đó tăng đáng kể độ cứng vững mà không cần tăng độ dày vật liệu.
- **Thân cây hình ống (như cọng rau muống):** Cấu trúc hình trụ có $$K = 0$$ với một phương uốn tròn ($$k_1 \neq 0$$), giúp phương còn lại dọc theo thân giữ thẳng ($$k_2 = 0$$) và khó bị gập gãy.

## 4. Thách thức của người vẽ bản đồ

Cùng một định lý giúp giữ thẳng lát pizza lại đặt ra giới hạn toán học không thể vượt qua trong ngành bản đồ học: **Trái Đất có dạng gần cầu ($$K > 0$$), còn tờ giấy bản đồ thì phẳng ($$K = 0$$).**

Từ *Theorema Egregium*, Gauss chứng minh rằng **không thể trải một bề mặt có $$K > 0$$ lên mặt phẳng có $$K = 0$$ mà bảo toàn đồng thời mọi khoảng cách**. Cũng như không thể ép phẳng một mảnh vỏ cam trên mặt bàn mà không làm rách hoặc nhăn nó, không tồn tại một tấm bản đồ phẳng nào thể hiện chính xác đồng thời cả hình dạng, góc và diện tích của Trái Đất.

![Sự biến dạng của phép chiếu Mercator](https://upload.wikimedia.org/wikipedia/commons/8/87/Tissot_mercator.png)
*Hình 3: Các vòng tròn chỉ thị Tissot minh họa mức độ biến dạng của phép chiếu Mercator: các vòng tròn càng gần cực càng bị phóng đại mạnh so với vùng xích đạo.*

### Sự đánh đổi giữa các phép chiếu bản đồ
Mỗi phép chiếu bản đồ phải chấp nhận đánh đổi giữa các yếu tố hình học khác nhau:
1. **Phép chiếu Mercator (được dùng phổ biến trên bản đồ web):**
   - *Ưu điểm:* Bảo toàn góc và hình dạng cục bộ (phép chiếu bảo giác — conformal), rất thuận tiện cho định hướng hàng hải.
   - *Nhược điểm:* Làm sai lệch mạnh diện tích ở các vĩ độ cao. Trên bản đồ Mercator, Greenland trông lớn ngang châu Phi, trong khi thực tế diện tích châu Phi lớn gấp khoảng 14 lần Greenland.
2. **Phép chiếu Gall–Peters:**
   - *Ưu điểm:* Bảo toàn tỉ lệ diện tích thực giữa các khu vực, giúp các quốc gia gần xích đạo được thể hiện đúng quy mô diện tích so với vùng vĩ độ cao.
   - *Nhược điểm:* Làm biến dạng hình dạng địa lý, khiến các lục địa gần xích đạo (như châu Phi) bị kéo dài theo chiều dọc.

Không có phép chiếu phẳng nào tránh được hoàn toàn biến dạng; đó là hệ quả trực tiếp từ định lý của Gauss.

---

## Ví dụ tính số cầm tay chỉ việc: Con số phía sau lát Pizza và bản đồ Mercator

1. **Độ cong của lát Pizza khi bóp cong thành cung tròn bán kính $$r = 5\text{ cm}$$:**
   - Theo phương ngang (mép vỏ bánh): $$k_1 = \frac{1}{r} = \frac{1}{5} = 0.2\text{ cm}^{-1}$$.
   - Để không làm rách đế bánh ($$K = 0$$), ta buộc phải có $$0.2 \cdot k_2 = 0 \implies k_2 = 0$$ (thẳng tắp theo chiều dọc!).

2. **Tại sao Greenland trông to bằng cả Châu Phi trên bản đồ Mercator?**
   Trên mặt cầu Trái Đất bán kính $$R$$, một vòng vĩ tuyến ở vĩ độ $$\phi$$ có chu vi $$2\pi R \cos\phi$$, nhưng bản đồ Mercator kéo giãn mọi vĩ tuyến rộng bằng đúng Xích đạo ($$2\pi R$$), tức phóng đại chiều ngang lên $$\frac{1}{\cos\phi} = \sec\phi$$ lần! Để bảo toàn góc (bảo giác), phép chiếu buộc phải phóng đại chiều dọc thêm $$\sec\phi$$ lần nữa $$\implies$$ **diện tích bị phóng đại lên $$\sec^2\phi$$ lần!** Hãy bấm máy kiểm tra ở ba vĩ độ:
   - Tại **Xích đạo** ($$\phi = 0^\circ$$, trung tâm Châu Phi): $$\sec^2 0^\circ = 1\times$$ (giữ nguyên diện tích).
   - Tại **$$\phi = 60^\circ$$** (miền Nam Greenland / Na Uy): $$\sec^2 60^\circ = \frac{1}{0.5^2} = 4\times$$!
   - Tại **$$\phi = 75^\circ$$** (miền Bắc Greenland): $$\sec^2 75^\circ \approx \frac{1}{0.2588^2} \approx 14.9\times$$!

   Con số $$14.9\times$$ ấy khớp đến kỳ lạ với thực tế diện tích Châu Phi ($$30.3\text{ triệu km}^2$$) lớn gấp khoảng **14 lần** Greenland ($$2.16\text{ triệu km}^2$$) — giải thích tại sao trên bản đồ Google Maps cổ điển hai vùng đất trông gần bằng nhau!

---

### Khung giải thích: Ba bước giải mã Theorema Egregium (nên đọc chậm)

#### Bước 1: Tại sao một phép uốn không kéo giãn lại khóa chặt $$K$$?
Giả sử bạn kẻ một hình tròn bán kính nhỏ $$\varepsilon$$ trên bề mặt. Chu vi của nó trên một mặt có độ cong Gauss $$K$$ tuân theo công thức khai triển Bertrand–Diquet–Puiseux:
$$
C(\varepsilon) = 2\pi\varepsilon\left(1 - \frac{K}{6}\varepsilon^2 + O(\varepsilon^4)\right).
$$
Công thức này **chỉ dùng thước dây đo trực tiếp trên bề mặt**! Nếu bạn uốn tờ giấy mà không kéo giãn, chu vi $$C(\varepsilon)$$ của mọi hình tròn nhỏ giữ nguyên tuyệt đối $$\implies$$ giá trị $$K$$ bắt buộc không đổi!

#### Bước 2: Quy tắc tích bằng 0 cho mọi bề mặt khai triển được ($$K = 0$$)
Bất kỳ bề mặt nào làm từ một tấm vật liệu phẳng không co giãn (tờ giấy, tấm tôn, lát bánh pizza) đều có $$K = k_1 k_2 = 0$$ tại mọi điểm — nên tại mỗi điểm **ít nhất một trong hai độ cong chính phải bằng $$0$$**! Chính tính chất đó buộc mặt chỉ có thể cong theo một phương tại một thời điểm.

#### Bước 3: Bất khả thi của bản đồ phẳng hoàn hảo
Nếu tồn tại một bản đồ phẳng bảo toàn mọi khoảng cách từ một mảnh Trái Đất ($$K = 1/R^2 > 0$$) sang tờ giấy ($$K = 0$$), thì theo Bước 1 ta phải có $$1/R^2 = 0$$ — vô lý! Do đó bản đồ học buộc phải chọn: giữ góc (Mercator) hay giữ diện tích (Gall–Peters).

## 5. Giai thoại: Gauss và công việc đo đạc trắc địa

Phát hiện của Gauss gắn liền với công việc thực địa. Vào những năm 1820, ông đảm nhận nhiệm vụ khảo sát trắc địa cho Vương quốc Hanover, trực tiếp đo đạc các lưới tam giác nối giữa những đỉnh núi (như Brocken, Hohenhagen và Inselberg).

Khi đo góc của các tam giác lớn trên bề mặt Trái Đất, tổng ba góc của tam giác cầu lớn hơn 180 độ — độ lệch này không phải sai số thiết bị mà xuất phát từ chính độ cong của Trái Đất. Từ đó, Gauss nhận ra rằng độ cong không nhất thiết phải quan sát từ bên ngoài không gian ba chiều (như nhìn quả địa cầu từ xa), mà có thể xác định hoàn toàn từ **bên trong** bề mặt thông qua các phép đo độ dài và góc. Đó chính là nội dung cốt lõi của *Theorema Egregium*: độ cong Gauss là một đại lượng nội tại.

## 6. Kết luận

Từ việc uốn nhẹ vỏ một lát pizza đến sự biến dạng diện tích của Greenland trên bản đồ phẳng, cả hai hiện tượng đều chịu sự chi phối của cùng một nguyên lý hình học. Hình học vi phân cho thấy độ cong là thuộc tính nội tại của bề mặt, quy định những biến dạng nào có thể thực hiện mà không làm co giãn vật liệu và những giới hạn nào là bất khả kháng.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, tiếng Anh. Xem trước: minh họa trực tiếp thí nghiệm lát pizza — uốn cong theo một phương buộc phương kia giữ thẳng vì độ cong Gauss của mặt phẳng vẫn bằng 0.
- [La manera más matemática de comerse una pizza](https://www.youtube.com/watch?v=1mVTp-8Zmok) — Lemnismath, tiếng Tây Ban Nha. Cùng câu chuyện lát pizza, sau đó mở rộng sang bản đồ: mặt cầu không thể trải phẳng mà giữ nguyên đồng thời cả góc lẫn diện tích.
- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, tiếng Anh. Bài giảng toán học dẫn tới định lý liên quan đến công việc đo đạc Hanover, với phần cuối trình bày *Theorema Egregium*.
