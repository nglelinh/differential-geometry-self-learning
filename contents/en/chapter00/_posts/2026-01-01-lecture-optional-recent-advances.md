---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — The Manifold Hypothesis and the Geometry of Data"
chapter: "00"
order: 5
owner: "Differential Geometry"
lesson_type: optional
---

## Overview

Imagine a single high-resolution photograph of a human face—say, $$1000 \times 1000$$ pixels in color. Formally, that image is a single point living inside a **three-million-dimensional Euclidean space** $$\mathbb{R}^{3{,}000{,}000}$$. If faces actually scattered uniformly through that colossal void, no machine-learning algorithm in the history of the universe could ever gather enough samples to recognize a smile—the famous **curse of dimensionality** would swallow every model whole.

Yet modern AI recognizes faces, folds proteins, and steers robots effortlessly. Why? Because real-world data almost never fill the ambient space $$\mathbb{R}^N$$. Instead, they hug a thin, gracefully curved, low-dimensional sheet $$M$$ embedded inside $$\mathbb{R}^N$$—an idea known as the **Manifold Hypothesis**.

This optional lesson does not replace the foundations you just studied in Chapter 00. Linear algebra, multivariable calculus, topology, and differential equations remain the indispensable alphabet; what follows is a postcard from 2022–2026 showing how that "dry" alphabet has become the living language of **statistical manifold theory** (Whiteley–Gray–Rubin-Delanchy), **Geometric Deep Learning** (Bronstein–Bruna–Cohen–Veličković), and **Information Geometry** (the Fisher–Rao metric).

---

## Background Knowledge Map: Where Does Chapter 00 Meet Modern Data Science?

If you graduated in math, computer science, or engineering, you may have learned Jacobians, inner products, and probability distributions in completely separate courses. Here is how they lock together in modern geometry of data.

### 1. Smooth Manifolds & Embeddings: Sheets Inside Giant Spaces
**What is it?** A $$d$$-dimensional **manifold** $$M$$ is a space that looks locally like flat Euclidean space $$\mathbb{R}^d$$ (just as Earth looks flat in your neighborhood even though it is a curved sphere). An **embedding** $$\iota: M \to \mathbb{R}^N$$ bends and places that $$d$$-dimensional sheet inside a much larger ambient space $$\mathbb{R}^N$$ without self-intersections.

**What does it study?**
- **Intrinsic vs. extrinsic distance:** Two points on a rolled-up sheet of paper can sit millimeters apart in 3D space (**extrinsic** chord distance) yet centimeters apart if you walk along the paper (**intrinsic** geodesic distance).
- **Charts and atlases:** Stitching local flat coordinate patches together to describe a globally curved space—the exact blueprint behind manifold-learning algorithms like Isomap, UMAP, and t-SNE.

### 2. Geometric Deep Learning: The "Five Gs" of Symmetry
**What is it?** Rather than treating every dataset as a raw list of numbers, **Geometric Deep Learning** designs neural networks that respect the underlying geometric domain and its symmetries (**equivariance**).

**What does it study?**
- **Grids, Groups, Graphs, Geodesics, and Gauges:** Convolutional networks respect translation symmetry on grids; graph neural networks respect permutation symmetry on graphs; mesh/manifold networks transport features along geodesics using local gauge frames.

### 3. Information Geometry: Measuring Distance Between Probability Distributions
**What is it?** A parametric family of probability distributions $$p_\theta(x)$$ (such as all 1D Gaussians $$\mathcal{N}(\mu, \sigma^2)$$) forms a smooth **statistical manifold** whose points *are* probability distributions.

**What does it study?**
- **Fisher–Rao metric:** Measures how distinguishable two nearby probability distributions are statistically—not how far apart their parameter numbers look on paper.
- **Natural gradient:** Steepest descent measured with the Fisher–Rao ruler rather than the Euclidean ruler, making optimization invariant under reparametrization!

---

## Intuitive explanation

Picture a **Swiss roll**: a flat two-dimensional sponge cake rolled into a spiral inside three-dimensional space $$\mathbb{R}^3$$. Viewed as a raw cloud of $$(x,y,z)$$ coordinates, points on adjacent layers look close together even though they belong to completely different parts of the cake. Unroll the spiral, and the entire dataset collapses cleanly onto a flat 2D rectangle.

Between 2022 and 2025, **Nick Whiteley, Annie Gray, and Patrick Rubin-Delanchy** (*JRSS Series B*) gave the manifold hypothesis a rigorous statistical backbone: you do not need to assume nature magically places data onto a pre-built manifold. In a simple **Latent Metric Model**—random feature fields evaluated on hidden low-dimensional latent variables plus noise—high-dimensional data points *automatically concentrate* near a smooth low-dimensional manifold!

