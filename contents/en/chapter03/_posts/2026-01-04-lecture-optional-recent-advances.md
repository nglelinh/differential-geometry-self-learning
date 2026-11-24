---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Fundamental Forms, Jacobians, and Shape Analysis"
chapter: "03"
order: 3
owner: "Differential Geometry"
lesson_type: optional
---

## Overview

Pick up a flat sheet of paper. You can roll it effortlessly into a cylinder or twist it into a cone without tearing or stretching a single fiber—yet try wrapping that same flat sheet smoothly around a basketball, and it immediately crumples! Why?

In Chapter 03, you met the two measuring ledgers behind that everyday miracle: the **First Fundamental Form $$\mathrm{I}$$** (which records intrinsic lengths, angles, and areas *inside* the surface) and the **Second Fundamental Form $$\mathrm{II}$$** (which records how the surface bends *out* into ambient 3D space). Together they produce the **principal curvatures** $$\kappa_1, \kappa_2$$, **Gaussian curvature** $$K = \kappa_1 \kappa_2$$, and **mean curvature** $$H = \tfrac{1}{2}(\kappa_1 + \kappa_2)$$.

Between 2022 and 2026, computer graphics and 3D shape analysis rediscovered those exact classical objects in neural and discrete form. **Neural Jacobian Fields** (Aigerman et al., *SIGGRAPH 2022*) showed that instead of predicting raw 3D vertex positions (which easily tear or self-intersect), a neural network should predict a **tangential Jacobian field**—the differential $$dF$$ of a map—and recover the global surface deformation via a **Poisson solve**, respecting the First Fundamental Form intrinsically! Meanwhile, **discrete differential geometry** (angle defect for $$K$$, cotangent Laplacian for $$H$$) remains the engine behind mesh smoothing, UV unwrapping, and thin-shell engineering.

---

## Background Knowledge Map: Fundamental Forms Meet Discrete Meshes

How do smooth derivatives on surfaces translate into triangle meshes and neural shape-matching networks? Three pillars bridge them.

### 1. The First & Second Fundamental Forms: Two Ledgers of Geometry
**What is it?**
- **First Fundamental Form $$\mathrm{I} = E\,du^2 + 2F\,du\,dv + G\,dv^2$$:** The induced inner product on each tangent plane $$T_p M$$. It measures curve lengths, angles between intersecting curves, and surface area. A map preserving $$\mathrm{I}$$ is an **isometry** (bending without stretching).
- **Second Fundamental Form $$\mathrm{II} = e\,du^2 + 2f\,du\,dv + g\,dv^2$$:** Measures how rapidly the unit normal $$\mathbf{n}$$ tilts as you move across the surface (the **shape operator** $$S = -d\mathbf{n}$$).

**What does it study?**
- **Principal curvatures $$\kappa_1, \kappa_2$$:** The maximum and minimum normal bending directions—the eigenvalues of $$\mathrm{I}^{-1}\mathrm{II}$$.
- **Gaussian curvature $$K = \kappa_1\kappa_2$$ vs. Mean curvature $$H = \tfrac{1}{2}(\kappa_1+\kappa_2)$$:** $$K$$ distinguishes bowls ($$K>0$$), cylinders/planes ($$K=0$$), and saddles ($$K<0$$); $$H$$ governs soap films ($$H=0$$) and surface tension!

### 2. Intrinsic Maps & Jacobian Fields (Gradient-Domain Geometry)
**What is it?** Given a map $$F: M \to N$$ between two surfaces, its differential $$dF_p: T_p M \to T_{F(p)} N$$ is a $$2\times 2$$ (or $$3\times 2$$) **Jacobian matrix** telling you how infinitesimal triangles stretch and rotate.

**What does it study?**
- **Poisson reconstruction:** Because a predicted matrix field $$J(p)$$ on triangles might not fit together seamlessly on its own, solving the **Poisson equation** $$\Delta F = \operatorname{div}(J)$$ finds the closest globally consistent surface map $$F$$ whose differential matches $$J$$—yielding smooth, fold-free deformations even across completely different mesh triangulations!

