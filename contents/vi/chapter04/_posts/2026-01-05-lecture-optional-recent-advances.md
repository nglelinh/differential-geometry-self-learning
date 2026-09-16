---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Hình học nội tại, độ cong đồ thị, và Ricci flow số"
chapter: "04"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

## Tổng quan

Theorema Egregium nói một điều mà Gauss tự hào gọi là tuyệt vời: độ cong Gauss có thể đọc được từ các phép đo *trên* mặt, không cần bước ra ngoài. Đường trắc địa là những đường thẳng nhất mà cư dân trên mặt có thể đi. Bài tùy chọn này giữ nguyên hai ý ấy, rồi chỉ ra rằng cộng đồng học biểu diễn đồ thị, khoảng 2022–2023, đã biến chúng thành một lý thuyết về *nút thắt thông tin*.

Topping, Di Giovanni, Chamberlain, Dong và Bronstein (ICLR 2022, honorable mention) chứng minh rằng các cạnh có độ cong tổ hợp âm — một họ hàng rời rạc của Ollivier–Ricci — chính là chỗ thông điệp bị “bóp nghẹt” (over-squashing) khi mạng nơ-ron đồ thị cố gắng nghe các nút ở xa. Họ đề xuất một dòng chảy Ricci rời rạc ngẫu nhiên (SDRF) để *nối lại* đồ thị, đúng tinh thần của việc làm mượt metric. Năm 2023, Nguyen, Nong, Nguyen, Ho, Osher và Nguyen (ICML) dùng đúng độ cong Ollivier–Ricci để thống nhất over-smoothing (cong dương) và over-squashing (cong âm), rồi viết một thuật toán Batch Ollivier–Ricci Flow.

Bạn không cần trở thành nhà nghiên cứu GNN. Bạn chỉ cần nghe: *độ cong nội tại điều khiển cách thông tin đi trên một không gian rời rạc*, đúng như nó điều khiển cách hai đường trắc địa hội tụ trên mặt cầu.

## Giải thích trực quan

Hãy lại là con kiến trên quả cam. Nếu hai đường “thẳng” xuất phát gần nhau, chúng sẽ gặp lại — đó là $$K>0$$. Trên yên ngựa chúng tách ra — $$K<0$$. Trên một đồ thị, “đường thẳng” là bước ngẫu nhiên hoặc đường đi ngắn nhất, và độ cong Ollivier so sánh quả bóng đơn vị tại hai đỉnh kề: nếu hai quả bóng chồng lên nhau nhiều, cạnh *cong dương* (thông tin hòa quyện quá nhanh, mọi nút trở nên giống nhau); nếu chúng hầu như không chạm, cạnh *cong âm* (thông tin phải chui qua một cổ chai).

Over-squashing là cảm giác đứng ở một hành lang hẹp: quá nhiều thông điệp từ một cây gia phả khổng lồ bị nhét vào một cạnh. Ricci flow, trong hình học trơn, làm metric tiến về chỗ đều hơn. Trên đồ thị, phiên bản số thêm cạnh nơi cong âm và (đôi khi) bớt cạnh nơi cong dương. Đó không phải là chứng minh Theorema Egregium; đó là Theorema Egregium được *mượn* làm nguyên lý thiết kế.

