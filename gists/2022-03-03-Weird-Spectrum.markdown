---
title: Connected Tripleton?
author: Parth
tags: algebraic geometry
---

We know that the affine spectrum of a local ring is a _connected doubleton_,
i.e. topologically it is the set $\{p,q\}$ with open sets $\{\emptyset, \{p\},
\{p,q\}\}$. Now consider the topological space with underlying set $\{p,q,r\}$ 
with open sets $\{\emptyset, \{p\}, \{p,q\}, \{p,q,r\}\}$. Is there a way to 
realise this as an affine scheme? 

If we think about $\mathbb{C}[X,Y]_{(X,Y)}$, this has the right number of primes at heights $0$ and $2$ but way too many at height $1$, so we need to remove those. However, we can't do this with the usual operations of localization and quotients-- something more exotic is needed. The trick is to consider the subring $$R:=\{f(X,Y)\in \mathbb{C}[X,Y^\pm]\;|\; f(0,Y)\in \mathbb{C}[X,Y]\}$$ of $\mathbb{C}[X,Y^\pm].$ In other words, we allow inverting $Y$ but only if it appears with an $X$. 

The ideal $\mathfrak{m}=(X,Y)\subset R$ is maximal, and $0$ is prime. Suppose we
have $0\subsetneq \mathfrak{p}\subsetneq \mathfrak{m}$ for some prime ideal
$\mathfrak{p}$, then it must have terms with no positive power of $Y$ (by
multiplying with $XY^{-n}$ for $n$ sufficiently large). Choose $f\in
\mathfrak{p}$ such that $f\in \mathbb{C}[X,Y^{-1}]$ and $\text{deg}_Xf$ is
minimal among these. Since $f\in (X,Y)\cap \mathbb{C}[X,Y^{-1}]$, we must have $f=X\cdot g$ for some $g\in \mathbb{C}[X,Y^{-1}]$. But then $\text{deg}_Xg<\text{deg}_Xf$ hence $g\notin \mathfrak{p}$, so $X\in \mathfrak{p}$ i.e. $\mathfrak{p}=(X)$. Thus the localisation $R_\mathfrak{m}$ has the required spectrum, with exactly one prime at heights $0$,$1$ and $2$ each.

There is a way to state and extend this example using valuation rings, on totally ordered groups other than $\mathbb{Z}$-- see [Hahn series rings](https://en.wikipedia.org/wiki/Hahn_series). The moral to me is that there are more exotic rings than I know of! 
<!--more-->
