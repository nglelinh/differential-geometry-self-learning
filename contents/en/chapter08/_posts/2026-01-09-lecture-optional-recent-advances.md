---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Lie Groups, Robot Kinematics, and Numerical Spacetime"
chapter: "08"
order: 3
owner: "Differential Geometry"
lesson_type: optional
---

Try commanding a robotic arm to rotate its wrist by interpolating three Euler angles—roll, pitch, and yaw—and at a $$90^\circ$$ pitch two axes suddenly lock together (**gimbal lock**), sending the arm into a wild spin! Meanwhile, thousands of light-years away at the center of our galaxy, photons skim the event horizon of Sagittarius A* along curved null geodesics of a Lorentzian spacetime. Both worlds—differentiable robotics libraries like **Theseus** and the **Event Horizon Telescope's** black-hole simulations—run on the exact differential geometry of Chapter 08: **Lie groups**, **Lie algebras**, and **Lorentzian geodesics**.

## Background Knowledge Map: Lie Groups, Exponential Maps, and Lorentzian Spacetime

Three pillars link Chapter 08's abstract group-manifold theory directly to 2022–2026 robotics, chemistry, and astrophysics:

1. **Matrix Lie Groups ($$SO(3), SE(3)$$) as Configuration Spaces:** A rigid 3D rotation is a matrix $$R \in SO(3)$$ ($$R^\top R = I, \det R = 1$$); a full rigid pose (rotation plus translation) is an element $$(R, p) \in SE(3)$$. Because rigid motions do *not* commute, pose optimization must compose group elements rather than adding 6D vectors naively.
2. **Lie Algebras & the Exponential Map ($$\exp: \mathfrak{g} \to G$$):** The tangent space at the identity—$$\mathfrak{so}(3)$$ (skew-symmetric angular velocities) or $$\mathfrak{se}(3)$$ (twists/screws)—is a flat vector space where gradient updates and Gauss–Newton steps live cleanly; the exponential map $$\exp$$ wraps those infinitesimal velocities onto exact, gimbal-lock-free finite motions!
3. **Lorentzian Metrics & Null Geodesics:** Switching one sign in the metric signature to $$(-, +, +, +)$$ turns Riemannian geometry into Einstein's general relativity. In 2022 EHT pipelines, supercomputers integrate millions of null geodesics ($$g(\dot\gamma, \dot\gamma) = 0$$) through Kerr spacetime to match radio images of Sgr A*.

## Overview

A Lie group is a manifold with a smooth multiplication; its Lie algebra is the tangent space at the identity; the exponential map sends an “infinitesimal velocity” to a finite motion. Lecture 16 already opened the door to Lorentzian spacetime. This optional lesson leaves those definitions untouched, then points to two lines of work from 2022–2024: (1) machine learning and differentiable optimisation on $$SE(3)$$ and $$SO(3)$$ for robots and molecules; (2) — only as it touches the spacetime lecture — the numerics of general relativity when the Event Horizon Telescope matches images against a library of GRMHD simulations.

Equiformer (Liao & Smidt, ICLR 2023) and EquiformerV2 turn irreps of $$SE(3)$$ into transformer layers for atomistic graphs. Theseus (Pineda et al., NeurIPS 2022) is a differentiable nonlinear least-squares library on PyTorch, with Lie groups built in, used for odometry, bundle adjustment, and state estimation. Geometric Fabrics (2022), met in Chapter 01, truly lives on configuration space — usually a product of circles and copies of $$SE(3)$$. On the numerical-relativity side, the 2022 Event Horizon Telescope papers on Sagittarius A* compare data with a large suite of general-relativistic magnetohydrodynamic runs: the geodesics of Lecture 16 become photon trajectories in code.

## Intuitive explanation

A rotating robot joint is a point of $$SO(3)$$, not three naïve Euler angles (Euler angles break at the poles). Driving a screw through space is an element of $$SE(3)$$: a rotation and a translation together. The Lie algebra $$\mathfrak{so}(3)$$ holds angular velocities; the exponential map is “rotate this many radians about this axis”. Theseus lets you write a least-squares problem on those elements and then *back-propagate* through Gauss–Newton: deep learning and Lie geometry share one computational graph.

Equiformer does something else: it does not optimise *on* the group, it forces the network to *respect* the group. Rotate a molecule and the energy sits still, the force rotates along. That is Noether run backwards: symmetry does not produce a conservation law inside the model, it is *imposed* on the architecture so the model need not relearn known physics.

