---
title: Measure Pigeonhole
author: Parth
tags: analysis
---
Let $(E,\mathscr{E}, \mu)$ be a measure space. If $A,B\in \mathscr{E}$ are such
that $\mu(A)+\mu(B)> \mu(E)$ then $A\cap B \neq \emptyset$. This is essentially
a measure-theoretic consequence of De-Morgan's theorem (which for two sets $A$
and $B$ says $|A\cap B| = |A| + |B| - |A\cup B|$.) 

This has a neat application. Suppose $A\subset [0,1]$ is measurable with
$\mu(A)= \frac{1+\alpha}{2}$. Then for any $\alpha'<\alpha$, the set $A'
=(\alpha' + A)\cap [0,1]$ has measure $\geq \mu(A)-\alpha'$, hence
$\mu(A)+\mu(A')>1$. It follows that there is an $x$ with $\{x, x-\alpha'\}\in
A$. Conclude that $(-\alpha, \alpha)\subset A-A$.  <!--more-->
