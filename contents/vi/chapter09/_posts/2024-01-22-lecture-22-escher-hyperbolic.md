---
layout: post
lang: vi
title: "Bài 22: Nghệ thuật của Vô tận — M.C. Escher và Hình học Hyperbolic"
chapter: "09"
order: 6
owner: "Hình học Vi phân"
---

## 1. Cuộc nổi loạn của Hình học

Trong hơn 2000 năm, cuốn sách "Cơ sở" (Elements) của Euclid là kinh thánh của toán học. Nó xây dựng toàn bộ hình học dựa trên 5 tiên đề đơn giản.
Bốn tiên đề đầu tiên rất hiển nhiên (ví dụ: qua 2 điểm vẽ được 1 đường thẳng).
Nhưng Tiên đề thứ 5 (Tiên đề về đường song song) lại rất rắc rối: *"Qua một điểm nằm ngoài một đường thẳng, chỉ có duy nhất một đường thẳng song song với đường thẳng đó."*

Các nhà toán học cảm thấy tiên đề này quá phức tạp, không "đẹp". Họ cố gắng chứng minh nó dựa trên 4 tiên đề kia. Họ đã thử suốt 20 thế kỷ. Và họ đều thất bại.

Đến thế kỷ 19, một nhóm các nhà toán học "nổi loạn" (Gauss, Lobachevsky, Bolyai) đã đặt ra một câu hỏi táo bạo: **Điều gì xảy ra nếu Tiên đề 5 sai?**
Điều gì xảy ra nếu có **vô số** đường thẳng song song đi qua điểm đó?

Họ nghĩ rằng điều này sẽ dẫn đến mâu thuẫn và sụp đổ toán học. Nhưng không. Nó dẫn họ đến một thế giới mới, kỳ lạ nhưng hoàn toàn logic và nhất quán. Đó là **Hình học Hyperbolic** (Hình học Phi Euclid).

*Để hiểu sâu hơn về metric và độ cong, hãy xem [Bài giảng 6: Dạng cơ bản thứ nhất](/contents/vi/chapter03/2024-01-06-lecture-06-first-fundamental-form/) và [Bài giảng 14: Đa tạp Riemann](/contents/vi/chapter07/2024-01-14-lecture-14-riemannian-manifolds/).*

## 2. Thế giới trong cái Đĩa của Poincaré

Hình học Hyperbolic rất khó hình dung vì não bộ chúng ta được lập trình cho không gian phẳng Euclid.
Để giúp chúng ta nhìn thấy nó, Henri Poincaré đã tạo ra một mô hình: **Đĩa Poincaré**.