![Đường trắc địa trên mặt cầu là các vòng tròn lớn.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Hình 1. Các đường trắc địa không tầm thường trên mặt cầu tròn là các vòng tròn lớn. Tác giả: Mathwriter2718, Wikimedia Commons, 2024, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại (không chứng minh).** Độ cong Gauss $$K$$ là bất biến đẳng cự cục bộ. Phương trình trắc địa, với ký hiệu Christoffel, là
$$
\frac{d^2 u^k}{dt^2} + \Gamma^k_{ij}\frac{du^i}{dt}\frac{du^j}{dt} = 0.
$$

**Độ cong Ollivier–Ricci (phiên bản kể chuyện).** Với hai đỉnh $$i\sim j$$, lấy hai độ đo xác suất $$\mu_i,\mu_j$$ trên láng giềng, và khoảng cách Wasserstein $$W_1(\mu_i,\mu_j)$$. Khi ấy
$$
\kappa(i,j) = 1 - \frac{W_1(\mu_i,\mu_j)}{d(i,j)}
$$
dương khi hai “quả bóng” gần nhau hơn kỳ vọng Euclid, âm khi chúng xa. Topping và cộng sự còn đưa vào *Balanced Forman curvature*, một cận tổ hợp sắc của độ cong Ollivier, đủ để chứng minh rằng cạnh cong âm sinh nút thắt.

Ricci flow rời rạc, ở mức khẩu hiệu, là
$$
\frac{d}{dt}\,g_{ij} = -\mathrm{Ric}_{ij}
$$
hay, trên đồ thị, một vòng lặp: đo $$\kappa$$, thêm cạnh nơi $$\kappa$$ rất âm, bớt cạnh nơi $$\kappa$$ rất dương. SDRF và BORF là hai cách làm cho khẩu hiệu ấy chạy được trên dữ liệu.

## Minh họa hình học

![Vận chuyển song song trên mặt cầu — độ cong nội tại.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2. Đưa một vector đi vòng ANB trên mặt cầu; khi về, nó đã quay một góc tỉ lệ với diện tích và độ cong. Tác giả: Fred the Oyster, Wikimedia Commons (dựa trên sơ đồ cổ điển).*

[Image placeholder: “Đồ thị có một cầu hẹp; cạnh cầu có κ âm; SDRF thêm một dây chéo để giảm over-squashing”]

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Gauss (1827).** *Disquisitiones generales circa superficies curvas.* Nguồn của Theorema Egregium.

2. **do Carmo.** Các chương về Theorema Egregium, ký hiệu Christoffel, và đường trắc địa.

3. **Topping, J., Di Giovanni, F., Chamberlain, B. P., Dong, X., & Bronstein, M. M. (2022).** *Understanding Over-Squashing and Bottlenecks on Graphs via Curvature*. ICLR 2022. arXiv:2111.14522.

4. **Nguyen, K., Nong, H., Nguyen, V., Ho, N., Osher, S., & Nguyen, T. (2023).** *Revisiting Over-smoothing and Over-squashing Using Ollivier-Ricci Curvature*. ICML 2023, PMLR 202:25956–25979.

5. **Ollivier, Y. (2009).** *Ricci curvature of Markov chains on metric spaces*. Nguồn cổ điển của $$\kappa$$ trên đồ thị; đọc để thấy GNN không bịa ra độ cong.

## 🔗 Ứng dụng và kết nối liên ngành

Trong học máy, độ cong đồ thị trở thành chẩn đoán: mạng sâu thất bại không chỉ vì thiếu lớp, mà vì hình học của quan hệ. Trong vật lý số, Ricci flow là công cụ nghiên cứu các metric; phiên bản rời rạc trên bề mặt tam giác (Gu–Yau và các hậu duệ) vẫn được dùng để parametrize não bộ và các mặt y khoa. Trong robot, đường trắc địa trên mặt ràng buộc là quỹ đạo “thẳng” mà bộ lập kế hoạch nên ưu tiên — cùng một phương trình Christoffel, khác phần mềm.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác mặt cầu và hai vòng tròn lớn cắt nhau. Mô tả bằng lời vì sao hai “đường thẳng” hội tụ, và liên hệ với over-smoothing: thông tin hòa quá nhanh.

**Bài 2.** Phác một đồ thị hình cây rất phân nhánh nối vào một cạnh duy nhất. Đánh dấu cạnh ấy như ứng viên $$\kappa<0$$. Giải thích over-squashing mà không dùng công thức.

**Bài 3.** Theorema Egregium nói $$K$$ là nội tại. Trên đồ thị, ta không có nhúng vào $$\mathbb{R}^3$$. Vì sao việc chỉ dùng khoảng cách trên đồ thị (nội tại) để định nghĩa $$\kappa$$ lại trung thành với tinh thần Gauss hơn là việc nhúng đồ thị rồi đo góc Euclid?

---

Lý thuyết trắc địa và Theorema Egregium không đổi. Chapter 05 sẽ đổi ngôn ngữ sang dạng vi phân; bài tùy chọn bên ấy gặp đại số Clifford và các mạng đẳng biến.
