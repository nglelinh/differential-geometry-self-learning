---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Nhóm Lie, động học robot, và không-thời gian số"
chapter: "08"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

Khi một chiếc xe tự hành xây bản đồ 3D trong thời gian thực (SLAM), một cánh tay robot lên kế hoạch gắp vật thể không va chạm, hay kính thiên văn **Event Horizon Telescope (EHT)** dựng bức ảnh đầu tiên của lỗ đen **Sagittarius A\*** ngay tại tâm dải Ngân Hà năm 2022, cả ba bài toán tưởng chừng thuộc ba thế giới khác biệt ấy đều chạy trên cùng một động cơ toán học từ Chương 8: **Nhóm Lie $$SO(3), SE(3)$$** và **đường trắc địa trên không-thời gian Lorentz**!

Trong giai đoạn 2022–2024, các thư viện như **Theseus** (Pineda et al., NeurIPS 2022) đưa phép tối ưu hóa phi tuyến trên nhóm Lie thẳng vào PyTorch để lan truyền ngược (backprop), **Equiformer / EquiformerV2** (2023) mã hóa đối xứng $$SE(3)$$ vào transformer cho hóa học lượng tử, còn nhóm **EHT** (2022) tích phân hàng triệu đường trắc địa ánh sáng trên metric lỗ đen quay để đối chiếu với dữ liệu radio thiên văn.

**Mạch bài học:** Bản đồ kiến thức nền (tư thế vật rắn trên $$SE(3)$$, tối ưu khả vi trên nhóm Lie, thuyết tương đối rộng tính toán) → Trực giác Theseus, Equiformer & EHT → Định nghĩa hình thức phép nhân $$SE(3)$$ → Ví dụ tính tay cầm tay chỉ việc: kiểm chứng tính không giao hoán của hai chuyển động robot trong $$SE(3)$$ và bán kính quỹ đạo photon $$r_{\text{ph}} = \frac{3}{2}r_s$$ → Khung giải thích chậm: 3 bước kết nối Nhóm Lie & Không-Thời gian với công nghệ 2022–2024 → Ứng dụng, Video & Bài tập.

---

## Bản đồ kiến thức nền: Nhóm Lie trong Robot và Thuyết tương đối rộng số nghiên cứu gì?

### 1. Nhóm $$SE(3)$$ — không gian tự nhiên của mọi vật rắn 3D
Một vật rắn (máy bay không người lái, đầu gắp robot, hay camera) có trạng thái hoàn chỉnh gồm một ma trận quay $$R \in SO(3)$$ và một vector vị trí $$p \in \mathbb{R}^3$$. Nếu ta dùng 3 góc Euler (roll, pitch, yaw), hệ tọa độ sẽ sụp đổ tại góc nghiêng $$90^\circ$$ (**gimbal lock**). Làm việc trực tiếp trên nhóm Lie $$SE(3)$$ bằng ánh xạ mũ $$\exp$$ và logarit $$\log$$ loại bỏ hoàn toàn kỳ dị tọa độ!

### 2. Tối ưu hóa khả vi trên Nhóm Lie (Theseus, NeurIPS 2022)
Thay vì tối ưu rời rạc ngoài mạng nơ-ron, **Theseus** cài đặt các thuật toán bình phương tối thiểu phi tuyến (Gauss–Newton, Levenberg–Marquardt) *trực tiếp trên đa tạp nhóm Lie* $$SO(2), SO(3), SE(2), SE(3)$$ như một lớp khả vi của PyTorch — cho phép huấn luyện end-to-end các hệ thống SLAM và điều khiển robot.

### 3. Thuyết tương đối rộng tính toán (Numerical GR & GRMHD)
Trong không-thời gian cong mạnh quanh lỗ đen quay (metric Kerr), không có công thức đóng đơn giản cho ảnh bóng lỗ đen. Nhóm **Event Horizon Telescope (2022)** giải số phương trình đường trắc địa kiểu ánh sáng ($$ds^2 = 0$$) ngược từ camera trên Trái Đất về đĩa bồi tụ khí plasma để tái dựng và xác thực bức ảnh lỗ đen Sagittarius A\*.

