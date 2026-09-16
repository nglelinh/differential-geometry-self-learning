---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Intrinsic Geometry, Graph Curvature, and Numerical Ricci Flow"
chapter: "04"
order: 3
owner: "Differential Geometry"
lesson_type: optional
---

## Overview

The Theorema Egregium says something Gauss was proud enough to call remarkable: Gaussian curvature can be read from measurements *in* the surface, without stepping outside. Geodesics are the straightest paths a creature living in the surface can walk. This optional lesson leaves both ideas untouched, then shows that the graph-representation community, around 2022–2023, turned them into a theory of *information bottlenecks*.

Topping, Di Giovanni, Chamberlain, Dong, and Bronstein (ICLR 2022, honourable mention) prove that edges of negative combinatorial curvature — a discrete relative of Ollivier–Ricci — are precisely where messages are “over-squashed” when a graph neural network tries to hear distant nodes. They propose a stochastic discrete Ricci flow (SDRF) that *rewires* the graph, in the spirit of smoothing a metric. In 2023, Nguyen, Nong, Nguyen, Ho, Osher, and Nguyen (ICML) use Ollivier–Ricci curvature itself to unify over-smoothing (positive curvature) with over-squashing (negative curvature), and write a Batch Ollivier–Ricci Flow.

You need not become a GNN researcher. Hear only this: *intrinsic curvature governs how information travels on a discrete space*, just as it governs how two geodesics converge on a sphere.

## Intuitive explanation

Be again the ant on an orange. If two “straight” paths start nearby they will meet — that is $$K>0$$. On a saddle they peel apart — $$K<0$$. On a graph the “straight path” is a random walk or a shortest path, and Ollivier curvature compares unit balls at two adjacent vertices: if the balls overlap more than expected the edge is *positively curved* (information mixes too fast, every node looks the same); if they barely touch the edge is *negatively curved* (information must squeeze through a bottleneck).

Over-squashing is the feeling of standing in a narrow corridor: too many messages from a huge family tree are forced through one edge. Ricci flow, in the smooth setting, evolves a metric toward something more even. On a graph the numerical cousin adds edges where curvature is negative and (sometimes) removes them where it is positive. That is not a proof of the Theorema Egregium; it is the theorem *borrowed* as a design principle.

![Geodesics on the sphere are great circles.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Figure 1. The non-constant maximal geodesics of the round sphere are the great circles. Author: Mathwriter2718, Wikimedia Commons, 2024, open licence.*

## Formal definitions and notation

**Reminder (no proof).** Gaussian curvature $$K$$ is a local isometric invariant. The geodesic equation, with Christoffel symbols, is
$$
\frac{d^2 u^k}{dt^2} + \Gamma^k_{ij}\frac{du^i}{dt}\frac{du^j}{dt} = 0.
$$

**Ollivier–Ricci curvature (as a story).** For adjacent vertices $$i\sim j$$, take probability measures $$\mu_i,\mu_j$$ on neighbourhoods and the Wasserstein distance $$W_1(\mu_i,\mu_j)$$. Then
$$
\kappa(i,j) = 1 - \frac{W_1(\mu_i,\mu_j)}{d(i,j)}
$$
is positive when the two “balls” are closer than a Euclidean guess, negative when they are farther. Topping et al. also introduce *Balanced Forman curvature*, a sharp combinatorial lower bound on Ollivier curvature, sufficient to prove that negatively curved edges create bottlenecks.

Discrete Ricci flow, as a slogan, is
$$
\frac{d}{dt}\,g_{ij} = -\mathrm{Ric}_{ij}
$$
or, on a graph, a loop: measure $$\kappa$$, add edges where $$\kappa$$ is very negative, drop edges where $$\kappa$$ is very positive. SDRF and BORF are two ways of making the slogan run on data.

## Visual illustrations

![Parallel transport on the sphere — intrinsic curvature.](https://upload.wikimedia.org/wikipedia/commons/7/7d/Parallel_Transport.svg)
*Figure 2. Carry a vector around the loop ANB on the sphere; on return it has rotated by an angle proportional to area and curvature. Author: Fred the Oyster, Wikimedia Commons.*

[Image placeholder: “A graph with a narrow bridge; the bridge edge has negative κ; SDRF adds a cross-edge to ease over-squashing”]

## 🧠 Fundamental papers and references

1. **Gauss (1827).** *Disquisitiones generales circa superficies curvas.* The source of the Theorema Egregium.

2. **do Carmo.** The chapters on the Theorema Egregium, Christoffel symbols, and geodesics.

3. **Topping, J., Di Giovanni, F., Chamberlain, B. P., Dong, X., & Bronstein, M. M. (2022).** *Understanding Over-Squashing and Bottlenecks on Graphs via Curvature*. ICLR 2022. arXiv:2111.14522.

4. **Nguyen, K., Nong, H., Nguyen, V., Ho, N., Osher, S., & Nguyen, T. (2023).** *Revisiting Over-smoothing and Over-squashing Using Ollivier-Ricci Curvature*. ICML 2023, PMLR 202:25956–25979.

5. **Ollivier, Y. (2009).** *Ricci curvature of Markov chains on metric spaces*. The classical source of $$\kappa$$ on graphs; GNNs did not invent curvature.

## 🔗 Applications and connections

In machine learning, graph curvature becomes a diagnosis: a deep network may fail not for lack of layers but because of the geometry of relations. In numerical geometry, Ricci flow is a tool for evolving metrics; its discrete cousins on triangle surfaces (Gu–Yau and descendants) still parametrize brains and other medical surfaces. In robotics, a geodesic on a constraint surface is the “straight” path a planner should prefer — the same Christoffel equation, different software.

## 🧩 Exercises

**Exercise 1.** Sketch a sphere and two intersecting great circles. Describe in words why two “straight lines” converge, and relate that to over-smoothing: information mixing too quickly.

**Exercise 2.** Sketch a highly branching tree attached to the rest of a graph by a single edge. Mark that edge as a candidate for $$\kappa<0$$. Explain over-squashing without a formula.

**Exercise 3.** The Theorema Egregium says that $$K$$ is intrinsic. On a graph there is no embedding in $$\mathbb{R}^3$$. Why is defining $$\kappa$$ from graph distances alone (intrinsically) more faithful to Gauss’s spirit than embedding the graph and measuring Euclidean angles?

---

The theory of geodesics and the Theorema Egregium is unchanged. Chapter 05 will change the language to differential forms; its optional lesson meets Clifford algebra and equivariant networks.
