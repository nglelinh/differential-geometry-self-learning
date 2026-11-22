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

Theorema Egregium khẳng định độ cong Gauss $$K$$ có thể xác định hoàn toàn từ các phép đo *nội tại* trên bề mặt mà không cần biết đến không gian bao ngoài; còn đường trắc địa là những đường "thẳng nhất" theo góc nhìn nội tại ấy. Bài đọc thêm này giữ nguyên nền tảng lý thuyết đó và giới thiệu cách lĩnh vực học biểu diễn trên đồ thị (2022–2023) vận dụng các khái niệm độ cong nội tại để phân tích hiện tượng *nghẽn thông tin* trong mạng nơ-ron đồ thị (GNN).

Topping, Di Giovanni, Chamberlain, Dong và Bronstein (ICLR 2022, honorable mention) chứng minh rằng các cạnh có độ cong tổ hợp âm — một phiên bản rời rạc liên hệ chặt chẽ với độ cong Ollivier–Ricci — chính là vị trí xảy ra hiện tượng *nén thông tin quá mức* (over-squashing) khi mạng nơ-ron đồ thị truyền tin từ các nút ở xa. Nhóm tác giả đề xuất thuật toán dòng chảy Ricci rời rạc ngẫu nhiên (SDRF) để nối lại cạnh đồ thị nhằm giảm nút thắt. Tiếp theo đó, Nguyen, Nong, Nguyen, Ho, Osher và Nguyen (ICML 2023) sử dụng độ cong Ollivier–Ricci để phân tích thống nhất cả hai hiện tượng làm mượt quá mức (over-smoothing, gắn với độ cong dương) lẫn nén quá mức (over-squashing, gắn với độ cong âm), đồng thời đề xuất thuật toán Batch Ollivier–Ricci Flow (BORF).

Mục tiêu của bài này không phải là đi sâu vào kỹ thuật GNN, mà là minh họa một nguyên lý chung: *độ cong nội tại chi phối cách thông tin lan truyền trên không gian rời rạc*, tương tự cách độ cong chi phối sự hội tụ hay phân kỳ của các đường trắc địa trên bề mặt cong.

## Giải thích trực quan

Quay lại hình ảnh con kiến trên bề mặt cong: trên mặt cầu ($$K>0$$), hai đường trắc địa xuất phát gần nhau theo phương song song sẽ dần hội tụ; trên mặt yên ngựa ($$K<0$$), chúng tách xa nhau. Trên đồ thị, vai trò của đường trắc địa gắn với bước đi ngẫu nhiên hoặc đường đi ngắn nhất, còn độ cong Ollivier–Ricci so sánh hai phân bố lân cận tại hai đỉnh kề nhau: nếu hai lân cận chồng lấp nhiều, cạnh có *độ cong dương* (thông tin hòa trộn quá nhanh, dễ dẫn đến trạng thái các nút trở nên đồng nhất); nếu hai lân cận ít giao nhau, cạnh có *độ cong âm* (thông tin giữa hai vùng phải dồn qua một cổ chai hẹp).

Hiện tượng over-squashing xảy ra khi lượng thông tin tăng theo cấp số mũ từ các vùng lân cận xa bị dồn nén qua một số ít cạnh cầu có độ cong âm. Trong hình học trơn, dòng chảy Ricci (Ricci flow) biến đổi metric theo hướng làm đồng đều độ cong. Trên đồ thị, các thuật toán dòng chảy Ricci rời rạc bổ sung cạnh tại những vị trí có độ cong quá âm và (trong một số phương pháp) lược bớt cạnh tại những vị trí có độ cong quá dương để cải thiện cấu trúc truyền tin.