---

## Tổng quan

Nhóm Lie là đa tạp mang phép nhân trơn; đại số Lie là không gian tiếp tuyến tại phần tử đơn vị; ánh xạ mũ chuyển "vận tốc vô cùng nhỏ" thành phép biến đổi hữu hạn. Bên cạnh đó, Bài 16 đã giới thiệu không-thời gian Lorentz. Bài tùy chọn này giữ nguyên các định nghĩa nền tảng đó và điểm qua hai hướng ứng dụng nổi bật giai đoạn 2022–2024: (1) học máy và tối ưu hóa khả vi trên $$SE(3)$$, $$SO(3)$$ cho robot và phân tử; (2) tính toán số trong thuyết tương đối rộng khi dự án Event Horizon Telescope (EHT) đối chiếu ảnh quan sát lỗ đen với thư viện mô phỏng GRMHD.

*Equiformer* (Liao & Smidt, ICLR 2023) và *EquiformerV2* đưa các biểu diễn bất khả quy của $$SE(3)$$ vào lớp transformer cho đồ thị nguyên tử. *Theseus* (Pineda và cộng sự, NeurIPS 2022) là thư viện tối ưu hóa phi tuyến khả vi trên PyTorch có tích hợp sẵn các nhóm Lie, phục vụ bài toán odometry, bundle adjustment và ước lượng trạng thái. *Geometric Fabrics* (2022), đã nhắc ở Chương 1, vận hành trên không gian cấu hình — thường là tích của các đường tròn $$S^1$$ và các bản sao của $$SE(3)$$. Ở hướng vật lý tính toán, loạt công bố năm 2022 của Event Horizon Telescope về Sagittarius A* so sánh dữ liệu quan sát với thư viện mô phỏng từ thủy động lực học tương đối rộng (GRMHD): các đường trắc địa ở Bài 16 trở thành quỹ đạo photon được tích phân bằng máy tính.

## Giải thích trực quan

Một khớp quay của robot là một điểm trên $$SO(3)$$, không phải bộ ba góc Euler đơn thuần (vốn gặp kỳ dị tọa độ tại các cực). Một chuyển động vừa quay vừa tịnh tiến trong không gian 3D là một phần tử của $$SE(3)$$. Đại số Lie $$\mathfrak{so}(3)$$ biểu diễn các vận tốc góc, còn ánh xạ mũ tương ứng với phép quay một góc xác định quanh trục cho trước. *Theseus* cho phép viết bài toán bình phương tối thiểu phi tuyến trực tiếp trên các nhóm Lie này, rồi lan truyền ngược (backpropagation) qua thuật toán Gauss–Newton, đặt học sâu và hình học Lie vào chung một đồ thị tính toán.

*Equiformer* đi theo hướng khác: thay vì tối ưu *trên* nhóm, kiến trúc này buộc mạng *tôn trọng* đối xứng của nhóm. Khi quay phân tử, năng lượng dự đoán giữ nguyên còn vector lực quay theo đúng phép quay đó. Có thể nhìn đây như Định lý Noether theo chiều ứng dụng vào thiết kế mạng: tính đối xứng được đưa trực tiếp vào kiến trúc để mô hình không phải tự học lại từ dữ liệu.

Trong thuyết tương đối rộng tính toán (numerical GR), photon chuyển động dọc theo đường trắc địa kiểu ánh sáng của một metric Lorentz. Bộ mô phỏng của EHT năm 2022 không nhằm thay thế lý thuyết định lý kỳ dị, mà cho thấy các phương trình đã học — đường trắc địa và metric dấu $$(-,+,+,+)$$ — được tích phân hàng triệu lần để dựng nên hình ảnh vòng sáng quanh lỗ đen.