In numerical GR, photons travel on null geodesics of a Lorentzian metric. The 2022 EHT library will not teach you a singularity theorem; it only reminds you that the equation you have just met — a geodesic, a signature $$(-,+,+,+)$$ — is being integrated millions of times to paint a ring of light around a black hole.

![The torus as the Lie group $$S^1\times S^1$$.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Figure 1. The torus is a familiar abelian Lie group; $$SO(3)$$ is more subtle (non-abelian, not simply connected), but the idea is the same: multiply two points and you still land on the surface. Wikimedia Commons.*

### Worked Example (Step by Step): Exponentiating $$\mathfrak{so}(3) \to SO(3)$$ and Checking Non-Commutativity in $$SE(3)$$

Verify two core Lie-group calculations by hand:

**Part A — Exponential map from angular velocity to a $$90^\circ$$ rotation.** Let $$\hat{u} = \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix} \in \mathfrak{so}(3)$$ be unit angular velocity about the $$z$$-axis, and rotate by $$\theta = \pi/2$$. Notice $$\hat{u}^2 = \begin{pmatrix} -1 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & 0 \end{pmatrix}$$. Plugging $$\sin(\pi/2)=1, \cos(\pi/2)=0$$ into **Rodrigues' formula** $$\exp(\theta \hat{u}) = I + (\sin\theta)\hat{u} + (1 - \cos\theta)\hat{u}^2$$:

$$
R = \exp\!\left(\frac{\pi}{2}\hat{u}\right) = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix} + \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix} + \begin{pmatrix} -1 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & 0 \end{pmatrix} = \mathbf{\begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 1 \end{pmatrix}} \in SO(3).
$$

Check: $$R^\top R = I$$, $$\det R = 1$$, and $$R(1,0,0)^\top = (0,1,0)^\top$$ — smooth, exact, and completely free of gimbal lock!

**Part B — Why $$SE(3)$$ robot poses do not commute.** Let $$g_1 = (R,\ (0,0,0))$$ (rotate $$90^\circ$$ about $$z$$) and $$g_2 = (I,\ (1,0,0))$$ (translate $$+1$$ along $$x$$). Apply $$(R,p)\cdot(R',p') = (RR',\ p + Rp')$$ in both orders:
- $$g_1 \cdot g_2 = (R,\ 0 + R(1,0,0)^\top) = \bigl(R,\ \mathbf{(0, 1, 0)}\bigr)$$ (translate along $$x$$, then rotate → robot ends on the $$+y$$ axis!).
- $$g_2 \cdot g_1 = (R,\ (1,0,0) + I(0,0,0)) = \bigl(R,\ \mathbf{(1, 0, 0)}\bigr)$$ (rotate in place, then translate → robot ends on the $$+x$$ axis!).

Because $$g_1 g_2 \neq g_2 g_1$$, differentiable SLAM and pose-graph libraries (like Theseus) optimize updates in the tangent algebra $$\mathfrak{se}(3)$$ and apply $$g \leftarrow g \cdot \exp(\delta \xi)$$.

### Deep-Dive Explanation: From Lie Algebras to Differentiable Robotics and Black-Hole Imaging (Read Slowly)

1. **Compute updates in the flat Lie algebra, store states in the curved Lie group:** $$\mathfrak{so}(3)$$ and $$\mathfrak{se}(3)$$ are ordinary vector spaces where derivatives and Gauss–Newton linear systems work cleanly; $$\exp$$ maps each step back onto exact rigid motions.
2. **Respect non-commutativity via left/right multiplication:** as Part B proved, translation and rotation couple via $$Rp'$$; group composition tracks that coupling automatically across chains of robot joints.
3. **Impose group symmetry on neural layers (Equiformer):** instead of augmenting a dataset with thousands of random 3D rotations, Equiformer builds $$SE(3)$$ representations directly into attention weights—cutting sample complexity dramatically in molecular simulation.
4. **Integrate Lorentzian geodesics to image spacetime:** in numerical GR, the same geodesic machinery runs with signature $$(-, +, +, +)$$ to trace photon rings around supermassive black holes.

**Quick check.** In Part A, what is $$\exp(\pi \hat{u})$$ (a $$180^\circ$$ rotation about $$z$$)? With $$\sin\pi = 0$$ and $$1 - \cos\pi = 2$$, Rodrigues' formula gives $$I + 2\hat{u}^2 = \operatorname{diag}(-1, -1, 1)$$—flipping $$x$$ and $$y$$ while fixing the $$z$$-axis!

## Formal definitions and notation

