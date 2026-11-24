---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Implicit Surfaces and Gaussian Splatting"
chapter: "02"
order: 3
owner: "Differential Geometry"
lesson_type: optional
---

## Overview

For half a century, if you wanted a computer to hold a 3D surface—a video-game character, a scanned statue, or a beating heart—you approximated it with a **triangle mesh**: millions of tiny flat triangles glued edge to edge. In Chapter 02, you learned the smooth mathematical truth underneath: a **regular surface**, defined either by local coordinate patches $$\mathbf{x}(u,v)$$ or as the zero level set $$f^{-1}(0)$$ of a smooth function with non-vanishing gradient, equipped at every point with a **tangent plane** and a **unit normal**.

Between 2021 and 2025, computer graphics and 3D computer vision underwent a dramatic revolution by returning directly to those two classical definitions of a surface!
1. **Neural Implicit Surfaces (NeuS, Wang et al., NeurIPS 2021, and its 2022–2025 descendants):** Instead of storing triangles, train a neural network to learn a smooth **Signed Distance Function (SDF)** $$f: \mathbb{R}^3 \to \mathbb{R}$$ whose zero level set $$f^{-1}(0)$$ is the exact 3D surface.
2. **3D & 2D Gaussian Splatting (Kerbl et al., SIGGRAPH 2023; Huang et al., 2024):** Represent a scene as millions of optimizable, translucent Gaussian ellipsoids ("splats") that render in real time—and then **flatten those ellipsoids into 2D tangent disks** hugging the true surface!

This optional lesson reconnects those cutting-edge rendering breakthroughs directly to the **implicit function theorem**, **unit normals**, and **tangent planes** you just mastered in Chapter 02.

---

## Background Knowledge Map: Three Ways to Represent a Surface

Every modern 3D vision pipeline is ultimately choosing between three classical geometric ways of describing a 2D surface inside $$\mathbb{R}^3$$.

### 1. Parametric Patches vs. Implicit Level Sets
**What is it?**
- **Parametric:** A map $$\mathbf{x}(u,v) \in \mathbb{R}^3$$ paints a 2D coordinate sheet onto 3D space (like latitude and longitude on a globe).
- **Implicit:** A scalar function $$f(x,y,z)$$ assigns a number to every point in $$\mathbb{R}^3$$, and the surface is simply the contour $$S = \{p \in \mathbb{R}^3 : f(p) = 0\}$$.

**What does it study?**
- **Implicit Function Theorem:** Guarantees that wherever $$f(p) = 0$$ and $$\nabla f(p) \neq \mathbf{0}$$, the level set $$f^{-1}(0)$$ is locally a smooth regular surface with unit normal $$\mathbf{n} = \nabla f / \|\nabla f\|$$.
- **Signed Distance Functions (SDFs):** A special implicit function where $$f(p)$$ equals the exact shortest distance to the surface (negative inside, positive outside), automatically obeying the **Eikonal PDE** $$\|\nabla f\| = 1$$!

### 2. Differentiable Volume Rendering (NeRF & NeuS)
**What is it?** To reconstruct a 3D surface purely from 2D photographs, shoot a camera ray $$\mathbf{r}(t) = \mathbf{o} + t\mathbf{d}$$ through each pixel and integrate emitted color weighted by local opacity along the ray.

**What does it study?**
- **Unbiased surface extraction:** Converting an SDF $$f(\mathbf{r}(t))$$ into a sharp volume density peaked *precisely* at the zero crossing $$f = 0$$, so optimizing pixel colors automatically sculpts an accurate geometric surface.

### 3. Explicit Tangent Primitives (3D & 2D Gaussian Splatting)
**What is it?** A collection of localized 3D Gaussian blobs $$G(\mathbf{x}) = \exp\!\bigl(-\tfrac{1}{2}(\mathbf{x}-\boldsymbol{\mu})^\top \Sigma^{-1}(\mathbf{x}-\boldsymbol{\mu})\bigr)$$ with position $$\boldsymbol{\mu}$$, covariance $$\Sigma$$, color, and opacity.