![Mặt xuyến như nhóm Lie $$S^1\times S^1$$.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Hình 1. Hình xuyến (torus) là một nhóm Lie giao hoán quen thuộc; $$SO(3)$$ phức tạp hơn (không giao hoán, không đơn liên) nhưng chia sẻ cùng cấu trúc nền tảng: hợp hai phần tử vẫn thu được một phần tử thuộc đa tạp. Wikimedia Commons.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại.** Một nhóm Lie $$G$$ là một đa tạp trơn với phép nhân và phép nghịch đảo trơn. Đại số Lie $$\mathfrak{g}=T_eG$$ mang cấu trúc dấu ngoặc Lie. Ánh xạ mũ $$\exp:\mathfrak{g}\to G$$ biến đường thẳng $$t\xi$$ thành nhóm con một tham số.

Trên nhóm $$SE(3)$$, phép nhân hai tư thế có dạng:
$$
(R,p)\cdot(R',p') = (RR',\, p+Rp'),
$$
và một phần tử vận tốc xoắn $$(\omega,v)\in\mathfrak{se}(3)$$ biểu diễn đồng thời chuyển động quay và tịnh tiến. Bài toán ước lượng trạng thái robot là tìm $$g\in SE(3)$$ cực tiểu hóa tổng bình phương sai số, thường thực hiện bằng retraction trên $$G$$ — cùng nguyên lý với Chương 7 nhưng khai thác thêm cấu trúc nhóm.

---

## Ví dụ tính tay cầm tay chỉ việc: Hợp hai tư thế robot trong $$SE(3)$$ và Quỹ đạo Photon quanh Lỗ đen

### Ví dụ 1: Kiểm chứng phép nhân không giao hoán trong $$SE(3)$$
Xét hai phép biến đổi cứng trong không gian 3D:
- $$g_1 = \bigl(R_z(90^\circ),\; (1, 0, 0)^T\bigr)$$ với $$R_z(90^\circ) = \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 1 \end{pmatrix}$$ (quay $$90^\circ$$ quanh trục $$z$$ rồi tịnh tiến $$+1$$ theo trục $$x$$).
- $$g_2 = \bigl(I,\; (0, 2, 0)^T\bigr)$$ (tịnh tiến thuần túy $$+2$$ theo trục $$y$$).

Áp dụng đúng công thức $$(R, p)\cdot(R', p') = (RR',\; p + Rp')$$:
- **Thực hiện $$g_2$$ trước, $$g_1$$ sau ($$g_1 \cdot g_2$$):**
  $$
  p_{12} = (1, 0, 0)^T + R_z(90^\circ)(0, 2, 0)^T = (1, 0, 0)^T + (-2, 0, 0)^T = (-1, 0, 0)^T!
  $$
- **Thực hiện $$g_1$$ trước, $$g_2$$ sau ($$g_2 \cdot g_1$$):**
  $$
  p_{21} = (0, 2, 0)^T + I(1, 0, 0)^T = (1, 2, 0)^T!
  $$

Dù cùng hướng cuối là $$R_z(90^\circ)$$, vị trí đầu gắp robot lệch nhau tới $$\sqrt{(1-(-1))^2 + (2-0)^2} = \sqrt{8} \approx 2.83$$ đơn vị! Đây là lý do mọi hệ thống SLAM / Theseus phải nhân đúng trên nhóm Lie $$SE(3)$$ chứ không bao giờ cộng trừ tọa độ 6 chiều rời rạc!

### Ví dụ 2: Quỹ đạo photon quanh lỗ đen (EHT 2022)
Trên metric Schwarzschild (Bài 16), giải phương trình đường trắc địa kiểu ánh sáng ($$ds^2 = 0$$) cho thấy ánh sáng có thể quay tròn quanh lỗ đen tại **mặt cầu photon** bán kính $$r_{\text{ph}} = \frac{3}{2}r_s$$, còn bóng lỗ đen mà kính thiên văn EHT chụp được có bán kính biểu kiến phóng đại do bẻ cong tia sáng là $$b_c = \frac{3\sqrt{3}}{2}r_s \approx 2.6\,r_s$$ — đúng bằng đường kính vòng sáng rực quanh Sagittarius A\*!

---

### Khung giải thích: Ba nhánh công nghệ 2022–2024 kế thừa Chương 8 như thế nào? (nên đọc chậm)

#### Bước 1: Tối ưu hóa trên Nhóm Lie trong Theseus (NeurIPS 2022)
Khi tối ưu tư thế $$g \in SE(3)$$ trong SLAM, ta không cộng $$g + \Delta g$$ (sẽ làm ma trận quay mất tính trực giao!). Thay vào đó, ở mỗi bước Gauss–Newton, ta tính một bước cập nhật nhỏ $$\xi \in \mathfrak{se}(3)$$ trong **đại số Lie phẳng**, rồi đẩy lên nhóm bằng ánh xạ mũ: $$g_{k+1} = g_k \cdot \exp(\xi)$$. Theseus tính đạo hàm ngược xuyên qua chính phép cập nhật $$\exp(\xi)$$ này!

#### Bước 2: Đối xứng $$SE(3)$$ trong Equiformer / EquiformerV2 (2023)
Thay vì tối ưu một điểm trên nhóm Lie, các mô hình phân tử buộc mọi lớp mạng phải giao hoán với tác động của $$SE(3)$$. Mọi phép quay phân tử trong không gian 3D tự động kéo theo phép quay tương ứng của vector lực — giảm mạnh lượng dữ liệu huấn luyện cần thiết cho hóa học lượng tử.

#### Bước 3: Tích phân đường trắc địa ánh sáng trong EHT (2022)
Từ hình ảnh vòng sáng radio của lỗ đen Sagittarius A\*, nhóm EHT tạo ra thư viện hàng chục nghìn mô phỏng GRMHD với nhiều giá trị spin lỗ đen khác nhau, rồi dùng ray-tracing tương đối tính (tích phân số phương trình $$\ddot{x}^\mu + \Gamma^\mu_{\nu\lambda}\dot{x}^\nu\dot{x}^\lambda = 0$$ cho hàng triệu tia sáng) để tìm mô hình khớp nhất với dữ liệu thực nghiệm!

Tóm tắt cầu nối Chương 8 sang thực tiễn 2022–2024:

$$
\text{Nhóm Lie } SE(3) \text{ \& Metric Lorentz}
\;\xrightarrow{\exp / \log \text{ \& Trắc địa số}}\;
\text{Theseus (SLAM)} \;\vert\; \text{Equiformer (Phân tử)} \;\vert\; \text{EHT (Lỗ đen)}.
$$

## Minh họa hình học

![Đường trắc địa trên mặt cầu — quỹ đạo của nhiều hệ cơ học trên $$SO(3)$$.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Hình 2. Mặt cầu $$S^3$$ là không gian phủ hai lá của $$SO(3)$$; các đường trắc địa trên mặt cầu là hình ảnh gần gũi nhất của chuyển động quay đều. Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Hall, B.** *Lie Groups, Lie Algebras, and Representations.* Nền tảng đại số về nhóm Lie ma trận.

2. **Liao, Y.-L., & Smidt, T. (2023).** *Equiformer*. ICLR 2023. **Liao et al. (2023).** *EquiformerV2*. arXiv:2306.12059.

3. **Pineda, L., et al. (2022).** *Theseus: A Library for Differentiable Nonlinear Optimization*. NeurIPS 2022.

4. **Van Wyk et al. (2022).** *Geometric Fabrics*. IEEE RA-L / ICRA. Kết hợp động học và hình học Finsler trên không gian cấu hình.

5. **Event Horizon Telescope Collaboration (2022).** *First Sagittarius A* Event Horizon Telescope Results. V.* ApJL 930, L16. doi:10.3847/2041-8213/ac6672. Ứng dụng tính toán số của thuyết tương đối rộng vào dữ liệu quan sát, đọc như phần minh họa cho Bài 16.

## 🔗 Ứng dụng và kết nối liên ngành

Trong kỹ thuật robot, odometry thị giác và SLAM hiện đại thực hiện phép nhân trực tiếp trên $$SE(3)$$ thay vì cộng trừ vector 6 chiều rời rạc. Trong hóa học tính toán, *EquiformerV2* trên bộ dữ liệu OC20 giảm số lần gọi mô phỏng DFT nhờ tôn trọng đối xứng $$E(3)$$. Trong vật lý thiên văn, tích phân đường trắc địa kiểu ánh sáng kết hợp mô phỏng GRMHD chuyển metric Lorentz thành ảnh chân trời sự kiện. Trong đồ họa máy tính, phép nội suy góc quay dùng hàm mũ và logarit trên $$SO(3)$$ để tránh hiện tượng khóa khớp (gimbal lock).

## Video tham khảo

- [What is Lie theory? Here is the big picture. \| Lie groups, algebras, brackets #3](https://www.youtube.com/watch?v=ZRca3Ggpy_g) — Mathemaniac, tiếng Anh. Xem trước: trình bày nhóm Lie và ánh xạ mũ, giúp thấy vì sao tư thế quay của khâu robot là một điểm trên $$SO(3)$$ chứ không đơn thuần là bộ ba góc Euler.
- [how to understand all of lie algebras with one picture](https://www.youtube.com/watch?v=tY7jac-iPA4) — Michael Penn, tiếng Anh. Đại số Lie như không gian vận tốc vô cùng nhỏ tại phần tử đơn vị, tương ứng với vai trò vận tốc góc của $$\mathfrak{so}(3)$$.
- [General Relativity & Curved Spacetime Explained! \| Space Time \| PBS Digital Studios](https://www.youtube.com/watch?v=AwhKZ3fd9JA) — PBS Space Time, tiếng Anh. Đường trắc địa trong không-thời gian cong, kết nối với phần mô phỏng quỹ đạo photon quanh lỗ đen trên metric Lorentz.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Giải thích bằng lời vì sao bộ ba góc Euler *không* tạo thành một hệ tọa độ toàn cục tốt trên toàn bộ $$SO(3)$$. Liên hệ điều này với việc một atlas trên đa tạp cần nhiều bản đồ cục bộ (Chương 0).

**Bài 2.** Một cánh tay robot cần đưa khâu cuối từ tư thế $$g_1$$ sang tư thế $$g_2$$. Mô tả quỹ đạo $$t\mapsto g_1\exp(t\xi)$$ với $$\xi=\log(g_1^{-1}g_2)$$ như một chuyển động xoắn ốc (helix) của gốc tọa độ trong không gian Euclid. Đường cong này có phải đường trắc địa của một metric Riemann bất biến trái trên $$SE(3)$$ không?

**Bài 3.** Suy ngẫm: Định lý Noether chỉ ra đối xứng liên tục dẫn đến định luật bảo toàn, còn *Equiformer* tích hợp sẵn đối xứng vào kiến trúc mạng. Hai góc nhìn này gặp nhau ở đâu khi huấn luyện một mô hình dự đoán trường lực phân tử?

---

Các định nghĩa về nhóm Lie và hình học không-thời gian giữ nguyên vai trò nền tảng. Chương 9 sẽ trình bày các bài toán ứng dụng trực quan, còn bài tùy chọn cuối cùng tổng hợp các kết nối giữa thị giác máy tính, hình dạng 3D, không gian hyperbolic và tương đối rộng tính toán.
