---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Applications: Vision, Robotics, Shape, Hyperbolic Learning, and Numerical GR"
chapter: "09"
order: 7
owner: "Differential Geometry"
lesson_type: optional
---

Why does curling a slice of pizza sideways stop the tip from drooping? Why does an airplane from Tokyo to New York arch up near Alaska? Why can a 2D Escher print pack an exponentially branching family tree comfortably near its circular rim where flat Euclidean paper runs out of space? Every one of Chapter 09's visual stories—Gaussian curvature, geodesics, minimal surfaces, the hairy-ball theorem, hyperbolic space, and black holes—has stepped straight out of popular math books and into 2022–2026 computer vision, robotics, hyperbolic deep learning, and astrophysics!

## Background Knowledge Map: How Intrinsic, Geodesic, and Hyperbolic Geometry Unite Modern Applications

This capstone map gathers the entire course into three practical geometric lenses used across 2022–2026 research:

1. **Intrinsic Curvature ($$K$$) & Theorema Egregium:** Bending a flat sheet ($$K = 0$$) without stretching cannot change Gaussian curvature—forcing 3D Gaussian Splatting and Neural Jacobian Fields to respect intrinsic surface geometry rather than chasing raw pixel colors.
2. **Negative Curvature ($$K < 0$$) & Hyperbolic Representation Learning:** In Euclidean space, circumference grows linearly ($$2\pi r$$), while in the hyperbolic Poincaré disc it grows **exponentially** ($$2\pi \sinh R$$)—matching the exponential leaf growth ($$2^d$$) of hierarchies, word taxonomies, and biological trees!
3. **Global Topology & Lorentzian Geodesics:** Global obstructions like the Hairy Ball Theorem explain why 3D graphics and spherical robotics cannot comb a smooth singularity-free direction field on $$S^2$$, while Lorentzian null geodesics turn Einstein's metric into supercomputer images of supermassive black holes.

## Overview

Chapter 09 of the course is already a cluster of windows: the pizza theorem and Gaussian curvature, flight paths as great circles, soap films, black holes, the hairy-ball theorem, Escher’s hyperbolic geometry. This optional lesson opens no new theorem. It only updates, with real citations from about 2022–2026, how each of those windows is being used in computer vision, robotics, shape analysis, hyperbolic deep learning, and — when it touches the relativity lesson — the numerics of general relativity.

You will recognise most of the papers from earlier optional lessons. This is the place to *gather* them in the spirit of an applications chapter, so that a course in differential geometry does not end at an exercise sheet but at a map of where to walk next.

## Intuitive explanation

The pizza that folds as you hold it — the Theorema Egregium in daily life — is the same principle that forces Gaussian splatting to learn a *surface*, not only a colour (Chapter 02), and Neural Jacobian Fields to learn an intrinsic map (Chapter 03). A great-circle flight path is a geodesic on the sphere (Chapter 04), and also the orbit of a retraction on $$S^2$$ in Riemannian optimisation (Chapter 07). A soap film is a surface with $$H=0$$; discrete mean-curvature flow is still a tool for smoothing meshes. The hairy-ball theorem forbids a non-vanishing tangent vector field on $$S^2$$: that is why robots and graphics must accept singularities when they comb a direction field on a sphere, and why an atlas of the sphere needs at least two charts.

Escher’s Poincaré disc, around 2022, is no longer only a print. Peng, Varanka, Mostafa, Shi, and Zhao (*IEEE TPAMI*, 2022) survey a wave of hyperbolic neural networks: embeddings of hierarchies, graphs, words, cells, images. A space with $$K<0$$ holds a tree more comfortably than Euclid does, just as the Escher lesson made you feel that “the closer you go to the rim, the more room there is”.

Black holes, in 2022, gained a second portrait: Sagittarius A*. The EHT Collaboration matched the ring of light against a GRMHD library: this is not a new relativity lecture, only a reminder that null geodesics and Lorentz signature are running on supercomputers.

