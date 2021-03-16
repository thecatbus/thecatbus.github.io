---
title: Why constant symbols
author: Parth
tags: logic
---
We define the signature of a first-order language as a collection of symbols for functions, predicates and _constants_. Does removing any of them make the language less expressive? The theory of groups is usually written in the signature $\{\ast,e\}$ where $\ast$ is a binary function-symbol and $e$ is a constant-symbol to be interpreted as the group identity. However, the axioms involving identity can very well be stated without using a constant-symbol:
\begin{gather}
(\exists w)((\forall x)(\exists y)(x\ast y = w \;\wedge \; y\ast x = w) \; \wedge \; (\forall x)(x\ast w = x \;\wedge w \ast x = x))
\end{gather}
 Hence can have a theory $T_g$ of groups in the constant-free signature $\sigma_g=\{\ast\}$.  Constant-symbols (or any equivalent predicates) allow us to pick out a _specific_ element and put arbitrarily many conditions on it. One could argue that, like for groups, it is possible to wrap the conjunction of all these sentences with an existential quantifier and get away with one less symbol in the language-- but this works only if you have finitely many things to say. 

Take the theory of groups containing an element of infinite order: the signature is $\sigma_g\cup\{ c \}$, where $c$ is a constant-symbol we will use to generate the orbit. The axioms are given by
\begin{gather}
T_{g_\infty}= T_g\cup \{\neg \underbrace{c\ast (c\ast( ... \ast(}_{n+1}c))) = c \; | \; n\in \mathbb{N}\}.
\end{gather}
Taking a conjunction of all the sentences involving $c$ is no longer a possibility. What about multiple existential statements? The problem there is, they can all be realised by _different_ elements. I can have sentences saying "there exists an element of order $>n$" for as large an $n$ as I want, but the group $\mathbb{Q}/\mathbb{Z}$ would model all of them-- it has elements of arbitrarily large degree, but no element of infinite degree. 

Suppose there were a $\sigma_g$ theory $S\subset T_g$ that did axiomatise the same class of structures as $T_{g_\infty}$. In particular, for any $p\in S$ we must have $T_{g_\infty}\vDash p$, i.e. $T_{g_\infty}\vdash p$. Now proofs are finite-- so $T'\vDash p$ holds for some finite subset $T'\subset T_{g_\infty}$. But we noticed that $\mathbb{Q}/\mathbb{Z}$ is a model of every finite subset of $T_{g_\infty}$, so we conclude $\mathbb{Q}/\mathbb{Z}$ is a model of every $p\in S$. This is a contradiction.

Hence we _need_ a constant-symbol (or some equivalent encoding as a predicate) to axiomatise this theory: constant-symbols are essential!

<!--more-->
