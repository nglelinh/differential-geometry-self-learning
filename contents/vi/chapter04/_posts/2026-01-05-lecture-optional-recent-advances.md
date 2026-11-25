---
layout: post
lang: vi
title: "Bài tùy chọn: Tiến bộ gần đây (2022–2026) — Hình học nội tại, độ cong đồ thị, và Ricci flow số"
chapter: "04"
order: 3
owner: "Hình học Vi phân"
lesson_type: optional
---

Một đồ thị mạng xã hội hay một phân tử hóa học không có tọa độ $$(x, y, z)$$ tự nhiên, không có mặt phẳng tiếp tuyến, cũng chẳng có vector pháp tuyến — vậy mà giới học máy giai đoạn 2022–2023 lại phát hiện ra rằng **độ cong nội tại** của đồ thị chính là thủ phạm đứng sau hai căn bệnh nan y nhất của mạng nơ-ron đồ thị (GNN): *làm mượt quá mức (over-smoothing)* và *nén thông tin quá mức (over-squashing)*.

Làm sao một ý tưởng ra đời từ đo đạc bề mặt Trái Đất năm 1827 của Gauss và dòng chảy Ricci của Hamilton–Perelman lại có thể chẩn đoán đúng điểm nghẽn thông tin trong trí tuệ nhân tạo hiện đại? Bài đọc thêm này sẽ giải mã điều đó qua **độ cong Ollivier–Ricci** và các thuật toán **dòng chảy Ricci rời rạc** (SDRF, BORF).

**Mạch bài học:** Tinh thần nội tại của Gauss trên không gian rời rạc → Kiến thức cần nhớ (Độ cong Ollivier–Ricci, Over-smoothing vs. Over-squashing, Dòng chảy Ricci rời rạc) → Trực giác hội tụ/phân kỳ đường trắc địa trên đồ thị → Định nghĩa hình thức $$\kappa(i, j)$$ & phương trình Ricci flow → Giải thích tự tính tay độ cong Ollivier–Ricci trên tam giác $$K_3$$ ($$\kappa = +1/2$$) và cạnh cầu nối hai sao bậc 3 ($$\kappa = -2/3$$) → Tài liệu nền tảng & ứng dụng.

## Kiến thức cần nhớ: Hình học nội tại bước vào học sâu đồ thị như thế nào?

### 1. Độ cong Ollivier–Ricci (Ollivier–Ricci Curvature)
- **Là gì:** Khái niệm độ cong thuần nội tại trên không gian metric rời rạc (Yann Ollivier, 2009), so sánh khoảng cách vận chuyển tối ưu Wasserstein $$W_1(\mu_i, \mu_j)$$ giữa hai phân bố lân cận tại hai đỉnh kề nhau $$i \sim j$$ với chính khoảng cách $$d(i, j)$$.
- **Nghiên cứu gì:** Chuyển ý tưởng hình học "hai quả cầu nhỏ quanh hai điểm gần nhau có xích lại gần nhau hơn tâm của chúng không?" (đặc trưng độ cong Ricci dương/âm trong hình học Riemann) sang ngôn ngữ xác suất và đường đi ngắn nhất trên đồ thị, không cần bất kỳ phép nhúng nào vào $$\mathbb{R}^3$$.

### 2. Hai căn bệnh hình học của GNN: Over-smoothing và Over-squashing
- **Là gì:** Khi mạng nơ-ron đồ thị truyền tin qua nhiều lớp, các nút ở vùng có **độ cong dương mạnh** (nhiều tam giác, liên kết dày đặc) hòa trộn đặc trưng quá nhanh khiến mọi nút trở nên na ná nhau (**over-smoothing**); ngược lại, thông tin đi qua các **cạnh cầu có độ cong âm mạnh** (cấu trúc kiểu cây phân nhánh) bị dồn nén vào một vector cố định duy nhất gây mất mát thông tin từ xa (**over-squashing**).
- **Nghiên cứu gì:** Liên kết trực tiếp cấu trúc tô-pô/hình học của đồ thị với giới hạn lý thuyết của cơ chế truyền tin (message passing) trong học sâu.

### 3. Dòng chảy Ricci rời rạc (Discrete Ricci Flow — SDRF, BORF)
- **Là gì:** Phiên bản số của phương trình dòng chảy Ricci $$\partial_t g_{ij} = -2\mathrm{Ric}_{ij}$$ dùng để "tái đi dây" (rewiring) đồ thị: thêm cạnh tắt để giải tỏa cổ chai ở vùng $$\kappa \ll 0$$ và tỉa bớt cạnh dư thừa ở vùng $$\kappa \gg 0$$.
- **Nghiên cứu gì:** Biến đổi hình học của đồ thị đầu vào trước khi huấn luyện GNN, giống như cách dòng chảy Ricci trong toán thuần túy làm trơn đều độ cong của đa tạp.

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

## Giải thích: Tự tính tay độ cong Ollivier–Ricci trên hai đồ thị mẫu

