---
layout: post
lang: vi
title: "Bài 22: Nghệ thuật của Vô tận — M.C. Escher và Hình học Hyperbolic"
chapter: "09"
order: 6
owner: "Hình học Vi phân"
---

## 1. Câu hỏi về tiên đề thứ năm của Euclid

Trong hơn hai nghìn năm, bộ *Cơ sở* (*Elements*) của Euclid là nền tảng của hình học, xây dựng từ năm tiên đề cơ bản. Bốn tiên đề đầu tiên rất trực quan (chẳng hạn qua hai điểm xác định một đường thẳng), nhưng tiên đề thứ năm — tiên đề về đường thẳng song song (*"qua một điểm nằm ngoài một đường thẳng, có duy nhất một đường thẳng song song với đường thẳng đó"*) — có phát biểu phức tạp hơn. Trong nhiều thế kỷ, các nhà toán học cố gắng chứng minh tiên đề này từ bốn tiên đề còn lại nhưng đều không thành công.

Đến thế kỷ 19, Gauss, Lobachevsky và Bolyai đặt câu hỏi ngược lại: điều gì xảy ra nếu thay tiên đề thứ năm bằng giả thiết rằng qua điểm đó có **vô số** đường thẳng song song? Thay vì dẫn đến mâu thuẫn, giả thiết này mở ra một hệ hình học hoàn toàn nhất quán về mặt logic gọi là **Hình học Hyperbolic** (một dạng hình học phi Euclid).

*Để tìm hiểu nền tảng toán học về metric và đa tạp cong, hãy xem [Bài giảng 6: Dạng cơ bản thứ nhất]({{ '/contents/vi/chapter03/lecture-06-first-fundamental-form/' | absolute_url }}) và [Bài giảng 14: Đa tạp Riemann]({{ '/contents/vi/chapter07/lecture-14-riemannian-manifolds/' | absolute_url }}).*

**Mạch bài học:** Bản đồ kiến thức nền (bộ ba hình học độ cong hằng $$K > 0, K = 0, K < 0$$, mô hình Đĩa Poincaré, sự bùng nổ hàm mũ) → Đĩa Poincaré & tranh *Circle Limit III* của Escher → Ví dụ tính tay cầm tay chỉ việc: tính khoảng cách hyperbolic $$d_{\text{hyp}}(0, r) = \ln\frac{1+r}{1-r}$$ tại $$r = 0.5, 0.9, 0.99$$ và so sánh chu vi hình tròn bán kính $$R = 5$$ ($$31.4$$ vs. $$466.2$$!) → Khung giải thích chậm: 3 bước hiểu Đĩa Poincaré và tại sao tự nhiên chọn độ cong âm → Lá xà lách, San hô & Video.

---

## Bản đồ kiến thức nền: Hình học Hyperbolic và Đĩa Poincaré nghiên cứu gì?

### 1. Bộ ba Hình học Độ cong Hằng — Euclid chỉ là "ranh giới mỏng manh" ở giữa!
Thế giới các mặt hai chiều đồng nhất có độ cong Gauss hằng số $$K$$ chia thành đúng ba hình học:
- **Hình học cầu ($$K > 0$$):** không có đường song song (mọi đường tròn lớn đều cắt nhau), tổng ba góc tam giác $$> 180^\circ$$.
- **Hình học Euclid ($$K = 0$$):** có đúng 1 đường song song, tổng ba góc tam giác $$= 180^\circ$$.
- **Hình học Hyperbolic ($$K < 0$$):** có **vô số** đường song song, tổng ba góc tam giác $$< 180^\circ$$!

### 2. Mô hình Đĩa Poincaré — bản đồ bảo giác của vô tận
Bởi theo định lý Hilbert, ta không thể nhúng trơn toàn bộ mặt phẳng hyperbolic vào $$\mathbb{R}^3$$ mà giữ nguyên mọi khoảng cách, Henri Poincaré đã vẽ nó gọn vào bên trong đĩa đơn vị $$x^2 + y^2 < 1$$ bằng phép chiếu **bảo giác** (bảo toàn chính xác mọi góc!) với metric $$ds^2 = \frac{4(dx^2+dy^2)}{(1-r^2)^2}$$. Mọi đường thẳng hyperbolic hiện ra như các cung tròn vuông góc với mép đĩa!

