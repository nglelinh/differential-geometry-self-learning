---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Ứng dụng: thị giác, robot, hình dạng, hyperbolic, và số GR"
chapter: "09"
order: 7
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Chapter 09 của khóa học vốn đã là một chùm cửa sổ: định lý pizza và độ cong Gauss, đường bay là vòng tròn lớn, màng xà phòng, hố đen, định lý quả bóng lông, hình học hyperbolic của Escher. Bài tùy chọn này không mở thêm định lý. Nó chỉ cập nhật, bằng các trích dẫn thật của khoảng 2022–2026, cách từng cửa sổ ấy đang được dùng trong thị giác máy tính, robot, phân tích hình dạng, học sâu hyperbolic, và — khi liên quan bài tương đối — số học của thuyết tương đối rộng.

Bạn sẽ nhận ra hầu hết các bài báo đã xuất hiện rải rác ở các chương trước. Đây là chỗ *gom* chúng lại theo tinh thần của chương ứng dụng, để thấy một khóa hình học vi phân không kết thúc ở trang bài tập, mà kết thúc ở một bản đồ đi tiếp.

## Giải thích trực quan

Chiếc pizza gập lại khi bạn cầm — Theorema Egregium ở đời thường — là cùng một nguyên lý khiến Gaussian splatting phải học *mặt*, không chỉ học màu (Chapter 02), và khiến Neural Jacobian Fields phải học ánh xạ nội tại (Chapter 03). Đường bay vòng tròn lớn là geodesics trên mặt cầu (Chapter 04), cũng là quỹ đạo retraction trên $$S^2$$ khi tối ưu Riemann (Chapter 07). Màng xà phòng là mặt $$H=0$$; các dòng chảy độ cong trung bình rời rạc vẫn là công cụ làm mượt lưới. Định lý quả bóng lông cấm trường vector tiếp xúc không suy biến trên $$S^2$$: đó là lý do robot và đồ họa phải chấp nhận điểm kỳ dị khi chải một trường hướng trên mặt cầu, và là lý do atlas cần ít nhất hai chart.

Đĩa Poincaré của Escher, khoảng 2022, không còn chỉ là tranh. Peng, Varanka, Mostafa, Shi và Zhao (*IEEE TPAMI*, 2022) tổng kết một làn sóng mạng nơ-ron hyperbolic: nhúng phân cấp, đồ thị, từ, tế bào, ảnh. Không gian $$K<0$$ chứa cây tốt hơn Euclid, đúng như bài Escher đã khiến bạn cảm thấy “càng ra biên càng nhiều chỗ”.

Hố đen, năm 2022, có thêm chân dung Sagittarius A*. Collaboration EHT so khớp vòng sáng với thư viện GRMHD: đây không phải bài giảng tương đối mới, chỉ là lời nhắc rằng geodesic loại ánh sáng và signature Lorentz đang chạy trên siêu máy tính.

