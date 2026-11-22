---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Nhóm Lie, động học robot, và không-thời gian số"
chapter: "08"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
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
