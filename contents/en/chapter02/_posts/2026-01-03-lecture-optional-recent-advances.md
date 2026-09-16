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

Chapter 02 taught you a regular surface as a parametrization patch $$\mathbf{x}(u,v)$$, with a tangent plane and a normal. That definition remains the right one. What happened in computer graphics and 3D vision from about 2021 to 2024 is a change of *representation*: instead of storing a triangle mesh, one learns an implicit function — often a signed distance $$\mathrm{SDF}:\mathbb{R}^3\to\mathbb{R}$$ — whose zero level set is the surface, or one learns a cloud of discrete 3D Gaussians and “splats” them into images.

NeuS (Wang et al., NeurIPS 2021, and its 2022–2024 descendants) couples an SDF to volume rendering so that the zero level set matches true geometry, not merely colour. 3D Gaussian Splatting (Kerbl, Kopanas, Leimkühler, Drettakis, TOG / SIGGRAPH 2023) showed that an explicit, optimisable representation can reconstruct scenes in real time. 2D Gaussian Splatting (2024) pulls those blobs closer to the surface, because geometry — not only light — is what Chapter 02 cares about.

This lesson will not install those methods. It only reconnects a classical question — *what is a surface?* — to a modern answer: *a regular level set of a learnable function, or a collection of tiny tangent patches*.

## Intuitive explanation

Remember the stiff card laid on the globe: that is the tangent plane. A neural SDF does the reverse. It assigns to every point of space a real number — negative inside, positive outside — and the surface is where the number vanishes. If the function is smooth and the gradient does not vanish on the level set, the implicit-function theorem (from your calculus lesson) tells you that the zero set is a regular surface, exactly as defined. The unit normal is $$\nabla \mathrm{SDF}/\|\nabla \mathrm{SDF}\|$$.

Gaussian splatting is more like covering the object with countless flat sweets, each with a position, a covariance (an ellipsoid), a colour, and an opacity. When projected they stack into an image. For the *geometry* to be right the sweets must sit on the surface rather than float in the volume. That is why the 2024 variants speak of “pulling” Gaussians onto the zero level set: they are returning to your tangent plane.

![A torus — the classical regular surface.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Figure 1. A torus in $$\mathbb{R}^3$$. Every point has a tangent plane and a normal, as in the regular-surface lesson. Wikimedia Commons, open licence.*

## Formal definitions and notation

**Definition (surface as a level set).**
If $$f:\mathbb{R}^3\to\mathbb{R}$$ is of class $$C^1$$, $$f(p)=0$$, and $$\nabla f(p)\neq 0$$, then near $$p$$ the set $$f^{-1}(0)$$ is a regular surface. The unit normal is $$\mathbf{n}=\nabla f/\|\nabla f\|$$.

**Definition (a Gaussian patch, at the level of intuition).**
A 3D Gaussian with centre $$\boldsymbol{\mu}$$ and covariance $$\Sigma$$ describes an ellipsoidal “cloud”
$$
G(\mathbf{x}) = \exp\bigl(-\tfrac12 (\mathbf{x}-\boldsymbol{\mu})^\top \Sigma^{-1}(\mathbf{x}-\boldsymbol{\mu})\bigr).
$$
When the axes of $$\Sigma$$ are flattened against a plane, the cloud becomes a tangent patch — a reminder of your stiff card.

NeuS observed that naïve volume rendering, if density is tied to an SDF carelessly, is *biased* away from the zero level set. Their corrected formula cancels that first-order error: a reminder that “a pretty picture” and “the right surface” do not automatically coincide.

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

## 🧩 Exercises

**Exercise 1.** Sketch the sphere $$f(x,y,z)=x^2+y^2+z^2-1$$. At a point, draw $$\nabla f$$ and the tangent plane. Explain why $$\nabla f\neq 0$$ on the unit sphere.

**Exercise 2.** If a learned SDF has $$\nabla f \approx 0$$ on a region of the zero set, what does the implicit-function theorem say? Is that where geometry “breaks” — an edge, a spike, a self-intersection?

**Exercise 3.** In words, not code: distinguish *a pretty image from one viewpoint* from *the correct surface*. Why might Gaussian splatting win on rendering speed yet lose to an SDF on geometry, and why do the 2024 papers try to win the geometry back?

---

The theory of regular surfaces is unchanged. Chapter 03 will measure curvature with the two fundamental forms; its optional lesson speaks of intrinsic maps and Jacobians on meshes.