### 3. Discrete Curvature on Triangle Meshes
**What is it?** On a polyhedral mesh, every triangle is flat—so all curvature is concentrated on the **vertices** (for $$K$$) and **edges** (for $$H$$)!

**What does it study?**
- **Angle defect:** Around any flat interior vertex, triangle angles sum to $$2\pi$$. Any shortage ($$2\pi - \sum \theta_i > 0$$) is positive discrete Gaussian curvature; any excess ($$2\pi - \sum \theta_i < 0$$) is negative saddle curvature!

---

## Intuitive explanation

Imagine two shirts cut from the exact same pattern and worn by two people in different poses. The threads inside the fabric (intrinsic lengths, $$\mathrm{I}$$) barely stretch, while the folds in 3D space (extrinsic bending, $$\mathrm{II}$$) change dramatically. Any good 3D registration or animation map between two poses must honor the **first ledger** ($$\mathrm{I}$$): bend the body naturally without rubbery stretching!

**Neural Jacobian Fields** take this geometric lesson to heart. Rather than asking a neural network to output raw vertex coordinates $$(x_i, y_i, z_i)$$—which ignores mesh connectivity and breaks down when you remesh the surface—the network predicts a local linear transformation (Jacobian $$J_t$$) on each triangle, then integrates those local deformations globally via a Poisson solve. Because Jacobians live intrinsically on tangent planes, the trained network transfers seamlessly across meshes with completely different resolutions and triangulations.

![The sign of Gaussian curvature on model surfaces.](https://upload.wikimedia.org/wikipedia/commons/6/61/Gaussian_curvature.svg)
*Figure 1. Principal-curvature lines: the geometric picture of diagonalising the second form with respect to the first. Wikimedia Commons, open licence.*

---

## Formal definitions and notation

On a parametrization $$\mathbf{x}(u,v)$$, the first fundamental form is
$$
\mathrm{I} = E\,du^2 + 2F\,du\,dv + G\,dv^2,
$$
and a map $$F: M \to N$$ is *nearly isometric* when the pullback metric satisfies $$F^*\mathrm{I}_2 \approx \mathrm{I}_1$$ (equivalently, its differential $$dF_p: T_p M \to T_{F(p)} N$$ nearly preserves inner products).

On a triangle mesh, the **discrete Gaussian curvature** at a vertex $$v$$ with incident triangle corner angles $$\theta_i$$ and local barycentric area $$A_v$$ is
$$
K(v) \approx \frac{2\pi - \sum_i \theta_i}{A_v}.
$$

---

## Concrete Hand-Verifiable Worked Examples

### Worked Example 1: Computing $$\mathrm{I}$$, $$\mathrm{II}$$, $$K$$, and $$H$$ on a Saddle by Hand
Take the hyperbolic paraboloid (Pringles chip) $$\mathbf{x}(u,v) = (u,\; v,\; u^2 - v^2)$$ right at the origin $$(u,v) = (0,0)$$:

1. **First derivatives & First Fundamental Form $$\mathrm{I}$$:**
   $$
   \mathbf{x}_u = (1, 0, 2u) \Big|_{(0,0)} = (1, 0, 0),
   \qquad
   \mathbf{x}_v = (0, 1, -2v) \Big|_{(0,0)} = (0, 1, 0).
   $$
   Dot products give $$E = \mathbf{x}_u\cdot\mathbf{x}_u = 1$$, $$F = \mathbf{x}_u\cdot\mathbf{x}_v = 0$$, $$G = \mathbf{x}_v\cdot\mathbf{x}_v = 1$$! So at the origin, $$\mathrm{I} = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}$$ (standard flat Euclidean inner product).
2. **Unit normal $$\mathbf{n}$$:** $$\mathbf{n} = \frac{\mathbf{x}_u \times \mathbf{x}_v}{\|\mathbf{x}_u \times \mathbf{x}_v\|} = (0, 0, 1)$$.
3. **Second derivatives & Second Fundamental Form $$\mathrm{II}$$:**
   $$
   \mathbf{x}_{uu} = (0, 0, 2), \qquad \mathbf{x}_{uv} = (0, 0, 0), \qquad \mathbf{x}_{vv} = (0, 0, -2).
   $$
   Projecting onto $$\mathbf{n} = (0,0,1)$$ gives $$e = 2$$, $$f = 0$$, $$g = -2$$, so $$\mathrm{II} = \begin{pmatrix} 2 & 0 \\ 0 & -2 \end{pmatrix}$$!
