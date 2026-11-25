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

In 1827, Carl Friedrich Gauss proved a result so astonishing that he christened it the **Theorema Egregium**—the "Remarkable Theorem": an intelligent ant living strictly inside a curved surface, unable to see the third dimension at all, can still determine the surface’s **Gaussian curvature $$K$$** purely by measuring distances and angles along the surface!

Two centuries later, deep-learning researchers studying **Graph Neural Networks (GNNs)** ran into a baffling mystery: why do GNNs fail catastrophically when trying to pass information between distant nodes in a molecular graph or social network, even when you stack dozens of layers?

In 2022–2023, two landmark papers (**Topping, Di Giovanni, Chamberlain, Dong, and Bronstein**, *ICLR 2022*; and **Nguyen, Nong, Nguyen, Ho, Osher, and Nguyen**, *ICML 2023*) revealed that the culprit was **pure intrinsic curvature**! Edges with strongly **negative discrete Ricci curvature** act as geometric bottlenecks where exponentially many messages get crushed together (**over-squashing**), while regions of strongly **positive curvature** blend every node’s features into an indistinguishable soup (**over-smoothing**). Their cure? Borrow **Hamilton and Perelman’s Ricci flow** to rewire the graph!

This optional lesson bridges Gauss’s smooth intrinsic geometry (geodesics, parallel transport, and curvature) with hand-verifiable calculations of **Ollivier–Ricci curvature** on concrete graphs.

---

## Key ideas: From Intrinsic Surface Curvature to Graph Bottlenecks

How can a discrete network of dots and edges—with no coordinates in $$\mathbb{R}^3$$ at all—possess "curvature" and "Ricci flow"? Three concepts make the bridge exact.

### 1. Intrinsic Geometry: Geodesics, Parallel Transport & Holonomy
**What is it?** Quantities that depend *only* on the metric $$g$$ (distances inside the space), never on how the space sits in $$\mathbb{R}^3$$.

**What does it study?**
- **Geodesics:** Locally shortest ("straightest") paths, obeying $$\ddot u^k + \Gamma^k_{ij}\dot u^i \dot u^j = 0$$.
- **Geodesic deviation:** Start two parallel geodesics side by side: if $$K > 0$$ (sphere), they converge; if $$K = 0$$ (plane), they stay parallel; if $$K < 0$$ (saddle/hyperbolic), they diverge exponentially!
- **Parallel transport & holonomy:** Sliding a tangent vector around a closed loop without twisting it locally causes it to return rotated by an angle equal to the enclosed curvature!

### 2. Optimal Transport & Ollivier–Ricci Curvature on Graphs
**What is it?** On a smooth manifold with positive Ricci curvature, two small spheres centered at nearby points $$x, y$$ are *closer* in **Wasserstein (earth-mover) distance** than their centers $$d(x,y)$$; in negative curvature, they are *farther* apart. Yann Ollivier (2009) turned that exact property into an intrinsic curvature $$\kappa(i,j)$$ for any edge $$i \sim j$$ of a graph!

**What does it study?**
- **Positive edge curvature ($$\kappa > 0$$):** Dense clusters full of triangles/4-cycles (like a clique)—neighbor balls overlap heavily.
- **Negative edge curvature ($$\kappa < 0$$):** Tree-like bridges connecting two separate communities—neighbor balls sit far apart!

### 3. Discrete Ricci Flow & Graph Rewiring (SDRF / BORF)
**What is it?** Smooth **Ricci flow** ($$\frac{d}{dt}g_{ij} = -2\mathrm{Ric}_{ij}$$) shrinks positively curved bulges and expands negatively curved necks.

**What does it study?**
- **Graph rewiring (2022–2023):** Adding shortcut edges across negatively curved bottlenecks (curing **over-squashing**) and pruning redundant edges inside overly positive cliques (curing **over-smoothing**).

---

## Intuitive explanation

