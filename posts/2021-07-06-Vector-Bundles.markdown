---
title: Vector Bundles
author: Parth
date: 6 July 2021
tags: geometry
---
<div class="teaser"> 
One of the first tools one encounters in the study of homotopy groups is to
consider covering spaces-- things that _locally_ look like products with some
discrete topological space $\Delta$ but can have vastly different global
properties than a simple product space. In fact the number of non-trivial
covering spaces is a measure of the topological complexity of the space, in a
sense made precise by the Galois correspondence of fundamental groups. It is
then natural to ask what happens if one replaces $\Delta$ with more a
complicated topological space $F$: what results is a richer analogue of a
covering space called a _fiber bundle_, or a _vector bundle_ if $F$ is a vector
space.  </div>
<!--more-->

# Locally product-like spaces

Recall that we say $E\xrightarrow{p} B$ is a _covering space_ with fibers $F$
(where $F$ is a discrete topological space) if $B$ has an open cover
$\{U_\alpha\}$ such that for each $\alpha$, there is a homeomorphism
$\phi_\alpha: U_\alpha \times F \rightarrow p^{-1}(U_\alpha)$ which makes the
following diagram commute (here $\pi_i$ can _any_ of the projection maps which
the product comes with.)

<center> <img align="middle" src="../images/diagram-20210706.png" width="300"/> </center>

This motivates the definition of a vector bundle: 
<div class="definition">
<sc>Definition</sc> For a topological space $B$, we say $E\xrightarrow{p} B$ is
a (real) _vector bundle_ of rank $n$ if $B$ has an open cover $\{U_\alpha\}$
such that for each $\alpha$, we have a fiber-preserving homeomorphism
$\phi_\alpha: U_\alpha\times \mathbb{R}^n \rightarrow p^{-1}(U_\alpha)$ which is
a linear isomorphism on each fiber (i.e.\ for each $x\in U_\alpha$,
$\phi_\alpha$ restricts to a linear isomorphism $x\times \mathbb{R}^n\rightarrow
p^{-1}(x)$ of affine spaces).

Vector bundles of rank $1$ are termed _line bundles_.
</div>

$E$ is termed the _total space_, while $B$ is the _base space_. The collection
of charts $\{(\phi_\alpha, U_\alpha)\}$ is called a _trivialization_.

Note that one may replace $\mathbb{R}$ with any other field, and strengthen
'homeomorphism' in the above definition to 'diffeomorphism' or 'isomorphism'
depending on what kind of geometry is involved.

The condition we ask for is _local trivialization_: to each $U_\alpha$, the map
$p$ must look just like a projection $U_\alpha \times \mathbb{R}^n \rightarrow
U_\alpha$. As with covering spaces, this says nothing about the global structure
that $E$ might possess. $E$ has carrier set $\coprod_{x\in B} \{x\}\times
\mathbb{R}^n$ and $p:E\rightarrow B$ acts as the natural map on sets, but $E$
has additional structure induced by both the topology on $B$ and the vector
space structure on $\mathbb{R}^n$. The vector bundle then is a $B$-parametrised
family of vector spaces which varies 'smoothly'.

<div class="example">
<sc>Example</sc> What is the simplest thing that locally looks like a product? A
product, of course. Accordingly, we call $E= B\times \mathbb{R}^n\rightarrow B$
the _trivial bundle_ of rank $n$. Note that a bundle is trivial if and only if
$\{(\text{id}, B)\}$ is a trivialization.

A slightly more involved example is that of a _tangent bundle_: given an
$n$-dimensional differentiable manifold $B$, to each $x\in B$ we can associate
the tangent space $T_xB$ ($\cong \mathbb{R}^n$). Then the tangent bundle has
carrier set 
\begin{align*}
    E &=\coprod_{x\in B} \{x\}\times T_xB \\ 
      &= \{(x,y)\;|\;x\in B, \; y\in T_xB\}
\end{align*} 
and there is a natural map $p: E\rightarrow B$ given by $(x,y)\mapsto x$. We can
turn this into a vector bundle-- in fact, a manifold in its own right. Recall
that $B$ has an open cover $\{U_\alpha\}$ such that each $U_\alpha$ is
diffeomorphic to $\mathbb{R}^n$ via some chart $\theta_\alpha$. Identifying each
$T_xB$ with $\mathbb{R}^n$, we can define functions (of sets) $\phi_\alpha:
U_\alpha \times \mathbb{R}^n \cong \mathbb{R}^{2n}\rightarrow p^{-1}(U_\alpha)$.
Giving $E$ the weak topology induced by these, we have an atlas of charts on $E$
whose transition functions can be checked to be smooth. Then in addition to
being a vector bundle, $E$ is also a $2n$-dimensional manifold.

