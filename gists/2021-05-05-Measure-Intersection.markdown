---
title: Intersection and measure
author: Parth
tags: algebra
---
Let $(E,\mathcal{E}, \mu)$ be a measure space. If $A,B\in \mathcal{E}$ are such that $\mu(A)+\mu(B)> \mu(E)$ then $A\cap B \neq \emptyset$. A neat illustration: 

Suppose $A\subset [0,1]$ is measurable with $\mu(A)= \frac{1+\alpha}{2}$. Then for any $\alpha'<\alpha$, the set $A' =(\alpha' + A)\cap [0,1]$ has measure $\geq \mu(A)-\alpha'$, hence $\mu(A)+\mu(A')>1$. It follows that there is an \(x\) with \(\{x, x-\alpha'\}\in A\). Conclude that $(-\alpha, \alpha)\subset A-A$.
<!--more-->