Để không thấy công thức Wasserstein $$W_1$$ trừu tượng, hãy chọn phân bố đều trên các láng giềng $$\mu_u(x) = \frac{1}{\deg(u)}$$ với mọi $$x \sim u$$ (không giữ khối lượng tại chính $$u$$) và tính tay $$\kappa(A, B) = 1 - W_1(\mu_A, \mu_B)$$ trên hai đồ thị tí hon (đều có $$d(A, B) = 1$$).

### Trường hợp 1: Tam giác $$K_3$$ gồm 3 đỉnh $$A, B, C$$ (độ cong dương)
- Láng giềng của $$A$$ là $$\{B, C\} \implies \mu_A(B) = \frac{1}{2},\; \mu_A(C) = \frac{1}{2}$$.
- Láng giềng của $$B$$ là $$\{A, C\} \implies \mu_B(A) = \frac{1}{2},\; \mu_B(C) = \frac{1}{2}$$.
- **Vận chuyển tối ưu từ $$\mu_A$$ sang $$\mu_B$$:** Khối lượng $$\frac{1}{2}$$ tại đỉnh chung $$C$$ đứng yên (chi phí $$0$$); khối lượng $$\frac{1}{2}$$ tại $$B$$ chuyển sang $$A$$ qua quãng đường $$d(B, A) = 1$$ (chi phí $$\frac{1}{2} \times 1 = \frac{1}{2}$$).
- Do đó $$W_1(\mu_A, \mu_B) = \frac{1}{2}$$, suy ra:
  $$ \kappa(A, B) = 1 - \frac{1/2}{1} = +\frac{1}{2} > 0. $$
  Vì $$A$$ và $$B$$ chia sẻ láng giềng chung $$C$$, hai đám mây xác suất chồng lấp mạnh — giống hai đường trắc địa hội tụ trên mặt cầu!

### Trường hợp 2: Cạnh cầu $$(A, B)$$ nối hai đỉnh bậc 3 dạng cây (độ cong âm)
Xét đồ thị cây gồm cạnh cầu $$(A, B)$$, trong đó $$A$$ nối thêm với hai lá $$a_1, a_2$$ còn $$B$$ nối thêm với hai lá $$b_1, b_2$$ (không có cạnh chéo nào khác).
- $$\mu_A$$ đặt khối lượng $$\frac{1}{3}$$ lên mỗi đỉnh trong $$\{B, a_1, a_2\}$$.
- $$\mu_B$$ đặt khối lượng $$\frac{1}{3}$$ lên mỗi đỉnh trong $$\{A, b_1, b_2\}$$.
- **Vận chuyển tối ưu từ $$\mu_A$$ sang $$\mu_B$$:**
  1. Đẩy $$\frac{1}{3}$$ từ $$a_1 \to A$$ (quãng đường $$1$$, chi phí $$\frac{1}{3}$$).
  2. Đẩy $$\frac{1}{3}$$ từ $$B \to b_1$$ (quãng đường $$1$$, chi phí $$\frac{1}{3}$$).
  3. Phần còn lại $$\frac{1}{3}$$ tại $$a_2$$ buộc phải vượt qua cả cạnh cầu để tới $$b_2$$ theo đường $$a_2 \to A \to B \to b_2$$ (quãng đường $$3$$, chi phí $$\frac{1}{3} \times 3 = 1$$).
- Tổng chi phí vận chuyển tối ưu là $$W_1(\mu_A, \mu_B) = \frac{1}{3} + \frac{1}{3} + 1 = \frac{5}{3}$$ (có thể kiểm chứng tối ưu bằng hàm 1-Lipschitz $$f(a_1)=f(a_2)=3,\; f(A)=2,\; f(B)=1,\; f(b_1)=f(b_2)=0$$ cho $$\mathbb{E}_{\mu_A}[f] - \mathbb{E}_{\mu_B}[f] = \frac{7}{3} - \frac{2}{3} = \frac{5}{3}$$).
- Suy ra độ cong Ollivier–Ricci của cạnh cầu là:
  $$ \kappa(A, B) = 1 - \frac{5/3}{1} = -\frac{2}{3} < 0. $$

| Cấu trúc cạnh $$(A, B)$$ | Khoảng cách $$W_1(\mu_A, \mu_B)$$ | Độ cong $$\kappa(A, B)$$ | Hành vi truyền tin trong GNN |
| :--- | :--- | :--- | :--- |
| Tam giác $$K_3$$ (chung láng giềng) | $$\frac{1}{2}$$ | $$+\frac{1}{2} > 0$$ | Hòa trộn nhanh — nguy cơ **over-smoothing** |
| Cạnh cầu nối hai cây bậc 3 | $$\frac{5}{3}$$ | $$-\frac{2}{3} < 0$$ | Cổ chai hẹp — nguy cơ **over-squashing** |

Chỉ cần thêm một cạnh tắt nối $$a_2$$ với $$b_2$$ (đúng thao tác của SDRF/BORF!), quãng đường $$d(a_2, b_2)$$ tụt từ $$3$$ xuống $$1$$, đẩy $$\kappa(A, B)$$ tăng vọt và giải phóng ngay nút thắt thông tin.

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