### 3. Bùng nổ không gian theo hàm mũ — chìa khóa từ sinh học đến AI
Trong mặt phẳng hyperbolic, chu vi và diện tích vòng tròn bán kính $$R$$ tăng theo **hàm mũ** ($$\sim e^R$$) thay vì đa thức ($$\sim R, R^2$$). Điều này giải thích cả mép lá xà lách xoăn tít trong tự nhiên lẫn lý do **mạng nơ-ron hyperbolic** ngày nay nhúng dữ liệu cây phân cấp tốt vượt trội so với không gian Euclid!

---

## 2. Mô hình Đĩa Poincaré

Vì trực giác của chúng ta quen với không gian phẳng Euclid, Henri Poincaré đã xây dựng một mô hình phẳng giúp biểu diễn mặt phẳng hyperbolic bên trong một hình tròn đơn vị, gọi là **Đĩa Poincaré**.

![Đĩa Poincaré](https://upload.wikimedia.org/wikipedia/commons/4/4c/Poincare_disc_hyperbolic_parallel_lines.svg)
*Hình 1: Mô hình Đĩa Poincaré. Cung tròn màu đỏ vuông góc với biên là một "đường thẳng" (trắc địa). Qua điểm P nằm ngoài đường đỏ, có vô số cung màu xanh đi qua P mà không cắt đường đỏ.*

Trong mô hình này, ta có thể hình dung quy luật đo khoảng cách như sau:
1. **Biên ở vô cực:** Đường tròn biên của đĩa không thuộc không gian hyperbolic mà đại diện cho vô cực.
2. **Thước đo co lại gần biên:** Càng tiến từ tâm ra gần mép đĩa, độ dài Euclid của mỗi bước chân có cùng độ dài hyperbolic càng nhỏ đi.
3. **Không gian vô hạn trong đĩa hữu hạn:** Vì bước chân co nhỏ dần theo tỉ lệ nghịch với khoảng cách đến biên, để đi tới mép đĩa cần vô hạn bước. Đối với sinh vật sống bên trong đĩa, thế giới này rộng vô tận dù người quan sát trong mặt phẳng Euclid thấy nó nằm gọn trong một hình tròn bán kính 1.

Trong ngôn ngữ hình học vi phân, quy luật đo khoảng cách này được cho bởi tensor metric Poincaré:

$$ ds^2 = \frac{4(dx^2 + dy^2)}{(1 - (x^2 + y^2))^2} $$

Khi $$r^2 = x^2 + y^2 \to 1$$ (tiến sát đường tròn biên), mẫu số tiến về 0 khiến phần tử độ dài $$ds$$ tăng ra vô cùng.

## 3. M.C. Escher và bức tranh *Circle Limit III*

Nghệ sĩ đồ họa người Hà Lan M.C. Escher không phải là nhà toán học chuyên nghiệp, nhưng ông đặc biệt quan tâm đến việc biểu diễn sự vô tận và các phép lát kín mặt phẳng (tessellation). Năm 1954, sau khi nhìn thấy một hình vẽ mô hình đĩa Poincaré trong tài liệu toán học, ông nhận thấy đây là cấu trúc hình học phù hợp để thể hiện sự lặp lại vô hạn bên trong một khung hình hữu hạn.

Từ đó ra đời tác phẩm **Circle Limit III** (1959), vẽ các dãy cá bơi nối đuôi nhau từ tâm tỏa ra biên đĩa. Ở gần tâm, các con cá trông lớn và thu nhỏ dần khi tiến ra mép đĩa. Tuy nhiên, **theo metric của hình học hyperbolic, tất cả các con cá đó đều có cùng kích thước**; chúng chỉ trông nhỏ dần khi được chiếu lên mặt phẳng Euclid. Các đường cong trắng chạy dọc theo sống lưng các hàng cá trong tranh khớp rất sát với các đường trắc địa (cung tròn vuông góc hoặc cắt biên dưới góc cố định) của hình học hyperbolic.

---

## Ví dụ tính tay cầm tay chỉ việc: Khoảng cách ra biên Đĩa Poincaré & Chu vi hình tròn bán kính $$R = 5$$

### Ví dụ 1: Tích phân khoảng cách từ tâm ra bán kính Euclid $$r \in [0, 1)$$
Đi thẳng dọc trục hoành từ tâm $$(0, 0)$$ tới điểm $$(r, 0)$$ (với $$dy = 0$$), phần tử độ dài là $$ds = \frac{2\,dt}{1 - t^2}$$. Tích phân trực tiếp bằng phân tích phân thức:

$$
d_{\text{hyp}}(0, r) = \int_0^r \frac{2\,dt}{1 - t^2} = \int_0^r \left(\frac{1}{1+t} + \frac{1}{1-t}\right) dt = \ln\!\left(\frac{1 + r}{1 - r}\right)!
$$

Hãy thay các giá trị $$r$$ ngày càng sát mép đĩa $$r = 1$$:
- **$$r = 0.5$$** (nửa đường ra biên theo mắt thường): $$d_{\text{hyp}} = \ln\!\left(\frac{1.5}{0.5}\right) = \ln 3 \approx 1.10$$.
- **$$r = 0.9$$:** $$d_{\text{hyp}} = \ln\!\left(\frac{1.9}{0.1}\right) = \ln 19 \approx 2.94$$.
- **$$r = 0.99$$:** $$d_{\text{hyp}} = \ln\!\left(\frac{1.99}{0.01}\right) = \ln 199 \approx 5.29$$.
- **$$r \to 1^-$$:** $$\ln\!\left(\frac{1+r}{1-r}\right) \to +\infty$$! Mép đĩa tròn cách tâm một khoảng **vô hạn**!

### Ví dụ 2: Chu vi hình tròn bán kính $$R = 5$$ — Euclid vs. Hyperbolic
- Trong **mặt phẳng Euclid** ($$K = 0$$): $$C_{\text{Euc}}(5) = 2\pi \cdot 5 \approx 31.4$$.
- Trong **mặt phẳng Hyperbolic** ($$K = -1$$): $$C_{\text{hyp}}(5) = 2\pi \sinh(5) \approx 2\pi \cdot 74.20 \approx 466.2$$!

Chỉ mới đi ra bán kính $$R = 5$$, chu vi vòng tròn hyperbolic đã **dài gấp gần 15 lần** vòng tròn Euclid! Không gian ngoài rìa nhiều đến nỗi một chiếc lá hay cành san hô không thể nằm phẳng mà buộc phải gợn sóng gấp nếp để chứa hết phần mép!

---

### Khung giải thích: Ba bước hiểu Đĩa Poincaré và Hình học Độ cong Âm (nên đọc chậm)

#### Bước 1: Tại sao các "đường thẳng" trong Đĩa Poincaré lại cong vào tâm?
Hãy tưởng tượng bạn cần đi từ hai điểm $$A, B$$ gần mép đĩa sang nhau. Nếu đi theo đoạn thẳng Euclid sát mép, mẫu số $$(1 - r^2)$$ rất nhỏ nên **chi phí độ dài cực kỳ đắt đỏ**! Để tiết kiệm tổng chi phí, đường ngắn nhất (trắc địa) khôn ngoan **vòng sâu vào gần tâm đĩa** (nơi bước chân rẻ hơn nhiều!) rồi mới vòng ra $$B$$ — tạo thành đúng cung tròn vuông góc với biên!

#### Bước 2: Quy luật diện tích tam giác — tổng góc càng nhỏ, tam giác càng to!
Trong mặt phẳng hyperbolic độ cong $$K = -1$$, định lý Gauss–Bonnet cho công thức kinh ngạc: diện tích của mọi tam giác hyperbolic có ba góc $$\alpha, \beta, \gamma$$ là:
$$
\operatorname{Area}(\triangle) = \pi - (\alpha + \beta + \gamma).
$$
Do đó mọi tam giác hyperbolic đều có diện tích bị chặn trên bởi $$\pi$$ (ngay cả khi ba đỉnh nằm tận biên vô cực với ba góc bằng $$0$$)!

#### Bước 3: Từ nghệ thuật Escher sang Học sâu Hyperbolic hiện đại
Vì chu vi tăng theo hàm mũ $$e^R$$, không gian hyperbolic có đúng "hình dạng tự nhiên" của một **cây phân cấp** (số nút lá ở tầng $$d$$ cũng tăng theo hàm mũ $$2^d$$)! Đó là lý do những chú cá nhỏ dần ở mép đĩa trong tranh *Circle Limit III* của Escher ngày nay trở thành hình ảnh đại diện cho các mạng nơ-ron hyperbolic biểu diễn tri thức phân cấp!

## 4. Hình học hyperbolic trong tự nhiên: Lá xà lách và san hô

Hình học hyperbolic không chỉ tồn tại trong mô hình toán học hay tranh vẽ mà còn xuất hiện phổ biến ở sinh vật tự nhiên như mép lá rau xà lách xoăn, nấm tai mèo hay các loài san hô.

![Tam giác Hyperbolic](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Hyperbolic_triangle_angle_sum.svg/400px-Hyperbolic_triangle_angle_sum.svg.png)
*Hình 2: Tam giác trong không gian hyperbolic có các cạnh uốn cong vào trong và tổng ba góc nhỏ hơn 180 độ; diện tích càng lớn thì tổng góc càng nhỏ.*

Đó là hệ quả trực tiếp của **độ cong Gauss âm ($$K < 0$$)**:
- Trên mặt phẳng Euclid, chu vi đường tròn bán kính $$R$$ là $$2\pi R$$ và diện tích tăng theo $$R^2$$.
- Trên mặt phẳng hyperbolic (với $$K = -1$$), chu vi đường tròn là $$2\pi \sinh R$$, tăng theo hàm mũ khi $$R$$ tăng.

Để tăng nhanh diện tích bề mặt nhằm hấp thụ ánh sáng quang hợp (ở lá xà lách) hoặc lọc chất dinh dưỡng trong nước (ở san hô), phần mép sinh trưởng nhanh hơn nhiều so với bán kính. Vì phần mép dài ra vượt quá chỗ chứa của một mặt phẳng, cấu trúc buộc phải uốn lượn, gợn sóng thành dạng bề mặt mang độ cong âm.

## 5. Kết luận

Từ hình học phẳng Euclid ($$K = 0$$) đến hình học cầu ($$K > 0$$) và hình học hyperbolic ($$K < 0$$), hình học vi phân cho thấy độ cong quyết định sâu sắc cách khoảng cách, góc và diện tích vận hành. Dù xuất hiện trong mô hình đĩa Poincaré, tác phẩm đồ họa của Escher hay hình thái gấp nếp của sinh vật biển, cấu trúc của hình học phi Euclid đều mang ý nghĩa hình học rõ ràng và nhất quán.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" — dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*

## Video tham khảo

- [Ditching the Fifth Axiom - Numberphile](https://www.youtube.com/watch?v=PnW5IRvgvLY) — Numberphile, tiếng Anh. Xem trước: giải thích hệ quả của việc bỏ tiên đề thứ năm của Euclid, mở ra trường hợp có vô số đường song song qua một điểm.
- [Playing Sports in Hyperbolic Space - Numberphile](https://www.youtube.com/watch?v=u6Got0X41pY) — Numberphile, tiếng Anh. Minh họa mô hình đĩa Poincaré, nơi đường thẳng là các cung vuông góc với biên và diện tích tăng theo hàm mũ khi ra xa tâm.
- [Non-euclidean virtual reality](https://www.youtube.com/watch?v=ztsi0CLxmjw) — Henry Segerman, tiếng Anh. Trải nghiệm di chuyển trực quan trong không gian hyperbolic được dựng bằng thực tế ảo, minh họa trực tiếp không gian vô tận trong tranh *Circle Limit* của Escher.
