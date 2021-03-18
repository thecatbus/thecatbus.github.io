---
title: Evil irreducibility 
author: Parth
tags: algebra
---
Watch out for analytical tricks to deduce irreducibility of a polynomial: 

Suppose $a_1,...,a_n$ are integers and $p$ is a prime such that $\sum_{i=1}^n|a_i|< p$. Then the polynomial $a_nX^n+...+ a_1X+p$ is irreducible over $\mathbb{Z}$: if not, the polynomial can be written as $f\cdot g$ for non-constant polynomials $f,g$. Then $f(0)\cdot g(0)= p$, so wlog $f(0)=\pm 1$. This implies the product of the (complex) roots of $f$ is $1$, in particular there is a root $\alpha$ with $|\alpha|\leq 1$. But then $|p| = |a_n\alpha^n+...+a_1\alpha|\leq \sum_{i=1}^n |\alpha_i|$, a contradiction.
<!--more-->