Be the ant on an orange once more. Launch two geodesics side by side: on the orange ($$K > 0$$), they curve together and meet—information spreads and mixes almost instantaneously. On a hyperbolic saddle ($$K < 0$$), they flare apart exponentially—each step opens up an exponentially growing number of neighbors!

Now step onto a graph. Imagine two huge tree-like families connected by a single narrow bridge edge $$(u,v)$$. When a GNN tries to pass messages from one family to the other, exponentially many nodes must cram their signals through that single bridge—creating an information traffic jam called **over-squashing**. Conversely, inside a tightly packed clique ($$\kappa > 0$$), messages bounce around so fast that every node’s hidden state averages out to the exact same vector (**over-smoothing**). **Discrete Ricci flow** diagnoses both diseases directly from the graph’s intrinsic metric and surgically rewires the edges!

![Geodesics on the sphere are great circles.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Figure 1. The non-constant maximal geodesics of the round sphere are the great circles. Author: Mathwriter2718, Wikimedia Commons, 2024, open licence.*

---

## Formal definitions and notation

**Reminder (smooth intrinsic geometry).** Gaussian curvature $$K$$ is a local isometric invariant (**Theorema Egregium**). Geodesics obey the Christoffel equation
$$
\frac{d^2 u^k}{dt^2} + \Gamma^k_{ij}\frac{du^i}{dt}\frac{du^j}{dt} = 0.
$$

**Ollivier–Ricci curvature on a graph.** For adjacent vertices $$i\sim j$$ (with graph distance $$d(i,j)=1$$), let $$\mu_i, \mu_j$$ be uniform probability distributions on the neighbors of $$i$$ and $$j$$, and let $$W_1(\mu_i, \mu_j)$$ be the **1-Wasserstein (optimal transport) distance**—the minimum total cost (mass $$\times$$ graph distance) to move the probability pile $$\mu_i$$ onto $$\mu_j$$. Then:
$$
\kappa(i,j) = 1 - \frac{W_1(\mu_i, \mu_j)}{d(i,j)} = 1 - W_1(\mu_i, \mu_j).
$$
Topping et al. (2022) also introduced **Balanced Forman curvature**, a fast combinatorial lower bound on $$\kappa(i,j)$$ built directly from triangles and 4-cycles, sufficient to prove mathematically that negatively curved edges cause exponential over-squashing.

---

## Concrete Hand-Verifiable Worked Examples

### Worked Example 1: Parallel Transport Holonomy on the Unit Sphere $$S^2$$
Stand at the North Pole $$N = (0,0,1)$$ holding an arrow pointing south along the prime meridian toward $$A = (1,0,0)$$. Now walk along the three great-circle edges of the octant triangle $$N \to A \to B \to N$$ (where $$B = (0,1,0)$$), sliding the arrow strictly **parallel** to itself (keeping a constant angle with each geodesic):
1. **Leg 1 ($$N \to A$$):** The arrow points straight forward along the meridian, arriving at $$A$$ pointing due south ($$(0,0,-1)$$).
2. **Leg 2 ($$A \to B$$ along the Equator):** The arrow is perpendicular to the Equator (pointing south). Keeping it perpendicular all the way to $$B$$, it arrives at $$B$$ still pointing due south ($$(0,0,-1)$$).
3. **Leg 3 ($$B \to N$$ up the $$90^\circ$$ meridian):** Along this meridian, due south is straight *backward*! Sliding it straight backward back to $$N$$, it arrives pointing along the $$90^\circ$$ meridian—rotated by **$$90^\circ = \frac{\pi}{2}$$** from its starting direction!

Now check Gauss–Bonnet by hand: the unit sphere has constant Gaussian curvature $$K = 1$$, and the octant covers $$\frac{1}{8}$$ of the sphere’s area $$4\pi$$, so
$$
\text{Holonomy angle} = \iint_{\triangle NAB} K\,dA = 1 \cdot \frac{4\pi}{8} = \frac{\pi}{2}!
$$
The ant measures $$K = 1$$ without ever leaving the surface!

### Worked Example 2: Computing Ollivier–Ricci Curvature $$\kappa(i,j)$$ by Hand on Two Graphs
Now compute exact discrete curvature $$\kappa(i,j) = 1 - W_1(\mu_i, \mu_j)$$ on two tiny graphs!

1. **A triangle (complete graph $$K_3$$ with vertices $$1, 2, 3$$):**
   Look at edge $$(1,2)$$. Vertex $$1$$ has two neighbors $$\{2, 3\}$$, so $$\mu_1$$ puts mass $$\frac{1}{2}$$ at $$2$$ and $$\frac{1}{2}$$ at $$3$$. Vertex $$2$$ has two neighbors $$\{1, 3\}$$, so $$\mu_2$$ puts mass $$\frac{1}{2}$$ at $$1$$ and $$\frac{1}{2}$$ at $$3$$.
   - How cheaply can you transport $$\mu_1$$ onto $$\mu_2$$? The mass $$\frac{1}{2}$$ at vertex $$3$$ is **already in place** (cost $$0$$)! You only move the mass $$\frac{1}{2}$$ from vertex $$2$$ to vertex $$1$$ across distance $$1$$:
     $$
     W_1(\mu_1, \mu_2) = \frac{1}{2}\cdot 0 + \frac{1}{2}\cdot 1 = \frac{1}{2}
     \;\Longrightarrow\;
     \kappa(1,2) = 1 - \frac{1}{2} = +\frac{1}{2} > 0!
     $$
   **Positive curvature!** Triangles pull neighbor balls tightly together.

2. **A narrow bridge edge $$(u,v)$$ connecting two 3-stars (a tree):**
   Suppose $$u$$ connects to $$v$$ plus two leaves $$a_1, a_2$$ (degree $$3$$), and $$v$$ connects to $$u$$ plus two leaves $$b_1, b_2$$ (degree $$3$$).
   - $$\mu_u$$ puts mass $$\frac{1}{3}$$ each on $$\{v, a_1, a_2\}$$.
   - $$\mu_v$$ puts mass $$\frac{1}{3}$$ each on $$\{u, b_1, b_2\}$$.
   - To transport $$\mu_u$$ onto $$\mu_v$$: move mass $$\frac{1}{3}$$ from $$v$$ to $$u$$ (distance $$1$$), and move the remaining $$\frac{2}{3}$$ mass from $$\{a_1, a_2\}$$ all the way across **3 edges** ($$a_k \to u \to v \to b_k$$) to $$\{b_1, b_2\}$$:
     $$
     W_1(\mu_u, \mu_v) = \frac{1}{3}(1) + \frac{2}{3}(3) = \frac{7}{3}
     \;\Longrightarrow\;
     \kappa(u,v) = 1 - \frac{7}{3} = -\frac{4}{3} < 0!
     $$
   **Strongly negative curvature!** Watch what happens if discrete Ricci flow adds just **one shortcut edge** between $$a_1$$ and $$b_1$$: the distance from $$a_1$$ to $$b_1$$ drops from $$3$$ straight down to $$1$$, cutting $$W_1$$ from $$\frac{7}{3}$$ to $$\frac{5}{3}$$ and raising $$\kappa(u,v)$$ from $$-\frac{4}{3}$$ up to $$-\frac{2}{3}$$—immediately relieving the bottleneck!

---

### Explanation: How Graph Curvature Diagnoses and Cures GNN Bottlenecks

Why did Gauss’s 1827 intrinsic curvature become one of the hottest diagnostic tools in 2022–2026 graph machine learning? Follow the four steps slowly:

#### Step 1: Message passing on a graph is discrete diffusion
In a Graph Neural Network, every layer updates each node’s feature vector by aggregating messages from its immediate neighbors. To let node $$a$$ influence a distant node $$b$$ at distance $$L$$, you need at least $$L$$ layers—meaning node $$b$$ receives signals from its entire $$L$$-hop neighborhood ball!

#### Step 2: Negative curvature forces exponential neighborhood growth (over-squashing)
Just as volume grows exponentially in negatively curved hyperbolic space, a tree-like graph with negative Ollivier–Ricci / Balanced Forman curvature has exponentially many nodes crammed behind a single bridge edge $$(u,v)$$. Topping et al. (*ICLR 2022*) proved rigorously that the Jacobian sensitivity $$\left\|\frac{\partial h_b^{(L)}}{\partial x_a}\right\|$$ decays exponentially across negatively curved bottlenecks!

#### Step 3: Positive curvature forces rapid mixing (over-smoothing)
Inside positively curved cliques ($$\kappa > 0$$), neighbor balls overlap heavily, so repeated averaging collapses distinct node features onto the same constant vector. Nguyen et al. (*ICML 2023*) unified both failure modes on a single curvature axis: **$$\kappa \ll 0 \implies$$ over-squashing**, **$$\kappa \gg 0 \implies$$ over-smoothing**.

#### Step 4: Run Discrete Ricci Flow (SDRF / BORF) before training
Mimicking Hamilton’s PDE $$\frac{d}{dt}g = -2\mathrm{Ric}$$, **Stochastic Discrete Ricci Flow (SDRF)** and **Batch Ollivier–Ricci Flow (BORF)** iteratively add triangles/4-cycle shortcuts across the most negatively curved edges and prune redundant edges inside the most positively curved clusters—flattening the graph’s intrinsic geometry so information flows cleanly!

In one schematic line:

$$
\text{Graph distance }d(i,j)
\;\xrightarrow{\;\text{Wasserstein }W_1\;}\;
\text{Ollivier–Ricci }\kappa(i,j)
\;\xrightarrow{\;\text{SDRF / BORF rewiring}\;}\;
\text{Balanced curvature (no over-squashing or over-smoothing)}.
$$

---

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

## Video tham khảo

- [Lecture 8: Curvature & Oversquashing in GNNs - Francesco Di Giovanni](https://www.youtube.com/watch?v=pJyFg9NF7LQ) — Michael Bronstein, English. xem trước. This is the lesson’s own topic: negative graph curvature creates over-squashing bottlenecks, and a discrete Ricci flow is proposed to loosen them.
- [Tensor Calculus 22: Riemann Curvature Tensor Geometric Meaning (Holonomy + Geodesic Deviation)](https://www.youtube.com/watch?v=-Il2FrmJtcQ) — eigenchris, English. Smooth curvature seen through holonomy and geodesic deviation, so the graph-theoretic Ollivier–Ricci curvature has a classical object to imitate.
- [Lecture 20: Geodesics (Discrete Differential Geometry)](https://www.youtube.com/watch?v=uojNGbVtlsQ) — Keenan Crane, English. Geodesics are the straight paths of someone who lives on the surface; the lesson uses that picture for intrinsic graph distance.

## 🧩 Exercises

**Exercise 1.** Sketch a sphere and two intersecting great circles. Describe in words why two “straight lines” converge, and relate that to over-smoothing: information mixing too quickly.

**Exercise 2.** Sketch a highly branching tree attached to the rest of a graph by a single edge. Mark that edge as a candidate for $$\kappa<0$$. Explain over-squashing without a formula.

**Exercise 3.** The Theorema Egregium says that $$K$$ is intrinsic. On a graph there is no embedding in $$\mathbb{R}^3$$. Why is defining $$\kappa$$ from graph distances alone (intrinsically) more faithful to Gauss’s spirit than embedding the graph and measuring Euclidean angles?

---

The theory of geodesics and the Theorema Egregium is unchanged. Chapter 05 will change the language to differential forms; its optional lesson meets Clifford algebra and equivariant networks.