![Đường trắc địa trên mặt cầu là các vòng tròn lớn.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Hình 1. Các đường trắc địa trên mặt cầu là các đường tròn lớn. Tác giả: Mathwriter2718, Wikimedia Commons, 2024, giấy phép mở.*

## Định nghĩa hình thức và ký hiệu

**Nhắc lại:** Độ cong Gauss $$K$$ là bất biến đẳng cự cục bộ. Phương trình đường trắc địa biểu diễn qua ký hiệu Christoffel có dạng:
$$
\frac{d^2 u^k}{dt^2} + \Gamma^k_{ij}\frac{du^i}{dt}\frac{du^j}{dt} = 0.
$$

**Độ cong Ollivier–Ricci (trên đồ thị):** Với hai đỉnh kề nhau $$i \sim j$$, xét hai độ đo xác suất $$\mu_i, \mu_j$$ đặt trên các tập láng giềng tương ứng và khoảng cách Wasserstein bậc một $$W_1(\mu_i, \mu_j)$$ giữa chúng. Độ cong Ollivier–Ricci của cạnh $$(i, j)$$ được định nghĩa bởi:
$$
\kappa(i,j) = 1 - \frac{W_1(\mu_i,\mu_j)}{d(i,j)}.
$$
Giá trị $$\kappa(i, j)$$ dương khi hai phân bố lân cận gần nhau hơn khoảng cách $$d(i, j)$$ giữa hai đỉnh, và âm khi chúng tách xa nhau. Topping và cộng sự cũng giới thiệu *độ cong Balanced Forman*, một đại lượng tổ hợp liên hệ trực tiếp với độ cong Ollivier, đủ để chứng minh rằng các cạnh cong âm mạnh tạo ra nút thắt truyền tin.

**Dòng chảy Ricci:** Trong hình học Riemann trơn, phương trình dòng chảy Ricci có dạng:
$$
\frac{\partial}{\partial t}\,g_{ij} = -2\,\mathrm{Ric}_{ij}.
$$
Phiên bản rời rạc trên đồ thị hoạt động theo chu trình lặp: ước lượng độ cong $$\kappa$$ trên các cạnh, bổ sung cạnh tại những vùng có $$\kappa$$ rất âm và giảm bớt cạnh tại những vùng có $$\kappa$$ rất dương. Hai thuật toán SDRF và BORF là những cách cụ thể hóa nguyên lý này cho dữ liệu đồ thị.

## Minh họa hình học

![Vận chuyển song song trên mặt cầu — độ cong nội tại.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Hình 2. Vận chuyển song song một vector dọc theo chu trình kín trên mặt cầu: khi quay về điểm xuất phát, vector bị quay đi một góc tỉ lệ với diện tích bao quanh và độ cong. Tác giả: Fred the Oyster, Wikimedia Commons.*

## 🧠 Tài liệu nền tảng và các bài báo gần đây

1. **Gauss (1827).** *Disquisitiones generales circa superficies curvas.* Tài liệu gốc của Theorema Egregium.

2. **do Carmo.** Các chương về Theorema Egregium, ký hiệu Christoffel và đường trắc địa.

3. **Topping, J., Di Giovanni, F., Chamberlain, B. P., Dong, X., & Bronstein, M. M. (2022).** *Understanding Over-Squashing and Bottlenecks on Graphs via Curvature*. ICLR 2022. arXiv:2111.14522.

4. **Nguyen, K., Nong, H., Nguyen, V., Ho, N., Osher, S., & Nguyen, T. (2023).** *Revisiting Over-smoothing and Over-squashing Using Ollivier-Ricci Curvature*. ICML 2023, PMLR 202:25956–25979.

5. **Ollivier, Y. (2009).** *Ricci curvature of Markov chains on metric spaces*. Nguồn lý thuyết gốc định nghĩa độ cong $$\kappa$$ trên đồ thị và không gian metric rời rạc.

## 🔗 Ứng dụng và kết nối liên ngành

Trong học máy, độ cong đồ thị đóng vai trò công cụ chẩn đoán cấu trúc mạng: hiệu năng của GNN sâu không chỉ phụ thuộc vào số lớp mà còn chịu chi phối bởi hình học của đồ thị quan hệ. Trong hình học tính toán, dòng chảy Ricci rời rạc trên lưới tam giác (các công trình của Gu–Yau và các phát triển kế tiếp) được ứng dụng để tham số hóa bề mặt vỏ não và các bề mặt y khoa. Trong robotics, đường trắc địa trên bề mặt ràng buộc là cơ sở để tìm quỹ đạo mượt thông qua cùng hệ phương trình Christoffel.

## Video tham khảo

- [Lecture 8: Curvature & Oversquashing in GNNs - Francesco Di Giovanni](https://www.youtube.com/watch?v=pJyFg9NF7LQ) — Michael Bronstein, tiếng Anh. Nên xem trước vì trình bày trực tiếp chủ đề của bài: độ cong đồ thị âm gây ra nút thắt over-squashing và cách dùng dòng chảy Ricci rời rạc để cải thiện cấu trúc đồ thị.
- [Tensor Calculus 22: Riemann Curvature Tensor Geometric Meaning (Holonomy + Geodesic Deviation)](https://www.youtube.com/watch?v=-Il2FrmJtcQ) — eigenchris, tiếng Anh. Giải thích độ cong trong hình học trơn qua hiện tượng holonomy và độ lệch trắc địa, giúp đối chiếu bản chất hình học mà độ cong Ollivier–Ricci mô phỏng trên đồ thị.
- [Lecture 20: Geodesics (Discrete Differential Geometry)](https://www.youtube.com/watch?v=uojNGbVtlsQ) — Keenan Crane, tiếng Anh. Trình bày đường trắc địa dưới góc nhìn nội tại, tương ứng với vai trò thước đo khoảng cách nội tại trên đồ thị trong bài.

## 🧩 Bài tập và suy ngẫm

**Bài 1.** Phác họa mặt cầu cùng hai đường tròn lớn cắt nhau. Giải thích bằng lời vì sao hai đường trắc địa hội tụ lại với nhau trên không gian cong dương, và liên hệ trực giác đó với hiện tượng over-smoothing (thông tin giữa các nút hòa trộn quá nhanh).

**Bài 2.** Phác họa hai đồ thị dạng cây phân nhánh mạnh được nối với nhau qua một cạnh cầu duy nhất. Đánh dấu cạnh cầu này như một cạnh có $$\kappa < 0$$ và giải thích bằng lời hiện tượng over-squashing xảy ra qua cạnh đó.

**Bài 3.** Theorema Egregium khẳng định $$K$$ là đại lượng nội tại. Đồ thị trừu tượng vốn không đi kèm phép nhúng sẵn vào $$\mathbb{R}^3$$; vì sao việc định nghĩa độ cong $$\kappa$$ hoàn toàn dựa trên khoảng cách nội tại của đồ thị lại phù hợp với tinh thần của Gauss hơn so với việc nhúng đồ thị vào không gian Euclid rồi đo góc?

---

Các kết quả cốt lõi về đường trắc địa và Theorema Egregium là nền tảng cố định. Chương 5 sẽ chuyển sang ngôn ngữ dạng vi phân; bài tùy chọn của chương đó giới thiệu đại số Clifford và các mạng nơ-ron đẳng biến.
