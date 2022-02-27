---
title: Quasicoherent Sheaves
author: Parth
date: 8 December 2021
tags: geometry
---

<div class="teaser"> 
[UNDER CONSTRUCTION] Having seen vector bundles and their geometric value, we want to use them to study structures more complicated than a topological space-- but building smooth manifolds and schemes (whatever they are) is expensive, these demand a lot more data than a topology. Here we make two observations-- firstly, almost all the utility of vector bundles comes from studying sections. Secondly, euclidean spaces (and their reasonable equivalents) come canonically pre-equipped with most geometric structures you would want to put on them. By their very construction, sections of vector bundles are maps that _locally_ look like functions to euclidean space, with interesting structure coming from twisted gluings. This gives an alternate construction to vector bundles, where packaging the data of sections by giving a total space, we use a more elaborate tool.
</div>
<!--more-->

# Repackaging

We start with a real vector bundle $E\xrightarrow{p}B$ of rank $n$. Call an open set $U\subset B$ _trivialising_ if the restriction $E|_U$ is isomorphic to a trivial bundle. Write $\mathcal{S}(U)$ for the space of partial sections on $U$, i.e.\ maps $U\xrightarrow{s}B$ such that $p\circ s = \text{id}_U$. Since $U$ was trivialising, this is just the abelian group of $\mathbb{R}^n$-valued functions on $U$. Now if $U,V$ are two trivialising open sets, then so is $U\cap V$, and from any $f\in \mathcal{S}(U)$ you can obtain a $f|_{U\cap V}\in \mathcal{S}(U\cap V)$, giving group homomorphisms $$\mathcal{S}(U)\rightarrow \mathcal{S}(U\cap V) \leftarrow \mathcal{S}(V).$$
It isn't hard to see that these two morphisms capture precisely the data of a transition function $g_{UV}$ for the trivialising cover of all trivialising sets.