![Đĩa Poincaré — đường song song hyperbolic.](https://upload.wikimedia.org/wikipedia/commons/4/4c/Poincare_disc_hyperbolic_parallel_lines.svg)
*Hình 1. Trong mô hình đĩa Poincaré, “đường thẳng” là các cung vuông góc với biên; qua một điểm có vô hạn đường song song với một đường cho trước. Wikimedia Commons, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

Không có định nghĩa mới. Chỉ một bảng tương ứng, viết bằng văn xuôi hình học:

Độ cong Gauss của pizza và của mặt học được là cùng một $$K$$. Geodesics của đường bay là nghiệm của phương trình Christoffel trên $$S^2$$ với metric tròn. Mặt cực tiểu thỏa $$H=0$$, tức vết của dạng thứ hai triệt tiêu. Hairy ball là sự triệt tiêu của mọi mục tiêu $$\Gamma(TS^2)$$ không suy biến. Metric hyperbolic trên đĩa,
$$
g = \frac{4\,(dx^2+dy^2)}{(1-x^2-y^2)^2},
$$
là metric mà các tối ưu Riemann (Geoopt, Boumal) và các lớp mạng hyperbolic đang bước lên. Metric Lorentz, ở mức số, là đầu vào của tích phân geodesic trong mã EHT.

## Minh họa hình học

![Ảnh chân trời sự kiện của M87* — hình học ánh sáng quanh một hố đen.](https://upload.wikimedia.org/wikipedia/commons/4/4f/Black_hole_-_Messier_87_crop_max_res.jpg)
*Hình 2. Ảnh EHT của M87* (2019; cùng chương trình quan sát dẫn tới Sgr A* 2022). Collaboration EHT, CC BY 4.0, qua Wikimedia Commons. Vòng sáng là hình học của geodesics null, không phải một đĩa vật chất phẳng.*

![Trường vector trên torus — hairy ball không cấm mặt này.](https://upload.wikimedia.org/wikipedia/commons/7/75/Torus_vectors_radial.png)
*Hình 3. Torus nhận trường vector không suy biến; $$S^2$$ thì không. RokerHRO / Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Hilbert & Cohn-Vossen.** *Geometry and the Imagination.* Tinh thần trực giác của cả chương 09.

2. **Kerbl et al. (2023).** 3D Gaussian Splatting. **Aigerman et al. (2022).** Neural Jacobian Fields. Thị giác và hình dạng.

3. **Van Wyk et al. (2022)** và **Pineda et al. (2022).** Robot: fabrics và Theseus.

4. **Peng, W., Varanka, T., Mostafa, A., Shi, H., & Zhao, G. (2022).** *Hyperbolic Deep Neural Networks: A Survey.* IEEE Trans. Pattern Anal. Mach. Intell. 44(12):10023–10044. doi:10.1109/TPAMI.2021.3136921.

5. **Topping et al. (2022)** và **Nguyen et al. (2023).** Độ cong đồ thị / Ricci flow số.

6. **Event Horizon Telescope Collaboration (2022).** *First Sgr A* EHT Results. V.* ApJL 930, L16. Số GR gặp quan sát.

## 🔗 Ứng dụng và kết nối liên ngành

Thị giác máy tính: tái tạo mặt, đăng ký hình dạng, parametrization UV. Robot: quỹ đạo trên $$SE(3)$$, lực tiếp xúc theo pháp tuyến, ổn định kiểu fabric. Phân tích hình dạng: gần đẳng cự giữa các tư thế, độ cong rời rạc trên lưới quét. Học biểu diễn: đĩa Poincaré cho dữ liệu phân cấp. Thiên văn: so khớp ảnh chân trời với geodesic trong metric Kerr hoặc trong GRMHD. Khoa học dữ liệu: khoảng cách trắc địa trên đa tạp học được, thay cho Euclid thô — quay về giả thuyết đa tạp của Chapter 00.

Một ví dụ cụ thể: một robot cầm một miếng pizza số (một lưới) phải gập mặt sao cho $$K$$ được bảo toàn từng mảnh; nếu thuật toán chỉ tối ưu vị trí đỉnh trong $$\mathbb{R}^3$$, nó sẽ kéo giãn bột. Đó là Theorema Egregium đội lốt kỹ thuật.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Chọn *một* bài bắt buộc của Chapter 09 (pizza, đường bay, xà phòng, hố đen, hairy ball, hoặc Escher). Viết một đoạn nối bài ấy với đúng *một* trích dẫn 2022–2026 ở trên. Không cần công thức mới.

**Bài 2.** Phác đĩa Poincaré và một cây phân cấp (thư mục, từ điển, loài). Vì sao càng ra gần biên càng “còn chỗ” cho lá, và vì sao Euclid phải tăng chiều để chứa cùng một cây?

**Bài 3.** Hairy ball nói không có lược chải tóc trên quả cầu. Một trường pháp tuyến trên mặt cầu *lại có*. Phân biệt hai trường ấy, và giải thích vì sao atlas của $$S^2$$ vẫn cần ít nhất hai chart dù pháp tuyến tồn tại toàn cục trong $$\mathbb{R}^3$$.

**Bài 4.** Suy ngẫm cuối khóa: nếu bạn chỉ nhớ ba chữ — nội tại, trắc địa, đẳng biến — bạn đã đủ để đọc phần lớn các bài 2022–2026 ở trên chưa? Chỗ nào vẫn cần tensor Riemann đầy đủ?

---

Toàn bộ lý thuyết của khóa học được giữ nguyên. Các bài tùy chọn chỉ là những mũi tên chỉ ra ngoài giáo trình, viết cho người đã đi hết các đường cong, các mặt, và các đa tạp.
