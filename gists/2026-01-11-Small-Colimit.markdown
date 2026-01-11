---
title: A tiny infinite colimit 
author: Parth
tags: algebra
---
The slogan "_colimits are unions_" works most of the time, except when it doesn't -- here is a nice example pointed out to me by Jiacheng Tang. Work in the category of _finite_ groups, and consider the directed system $0\hookrightarrow \mathbb{Z}/2\mathbb{Z}\hookrightarrow\mathbb{Z}/4\mathbb{Z}\hookrightarrow \cdots$. Any non-zero element in this directed system can be halved arbitrarily many times, and hence so can its image under any homomorphism out of the system. But we are working in the category of finite groups, so such an image can only be the trivial (i.e. identity) element. In other words, the colimit of this infinite directed system is the trivial group. 

Of course if one instead works in the larger category of all groups, the colimit is the "infinite union" $\mathbb{Z}[\frac{1}{2}]/\mathbb{Z}$.
<!--more-->