**Reminder.** A Lie group $$G$$ is a smooth manifold with smooth multiplication and inversion. The Lie algebra $$\mathfrak{g}=T_eG$$ carries a Lie bracket. The exponential $$\exp:\mathfrak{g}\to G$$ sends the straight line $$t\xi$$ to a one-parameter subgroup.

For $$SE(3)$$,
$$
(R,p)\cdot(R',p') = (RR',\, p+Rp'),
$$
and a “velocity” $$(\omega,v)\in\mathfrak{se}(3)$$ both spins and slides. Robot state estimation is the search for a $$g\in SE(3)$$ minimising a sum of squared residuals, usually by a retraction on $$G$$ — the same idea as Chapter 07, now with a group structure.

## Visual illustrations

![Geodesics on the sphere — orbits of many mechanical systems on $$SO(3)$$.](https://upload.wikimedia.org/wikipedia/commons/0/0a/Sphere_geodesic.svg)
*Figure 2. $$S^3$$ double-covers $$SO(3)$$; geodesics on a sphere are the friendliest picture of “steady rotation”. Wikimedia Commons.*

[Image placeholder: “The SE(3) frame of a robot end-effector: origin p, the three axes of R, and a screw exp(tξ)”]

## 🧠 Fundamental papers and references

1. **Hall, B.** *Lie Groups, Lie Algebras, and Representations.* The algebraic foundation.

2. **Liao, Y.-L., & Smidt, T. (2023).** *Equiformer*. ICLR 2023. **Liao et al. (2023).** *EquiformerV2*. arXiv:2306.12059.

3. **Pineda, L., et al. (2022).** *Theseus: A Library for Differentiable Nonlinear Optimization*. NeurIPS 2022.

4. **Van Wyk et al. (2022).** *Geometric Fabrics*. IEEE RA-L / ICRA. Dynamics plus Finsler geometry on configuration space.

5. **Event Horizon Telescope Collaboration (2022).** *First Sagittarius A* Event Horizon Telescope Results. V.* ApJL 930, L16. doi:10.3847/2041-8213/ac6672. Numerical GR meeting observation; read as an application of Lecture 16, not as a replacement for the theory.

## 🔗 Applications and connections

Robot learning: modern visual odometry and SLAM multiply elements of $$SE(3)$$, they do not add six-vectors naïvely. Computational chemistry: EquiformerV2 on OC20 reduces DFT calls by respecting $$E(3)$$. Astrophysics: null geodesics and GRMHD turn a Lorentzian metric into a horizon-scale image. Graphics: interpolating rotations uses $$\exp$$ and $$\log$$ on $$SO(3)$$ to avoid gimbal lock — the same exponential map.

## Video tham khảo

- [What is Lie theory? Here is the big picture. \| Lie groups, algebras, brackets #3](https://www.youtube.com/watch?v=ZRca3Ggpy_g) — Mathemaniac, English. xem trước. Watch Lie groups and the exponential map first: a robot joint rotation is a point of $$SO(3)$$, not three casual Euler angles.
- [how to understand all of lie algebras with one picture](https://www.youtube.com/watch?v=tY7jac-iPA4) — Michael Penn, English. The Lie algebra as the space of infinitesimal velocities at the identity, which is what the lesson means by calling $$\mathfrak{so}(3)$$ angular velocity.
- [General Relativity & Curved Spacetime Explained! \| Space Time \| PBS Digital Studios](https://www.youtube.com/watch?v=AwhKZ3fd9JA) — PBS Space Time, English. Geodesics in curved spacetime, the other half of the lesson, where a simulated black-hole photon rides a Lorentzian metric.

## 🧩 Exercises

**Exercise 1.** Explain in words why three Euler angles are *not* a good coordinate system on all of $$SO(3)$$. Relate this to the need for several charts in an atlas (Chapter 00).

**Exercise 2.** A robot must take its end-effector from pose $$g_1$$ to pose $$g_2$$. Describe the path $$t\mapsto g_1\exp(t\xi)$$ with $$\xi=\log(g_1^{-1}g_2)$$ as a helix in the Euclidean space of the origin. Is this a geodesic of a left-invariant Riemannian metric?

**Exercise 3.** Reflect: Noether says that a symmetry yields a conservation law. Equiformer *imposes* a symmetry on a network. Where do the two directions meet when one trains a molecular force model?

---

Lie groups and spacetime geometry are not rewritten. Chapter 09 opens the applied horizon; the last optional lesson gathers vision, shape, hyperbolic learning, and numerical GR.
