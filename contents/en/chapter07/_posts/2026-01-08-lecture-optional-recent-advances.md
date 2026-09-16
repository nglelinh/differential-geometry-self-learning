---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Riemannian Manifolds, Adam on Manifolds, and Geoopt"
chapter: "07"
order: 3
owner: "Differential Geometry"
lesson_type: optional
---

## Overview

A Riemannian manifold $$(M,g)$$ is where everything in the course meets: length, geodesics, Levi-Civita, the Riemann curvature tensor, Ricci, and scalar curvature. Hopf–Rinow, at a conceptual level, ties metric completeness to geodesic completeness. This optional lesson does not reprove those theorems. It tells the story of optimisation on $$(M,g)$$ — the question “what must Adam do if the parameters do not live in $$\mathbb{R}^n$$?” — and the story of discrete Ricci curvature on graphs, already met in Chapter 04, now placed in the Ricci language of this chapter.

Boumal published *An Introduction to Optimization on Smooth Manifolds* (Cambridge, 2023): a modern text centred on retractions, Riemannian gradients, Newton, and trust-region methods. Geoopt (Kochurov, Karimov, Kozlukov, 2020) remains the PyTorch library that 2022–2026 papers call for `RiemannianAdam`. Bécigneul & Ganea (ICLR 2019) is the original “Adam on manifolds” paper; that lineage, together with Boumal’s book, shapes how people train hyperbolic networks, networks on $$St(p,n)$$, or on SPD matrices. Nguyen et al. (ICML 2023) show that Ricci is not only a textbook tensor: its sign on a graph adjudicates two classical diseases of GNNs.

## Intuitive explanation

The Euclidean gradient is only a list of partial derivatives. On a sphere, if you add that gradient to a weight vector and *do not* project back, you have left $$M$$. Riemannian optimisation does three things you have just learned: (1) treat the derivative as a covector, (2) raise it by $$g^{-1}$$ to obtain a tangent vector, (3) take a step by a retraction — a computational cousin of the exponential map, cheaper than true geodesics. Riemannian Adam keeps first and second moments *in the tangent spaces*, then transports them as the parameter point moves: again, a connection.

Think of the metric as the cost terrain from Lecture 14. RiemannianAdam does not step along the paper arrow; it steps along the arrow already corrected by that terrain, then lands on the surface by a retraction. Geoopt is merely a way of writing this in a few lines of Python; the mathematics is still $$(M,g,\nabla)$$.

Riemannian curvature measures the failure of covariant derivatives to commute. On a graph, Ollivier–Ricci is a discrete shadow of that trace. Positive sign: neighbours mix too much (over-smoothing). Negative sign: a bottleneck (over-squashing). Numerical Ricci flow, as already told, is an algorithm that makes $$g$$ — or the edge set — gentler.

![Geodesics on the sphere — the path of Riemannian gradient descent if the loss is distance.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Figure 1. Great circles: both geodesics and the orbits of many gradient steps when $$M=S^n$$. Mathwriter2718 / Wikimedia Commons, 2024.*

## Formal definitions and notation

**Riemannian gradient.** For $$f:M\to\mathbb{R}$$, $$\operatorname{grad} f$$ is defined by
$$
g(\operatorname{grad} f, X) = df(X)
$$
for every field $$X$$. In coordinates, $$\operatorname{grad} f = g^{ij}\partial_j f$$.

**Retraction.** A retraction $$R_x:T_xM\to M$$ satisfies $$R_x(0)=x$$ and $$d(R_x)_0 = \mathrm{id}$$. The exponential map is a retraction; many algorithms use QR, normalisation, or a matrix exponential — cheaper.

**One RiemannianAdam step (as a slogan).** Take the Riemannian gradient $$g_t$$, update moments in $$T_{x_t}M$$, transport the previous moments to $$x_t$$, then
$$
x_{t+1} = R_{x_t}(-\alpha\, m_t/\sqrt{v_t}).
$$
The arithmetic lives in Geoopt; the geometry lives in this chapter.

## Visual illustrations

![Transporting moments: parallelise before adding.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Figure 2. Adam on a manifold must bring moving averages from $$T_{x_{t-1}}M$$ into $$T_{x_t}M$$. That is parallel transport, even if the implementation is often a cheap projection. Wikimedia Commons.*

[Image placeholder: “A sphere in R^3; a raw Euclidean step flying off the surface; a retraction step landing back on the surface”]

## 🧠 Fundamental papers and references

1. **do Carmo / Jost.** Riemannian manifolds, curvature, Hopf–Rinow (conceptually).

2. **Boumal, N. (2023).** *An Introduction to Optimization on Smooth Manifolds*. Cambridge University Press. doi:10.1017/9781009166164.

3. **Kochurov, M., Karimov, R., & Kozlukov, S. (2020).** *Geoopt: Riemannian Optimization in PyTorch*. arXiv:2005.02819. The `RiemannianAdam` library still used in 2022–2026 papers.

4. **Bécigneul, G., & Ganea, O.-E. (2019).** *Riemannian Adaptive Optimization Methods*. ICLR 2019. The original Adam-on-manifolds paper.

5. **Nguyen et al. (2023).** *Revisiting Over-smoothing and Over-squashing Using Ollivier-Ricci Curvature*. ICML 2023. The Ricci tensor of this chapter meeting GNNs.

## 🔗 Applications and connections

Hyperbolic deep learning embeds hierarchies in the Poincaré disc: parameters live on $$M$$, not in $$\mathbb{R}^n$$, so the optimiser must be Riemannian. Vision: covariance matrices (SPD) and subspaces (Grassmann) appear in tracking. Robotics: pose space is $$SO(3)$$ or $$SE(3)$$ — Chapter 08 will be more precise, but the gradient is already Riemannian. Information geometry, lightly: Fisher–Rao turns a model space into $$(M,g)$$, and the natural gradient is precisely $$\operatorname{grad} L$$.

## 🧩 Exercises

**Exercise 1.** On $$S^2\subset\mathbb{R}^3$$ let $$f(x)=x\cdot e_3$$. Describe $$\operatorname{grad} f$$ as the projection of $$e_3$$ onto the tangent plane. What does a raw Euclidean step do wrong?

**Exercise 2.** Explain in words the difference between a *retraction* and the *exponential map*. When is a retraction accurate enough for machine learning, and when does true geodesic geometry (Hopf–Rinow) matter again?

**Exercise 3.** Reflect: the Ricci tensor is a trace of Riemann. On a graph, Ollivier–Ricci is a number on each edge. Write one sentence that joins “a trace of holonomy” to “whether two random balls overlap”.

---

The theory of Riemannian manifolds is unchanged. Chapter 08 will add a group structure; its optional lesson meets Equiformer, Theseus, and robot kinematics.
