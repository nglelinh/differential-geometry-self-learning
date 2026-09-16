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

The two fundamental forms are the measuring pair of a surface: the first keeps lengths, angles, and areas; the second keeps how the surface bends in the ambient space. Gaussian and mean curvature are born from that pair. This optional lesson does not recompute $$E,F,G$$ or $$e,f,g$$. It tells how, in 2022–2026, graphics and shape learning recovered those same objects under the names *Jacobian fields*, *intrinsic maps*, and *discrete curvature on meshes*.

Neural Jacobian Fields (Aigerman, Gupta, Kim, Chaudhuri, Saito, Groueix, SIGGRAPH 2022) learn a field of matrices on a surface, project them onto the tangent spaces, and recover a map by a Poisson solve. That is work in the “intrinsic gradient domain” — a computational cousin of the first fundamental form. At the same time the discrete-geometry community continues to estimate Gaussian and mean curvature on triangle meshes, because every smoothing, segmentation, or registration algorithm needs to know in which sense the surface is bending.

## Intuitive explanation

Imagine two garments cut from the same cloth and worn on two different bodies. The threads (lengths in the surface) are nearly preserved; the folds (bending in space) change. The first form is the ledger of threads; the second is the ledger of folds. A good intrinsic map between two 3D meshes must honour the first ledger: it must not stretch the skin at will.

Neural Jacobian Fields do not learn vertex positions directly. They learn, at each point, a matrix — a candidate for $$dF$$ of a map $$F$$ — and then find the nearest $$F$$ in the Poisson sense. You can hear multivariable calculus: the Jacobian is the best linear map, and on a surface one keeps only the tangential part. That the triangulation may differ across samples is the method’s strength: two shapes need not share a vertex set.

Discrete curvature — angle defect for Gauss, a Laplace–Beltrami operator for the mean — is how a computer holds $$K$$ and $$H$$. Without it there is no mesh smoothing, no discrete mean-curvature flow in graphics, no wrinkle analysis on a digital face.

![The sign of Gaussian curvature on model surfaces.](https://upload.wikimedia.org/wikipedia/commons/6/61/Gaussian_curvature.svg)
*Figure 1. Principal-curvature lines: the geometric picture of diagonalising the second form with respect to the first. Wikimedia Commons, open licence.*

## Formal definitions and notation

On a parametrization the first form is
$$
\mathrm{I} = E\,du^2 + 2F\,du\,dv + G\,dv^2,
$$
and a map $$F$$ between surfaces is *nearly isometric* when $$F^*\mathrm{I}_2 \approx \mathrm{I}_1$$. The Jacobian $$dF_p: T_pM\to T_{F(p)}N$$ is the linear version of that story: $$dF_p$$ nearly preserves the inner product induced by $$\mathrm{I}$$.

Discrete Gaussian curvature at a vertex $$v$$ is often
$$
K(v) \approx \frac{2\pi - \sum_i \theta_i}{A_v},
$$
with $$\theta_i$$ the corner angles at $$v$$ and $$A_v$$ a barycentric area. This is not the smooth definition, but it converges, in several precise senses, to $$K$$ as the mesh is refined.

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

## 🧩 Exercises

**Exercise 1.** Sketch a cylinder and a plane. Point out the directions in which $$K=0$$, and explain why “unrolling” the cylinder onto paper can preserve $$\mathrm{I}$$ locally without doing so globally.

**Exercise 2.** On a coarse triangulation of the sphere, the angle defect at vertices tends to be positive. Explain in words why the total defect of the mesh already remembers Gauss–Bonnet, even if you have not met that theorem formally.

**Exercise 3.** Reflect: if a network only learns vertex coordinates in $$\mathbb{R}^3$$, it easily learns extrinsic deformations. Why is learning an *intrinsic* Jacobian more faithful to the first fundamental form?

---

The two fundamental forms are not rewritten. In Chapter 04, the Theorema Egregium and geodesics will meet Ricci flow on graphs and the over-squashing of GNNs.
