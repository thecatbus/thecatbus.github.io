---
title: The Extension Problem
author: Parth
date: 6 July 2021
tags: algebra
---
<div class="teaser">
If you know what abelian groups $A$ and $B=X/A$ are, then what can you say about
$X$? The fact that $X=A\oplus B$ is not the only possibility has probably taken
many first-year undergrads by surprise, but the subsequent question of _how many
such solutions are there_ goes far deeper than the scope of a first course in
group theory. 

This is a sketch for my Part III seminar talk, and I shall ambitiously aim to
use the _extension problem_ for abelian groups to motivate homological methods
and resolutions.
</div> <!--more-->

$\renewcommand{\xrightarrow}[1]{\overset{\small{#1}}{\longrightarrow}}$
In the early 1900s, homological methods were the topologist's tool to attach
invariants to spaces-- in the work of Riemann and Betti these were the _Betti
numbers_, which were computed and recomputed in a variety of ways by Poincaré,
Čech, de Rham, and others. In 1925 Emmy Noether made a revolutionary observation
which upgraded the invariants from mere numbers to groups. Subsequent
developments, notably the Universal coefficients theorem(s), deeply intertwined
homological methods with the study of groups and exact sequences-- particularly
the question of extending a group $B$ by another group $A$. More precisely,
we seek to understand the _extension set_ defined below. 

<div class="definition">
<sc>Definition</sc> For abelian groups $A,B$, let $\text{Ext}(B,A)$ be the set
of exact sequences $0\rightarrow A \rightarrow X \rightarrow B \rightarrow 0$,
up to isomorphism of chain complexes.  </div>

A simple application of the [five lemma](https://en.wikipedia.org/wiki/Five_lemma) shows that two such solutions $X,Y$ are isomorphic if and only if there is a map $X\rightarrow Y$ making the diagram commute:


<center> <img align="middle" src="../images/ext-fig1.png" width="300"/> </center>

(If you are unfamiliar with what this means, you can take the above to be the
definition of the isomorphism.)

Of course, the simplicity of this question meant it was of interest even before
homological algebra existed. But more than just being a tool in answering
questions about the homology of geometric spaces, it provided a purely algebraic
question that homological methods could solve-- thus showing that invariants
could in fact be attached to algebraic systems themselves.

Note abelian groups are simply $\mathbb{Z}$-modules, and it makes sense to ask
the question for modules over any commutative ring $R$ with a unit. Hence, to
avoid writing "abelian group" every time, I will continue the discussion for the
slightly shorter term "$R$-module".

# Elementary properties of $Ext(\cdot, \cdot)$

Like every good mathematical construction, $Ext(\cdot, \cdot)$ is functorial:
given an extension $0\rightarrow A\xrightarrow{i} X \xrightarrow{p} B
\rightarrow 0$ and a map $A\xrightarrow{f}A'$, take the pushout $X'=X\otimes_A
A'=X\oplus A' \; / \; \{(i(a), -f(a))\;|\; a\in A\}$. Then the natural map
$A'\rightarrow X'$ is injective and has cokernel $B$, giving an extension
$0\rightarrow A'\rightarrow X\rightarrow B\rightarrow 0$. Thus we have a map
$Ext(B,f): Ext(B,A)\rightarrow Ext(B,A')$, and we can check that this makes
$Ext(B,\cdot)$ a functor. 

<center> <img align="middle" src="../images/ext-fig3.png" width="300"/> </center>

For a map $B'\xrightarrow{g} B$, we can repeat this construction (taking the
pullback $X\times_B B'$ instead) to get a map $Ext(g,A):Ext(B,A)\rightarrow
Ext(B',A)$. Note $Ext(\cdot,\cdot)$ is contravariantly functorial in the first
argument and covariantly in the second, just like $Hom$. So, adapting the
notation, we will write $f\circ \xi:= Ext(B,f)(\xi)$ and $\xi\circ g:=
Ext(g,A)(\xi)$. Of course this isn't purely formal and there is a deeper
connection, but we won't worry about it here.

## The Baer Sum

In 1934, Reinhold Baer observed that pushouts and pullbacks can be used to
enhance $Ext(B,A)$ with a group structure. We shall summarise his construction
using the functorial language-- given extensions $\xi: 0\rightarrow A
\xrightarrow{i} X\xrightarrow{p} B\rightarrow 0$ and $\eta: 0\rightarrow
A\xrightarrow{i'} X'\xrightarrow{p'} B\rightarrow 0$, we have an exact sequence
$$\xi\oplus \eta:0\rightarrow A\oplus A \xrightarrow{i\oplus i'} X\oplus X'
\xrightarrow{p\oplus p'} B\oplus B' \rightarrow 0.$$ There are natural maps
$\Delta: B\rightarrow B\oplus B$ and $\nabla: A\oplus A \rightarrow
A$ (given by the diagonal and codiagonal i.e.\ the group law respectively), and
we can use the functoriality of $Ext(\cdot, \cdot)$ to obtain an exact sequence
$$\nabla \circ (\xi\oplus \eta) \circ \Delta \quad : \quad 0\rightarrow
A\rightarrow [((X\oplus X')\times_{B\oplus B} B) \otimes_{A\oplus A}A]
\rightarrow B \rightarrow 0.$$ 
This is what we shall define to be the _Baer sum_ of $\xi$ and $\eta$.
Explicitly, take the group $\Gamma = \{(x,x')\in X\oplus X'\;|\; p(x)=p'(x')\}$
and quotient by the subgroup $N=\{(i(a),-i'(a))\;|\;a\in A\}$. The inclusion
$A\ni a\mapsto [(a,0)]=[(0,a)]\in \Gamma/N$ and the projection $\Gamma/N\ni[(x,x')]\mapsto p(x)=p'(x')\in B$ give the extension we want.

It is immediate that the group law is commutative, and some thought shows the
trivial (split) extension $0\rightarrow A\rightarrow A\oplus B \rightarrow
B\rightarrow 0$ is the identity: indeed, using the notation above, for
$X'=A\oplus B$ we have $\Gamma = \{(x,a+b)\;|\; p(x)=b\} \cong X\oplus A$ where
the isomorphism is given by $\Gamma \ni(x,a+b)\mapsto (x+i(a),a)\in X\oplus A$.
Under this identification, $N=\{(i(a),-a)\;|\;a\in A\} \cong 0\oplus A$ so that
$\Gamma/N \cong X$. 

<div class="block"> 
<sc>Exercise</sc> Show that the extension
$0\rightarrow A\xrightarrow{-i}X\xrightarrow{p}B\rightarrow 0$
is the inverse to
$0\rightarrow A\xrightarrow{i}X\xrightarrow{p}B\rightarrow 0$ (i.e.\ their Baer
sum is split).
</div>

Making a deal with the devil shows the Baer sum is associative, and hence we
have a group. Baer in fact gave a nice description of this group, along with an
efficient way to compute it which paved the way for modern homological methods.

# The first C

Suppose $0\rightarrow A \rightarrow X \rightarrow B \rightarrow 0$ is an
extension of $B$ by $A$. Fix a presentation $B=F/R$, where $F$ is a free module
and $R$ is a subgroup of relations defining $B$. For each generator $e_i\in F$,
choose a lift $h(e_i)\in X$ of $e_i+R\in B$. Thus we have a commutative diagram
where the bottom row is exact.

<center> <img align="middle" src="../images/ext-fig2.png" width="300"/> </center>

Now if $r\in R$, then $g(h(r))=0$ so that $h(r)\in A$. Moreover, if
$h':F\rightarrow X$ was another choice of lifts then $(h-h')\circ g = 0$ so
$(h-h')\in Hom(F,A)$. Thus in fact for each extension $\xi: 0\rightarrow
A\rightarrow X\rightarrow B\rightarrow 0$, we can pick an element of
$Hom(R,A)/Hom(F,A)$, the cokernel of the restriction map $Hom(F,A)\rightarrow
Hom(R,A)$. In fact, this correspondence is bijective.

<div class="theorem">
<sc> Theorem </sc> (Baer) Suppose we have $R$-modules $A,B$ where $B$ has
presentation $B=F/R$ for $F$ free. Then there is a natural bijection between
$Ext(B,A)$ and the cokernel of the restriction map $Hom(F,A)\rightarrow
Hom(R,A)$
<div class="proof">
<sc> Proof </sc> We have already shown how, given an extension $\xi\in Ext(B,A)$
we can obtain a well-defined element $[h]\in \text{coker}[Hom(F,A)\rightarrow
Hom(R,A)]$. Conversely given a map $h:R\rightarrow A$, let $X$ be the pushout
$A\otimes_R F = A\oplus F \;/\; \{(h(r), r)\;|\; r\in R\}$. We have a surjection
$X\twoheadrightarrow B$ induced from $A\times F \twoheadrightarrow F
\twoheadrightarrow B$, and the kernel of this surjection is precisely
$A\oplus R\;/\;\{(h(r), r)\;|\; r\in R\}=A\otimes_R R \cong A$. Thus
we have an extension $\xi: 0\rightarrow A\rightarrow X\rightarrow B\rightarrow 0$, and moreover if $h-h'$ extends to a map $F\rightarrow A$ then .
</div>
</div>


# Freshman's dream?

As mentioned, there is always the trivial solution $0\rightarrow A \rightarrow
A\oplus B \rightarrow B \rightarrow 0$. Such exact sequences are said to be
_split_, and it seems like a good idea to ask for what $A,B$ is the only
solution to the extension problem split? 

We understand split exact sequences quite well:

<div class="lemma">
<sc> Lemma </sc> (Splitting lemma) For an exact sequence $0\rightarrow
A\xrightarrow{f} X \xrightarrow{g} B \rightarrow 0$ of $R$-modules, the
following are equivalent: 

1. The sequence is split, i.e.\ $X=A\oplus B$.
2. There is a retract of $f$, i.e.\ a map $X\xrightarrow{r}A$ such that $r\circ
   f = \text{id}_A$.
3. There is a section of $g$, i.e.\ a map $B\xrightarrow{s}X$ such that $g\circ
   s = \text{id}_B$.
<div class="proof">
<sc> Proof </sc> If $X=A\oplus B$, then we can take $r,s$ to be the canonical
projection and injection respectively. For the rest of the proof, identify $A$
with its image in $X$. <br>
If $f$ has a retraction $r$, then for any $x\in X$ we have $x=(x-r(x))+r(x)$,
where $x-r(x)\in \ker(r)$ and $r(x)\in A$. Moreover this
decomposition is unique since $\ker(r)\cap A= 0$. Thus $X\cong A\oplus \ker(r)$.
Then observe $\ker(r)\cong X/A = B$. <br> Lastly, if $g$ has a section $s$ then
any $x\in X$ can be written $x=(x-s\circ
g(x))+ s\circ g(x)$ where $x-s\circ g(x)\in \ker(g) = A$, and $s\circ g(x) \in
\text{im}(s)$. Moreover, this decomposition is unique since $A \cap \text{im}(s)
= 0$. Thus $X\cong A\oplus \text{im}(s)$. Then observe $\text{im}(s)\cong
X/A=B$.  $\square$ </proof>
</div>

One immediate application is that the exact sequence $0\rightarrow
A\xrightarrow{f} X \xrightarrow{g} B \rightarrow 0$ splits whenever $B$ is free
since giving a section of $g$ would simply correspond to choosing lifts of the
generators of $B$.  In this case, $Ext(B,A)\cong\{0\}$ is the one-element set.

<div class="definition">
<sc>Definition</sc> Say a module $P$ is _projective_ if every exact sequence
$0\rightarrow A \rightarrow X \rightarrow P \rightarrow 0$ splits. Equivalently, every surjection $X\twoheadrightarrow P$ has a section. Equivalently, $Ext(P,A)\cong \{0\}$ for every module $A$.</div>

Note for any module $P$ there is always a free module that surjects onto $P$
(just take the free module generated by elements of $P$), so by the splitting
lemma, every projective module is a direct summand of some free module. In
fact, the converse is true too.

<div class="theorem">
<sc>Theorem</sc> A module $P$ is projective if and only if there is a module $Q$
such that $P\oplus Q$ is free.
<div class="proof">
<sc> Proof </sc> If $P$ is projective, then we observed above that it can be
written as a direct summand of some free module. To show the converse, suppose
we have a $Q$ such that $P\oplus Q$ is free, and $0\rightarrow A\rightarrow
X\rightarrow P\rightarrow 0$ is exact. Then we have an exact sequence
$0\rightarrow A\oplus 0\rightarrow X\oplus Q \rightarrow P\oplus Q\rightarrow
0$. But $P\oplus Q$ is free so $X\oplus Q \twoheadrightarrow A\oplus P \oplus Q$ is an isomorphism. Since it acts as identity on $Q$, it follows that $X\cong A\oplus P$ and hence $P$ is projective. $\square$
</div>
</div>

This gives a complete characterisation of projective modules.

<div class="example">
<sc> Example </sc> (Projectivity is stronger than freeness) The simplest example of a non-free projective module is obtained by considering the product ring $R\times R'$. Then $R\times 0$ is a direct summand of $R\times R'$ so is projective, but clearly isn't free. So, for instance, $\mathbb{Z}/2\mathbb{Z}$ is a projective $\mathbb{Z}/6\mathbb{Z}$-module.

By the [structure
theorem](https://en.wikipedia.org/wiki/Structure_theorem_for_finitely_generated_modules_over_a_principal_ideal_domain)
for finitely generated modules over a principal ideal domain, we can show that a
finitely generated module over a PID is projective if and only if it is free.
In fact, one can (non constructively) show that _all projective abelian groups
are free_ by showing [every subgroup of a free group is
free](https://en.wikipedia.org/wiki/Nielsen–Schreier_theorem).  
</div>

We can dually define a module $I$ to be _injective_ if every exact sequence $0\rightarrow I \rightarrow X \rightarrow B \rightarrow 0$ splits. Equivalently, if every injection $I\hookrightarrow X$ admits a retract. Equivalently, if $Ext(B,I)\cong 0$ for every module $B$.

Characterising injective and projective modules goes a part of the way towards
understanding $Ext(\cdot,\cdot)$; they are (in a sense that can be made
precise) 'simple' objects, and we can exploit their simplicity to understand
other extension problems.



# References
- Weibel's essay on the [History of Homological
  Algebra](https://sites.math.rutgers.edu/~weibel/HA-history.pdf)
