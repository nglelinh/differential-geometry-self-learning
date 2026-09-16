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

Nhóm Lie là đa tạp mang phép nhân trơn; đại số Lie là không gian tiếp tuyến tại đơn vị; hàm mũ đưa “vận tốc vô hạn nhỏ” thành chuyển động hữu hạn. Bài 16 đã mở cửa không-thời gian Lorentz. Bài tùy chọn này giữ nguyên các định nghĩa ấy, rồi chỉ vào hai dòng công việc 2022–2024: (1) học máy và tối ưu khả vi trên $$SE(3)$$, $$SO(3)$$ cho robot và phân tử; (2) — chỉ ở mức liên hệ với bài không-thời gian — số học của thuyết tương đối rộng khi kính thiên văn chân trời sự kiện so khớp ảnh với thư viện mô phỏng GRMHD.

Equiformer (Liao & Smidt, ICLR 2023) và EquiformerV2 biến irrep của $$SE(3)$$ thành lớp transformer cho đồ thị nguyên tử. Theseus (Pineda và cộng sự, NeurIPS 2022) là thư viện tối ưu phi tuyến khả vi trên PyTorch, có sẵn nhóm Lie, dùng cho odometry, bundle adjustment, và ước lượng trạng thái. Geometric Fabrics (2022), đã gặp ở Chapter 01, thực sự sống trên không gian cấu hình — thường là tích các $$S^1$$ và bản sao của $$SE(3)$$. Về phía vật lý số, loạt bài Event Horizon Telescope 2022 về Sagittarius A* so sánh dữ liệu với hàng loạt mô phỏng động lực học từ tính tương đối rộng: geodesics của bài 16 trở thành quỹ đạo photon trong mã máy.

## Giải thích trực quan

Một khâu robot quay là một điểm trên $$SO(3)$$, không phải ba góc Euler ngây thơ (góc Euler gãy tại các cực). Vặn một chiếc vít trong không gian là một phần tử của $$SE(3)$$: vừa quay vừa tịnh tiến. Đại số Lie $$\mathfrak{so}(3)$$ là các vận tốc góc; hàm mũ là “quay đúng bấy nhiêu radian quanh đúng trục ấy”. Theseus cho phép bạn viết một bài toán bình phương tối thiểu trên các phần tử ấy, rồi *vi phân ngược* qua thuật toán Gauss–Newton: học sâu và hình học Lie ngồi cùng một đồ thị tính toán.

Equiformer làm việc khác: nó không tối ưu *trên* nhóm, nó bắt mạng *tôn trọng* nhóm. Quay phân tử thì năng lượng im, lực quay theo. Đó là Noether ở chiều ngược: đối xứng không sinh định luật bảo toàn trong mô hình, nó bị *ép* lên kiến trúc để mô hình không phí sức học lại vật lý đã biết.

Trong GR số, photon đi trên geodesics loại ánh sáng của một metric Lorentz. Thư viện EHT 2022 không dạy bạn chứng minh định lý kỳ dị; nó nhắc rằng phương trình bạn vừa gặp — geodesic, signature $$(-,+,+,+)$$ — đang được tích phân hàng triệu lần để dựng một vòng sáng quanh hố đen.

![Mặt xuyến như nhóm Lie $$S^1\times S^1$$.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Hình 1. Torus là nhóm Lie giao hoán quen thuộc; $$SO(3)$$ phức tạp hơn (không giao hoán, không đơn liên), nhưng cùng một ý: nhân hai điểm vẫn ra một điểm trên mặt. Wikimedia Commons.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại.** Một nhóm Lie $$G$$ là một đa tạp trơn với phép nhân và nghịch đảo trơn. Đại số Lie $$\mathfrak{g}=T_eG$$ mang ngoặc Lie. Hàm mũ $$\exp:\mathfrak{g}\to G$$ gửi đường thẳng $$t\xi$$ thành nhóm một-tham số.

Với $$SE(3)$$,
$$
(R,p)\cdot(R',p') = (RR',\, p+Rp'),
$$
và một “vận tốc” $$(\omega,v)\in\mathfrak{se}(3)$$ vừa xoay vừa trượt. Ước lượng trạng thái robot là tìm $$g\in SE(3)$$ cực tiểu hóa một tổng bình phương sai số, thường bằng retraction trên $$G$$ — cùng ý với Chapter 07, thêm cấu trúc nhóm.

## Minh họa hình học

![Đường trắc địa trên mặt cầu — quỹ đạo của nhiều hệ cơ học trên $$SO(3)$$.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Hình 2. $$S^3$$ phủ $$SO(3)$$; các geodesics trên mặt cầu là hình ảnh gần gũi nhất của “quay đều”. Wikimedia Commons.*

[Image placeholder: “Khung SE(3) của khâu cuối robot: gốc p, ba trục của R, và một xoắn ốc exp(tξ)”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Hall, B.** *Lie Groups, Lie Algebras, and Representations.* Nền tảng đại số.

2. **Liao, Y.-L., & Smidt, T. (2023).** *Equiformer*. ICLR 2023. **Liao et al. (2023).** *EquiformerV2*. arXiv:2306.12059.

3. **Pineda, L., et al. (2022).** *Theseus: A Library for Differentiable Nonlinear Optimization*. NeurIPS 2022.

4. **Van Wyk et al. (2022).** *Geometric Fabrics*. IEEE RA-L / ICRA. Động học + hình học Finsler trên không gian cấu hình.

5. **Event Horizon Telescope Collaboration (2022).** *First Sagittarius A* Event Horizon Telescope Results. V.* ApJL 930, L16. doi:10.3847/2041-8213/ac6672. GR số gặp quan sát; đọc như ứng dụng của bài 16, không như thay thế lý thuyết.

## 🔗 Ứng dụng và kết nối liên ngành

Robot học: odometry thị giác và SLAM hiện đại nhân các phần tử $$SE(3)$$, không cộng vector 6 chiều một cách ngây thơ. Hóa học tính toán: EquiformerV2 trên OC20 giảm số lần gọi DFT nhờ tôn trọng $$E(3)$$. Vật lý thiên văn: geodesics null và GRMHD biến metric Lorentz thành ảnh chân trời. Đồ họa: phép nội suy quay dùng $$\exp$$ và logarithm trên $$SO(3)$$ để tránh gimbal lock — cùng một hàm mũ.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Giải thích bằng lời vì sao ba góc Euler *không* phải một hệ tọa độ tốt trên cả $$SO(3)$$. Liên hệ với việc atlas cần nhiều chart (Chapter 00).

**Bài 2.** Một robot cần đưa khâu cuối từ tư thế $$g_1$$ sang $$g_2$$. Mô tả đường $$t\mapsto g_1\exp(t\xi)$$ với $$\xi=\log(g_1^{-1}g_2)$$ như một helix trong không gian Euclid của điểm gốc. Đây có phải geodesics của một metric Riemann trái-bất biến?

**Bài 3.** Suy ngẫm: Noether nói đối xứng sinh bảo toàn. Equiformer *ép* đối xứng lên mạng. Hai chiều ấy gặp nhau ở đâu khi ta huấn luyện một mô hình lực phân tử?

---

Nhóm Lie và hình học không-thời gian không bị viết lại. Chapter 09 sẽ mở các chân trời ứng dụng; bài tùy chọn cuối cùng gom thị giác, hình dạng, hyperbolic, và số GR.