**What does it study?**
- **From floating clouds to tangent planes:** Pure 3D Gaussians render blazingly fast (100+ FPS), yet can float slightly off the true surface. **2D Gaussian Splatting (2024)** collapses one axis of $$\Sigma$$ to zero—turning each blob into an explicit **tangent disk** aligned with the surface’s normal!

---

## Intuitive explanation

Remember pressing a stiff index card flat against a globe to visualize the **tangent plane**? A **neural SDF** works from the outside in: it fills all of 3D space with a smooth scalar field—negative inside the object, positive outside—so the surface is the exact zero-contour where inside meets outside, and the gradient $$\nabla f$$ points straight out as the normal vector.

**Gaussian Splatting** works from the surface out: imagine tiling a sculpture with hundreds of thousands of tiny, softly feathered oval stickers, each with a center, an orientation, a color, and a transparency. From any camera angle, projecting ("splatting") those stickers onto the screen paints a photorealistic image in milliseconds. Yet if the stickers are puffy 3D marshmallows floating in midair, the picture looks great while the underlying 3D geometry is lumpy. That is why 2024’s **2D Gaussian Splatting** flattens every marshmallow into a razor-thin tangent disk—bringing computer graphics right back to Chapter 02’s stiff index card!

![A torus — the classical regular surface.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Figure 1. A torus in $$\mathbb{R}^3$$. Every point has a tangent plane and a normal, as in the regular-surface lesson. Wikimedia Commons, open licence.*

---

## Formal definitions and notation

<div class="textbook-definition" markdown="1">
**Definition (surface as a level set).**
If $$f:\mathbb{R}^3\to\mathbb{R}$$ is of class $$C^1$$, $$f(p)=0$$, and $$\nabla f(p)\neq 0$$, then near $$p$$ the set $$f^{-1}(0)$$ is a regular surface. The unit normal is $$\mathbf{n}=\nabla f/\|\nabla f\|$$.
</div>

<div class="textbook-definition" markdown="1">
**Definition (a Gaussian patch, at the level of intuition).**
A 3D Gaussian with centre $$\boldsymbol{\mu}$$ and covariance $$\Sigma$$ describes an ellipsoidal “cloud”
$$
G(\mathbf{x}) = \exp\bigl(-\tfrac12 (\mathbf{x}-\boldsymbol{\mu})^\top \Sigma^{-1}(\mathbf{x}-\boldsymbol{\mu})\bigr).
$$
When the smallest principal axis of $$\Sigma$$ is flattened against a plane, the cloud becomes a tangent patch — a reminder of your stiff card.
</div>

---

## Concrete Hand-Verifiable Worked Examples

### Worked Example 1: Verifying the Eikonal Equation and Tangent Plane for a Sphere SDF
Consider the exact Signed Distance Function of a sphere of radius $$R = 5$$ centered at the origin:
$$
f(x,y,z) = \sqrt{x^2 + y^2 + z^2} - 5.
$$
1. **Check the zero level set:** $$f(x,y,z) = 0 \iff x^2 + y^2 + z^2 = 25$$ (the sphere of radius 5; negative inside, positive outside).
2. **Compute the gradient $$\nabla f$$ by hand:**
   $$
   \nabla f(x,y,z) = \left(\frac{x}{\sqrt{x^2+y^2+z^2}},\; \frac{y}{\sqrt{x^2+y^2+z^2}},\; \frac{z}{\sqrt{x^2+y^2+z^2}}\right).
   $$
3. **Verify the Eikonal equation:**
   $$
   \|\nabla f(x,y,z)\| = \sqrt{\frac{x^2+y^2+z^2}{x^2+y^2+z^2}} = 1 \quad \text{everywhere except }(0,0,0)!
   $$
   (In NeuS, neural networks enforce this exact identity via an **Eikonal loss** $$\mathbb{E}\bigl[(\|\nabla f_\theta\| - 1)^2\bigr]$$ so the learned field behaves like a true distance!)
4. **Tangent plane at $$p = (3, 4, 0)$$:** Since $$3^2 + 4^2 + 0^2 = 25$$, $$p$$ lies on the sphere. Its unit normal is $$\mathbf{n} = \nabla f(3,4,0) = \left(\frac{3}{5}, \frac{4}{5}, 0\right)$$, so its tangent plane is
   $$
   \frac{3}{5}(x - 3) + \frac{4}{5}(y - 4) = 0 \;\Longleftrightarrow\; 3x + 4y = 25.
   $$

### Worked Example 2: Flattening a 3D Gaussian into a Tangent Disk
In 3D Gaussian Splatting, every covariance matrix is factored via a rotation $$R$$ and diagonal scales $$S = \operatorname{diag}(\sigma_1, \sigma_2, \sigma_3)$$:
$$
\Sigma = R S S^\top R^\top.
$$
Take a Gaussian centered at the origin aligned with the coordinate axes ($$R = I$$), with scales $$\sigma_1 = 1$$, $$\sigma_2 = 1$$, and $$\sigma_3 = 0.01$$. Look at its level ellipsoid $$(\mathbf{x}-\boldsymbol{\mu})^\top \Sigma^{-1} (\mathbf{x}-\boldsymbol{\mu}) = 1$$:
$$
\frac{x^2}{1^2} + \frac{y^2}{1^2} + \frac{z^2}{(0.01)^2} = 1 \;\Longrightarrow\; \lvert z\rvert \le 0.01!
$$
The 3D ellipsoid has collapsed into a razor-thin **tangent disk** in the $$xy$$-plane of thickness $$0.02$$, and the eigenvector corresponding to the smallest eigenvalue $$\sigma_3^2 = 10^{-4}$$ is $$(0, 0, 1)$$—which is literally the **unit surface normal $$\mathbf{n}$$**! That is why **2D Gaussian Splatting (2024)** sets $$\sigma_3 = 0$$ explicitly: every splat becomes an exact oriented tangent patch!

---

### Deep-Dive Explanation: Why "Pretty Pictures" ≠ "True Surfaces" (Read Slowly)

Why did 3D vision spend 2021–2025 fighting to turn NeRFs and 3D Gaussians into genuine differential-geometric surfaces? Follow the four steps slowly:

#### Step 1: Photometric ambiguity—many clouds paint the same photograph
When a neural renderer only optimizes pixel colors from photographs, it can cheat: a semi-transparent fog hovering slightly in front of a wall can reproduce the exact same image from limited viewpoints as a crisp solid surface. Good rendering alone does **not** guarantee a valid regular surface.

#### Step 2: NeuS’s unbiased density—locking rendering onto $$f^{-1}(0)$$
In naive volume rendering, making density proportional to a bell curve centered at $$f=0$$ actually shifts the peak opacity slightly *in front* of the true surface due to occlusion along the ray! **NeuS (Wang et al.)** proved mathematically how to derive an **unbiased** opacity weight directly from the derivative of the SDF along the ray, forcing maximum weight to occur *strictly* at $$f(\mathbf{r}(t)) = 0$$.

#### Step 3: Enforcing the Eikonal condition keeps $$\nabla f \neq 0$$
Adding the Eikonal penalty $$(\|\nabla f\| - 1)^2$$ stops the learned function from flattening out ($$\nabla f \to 0$$), which by the **Implicit Function Theorem** guarantees that $$f^{-1}(0)$$ stays a smooth, regular surface with well-defined unit normals $$\mathbf{n} = \nabla f$$ everywhere.

#### Step 4: Pulling explicit Gaussian splats back onto the tangent plane
While SDFs give clean watertight geometry, ray-marching them is slow. **3D Gaussian Splatting** flipped the trade-off—blazing real-time speed via rasterization, at the cost of noisy 3D clouds. **2D Gaussian Splatting (2024)** and normal-consistency losses marry both worlds: every splat is flattened into a 2D tangent disk whose normal agrees with depth-map gradients, recovering both speed and true Chapter 02 surface geometry!

In one schematic line:

$$
\text{2D multi-view photos}
\;\xrightarrow{\;\text{NeuS (SDF + Eikonal) or 2DGS (tangent disks)}\;}\;
f^{-1}(0)\text{ with }\|\nabla f\|=1
\;\xrightarrow{\;\text{Implicit Function Theorem}\;}\;
\text{Regular surface \& exact normals }\mathbf{n}.
$$

---

## Visual illustrations

![A saddle — the hyperbolic paraboloid.](https://upload.wikimedia.org/wikipedia/commons/4/40/Saddle_point.png)
*Figure 2. A saddle: the normal changes in two opposite senses. Surface-learning methods must recover this, not only smooth spheres. Wikimedia Commons.*

[Image placeholder: “A cross-section of an SDF: the zero contour, gradient arrows as normals, and a few Gaussians pulled onto the surface”]

## 🧠 Fundamental papers and references

1. **do Carmo, Chapter 2.** Regular surfaces, parametrizations, normals — not rewritten.

2. **Wang, P., Liu, L., Liu, Y., Theobalt, C., Komura, T., & Wang, W. (2021).** *NeuS: Learning Neural Implicit Surfaces by Volume Rendering for Multi-view Reconstruction*. NeurIPS 2021. The starting point still used as a baseline in 2022–2024.

3. **Kerbl, B., Kopanas, G., Leimkühler, T., & Drettakis, G. (2023).** *3D Gaussian Splatting for Real-Time Radiance Field Rendering*. ACM Trans. Graph. 42(4). doi:10.1145/3592433.

4. **Huang, B., Yu, Z., Chen, A., Geiger, A., & Gao, S. (2024).** *2D Gaussian Splatting for Geometrically Accurate Radiance Fields*. arXiv:2403.17888. Primitives pulled toward the surface, in the spirit of Chapter 02.

## 🔗 Applications and connections

In computer vision, reconstructing a surface from many photographs is the estimation of a two-dimensional manifold in $$\mathbb{R}^3$$. In graphics, normals from an SDF or a mesh decide shading. In reverse engineering and medicine, a smooth SDF yields thickness, distance-to-surface, and virtual surgery. A grasping robot needs the correct normal at the contact point: the stiff card is no longer a metaphor, it is a force vector.

## Video tham khảo

- [3D Gaussian Splatting for Real-Time Radiance Field Rendering](https://www.youtube.com/watch?v=T_kXY43VZnk) — Inria/GraphDeco GraphDeco Inria Research Group, English. xem trước. This is the 3D Gaussian Splatting talk the lesson cites: each Gaussian is an optimized elliptical splat.
- [Gauss, normals and fundamental forms \| Differential Geometry 34 \| NJ Wildberger](https://www.youtube.com/watch?v=drOldszOT7I) — Insights into Mathematics, English. The classical normal and tangent plane, which is why a flattened Gaussian has to hug the level set rather than float in the volume.
- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, English. Geometry-processing context: a surface is the three-dimensional signal that vision now learns either as an implicit function or as explicit primitives.

## 🧩 Exercises

**Exercise 1.** Sketch the sphere $$f(x,y,z)=x^2+y^2+z^2-1$$. At a point, draw $$\nabla f$$ and the tangent plane. Explain why $$\nabla f\neq 0$$ on the unit sphere.

**Exercise 2.** If a learned SDF has $$\nabla f \approx 0$$ on a region of the zero set, what does the implicit-function theorem say? Is that where geometry “breaks” — an edge, a spike, a self-intersection?

**Exercise 3.** In words, not code: distinguish *a pretty image from one viewpoint* from *the correct surface*. Why might Gaussian splatting win on rendering speed yet lose to an SDF on geometry, and why do the 2024 papers try to win the geometry back?

---

The theory of regular surfaces is unchanged. Chapter 03 will measure curvature with the two fundamental forms; its optional lesson speaks of intrinsic maps and Jacobians on meshes.