4. **Principal, Gaussian, and Mean Curvatures:** The eigenvalues of $$\mathrm{I}^{-1}\mathrm{II} = \begin{pmatrix} 2 & 0 \\ 0 & -2 \end{pmatrix}$$ are **$$\kappa_1 = +2$$** (curves upward along $$u$$) and **$$\kappa_2 = -2$$** (curves downward along $$v$$). Immediately:
   $$
   K = \kappa_1 \kappa_2 = (2)(-2) = -4 < 0 \quad (\text{saddle!}),
   \qquad
   H = \frac{\kappa_1 + \kappa_2}{2} = \frac{2 - 2}{2} = 0 \quad (\text{locally minimal!}).
   $$

### Worked Example 2: Discrete Gaussian Curvature & Gauss–Bonnet on a Cube
Wait: every face of a cube is completely flat, so where did all the curvature of a sphere go when you turned a sphere into a cube? **Straight into its 8 corners!** Check it by hand using the angle defect formula:
- At each of the $$8$$ vertices of a cube, **three squares** meet, each contributing a corner angle of $$90^\circ = \frac{\pi}{2}$$.
- Therefore the **angle defect** (integrated Gaussian curvature) at each vertex is
  $$
  \Omega(v) = 2\pi - \left(\frac{\pi}{2} + \frac{\pi}{2} + \frac{\pi}{2}\right) = 2\pi - \frac{3\pi}{2} = \frac{\pi}{2} > 0.
  $$
- Now sum the angle defect over all $$8$$ vertices of the cube:
  $$
  \sum_{v=1}^{8} \Omega(v) = 8 \times \frac{\pi}{2} = 4\pi = 2\pi \cdot \chi(S^2)!
  $$
Even on a sharp-cornered cube, total discrete Gaussian curvature equals **$$4\pi$$**—the exact same total curvature as a smooth round sphere ($$\iint_{S^2} 1\,dA = 4\pi$$)!

---

### Deep-Dive Explanation: How Neural Jacobian Fields Learn Intrinsic Surface Maps (Read Slowly)

Why did Aigerman et al. (*SIGGRAPH 2022*) abandon predicting vertex positions in favor of predicting **Jacobian fields**? Follow the four steps slowly:

#### Step 1: Why raw vertex prediction fails under remeshing
Suppose you train a network to deform a mesh by predicting a 3D displacement $$\Delta \mathbf{p}_i$$ at every vertex. Even tiny independent errors at neighboring vertices cause adjacent triangles to flip inside-out, creating ugly spikes and self-intersections—and if the test mesh has twice as many triangles, the learned displacements break down completely.

#### Step 2: Predict local differentials $$J_t$$ on every triangle instead
Instead of positions, the network predicts a $$3\times 3$$ matrix $$J_t$$ on each triangle $$t$$—representing the desired **Jacobian** (local stretch and rotation) of the deformation map $$F$$ restricted to that triangle’s tangent plane! Now the network speaks directly in the language of the First Fundamental Form $$\mathrm{I}$$.

#### Step 3: Solve one global linear Poisson equation to stitch the map together
An arbitrary field of predicted matrices $$\{J_t\}$$ is generally not integrable (the deformed triangles won’t automatically share edges). So Neural Jacobian Fields minimizes the global least-squares energy
$$
\min_{F} \sum_{t} A_t \,\bigl\| \nabla_t F - J_t \bigr\|_F^2
\quad \Longleftrightarrow \quad
\Delta_{\text{cot}} F = \operatorname{div}(J),
$$
where $$\Delta_{\text{cot}}$$ is the classical **cotangent Laplace–Beltrami operator**!