![Đĩa Poincaré](https://upload.wikimedia.org/wikipedia/commons/4/4c/Poincare_disc_hyperbolic_parallel_lines.svg)
*Hình 1: Mô hình Đĩa Poincaré. Đường cong màu đỏ là một "đường thẳng" (trắc địa). Qua điểm P nằm ngoài đường đỏ, có vô số đường màu xanh đi qua P mà không cắt đường đỏ (song song).*

Hãy tưởng tượng một cái đĩa tròn.
1.  **Luật chơi:** Bạn không bao giờ có thể chạm vào mép đĩa. Mép đĩa là "vô cực".
2.  **Phép thuật:** Khi bạn đi từ tâm ra mép đĩa, bạn bị thu nhỏ lại. Càng gần mép, bạn càng bé đi. Bước chân bạn ngắn lại.
3.  **Hệ quả:** Để đi đến mép đĩa, bạn phải bước vô hạn bước chân. Đối với bạn (người sống trong đĩa), thế giới này là vô tận, dù người ngoài nhìn vào thấy nó hữu hạn.

Trong hình học vi phân, ta mô tả điều này bằng Metric Tensor:

$$ ds^2 = \frac{4(dx^2 + dy^2)}{(1 - (x^2 + y^2))^2} $$

Khi \(r^2 = x^2 + y^2 \to 1\) (tiến ra mép), mẫu số tiến về 0, làm cho khoảng cách \(ds\) tiến tới vô cùng.

## 3. M.C. Escher: Người họa sĩ của Vô tận

M.C. Escher, nghệ sĩ đồ họa thiên tài người Hà Lan, không phải là nhà toán học. Nhưng ông bị ám ảnh bởi sự vô tận và các quy luật lấp đầy mặt phẳng (tessellation).
Năm 1954, ông nhìn thấy một hình minh họa của đĩa Poincaré trong một cuốn sách toán. Ông bị sốc. Ông nhận ra đây chính là cái khung hoàn hảo để ông vẽ sự vô tận.

Bức tranh **Circle Limit III** (1959) ra đời.
- Ông vẽ những con cá bơi nối đuôi nhau.
- Ở tâm, con cá to. Ra ngoài biên, con cá nhỏ dần.
- Nhưng hãy nhớ: **Trong thế giới Hyperbolic, tất cả những con cá đó đều to bằng nhau!**
- Chúng chỉ "trông có vẻ" nhỏ đi do hiệu ứng của metric Poincaré khi chiếu lên mặt phẳng Euclid của chúng ta.

Escher đã vẽ chính xác đến mức các nhà toán học sau này dùng thước đo và thấy các đường cong màu trắng chạy dọc theo lưng cá chính là các đường trắc địa (geodesics) chuẩn xác trong hình học Hyperbolic. Ông đã thấu hiểu cấu trúc của không gian này bằng trực giác nghệ thuật.

## 4. Tại sao Rau Xà lách lại xoăn?

Hình học Hyperbolic không chỉ nằm trong tranh của Escher. Nó nằm trong đĩa salad của bạn.
Hãy nhìn một lá rau xà lách, hoặc một miếng san hô, hay một cây nấm. Tại sao mép của chúng lại xoăn tít thò lò như vậy?

![Tam giác Hyperbolic](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Hyperbolic_triangle_angle_sum.svg/400px-Hyperbolic_triangle_angle_sum.svg.png)
*Hình 2: Một tam giác trong không gian Hyperbolic có các cạnh cong vào trong và tổng ba góc nhỏ hơn 180 độ. Diện tích càng lớn, tổng góc càng nhỏ.*

Đó là biểu hiện của **Độ cong Âm (Negative Curvature)**.
- Trong mặt phẳng (Euclid): Chu vi vòng tròn là \(2\pi R\).
- Trong hình học Hyperbolic: Chu vi vòng tròn lớn hơn \(2\pi R\) rất nhiều (tăng theo hàm mũ \( \sinh R \)).

Cây xà lách muốn phát triển diện tích bề mặt thật nhanh để quang hợp được nhiều ánh sáng nhất.
- Nếu nó mọc phẳng, diện tích chỉ tăng theo bình phương bán kính (\(R^2\)). Quá chậm.
- Để tăng diện tích nhanh hơn bán kính, nó phải uốn cong không gian của chính nó. Nó tạo ra một bề mặt Hyperbolic. Mép lá dài ra nhanh hơn mức bình thường, nên nó không còn chỗ để nằm phẳng, buộc phải uốn lượn, gấp nếp chồng chéo lên nhau.

San hô cũng vậy. Để lọc được nhiều thức ăn trong nước biển, nó cần diện tích tiếp xúc tối đa. Cấu trúc Hyperbolic là giải pháp tối ưu của tiến hóa.

## 5. Kết luận

Chúng ta đã đi một chặng đường dài. Từ những đường cong trơn láng của giải tích, đến độ cong của không gian-thời gian, và giờ là vẻ đẹp vô tận của hình học Hyperbolic.
Hình học Vi phân cho chúng ta thấy rằng "Không gian" không phải là một tờ giấy trắng thụ động. Nó có hình dáng, có tính cách, và có sức sống.
- Nó có thể phẳng lặng và bình yên (Euclid).
- Nó có thể khép kín và tròn trịa (Mặt cầu).
- Nó có thể bùng nổ và hoang dại (Hyperbolic).

Và dù là trong một bức tranh, một chiếc lá, hay một thiên hà xa xôi, toán học vẫn luôn ở đó, âm thầm dệt nên vẻ đẹp của thực tại.

---
*Bài giảng này thuộc chương "Vẻ đẹp của Hình học Vi phân" - dành cho đại chúng, nằm trong khóa học Tự học Hình học Vi phân.*