What does the tangent bundle of $S^1$ look like? If $(x,y)\in S^1$, we have that
$T_{(x,y)}S^1 = \{(u,v)\;|\; ux+vy=0\}\subset \mathbb{R}^2$ hence the tangent
bundle $TS^1$ is precisely the manifold $\{(x,y,u,v)\;|\;x^2+y^2=1, \;
ux+vy=0\}\subset \mathbb{R}^4$, isomorphic to the annulus
$\{(x,y,u)\;|\;x^2+y^2=1\}\subset \mathbb{R}^3$. But this is the trivial bundle
$S^1\times \mathbb{R}$.

What about other spheres? It is a fact that $S^1, S^3$ and $S^7$ are the only
spheres whose tangent bundle is trivial. We will be able to address the case for
$S^2$ once we understand what _sections_ are.  </div>

## Linearity

In the definition of a vector bundle we insist that the charts are linear
isomorphisms on fibers, not just diffeomorphisms. This is a strong constraint,
but also a helpful one since vector spaces are rich with structure and we
understand them well. Firstly, observe that associating a vector space to each
point is morally the right thing to do when dealing with objects like tangent
bundles of a manifold. And all our favourite vector space operations extend
directly to vector bundles-- in essence, all operations are 'pointwise': 

- **Direct sums**: If $E_1\xrightarrow{p_1}B$ and $E_2\xrightarrow{p_2}B$ are
  two vector bundles on $B$, then $E_1\oplus E_2$ has carrier set
  $\{(v_1,v_2)\;|\; p_1(v_1)=p_2(v_2)\}$ and associated projection
  $p(v_1,v_2)=p_1(v_1)=p_2(v_2)$. After checking local triviality, we can see
  that this does what we want: for any $x\in B$, $p^{-1}(x)=p_1^{-1}(x)\oplus
  p_2^{-1}(x)$.

- **Tensor products**: For $E_1$ and $E_2$ as above, we define $E_1\otimes E_2$
  to have carrier set the disjoint union of $p_1^{-1}(x)\otimes p_2^{-1}(x)$ for
  $x\in B$, and the natural projection map. The topology is given by taking open
  sets which trivialize both $E_1$ and $E_2$, and then letting the fiberwise
  tensor products of the charts on these be homeomorphisms.

- **Linear Duals**: If $E\xrightarrow{p}B$ is a vector bundle, then we can
  define the _dual bundle_ $E^\ast$ to have carrier set given by the disjoint
  union of $p^{-1}(x)^\ast$ for each $x\in B$. This can be given a topology by
  explicitly gluing the pullbacks of open sets along transition functions, a
  method of construction we shall meet next.

# Twisted functions

If $f:X\rightarrow Y$ is a morphism, we can replace it with a morphism
$\tilde{f}: X\rightarrow X\times Y$ given by $\tilde{f}(x)=(x,f(y))$.
$\tilde{f}$ thus given is called the _graph_ of $f$. Moreover, the
correspondence is one-to-one in that if $\tilde{f}:X\rightarrow X\times Y$ is
any morphism such that $\pi_1\circ \tilde{f}=\text{id}_X$, then there is a
unique morphism $f$ which $\tilde{f}$ is the graph of.

Now suppose $B$ is a topological space, and $\{U_\alpha\}$ is an open cover of
$B$. If $f:B\rightarrow \mathbb{R}^n$ is any continuous map, then its graph
$\tilde{f}$ is a map from $B$ to the trivial vector bundle $B\times
\mathbb{R}^n$ satisfying $\tilde{f}\circ \pi_1 = \text{id}_B$. In a trivial way,
it induces maps $U_\alpha\rightarrow U_\alpha\times \mathbb{R}^n$ which when
'stitched' together, give a map $B\rightarrow B\times \mathbb{R}^n$. Then a
function $f: B\rightarrow \mathbb{R}^n$ is what we get by 'stitching' _locally
defined_ functions into a global function. We can generalise this construction
by not restricting ourselves to trivial stitching.

