---
layout: post
lang: en
title: "Optional: Recent Advances (2022–2026) — Lie Groups, Robot Kinematics, and Numerical Spacetime"
chapter: "08"
order: 3
owner: "Differential Geometry"
lesson_type: optional
---

## Overview

A Lie group is a manifold with a smooth multiplication; its Lie algebra is the tangent space at the identity; the exponential map sends an “infinitesimal velocity” to a finite motion. Lecture 16 already opened the door to Lorentzian spacetime. This optional lesson leaves those definitions untouched, then points to two lines of work from 2022–2024: (1) machine learning and differentiable optimisation on $$SE(3)$$ and $$SO(3)$$ for robots and molecules; (2) — only as it touches the spacetime lecture — the numerics of general relativity when the Event Horizon Telescope matches images against a library of GRMHD simulations.

Equiformer (Liao & Smidt, ICLR 2023) and EquiformerV2 turn irreps of $$SE(3)$$ into transformer layers for atomistic graphs. Theseus (Pineda et al., NeurIPS 2022) is a differentiable nonlinear least-squares library on PyTorch, with Lie groups built in, used for odometry, bundle adjustment, and state estimation. Geometric Fabrics (2022), met in Chapter 01, truly lives on configuration space — usually a product of circles and copies of $$SE(3)$$. On the numerical-relativity side, the 2022 Event Horizon Telescope papers on Sagittarius A* compare data with a large suite of general-relativistic magnetohydrodynamic runs: the geodesics of Lecture 16 become photon trajectories in code.

## Intuitive explanation

A rotating robot joint is a point of $$SO(3)$$, not three naïve Euler angles (Euler angles break at the poles). Driving a screw through space is an element of $$SE(3)$$: a rotation and a translation together. The Lie algebra $$\mathfrak{so}(3)$$ holds angular velocities; the exponential map is “rotate this many radians about this axis”. Theseus lets you write a least-squares problem on those elements and then *back-propagate* through Gauss–Newton: deep learning and Lie geometry share one computational graph.

Equiformer does something else: it does not optimise *on* the group, it forces the network to *respect* the group. Rotate a molecule and the energy sits still, the force rotates along. That is Noether run backwards: symmetry does not produce a conservation law inside the model, it is *imposed* on the architecture so the model need not relearn known physics.

In numerical GR, photons travel on null geodesics of a Lorentzian metric. The 2022 EHT library will not teach you a singularity theorem; it only reminds you that the equation you have just met — a geodesic, a signature $$(-,+,+,+)$$ — is being integrated millions of times to paint a ring of light around a black hole.

![The torus as the Lie group $$S^1\times S^1$$.](https://upload.wikimedia.org/wikipedia/commons/1/17/Torus.png)
*Figure 1. The torus is a familiar abelian Lie group; $$SO(3)$$ is more subtle (non-abelian, not simply connected), but the idea is the same: multiply two points and you still land on the surface. Wikimedia Commons.*

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

## 🧩 Exercises

**Exercise 1.** Explain in words why three Euler angles are *not* a good coordinate system on all of $$SO(3)$$. Relate this to the need for several charts in an atlas (Chapter 00).

**Exercise 2.** A robot must take its end-effector from pose $$g_1$$ to pose $$g_2$$. Describe the path $$t\mapsto g_1\exp(t\xi)$$ with $$\xi=\log(g_1^{-1}g_2)$$ as a helix in the Euclidean space of the origin. Is this a geodesic of a left-invariant Riemannian metric?

**Exercise 3.** Reflect: Noether says that a symmetry yields a conservation law. Equiformer *imposes* a symmetry on a network. Where do the two directions meet when one trains a molecular force model?

---

Lie groups and spacetime geometry are not rewritten. Chapter 09 opens the applied horizon; the last optional lesson gathers vision, shape, hyperbolic learning, and numerical GR.