![The Poincaré disc — hyperbolic parallels.](https://upload.wikimedia.org/wikipedia/commons/4/4c/Poincare_disc_hyperbolic_parallel_lines.svg)
*Figure 1. In the Poincaré disc model, “straight lines” are arcs orthogonal to the boundary; through a point there are infinitely many parallels to a given line. Wikimedia Commons, open licence.*

### Worked Example (Step by Step): Measuring Exponential Room Near the Rim of the Poincaré Disc

In the Poincaré disc $$\mathbb{D} = \{x^2 + y^2 < 1\}$$ with hyperbolic metric $$g = \dfrac{4(dx^2 + dy^2)}{(1 - r^2)^2}$$, the hyperbolic distance from the origin $$0$$ to a point at Euclidean radius $$r \in [0, 1)$$ is:

$$
d_{\mathbb{H}}(0, r) = \int_0^r \frac{2\,dt}{1 - t^2} = \ln\!\left(\frac{1 + r}{1 - r}\right).
$$

Plug in three radii approaching the rim and compare the **hyperbolic circumference** $$C_{\mathbb{H}}(R) = 2\pi\sinh(R)$$ against the **Euclidean circumference** $$C_{\mathbb{E}}(R) = 2\pi R$$ at the same geodesic radius $$R = d_{\mathbb{H}}(0, r)$$:

| Euclidean radius $$r$$ | Hyperbolic radius $$R = \ln\bigl(\frac{1+r}{1-r}\bigr)$$ | Euclidean circumference $$2\pi R$$ | Hyperbolic circumference $$2\pi \sinh(R)$$ |
|---|---|---|---|
| $$r = 0.50$$ | $$\ln(3) \approx \mathbf{1.10}$$ | $$6.90$$ | $$8.38$$ |
| $$r = 0.90$$ | $$\ln(19) \approx \mathbf{2.94}$$ | $$18.50$$ | $$\mathbf{59.5}$$ |
| $$r = 0.99$$ | $$\ln(199) \approx \mathbf{5.29}$$ | $$33.26$$ | **$$624.5$$** (nearly **19×** more room!) |

Look at that bottom row: moving from $$r = 0.90$$ to $$r = 0.99$$ barely nudges the Euclidean radius, yet increases hyperbolic circumference more than **10-fold**! That exponential explosion of room near the boundary is why a 2D hyperbolic neural network embeds deep WordNet taxonomies with tiny distortion where 2D Euclidean embeddings crush siblings on top of one another.

### Deep-Dive Explanation: Three Words That Unlock 2022–2026 Applied Geometry (Read Slowly)

1. **Intrinsic:** ask what survives bending without stretching (Gaussian curvature $$K$$, geodesic distance); vision and shape-matching models that learn intrinsic quantities generalize seamlessly across body poses.
2. **Geodesic:** on curved spaces—spheres, $$SE(3)$$, hyperbolic discs, or Kerr spacetime—straight lines generalize to shortest/stationary curves; Riemannian optimizers and black-hole ray tracers both follow geodesics (or retractions).
3. **Equivariant:** whenever a domain carries a symmetry group ($$O(3), SE(3)$$), encoding that symmetry directly into Clifford layers or spherical-harmonic transformers lets models obey conservation laws out of the box.
4. **Match curvature sign to your data's geometry:** use $$K = 0$$ (Euclidean) for flat grids, $$K > 0$$ (spheres/$$SO(3)$$) for directions and rotations, and $$K < 0$$ (hyperbolic space) for trees and hierarchies.

**Quick check.** In the Poincaré disc, what happens to $$d_{\mathbb{H}}(0, r) = \ln\!\left(\frac{1+r}{1-r}\right)$$ as $$r \to 1^-$$? It diverges to **$$+\infty$$**—proving that the boundary circle $$r = 1$$ sits infinitely far away in hyperbolic distance, so the Poincaré disc is geodesically complete!

## Formal definitions and notation

No new definition. Only a dictionary, written as geometric prose:

The Gaussian curvature of a pizza slice and of a learned surface is the same $$K$$. The geodesics of a flight path are solutions of the Christoffel equation on $$S^2$$ with the round metric. A minimal surface satisfies $$H=0$$, the vanishing of the trace of the second form. The hairy ball is the vanishing of every non-singular section of $$\Gamma(TS^2)$$. The hyperbolic metric on the disc,
$$
g = \frac{4\,(dx^2+dy^2)}{(1-x^2-y^2)^2},
$$
is the metric on which Riemannian optimisers (Geoopt, Boumal) and hyperbolic layers take their steps. A Lorentzian metric, numerically, is the input to a geodesic integrator in EHT code.

## Visual illustrations

![The event-horizon image of M87* — the geometry of light around a black hole.](https://upload.wikimedia.org/wikipedia/commons/4/4f/Black_hole_-_Messier_87_crop_max_res.jpg)
*Figure 2. The EHT image of M87* (2019; the same observational programme that led to Sgr A* in 2022). EHT Collaboration, CC BY 4.0, via Wikimedia Commons. The ring is the geometry of null geodesics, not a flat disc of matter.*

![A vector field on a torus — the hairy ball does not forbid this surface.](https://upload.wikimedia.org/wikipedia/commons/7/75/Torus_vectors_radial.png)
*Figure 3. A torus admits a non-vanishing tangent field; $$S^2$$ does not. RokerHRO / Wikimedia Commons.*

## 🧠 Fundamental papers and references

1. **Hilbert & Cohn-Vossen.** *Geometry and the Imagination.* The intuitive spirit of the whole of Chapter 09.

2. **Kerbl et al. (2023).** 3D Gaussian Splatting. **Aigerman et al. (2022).** Neural Jacobian Fields. Vision and shape.

3. **Van Wyk et al. (2022)** and **Pineda et al. (2022).** Robotics: fabrics and Theseus.

4. **Peng, W., Varanka, T., Mostafa, A., Shi, H., & Zhao, G. (2022).** *Hyperbolic Deep Neural Networks: A Survey.* IEEE Trans. Pattern Anal. Mach. Intell. 44(12):10023–10044. doi:10.1109/TPAMI.2021.3136921.

5. **Topping et al. (2022)** and **Nguyen et al. (2023).** Graph curvature / numerical Ricci flow.

6. **Event Horizon Telescope Collaboration (2022).** *First Sgr A* EHT Results. V.* ApJL 930, L16. Numerical GR meeting observation.

## 🔗 Applications and connections

Computer vision: surface reconstruction, shape registration, UV parametrization. Robotics: trajectories on $$SE(3)$$, contact forces along normals, fabric-style stability. Shape analysis: near-isometries between poses, discrete curvature on scanned meshes. Representation learning: the Poincaré disc for hierarchical data. Astronomy: matching a horizon-scale image to geodesics in a Kerr metric or in GRMHD. Data science: geodesic distances on a learned manifold instead of raw Euclid — a return to the manifold hypothesis of Chapter 00.

A concrete example: a robot holding a digital pizza (a mesh) must fold the surface so that $$K$$ is preserved piece by piece; if the algorithm only optimises vertex positions in $$\mathbb{R}^3$$ it will stretch the dough. That is the Theorema Egregium in overalls.

## Video tham khảo

- [The Remarkable Way We Eat Pizza - Numberphile](https://www.youtube.com/watch?v=gi-TBlh44gY) — Numberphile, English. xem trước. This is the chapter’s Gaussian-curvature window: the same $$K$$ on a pizza slice and on a surface a computer is trying to learn.
- [Playing Sports in Hyperbolic Space - Numberphile](https://www.youtube.com/watch?v=u6Got0X41pY) — Numberphile, English. The Poincaré disk and exponential area growth, which is why the lesson says a space with $$K<0$$ holds hierarchies better than Euclidean space.
- [General Relativity & Curved Spacetime Explained! \| Space Time \| PBS Digital Studios](https://www.youtube.com/watch?v=AwhKZ3fd9JA) — PBS Space Time, English. Lightlike geodesics in curved spacetime, the relativity half of the lesson, where a bright ring around a black hole is a computed photon orbit.

## 🧩 Exercises

**Exercise 1.** Choose *one* required lesson of Chapter 09 (pizza, flight paths, soap films, black holes, the hairy ball, or Escher). Write a paragraph joining that lesson to exactly *one* 2022–2026 citation above. No new formula is needed.

**Exercise 2.** Sketch the Poincaré disc and a hierarchy (folders, a thesaurus, a tree of species). Why is there “more room for leaves” near the rim, and why must Euclid raise dimension to hold the same tree?

**Exercise 3.** The hairy ball says one cannot comb a sphere. A *normal* field on the sphere *does* exist. Distinguish the two fields, and explain why an atlas of $$S^2$$ still needs at least two charts even though the normal exists globally in $$\mathbb{R}^3$$.

**Exercise 4.** A last reflection: if you remember only three words — intrinsic, geodesic, equivariant — can you already read most of the 2022–2026 papers above? Where do you still need the full Riemann tensor?

---

The theory of the course is left untouched. The optional lessons are only arrows pointing out of the textbook, written for a reader who has already walked the curves, the surfaces, and the manifolds.