Meanwhile, **Michael Bronstein, Joan Bruna, Taco Cohen, and Petar Veličković** unified modern deep learning under the **“five Gs”**—**Grids, Groups, Graphs, Geodesics, and Gauges**—showing that successful neural architectures are discrete incarnations of the exact geometric structures you will build throughout this course.

And in **Information Geometry**, moving in parameter space $$(\mu, \sigma)$$ is subtle: shifting the mean $$\mu$$ by $$1$$ when the standard deviation is $$\sigma = 0.01$$ separates two bell curves completely, whereas shifting $$\mu$$ by $$1$$ when $$\sigma = 100$$ barely changes the distribution at all! The **Fisher–Rao metric** captures that exact distortion.

![The Swiss roll unrolled — high-dimensional data living near a two-dimensional sheet.](https://upload.wikimedia.org/wikipedia/commons/4/4a/Swissroll_manifold_unrolled.png)
*Figure 1. The Swiss roll: a 2-dimensional surface embedded in $$\mathbb{R}^3$$. The standard intuition for the manifold hypothesis. Source: Wikimedia Commons, open licence / public-domain educational figure.*

---

## Formal definitions and notation

<div class="textbook-definition" markdown="1">
**Definition (working form of the manifold hypothesis).**
Given samples $$x_1,\dots,x_n \in \mathbb{R}^N$$, we say they obey a manifold hypothesis if there exist a smooth manifold $$M$$ of dimension $$d \ll N$$, an embedding $$\iota: M \to \mathbb{R}^N$$, and small noise $$\varepsilon_i$$ such that
$$
x_i = \iota(p_i) + \varepsilon_i, \qquad p_i \in M.
$$
The integer $$d$$ is the true number of degrees of freedom; $$N$$ is only the dimension of the observational coordinates.
</div>

**Intuition.** $$M$$ is the flat sheet of paper; $$\iota$$ is how nature rolls or crumples it into a huge ambient space; $$\varepsilon_i$$ is measurement jitter.

<div class="textbook-definition" markdown="1">
**Definition (Fisher–Rao metric, a light touch).**
For a family $$p_\theta$$, $$\theta \in \Theta \subset \mathbb{R}^k$$, the Fisher information matrix
$$
g_{ij}(\theta) = \mathbb{E}_\theta\Bigl[\partial_{\theta^i}\log p_\theta \cdot \partial_{\theta^j}\log p_\theta\Bigr]
$$
defines a Riemannian metric (positive semi-definite) on parameter space. The **natural gradient** of a loss $$L(\theta)$$ is
$$
\widetilde{\nabla} L = g(\theta)^{-1} \nabla L,
$$
the Euclidean gradient raised by the statistical metric.
</div>

---

## Concrete Hand-Verifiable Worked Examples

### Worked Example 1: Extrinsic vs. Intrinsic Distance on the Swiss Roll
Parametrize a 2D Swiss roll in $$\mathbb{R}^3$$ by coordinates $$(t, h)$$ with $$t \ge 0$$:
$$
\iota(t, h) = (t\cos t,\; h,\; t\sin t).
$$
Compute the partial derivatives (the columns of the Jacobian $$J_\iota$$) by hand:
$$
\frac{\partial \iota}{\partial t} = (\cos t - t\sin t,\; 0,\; \sin t + t\cos t),
\qquad
\frac{\partial \iota}{\partial h} = (0,\; 1,\; 0).
$$
Now compute the induced metric tensor $$g = J_\iota^\top J_\iota$$ via dot products:
- $$g_{tt} = (\cos t - t\sin t)^2 + (\sin t + t\cos t)^2 = (\cos^2 t + \sin^2 t) + t^2(\sin^2 t + \cos^2 t) = 1 + t^2$$.
- $$g_{th} = 0$$, and $$g_{hh} = 1$$.

So the intrinsic metric on the Swiss roll is simply $$g(t,h) = \begin{pmatrix} 1+t^2 & 0 \\ 0 & 1 \end{pmatrix}$$!
Now compare two points on the same height $$h=0$$: $$p_1 = (0,0)$$ at $$\iota(0,0) = (0,0,0)$$ and $$p_2 = (2\pi, 0)$$ at $$\iota(2\pi, 0) = (2\pi, 0, 0)$$:
- **Euclidean (extrinsic) distance in $$\mathbb{R}^3$$:** $$\| (2\pi, 0, 0) - (0,0,0) \| = 2\pi \approx 6.28$$.
- **Geodesic (intrinsic) distance along the rolled sheet:**
  $$
  d_M(p_1, p_2) = \int_0^{2\pi} \sqrt{g_{tt}}\,dt = \int_0^{2\pi} \sqrt{1+t^2}\,dt \approx 21.26!
  $$
Raw Euclidean distance underestimates the true path along the manifold by more than a factor of **3.3**—the exact reason linear PCA fails on curved manifolds!

### Worked Example 2: Computing the Exact Fisher–Rao Metric of 1D Gaussians
Take the family of 1D normal distributions $$\theta = (\mu, \sigma)$$ with $$\sigma > 0$$:
$$
\log p_{\mu,\sigma}(x) = -\frac{1}{2}\log(2\pi) - \log\sigma - \frac{(x-\mu)^2}{2\sigma^2}.
$$
Differentiate with respect to $$\mu$$ and $$\sigma$$ by hand:
$$
\frac{\partial \log p}{\partial \mu} = \frac{x-\mu}{\sigma^2},
\qquad
\frac{\partial \log p}{\partial \sigma} = \frac{(x-\mu)^2}{\sigma^3} - \frac{1}{\sigma}.
$$
Now take expectations using $$Z = (x-\mu)/\sigma \sim \mathcal{N}(0,1)$$, where $$\mathbb{E}[Z]=0$$, $$\mathbb{E}[Z^2]=1$$, $$\mathbb{E}[Z^3]=0$$, $$\mathbb{E}[Z^4]=3$$:
- $$g_{\mu\mu} = \mathbb{E}\!\left[\frac{Z^2}{\sigma^2}\right] = \frac{1}{\sigma^2}$$.
- $$g_{\mu\sigma} = \mathbb{E}\!\left[\frac{Z}{\sigma} \cdot \frac{Z^2 - 1}{\sigma}\right] = \frac{\mathbb{E}[Z^3] - \mathbb{E}[Z]}{\sigma^2} = 0$$.
- $$g_{\sigma\sigma} = \mathbb{E}\!\left[\frac{(Z^2 - 1)^2}{\sigma^2}\right] = \frac{\mathbb{E}[Z^4] - 2\mathbb{E}[Z^2] + 1}{\sigma^2} = \frac{3 - 2 + 1}{\sigma^2} = \frac{2}{\sigma^2}$$.

Behold the result:
$$
ds^2 = \frac{d\mu^2 + 2\,d\sigma^2}{\sigma^2}!
$$
Up to a rescaling of $$\sigma$$ by $$\sqrt{2}$$, **the space of all 1D Gaussian distributions is literally the hyperbolic upper half-plane (constant negative curvature $$K = -\tfrac{1}{2}$$)!** Notice the $$1/\sigma^2$$ factor: when $$\sigma$$ is tiny, moving $$\mu$$ is geometrically *huge*, so the natural gradient $$\widetilde{\nabla}L = g^{-1}\nabla L = \bigl(\sigma^2 \partial_\mu L,\; \tfrac{1}{2}\sigma^2 \partial_\sigma L\bigr)$$ automatically scales your step size down when the bell curve is sharp and up when it is wide!

---

### Deep-Dive Explanation: Why Geometry Governs High-Dimensional Learning (Read Slowly)

How do the basic ingredients of Chapter 00—Jacobians, open neighborhoods, and inner products—turn into the modern geometry of data? Trace the four steps slowly:

#### Step 1: High-dimensional observations hide low-dimensional latent factors
When sensors record $$N$$ correlated measurements of a system governed by $$d \ll N$$ physical or semantic knobs (pose, lighting, identity), the map $$\iota: \mathbb{R}^d \to \mathbb{R}^N$$ traces out a $$d$$-dimensional manifold $$M \subset \mathbb{R}^N$$. Whiteley–Gray–Rubin-Delanchy showed that even random smooth feature maps naturally concentrate data around such manifolds.

#### Step 2: Build a discrete atlas from local neighborhoods
Since you are only given a point cloud $$\{x_i\}$$ and *not* the formula for $$\iota$$, how do you avoid being fooled by Euclidean shortcuts across layers of a Swiss roll? Keep only **very small neighborhoods** ($$k$$-nearest neighbors), where the curved manifold looks locally flat! Chaining short local hops approximates true intrinsic geodesic distances.

#### Step 3: Respect domain symmetries in your architecture (the Five Gs)
Once data live on a domain (grid, graph, group, or curved surface), raw coordinates are arbitrary. Geometric Deep Learning enforces **equivariance**: rotate a 3D molecule or relabel nodes of a graph, and the network’s internal features transform cleanly alongside the geometry rather than memorizing arbitrary coordinate axes.

#### Step 4: Replace the Euclidean ruler with an intrinsic metric (Fisher–Rao)
Just as you cannot subtract tangent vectors at two different points on a sphere without parallel transport, you cannot treat parameter coordinates $$(\mu, \sigma)$$ as flat Euclidean space. Raising the gradient with $$g(\theta)^{-1}$$ converts coordinate-dependent optimization into genuine **intrinsic geometry** on the manifold of models.

In one schematic line:

$$
\text{Raw point cloud in }\mathbb{R}^N
\;\xrightarrow{\;\text{local charts / }k\text{-NN}\;}\;
\text{Latent manifold }M^d
\;\xrightarrow{\;\text{metric }g\text{ \& symmetries}\;}\;
\text{Intrinsic learning \& natural gradient}.
$$

---

## Visual illustrations

![Stereographic projection: a chart from the sphere onto the plane.](https://upload.wikimedia.org/wikipedia/commons/8/88/Stereographic_projection_in_3D.svg)
*Figure 2. A circle covered by overlapping coordinate domains — the chart/atlas idea from the topology lesson. Wikimedia Commons, open licence. If the image fails to load, imagine two open arcs covering the circle and overlapping at the ends.*

[Image placeholder: “Diagram of a Latent Metric Model: latent variables → random fields → high-dimensional points concentrated near a manifold”]

## 🧠 Fundamental papers and references

1. **do Carmo, M. P.** *Differential Geometry of Curves and Surfaces*. The theoretical backbone of the course, left untouched.

2. **Bronstein, M. M., Bruna, J., Cohen, T., & Veličković, P. (2021).** *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*. arXiv:2104.13478. The design map that most 2022–2026 work still follows.

3. **Whiteley, N., Gray, A., & Rubin-Delanchy, P. (2022–2025).** *Statistical exploration of the Manifold Hypothesis*. arXiv:2208.11665; journal version in JRSS Series B. A statistical account of why data “arrange themselves” into manifolds.

4. **Amari, S.-I.** *Information Geometry and Its Applications*. The classical source; read the Fisher–Rao pages lightly to see multivariable calculus living inside statistics.

5. **Lee, J. M.** *Introduction to Smooth Manifolds*. Return here whenever machine-learning papers use the word “manifold” a little too loosely.

## 🔗 Applications and connections

In machine learning the manifold hypothesis is why a network can learn from finitely many samples in a gigantic image space: the data do not fill $$\mathbb{R}^N$$, they lie on a thin sheet. In data science, UMAP, t-SNE, and their graph-neighbourhood cousins are ways of drawing a local map of $$M$$. In statistical physics and optimisation, the natural gradient appears whenever a Euclidean ruler on parameters would distort the geometry of the model.

A concrete example: while training a probabilistic model, two directions in parameter space may look equally long on paper, yet one barely changes the distribution and the other changes it violently. The Fisher metric detects that injustice, just as the Jacobian in multivariable calculus detects a change of variables that warps area.

## Video tham khảo

- [StatQuest: t-SNE, Clearly Explained](https://www.youtube.com/watch?v=NEaUSP4YerM) — StatQuest with Josh Starmer, English. xem trước. A high-dimensional cloud redrawn so that neighbors stay neighbors, the same Swiss-roll intuition as the manifold hypothesis.
- [3DGV Seminar: Michael Bronstein -- Geometric Deep Learning for 3D Shape Analysis and Synthesis](https://www.youtube.com/watch?v=2Z4L2I59AKo) — 3DGV Seminar, English. Michael Bronstein presents geometric deep learning as network design on grids, groups, graphs, and surfaces — the map of G’s cited in the lesson.
- [Lecture 1: Overview (Discrete Differential Geometry)](https://www.youtube.com/watch?v=8JCR6z3GLVI) — Keenan Crane, English. A reminder of what a surface looks like before the lesson treats the manifold hypothesis as a statistical claim about data.

## 🧩 Exercises

**Exercise 1.** Sketch a Swiss roll and mark two points that are close along the paper but far apart in $$\mathbb{R}^3$$. Explain why Euclidean distance on the raw data can mislead a clustering algorithm.

**Exercise 2.** Take the one-dimensional Gaussian family $$p_{\mu}(x)=(2\pi)^{-1/2}\exp(-(x-\mu)^2/2)$$. Without computing every term, say which ingredients of the Fisher formula appear, and explain in words why the metric on the line $$\mu\in\mathbb{R}$$ need not be ordinary $$d\mu^2$$ once variance is allowed to change as well.

**Exercise 3.** Re-read open sets and charts from the topology lesson. What is a $$k$$-nearest-neighbour algorithm on a point cloud trying to build — a rough atlas, a rough metric, or merely a graph?

**Exercise 4.** Reflect: if the manifold hypothesis fails (the data fill a solid block), where do geometric dimension-reduction methods break? Describe the failure with a picture rather than a formula.

---

The theory of Chapter 00 is unchanged. When you are ready, move on to smooth curves — and, if you wish, to that chapter’s optional lesson, where the Frenet frame is alive in robot control.