<div class="definition">
<sc>Definition</sc> If $E\xrightarrow{p} B$ is a vector bundle, we say
$f:B\rightarrow E$ is a _section_ if $p\circ f=\text{id}_B$.  </div>

A particularly nice one is the _zero section_, which assigns to each $x\in B$
the point $(x,0)\in E$. Since vector bundle isomorphisms act like linear
isomorphisms on fibres, zero sections are preserved.

Since vector bundles are locally trivial, the restrictions of $f$ to
trivialising open sets are functions. It is immediate from the preceding
discussion that $\mathbb{R}^n$-valued functions are precisely sections of the
trivial bundle of rank $n$. 

<div class="example">
<sc>Example</sc> The space $\mathbb{RP}^n$ is defined as the space of lines of
$\mathbb{R}^{n+1}$ through the origin. Assigning to every 'point' of
$\mathbb{RP}^n$ the line that it actually is gives us the _tautological bundle_
$E$, whose carrier set is $\{(\ell,v)\;|\; \ell \in \mathbb{RP}^n, v\in
\mathbb{R}^{n+1}, v\in \ell\}$. The simplest case is obtained for $n=1$, when
$\mathbb{RP}^1$ is homeomorphic to $\mathbb{S}^1$. The tautological bundle $E$
in this case is called the _Mobius bundle_, since it is homeomorphic to the
interior of a Mobius strip: $\mathbb{RP}^1\cong[0,\pi]/\{0,\pi\}$ is swept by a
line rotating through $\pi$, with $\{0\}\times\mathbb{R}$ identified with
$\{\pi\}\times \mathbb{R}$ by $(0,t)\sim (\pi,-t)$. 

What do sections of the Mobius bundle look like? We can trivialise $E$ by taking
charts $\mathbb{RP}^n \setminus \{x\} \cong (0,1)$ for each $x$-- then the
restriction of any section $f$ to this chart gives a function
$g:(0,1)\rightarrow \mathbb{R}$ such that $\lim_{x\rightarrow
0}g(x)=-\lim_{x\rightarrow 1} g(x)$. This is a family of partial functions on
$\mathbb{RP}^n$ that carries the same information up to some transition
function: it is morally the right thing to put them together into one packet.
However, there is no total function that does the job since restrictions of
total functions on $\mathbb{RP}^n (\cong S^1)$ to the chosen charts agree at end
points. The construction we need is precisely that of a Mobius bundle, and the
sections of this bundle are the 'twisted function' we want.

Then is the Mobius bundle isomorphic to the trivial bundle on $S^1$? No: a
simple way to see this is that every section on the Mobius bundle must meet the
zero section at some point (think intermediate value theorem) while the trivial
bundle has a nowhere-vanishing section.  </div>

We will now make precise the idea of gluing these partial functions with
appropriate twists involved.

## Transition functions and structure groups

What does it mean to 'stitch' these partial functions? If $\{U_\alpha\}$ is the
trivializing cover of the vector bundle $E\xrightarrow{p}B$, then for any
$\alpha,\beta$ writing $U_{\alpha\beta}=U_\alpha\cap U_\beta$ we see that
$p^{-1}(U_{\alpha\beta})$ sits inside both $\phi_\alpha(U_\alpha\times
\mathbb{R}^n)$ and $\phi_\beta(U_\beta\times \mathbb{R}^n)$. Identifying these
copies gives us a map $\phi_\alpha \circ \phi_\beta^{-1}:U_{\alpha\beta}\times
\mathbb{R}^n \rightarrow U_{\alpha\beta}\times \mathbb{R}^n$ that is an
automorphism of $\mathbb{R}^n$ on each fiber (i.e. for each fixed $x\in
U_{\alpha\beta}$). In other words, for each $x\in U_{\alpha\beta}$ we have a
linear map $g_{\alpha\beta}(x)\in GL_n(\mathbb{R})$. We can check that these
maps satisfy the _cocycle condition_: 
\begin{gather*}
    g_{\alpha\alpha}=\text{id} \\
    g_{\alpha\beta}\cdot g_{\beta\gamma}=g_{\alpha\gamma}
\end{gather*}