#### Step 4: Backpropagate through the Poisson solve end-to-end
Because $$\Delta_{\text{cot}} F = \operatorname{div}(J)$$ is a sparse, symmetric positive-definite linear system, you can differentiate right through the linear solver during training! The result: globally smooth, nearly isometric, triangulation-independent surface deformations and UV maps—pure Chapter 03 calculus running inside PyTorch!

In one schematic line:

$$
\text{Input mesh }M
\;\xrightarrow{\;\text{neural network}\;}\;
\text{Tangential Jacobian field }J_t
\;\xrightarrow{\;\Delta_{\text{cot}} F = \operatorname{div}(J)\;}\;
\text{Globally smooth, intrinsic map }F.
$$

---

## Visual illustrations

![A saddle point — negative Gaussian curvature.](https://upload.wikimedia.org/wikipedia/commons/4/40/Saddle_point.png)
*Figure 2. At a saddle the principal curvatures have opposite signs, so $$K<0$$. Learned maps must distinguish this from a spherical cap with $$K>0$$. Wikimedia Commons.*

[Image placeholder: “Two meshes with different triangulations; Jacobian arrows on each triangle; a Poisson map carrying one mesh onto the other”]

## 🧠 Fundamental papers and references

1. **do Carmo.** The first and second fundamental forms, principal curvatures — theory untouched.

2. **Aigerman, N., Gupta, K., Kim, V. G., Chaudhuri, S., Saito, J., & Groueix, T. (2022).** *Neural Jacobian Fields: Learning Intrinsic Mappings of Arbitrary Meshes*. ACM Trans. Graph. (SIGGRAPH). doi:10.1145/3528223.3530141.

3. **Crane, K.** *Discrete Differential Geometry: An Applied Introduction*. The modern bridge from $$K,H$$ in class to $$K,H$$ in code.

4. **Pressley, A.** *Elementary Differential Geometry*. To refresh the geometric meaning of $$K$$ and $$H$$ before reading mesh papers.

## 🔗 Applications and connections

In shape analysis, registering two poses of the same person is the search for a nearly isometric map: the skin does not stretch, the joints fold. In graphics, UV parametrization — flattening a 3D surface to 2D — is the search for an $$F$$ that warps $$\mathrm{I}$$ as little as possible; Neural Jacobian Fields were among the first systems to *learn* that task on meshes of varying connectivity. In engineering, mean curvature governs stresses in thin shells; estimating $$H$$ on a scanned mesh is the first step of a shell analysis.

## Video tham khảo

- [Shape Analysis (Lecture 6): Second fundamental form and surface curvature](https://www.youtube.com/watch?v=UewzuzaPlxA) — Justin Solomon, English. xem trước. Watch discrete curvature on meshes first: angle defect for Gaussian curvature and mean curvature, as in the lesson’s formula for $$K(v)$$.
- [Tensor Calculus 12: The Metric Tensor in Curved Spaces for Measuring Arc Length](https://www.youtube.com/watch?v=SmjbpIgVKFs) — eigenchris, English. The first fundamental form as a metric tensor: the length ledger a nearly isometric map has to respect.
- [Change of Variables & The Jacobian \| Multi-variable Integration](https://www.youtube.com/watch?v=wUF-lyyWpUc) — Dr. Trefor Bazett, English. The Jacobian of a change of variables measures area distortion; on a surface, $$dF$$ is the tangential version of that story.

## 🧩 Exercises

**Exercise 1.** Sketch a cylinder and a plane. Point out the directions in which $$K=0$$, and explain why “unrolling” the cylinder onto paper can preserve $$\mathrm{I}$$ locally without doing so globally.

**Exercise 2.** On a coarse triangulation of the sphere, the angle defect at vertices tends to be positive. Explain in words why the total defect of the mesh already remembers Gauss–Bonnet, even if you have not met that theorem formally.

**Exercise 3.** Reflect: if a network only learns vertex coordinates in $$\mathbb{R}^3$$, it easily learns extrinsic deformations. Why is learning an *intrinsic* Jacobian more faithful to the first fundamental form?

---

The two fundamental forms are not rewritten. In Chapter 04, the Theorema Egregium and geodesics will meet Ricci flow on graphs and the over-squashing of GNNs.
