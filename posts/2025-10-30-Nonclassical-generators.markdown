---
title: Small spanning objects
author: Parth
date: 30 October 2025
tags: geometry, algebra
---

<div class="teaser">
An object $G$ in a triangulated category $\mathscr{T}$ is a _classical generator_ if it is not contained in a proper triangulated subcategory of $\mathscr{T}$. It is a _generator_ if $\{G\}$ is a spanning class, i.e. $\text{Hom}^\bullet(G,x) = 0$ if and only if $x=0$. Every classical generator spans; I discuss two geometric counterexamples to the converse --- based on Dmitrii Pirozhkov's [exposition](https://arxiv.org/pdf/2510.25558) which attributes them to de Jong.
</div>
<!--more-->

The counterexamples are geometric, we fix the triangulated category $\mathbf{D}^\text{b}\text{Coh}(X)$ associated to a smooth variety $X$. Why might a generator in $\mathbf{D}^\text{b} \text{Coh} (X)$ not be a classical generator? In other words, what can allow a classical non-generator to have trivial orthogonal-complement?

_Support_ is one good reason; the set of all skyscrapers on $X$ spans but certainly doesn't classically generate the derived category. Concretely we may take a regular local Noetherian ring $R$ with the maximal ideal $\mathfrak{m}$, and set $X=\text{Spec}(R)$: the simple module $R/\mathfrak{m}$ is a generator of $\mathscr{T}$ by Nakayama’s lemma, but the subcategory $\langle R/\mathfrak{m}\rangle\subset\mathscr{T}$ consists only of objects supported at $\mathfrak{m} \in\text{Spec}(R)$ and does not include, for example, $R$ itself.

The Reimann--Roch theorem is another good reason. Let $X$ be a smooth projective curve of genus $g\geq 2$, with two rationally inequivalent points $p,q\in X$, and consider the line bundle $L=\mathscr{O}_X(2p-q)$ which has degree $1$ and satisfies $\text{Hom}(\mathscr{O}_X,L)=\text{Hom}(L,\mathscr{O}_X)=0$. Now $V=\mathscr{O}_X\oplus L$ certainly doesn't classically generate $\mathbf{D}^\text{b}\text{Coh} (X)$ (since otherwise the heart $\text{Coh} X$, which would contain a generating semibrick, would be Artinian). But $V$ does _span_ the category: otherwise there is a complex $W\neq 0$ such that $\text{Hom}^\bullet(V,W)=0$. Since $W$ <a href="./2023-06-07-CohP1.markdown">splits into its cohomologies</a>, we may assume $W$ is a coherent sheaf. Further $W$ splits into its torsion and torsion-free parts, and $V$ clearly has a morphism to every torsion sheaf so we may assume $W$ is locally free. In other words, we have bundles $W$ and $W'=W(q-2p)$ satisfying $\text{h}^0(W)=\text{h}^1(W)=0$, $\text{h}^0(W')=\text{h}^1(W')=0$.

But by the Hirzebruch--Riemann--Roch theorem, we see that $0=\chi(W)=(1-g)\text{rk}W- \text{deg} W$ and $0=\chi(W')=(1-g)\text{rk}W'- \text{deg} W'$, which cannot both simultaneously hold since $\text{rk}W'=\text{rk}W$ but $\text{deg} W'= \text{deg} W-1$.