This method of using explicit transition functions can be used to construct new
vector bundles from scratch: given $B$ with a collection of charts $U_\alpha$
and functions $g_{\alpha\beta}:U_{\alpha}\cap U_\beta \rightarrow
GL_n(\mathbb{R})$ which satisfy the cocycle conditions, there is a fiber bundle
$E$ that is trivializable over $\{U_\alpha\}$ with transition functions
$g_{ij}$.

Now it may happen that the maps $\{g_{\alpha\beta}\}$ take values in a subgroup
$G\subset GL_n(\mathbb{R})$, which then captures the symmetries of how the
different charts overlap. This group $G$ is then called a _structure group_ and
the charts $\{U_\alpha\}$ define a $G$-_structure_ on the vector bundle
$E\rightarrow B$. While the cocycles $\{g_{\alpha\beta}\}$ depend on the choice
of trivialization, structure groups are an invariant of the bundle.

<div class="theorem"> 
<sc>Proposition</sc> For a smooth manifold $B$, the vector bundle $E\rightarrow
B$ is trivial if and only if it has a trivial structure group. </div> 
<div class="proof">
<sc>Proof</sc> Suppose $E$ is the trivial bundle of rank $n$ on $B$, then
$\{(\text{id}, B)\}$ is a trivialization with cocycles $\{\text{id}\}\subset
GLn(\mathbb{R})$. Conversely, suppose $E\rightarrow B$ is a vector bundle with
trivial structure-group, and $\{(\phi_\alpha,U_\alpha)\}$ is a choice of
trivialization. Then for any $\alpha,\beta$, $\phi_\alpha\circ
\phi_{\beta}^{-1}$ is the identity on $\{x\} \times \mathbb{R}^n$ for any $x\in
U_\alpha\cap U_\beta$, so in fact $\phi_\alpha^{-1}$ and $\phi_\beta^{-1}$ agree
on $p^{-1}(U_\alpha)\cap p^{-1}(U_\beta)$. Then by the gluing lemma for smooth
maps [CITATION NEEDED] we find a smooth map $\phi^{-1}: \bigcup_\alpha
p^{-1}(U_\alpha) = E \rightarrow E\times \mathbb{R}^n$ that we can check is a
diffeomorphism. $\square$ </div>

What is the structure group of the Mobius bundle $\mathcal{M}$ on $S^1=
[0,1]/\{0,1\}$? We can triviale the bundle as $\{(\phi_0, U_0),
(\phi_1,U_1\})\}$ where $U_0 = S^1\setminus\{0\}$ and
$U_1=S^1\setminus\{\frac{1}{2}\}$. Then $U_0\cap U_1=(0,\frac{1}{2})\cap
(\frac{1}{2}, 1)$, so the transition function is 
$$ g_{01}(x): t\mapsto 
\begin{cases} 
    t,  &x<\frac{1}{2} \\ 
    -t, &x>\frac{1}{2}.\end{cases} $$ 
The structure group can be seen to be $\mathbb{Z}/2\mathbb{Z}\cong O(1)\subset GL_1(\mathbb{R})$. In particular, the Mobius bundle is non-trivial.

Note that the structure group of the Mobius bundle contains elements of negative
determinant-- this corresponds to the transition function reversing the
orientation of the fibers when gluing. Accordingly, vector bundles who have a
structure group with only elements of positive determinant are termed
_orientable_. Hence the Mobius bundle is non-orientable.

## Vector fields

This idea of writing functions as sections provides a useful tool when you
naturally care about maps whose codomain depends on the argument-- for instance,
a vector field $v$ on a smooth manifold $B$ which continuously assigns to each
$x\in B$ a vector $v(x)\in T_xB$. While using classical terminology would
_require_ us to consider an embedding of $B$ in a larger affine space, we can
now define vector fields as sections of the tangent bundle $TB$. While there are
ways to embed the manifold with its tangent bundles in a larger space to avoid
variable codomains, the tool becomes indispensible when considering _cotangent
bundles_ (the linear dual to the tangent bundle), where a section $f$ gives, for
each $x\in B$, a linear functional $f(x)\in (T_xB)^\ast$.

The additional linear structure that vector bundles contain over fiber bundles
gives us a lot more to talk about. For instance, we say a collection of vector
fields $\{V_\alpha\}$ on smooth manifold $B$ is _linearly independent_ if
$\{V_\alpha(x)\}$ is a linearly independent subset of $T_xB$ for each $x\in B$.
The vector fields form a _basis_ of the tangent bundle if the corresponding
vectors at each point form a basis of the tangent space. Then if an $n$
dimensional manifold has a basis of $n$ vector fields, we can decompose the
tangent bundle into linear combinations of these fields and construct an
isomorphism with the trivial bundle. These definitions and results are true for
general vector bundles:

<div class="theorem">
<sc>Theorem</sc> If $E\xrightarrow{p}B$ is a vector bundle of rank $n$, then $E$
is trivial if and only if it admits a basis of $n$ sections.  </div>

This, for instance, immediately shows that the tangent bundle of $S^1$ is
trivial since there is a non-vanishing vector field on $S^1$. On the other hand,
the _[hairy ball theorem](https://en.wikipedia.org/wiki/Hairy_ball_theorem)_
asserts that even dimensional spheres admit no nowhere-vanishing continuous
vector fields-- in particular, there cannot be a basis of $n$ vector fields
hence the tangent bundles are nontrivial. In a similar vein, the fact that the
Mobius bundle has no non-vanishing sections (a fact that follows from the
intermediate value theorem) shows that it is a non-trivial bundle.

To conclude, we shall give a construction of 'twisted functions' that naturally
arises in algebraic geometry.

## Homogeneous polynomials on $\mathbb{P}^n$

The complex projective space $\mathbb{P}^n$ (with homogeneous coordinates
$(X_0:...:X_n)$) is covered by $n+1$ affine patches $\{U_0,...,U_n\}$, where
$U_i = \{X_i \neq 0\}$. Each patch is a copy of $\mathbb{A}^n$, and polynomials
in coordinate functions are morphisms, or sections of $U_i\times \mathbb{C}$.
For $n=1$, consider $1+\frac{X_1}{X_0}$ on the patch $U_0$ and
$1+\frac{X_0}{X_1}$ on the patch $U_1$. Up to multiplication with
$\frac{X_1}{X_0}$, these associate a well-defined scalar to each point of
$\mathbb{P}^1$. It however, does not come from a function (a section of the
trivial bundle) since the transition functions are not identity-- but what we
have here is a perfect situation for a vector bundle.

Recall that $\mathbb{P}^n$ is the space of all (complex) 'lines' through the
origin in $\mathbb{C}^{n+1}$, so has an associated tautological line bundle
which we call $\mathcal{O}(-1)\rightarrow \mathbb{P}^n$. Let
$\mathcal{O}(1)\xrightarrow{p} \mathbb{P}^n$ denote the linear dual of this
bundle, i.e. $p^{-1}(x_0:...:x_n)$ is the space of linear functionals on
$(x_0,...,x_n)\mathbb{C}\subset \mathbb{C}^{n+1}$. This carries the structure of
a quasi-projective variety: writing $(X_0:...:X_{n+1})$ for the homogeneous
coordinates on $\mathbb{P}^{n+1}$, consider the quasi-projective variety given
by 
\begin{align*} 
    V &= \mathbb{P}^{n+1}\setminus\{(0:...:0:1)\} \\
      &= \{(x_0:...:x_n:\lambda)\;|\; (x_0:...:x_n)\in \mathbb{P}^n, \; \lambda
         \in \mathbb{C}\}.  
\end{align*} 
Then we can give an isomorphism $V\rightarrow \mathcal{O}(1)$ by mapping
$(x_0:...:x_n:\lambda)$ to the linear map $\lambda\in
\mathcal{O}(1)_{(x_0:...:x_n)}$. Henceforth we shall use the two realisations of
$\mathcal{O}(1)$ interchangeably.

Equipped with the natural projection map $p$, we can explicitly show that this
is a (complex) line bundle over $\mathbb{P}^n$ trivialized by the affine
patches: on $U_i$ we have the holomorphic chart
$(x_0:x_1:...:x_n:\lambda)\mapsto ((x_0:x_1:...:x_n),
\frac{\lambda}{x_i})\subset \mathbb{P}^n\times \mathbb{C}$ and for a fixed
$(x_0:...:x_n)\in U_i\cap U_j$, the transition function between charts is the
linear isomorphism given by $\frac{x_i}{x_j}\in \text{GL}(1,\mathbb{C})$. 

If $f:\mathbb{P}^n\rightarrow V$ is a holomorphic section of
$\mathcal{O}(1)=\mathcal{O}(-1)^\ast$, then for each $(x_0:...:x_n)\in
\mathbb{P}^n$, The linear map $f(x_0:...:x_n)$ maps $(x_0,...,x_n)\in
\mathcal{O}(-1)_{(x_0:...:x_n)}$ to some $F(x_0,...,x_n)\in \mathbb{C}$. Then
$F$ is a well-defined holomorphic function $\mathbb{C}^{n+1}\setminus \{0\}
\rightarrow \mathbb{C}$. From the description it is clear that $F(\lambda
x_0,...,\lambda x_n) = \lambda F(x_0,...,x_n)$, so $F$ is in fact linear and
homogeneous. In particular, the singularity at $0$ is removable, and we have a
homogeneous polynomial of degree $1$.

On the other hand if $F\in \mathbb{C}[X_0,...,X_n]$ is any homogeneous
polynomial of degree $1$, then $F$ corresponds to the section $z\mapsto
(z:F(z))$ of $V\subset \mathbb{P}^{n+1}$ (the degree $1$ condition ensures this
section is well-defined). Thus the holomorphic sections of
\(\mathcal{O}_{\mathbb{P}^n}(1)\) are precisely homogeneous degree 1
polynomials. 

Writing $\mathcal{O}(k)=\mathcal{O}(1)^{\otimes k}$, sections of
$\mathcal{O}(k)\rightarrow \mathbb{P}^n$ would correspond to formal products of
$k$ sections of $\mathcal{O}(1)\rightarrow \mathbb{P}^n$, i.e.\ of the form
$F_1\otimes F_2 \otimes ... \otimes F_k$ for homogeneous polynomials
$F_1,...,F_k$. For instance, if $n=1, k=2$ then the restriction of
$\mathcal{O}(k)$ to the patch $Z\neq 0$ is isomorphic to the trivial bundle, and
moreover the sections $\frac{X}{Z}\otimes  \frac{Y}{Z}$ and $\frac{Y}{Z}\otimes
\frac{X}{Z}$ are both equal to $(\frac{XY}{Z^2})(1\otimes 1)$ since smooth
functions can be treated like scalars. This reasoning can be extended to show
that the space of holomorphic sections of $\mathcal{O}_{\mathbb{P}^n}(k)$ has
basis $X_{i_1}\otimes ... \otimes X_{i_n}$ for $0\leq i_1\leq i_2 \leq ... \leq
i_k\leq n$. In other words, holomorphic sections of $\mathcal{O}(k)$ are
precisely degree $k$ homogeneous polynomials.

# A lens to view the base space

Going back to the initial motivation, we study covering spaces because the
isomorphism classes of covering spaces on a space are a measure of its
complexity (roughly the same measure as the fundamental group). We can play
similar games with vector bundles. 

Observe that $\mathbb{R}\setminus \{0\}$ is homotopy equivalent to the discrete
two-point space $S^0$, so if $E\rightarrow B$ is a real line bundle with
zero-section $Z$ then $E\setminus Z$ has the homotopy type of a fiber bundle
with fibers $S^0$ i.e. a double-cover of $B$. It is an easy check that the
trivial line bundle gives the trivial double cover (i.e.\ $B\times S^0$). This
gives us another way to see that the Mobius bundle is non-trivial: removing the
zero-section leaves us with (up to homotopy) the non-trivial double-cover of
$S^1$. 

Just like covering spaces, the classes of vector bundles on a compact Hausdorff
base space is a homotopy invariant. In particular, we have the following result 

<div class="theorem">
<sc>Theorem</sc> Every vector bundle over a contractible compact Hausdorff space
is trivial.</div>

Of course, the whole article was an elaborate proof of the fact that $S^1$ is
not contractible.

# References 
- Chapter 1 of [Hatcher's book on Vector
  Bundles](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)
- Chapter 2 of [Kovalev's part III Differential Geometry
  notes](https://www.dpmms.cam.ac.uk/~agk22/vb.pdf)
- Chapter 1, section 6 of [Differential forms in Algebraic Topology (Bott and
  Tu)](https://books.google.co.uk/books/about/Differential_Forms_in_Algebraic_Topology.html?id=S6Ve0KXyDj8C&redir_esc=y)
- Stephen Stolz's document on [Classification of
  Bundles](https://www3.nd.edu/~stolz/Math70330(F2008)/cohen.pdf)
- This [mathoverflow
  thread](https://mathoverflow.net/questions/7836/why-is-it-useful-to-study-vector-bundles)


