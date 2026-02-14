---
title: Categories of matrices
author: Parth
date: 11 February 2026
tags: algebra 
---

<div class="teaser">
A first class on category theory typically introduces this rather silly category whose objects are natural numbers, and morphisms $p\to q$ are $q\times p$ matrices -- this is perhaps to drive home the point that anything and everything under the sun can be a category -- and then proceeds to show that it is equivalent to the category of vector spaces (an "honest" category by anyone's definition). Continuing this rather silly exercise, we will examine a category whose objects are all finite matrices, and then proceed to take off its guise.
</div>
<!--more-->

Take a category $\mathcal{C}$ whose objects are all (finite) matrices over a field $\bbk$, with morphisms $M\to N$ given by pairs of matrices $(F_1,F_2)$ such that $MF_1=F_2N$. Note the shapes of $F_1$ and $F_2$ are determined by this relation, so the morphism-sets are $\bbk$-vector spaces in the obvious way. 

Turns out the category $\mathcal{C}$ is Abelian! A morphism $(F_1,F_2)$ is injective if and only if both $F_1$ and $F_2$ have no nullity; it is surjective if both have full rank. 

We describe the category in two equivalent but more familiar forms -- first, our category is evidently equivalent to $\Rep(\bullet\to\bullet)$, i.e. the category of functors $[\bullet\to\bullet]\longrightarrow \bbk\lmod$. To spell this out, the objects of this category are diagrams of vector spaces $[V_1\xrightarrow{m} V_2]$, with morphisms $[V_1\xrightarrow{m}V_2]\longrightarrow [W_1\xrightarrow{n}V_2]$ given by commuting squares. There is a fully faithful functor $\mathcal{C}\longrightarrow \Rep(\bullet\to \bullet)$ sending an $p\times q$ matrix $M$ to the corresponding linear map $\bbk^q\to \bbk^p$, this functor is essentially surjective since every finite dimensional vector space has a basis.

Now given $[V_1\xrightarrow{m}V_2]\in\Rep(\bullet\to\bullet)$, consider the right $A=\left(\begin{smallmatrix}\bbk&0\\\bbk&\bbk\end{smallmatrix}\right)$-module with underlying vector space $V_1\oplus V_2$, and $A$-action 
$$(v_1\oplus v_2)\cdot \left(\begin{smallmatrix}\lambda&0\\\xi&\mu\end{smallmatrix}\right)=(\lambda \cdot v_1+\xi\cdot mv_2 )\oplus(\mu \cdot v_2).$$
Conversely any finitely generated $A$-module $V$ has underlying vector space $V\left(\begin{smallmatrix}1&0\\0&0\end{smallmatrix}\right) \oplus V\left(\begin{smallmatrix}0&0\\0&1\end{smallmatrix}\right)$, and the data of the linear map $$(-)\cdot\left(\begin{smallmatrix}0&0\\1&0\end{smallmatrix}\right)\colon V\left(\begin{smallmatrix}0&0\\0&1\end{smallmatrix}\right)\to V\left(\begin{smallmatrix}1&0\\0&0\end{smallmatrix}\right)$$ determines $V$ completely as an $A$-module. Thus in fact $\mathcal{C}\simeq \Rep(\bullet\to\bullet)$ is equivalent to the $\bbk$-linear Abelian category of finitely generated right $A$-modules.

Generalising the above, the category of right modules over $K_n=\left(\begin{smallmatrix}\bbk^{\phantom{n}}&0\\\bbk^n&\bbk\end{smallmatrix}\right)$ is equivalent to the category of representations of the $n$-Kronecker quiver, i.e. the category of $n$-tuples of equi-shape matrices $(M_1,...,M_n)$ where morphisms $(M_1,...,M_n)\to (N_1,...,N_n)$ are given by pairs of matrices $(F_1,F_2)$ such that $M_iF_1=F_2N_i$ for all $i$.
