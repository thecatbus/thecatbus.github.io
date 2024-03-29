[latexpage]

Some preliminary notions

In the quest for putting a volume on each subset of a space, the following definitions arise:

Definition For \(\mathcal{A}\subset 2^A\) with \(\emptyset \in \mathcal{A}\), \(\mu: \mathcal{A}\rightarrow [0,+\infty]\) is a set function on \(A\) if \(\mu(\emptyset) = 0\).

Say \(\mu\) is finitely (resp. countably) additive if for finite (resp. countable) collections \(\{A_i\}\subset \mathcal{A}\) of disjoint sets, \(\mu(\bigsqcup A_i) = \sum \mu(A_i)\) whenever defined.
\(\mu\) is finitely (resp. countably) subadditive if for finite (resp. countable) collections \(\{A_i\}\subset \mathcal{A}\) of sets, \(\mu(\bigcup A_i)\leq \sum \mu(A_i)\) whenever defined.
\(\mu\) is increasing if \(A\subset B \; \Rightarrow \; \mu(A)\leq \mu(B)\).
We need collections of subsets to define our set-functions on. Ideally this collection will be the whole powerset, but that proves incredibly hard so we start humble. When measuring volumes in \(\mathbb{R}^3\), it is natural to consider all subsets that can be written as finite unions of boxes, since the volumes of those are easiest to define. Such collections form an algebra.

Definition A boolean algebra on \(A\) is a subset of \(2^A\) containing \(\emptyset\) that is closed under taking complements and finite unions.

Definition For \(A\) a set and \(\mathcal{A}\subset 2^A\) a boolean algebra, a mean on \((A,\mathcal{A})\) is a finitely additive set function \(m\) on \(A\).

Now we can measure the volumes of a large chunk of subsets of \(\mathbb{R}^n\) by considering the natural mean \(m\) on the boolean algebra generated by boxes. Call such a set elementary. We can in fact extend \(m\) to more than just elementary sets, by allowing things that they limit to: a subset \(A\subset \mathbb{R}^n\) is Jordan-measurable if for any \(\epsilon>0\) there are elementary sets \(E \subset A \subset F\) such that \(m(F\setminus E) < \epsilon\). The collection of all Jordan-measurable subsets is again a boolean algebra, and \(m\) is a mean on it.

There are also sets that are not Jordan-measurable, but have volumes in the traditional sense. In particular, Jordan-measurable sets are always bounded so something like Gabriel's horn (which has a finite volume in \(\mathbb{R}^3\)) is not Jordan-measurable. A bounded non-Jordan-measurable set is \(\mathbb{Q}\cap [0,1]\), since any elementary set containing it must have mean atleast \(1\) while any elementary set inside it must be finite hence having zero mean. One shortcoming boolean algebras have is that they are restricted to finite unions, whereas when thinking of volumes it is natural to consider limits of series: \(1 + \frac{1}{2} + \frac{1}{4} + ... = 2\). In the transition from elementary sets to Jordan-measurable ones, we essentially allowed only some countable unions. Thus it makes sense to extend our definitions to all countable unions.

Aside: in fact, countability is the furthest it makes sense to go, since the sum of uncountably many positive reals cannot be finite. We can consider algebras which include arbitrary unions, but then 'most' of the elements in the algebra would have infinite (or zero) volume and hence the information we get would be largely uninteresting.

Theorem If we have a collection \(n_i \geq 0\) of reals with \(\sum_{i \in I}n_i < \infty\) then at most countably many \(n_i\) can be non-zero.

Proof Let \(S_n = \{n_i | n_i > \frac{1}{n}\}\), for \(n \in \mathbb{N}\). If any \(S_n\) has infinitely many elements, then \(\sum_{i \in I}n_i > \sum_{m \in S_n} m= \infty\), hence each \(S_n\) is finite. Then the set of non-zero elements is \(\bigcup_{n\in \mathbb{N}}S_n\) which is a countable union of finite sets. \(\square\)

Definition A \(\sigma\)-algebra \(\mathcal{A}\) on \(A\) is a subset of \(2^A\) that contains \(\emptyset\) and is closed under taking complements and countable unions.

Definition A measure on \((A,\mathcal{A})\) is a countably additive set function \(\mu\) on \(A\). The triple \((A,\mathcal{A},\mu)\) is called a measure space.

Specifying the Measure

In an ideal universe you could specify the value of the function on each point and know it completely. Most useful \(\sigma\)-algebras however contain too many points to even talk about, since taking closures under countable unions and intersections isn't as straightforward as their finite counterparts. For instance, constructing the usual \(\sigma\)-algebra on \(\mathbb{R}\) requires using transfinite induction to generate the Borel Heirarchy:

\(\mathbf{\Sigma^0_1}\) is the collection of all open sets, \(\mathbf{\Pi}^0_1\) is the collection of all closed sets.
 \(\mathbf{\Sigma}^0_\alpha\) for \(\alpha > 1\) is generated by taking countable unions of elements in \(\bigcup_{\beta < \alpha} \mathbf{\Pi}^0_\beta\). (Sets of this class are closed under countable unions.)
A set is in \(\mathbf{\Pi}^0_\alpha\) iff its complement is in \(\mathbf{\Sigma}^0_\alpha\). (Sets of this class are closed under countable intersections)
\(\mathbf{\Delta}^0_{\alpha} = \mathbf{\Sigma}^0_\alpha \cap \mathbf{\Pi}^0_\alpha\)
Then the sigma algebra we need is \(\mathbf{\Delta}_{\omega_1}\), reached at the first uncountable ordinal.

\(\sigma\)-algebras can, however, be uniquely determined from certain subsets of the entire algebra. For example, the Borel \(\sigma\)-algebra we described above can be defined as the smallest \(\sigma\)-algebra containing all the open sets, i.e. it is the \(\sigma\)-algebra generated by the collection of all open sets of \(\mathbb{R}\). Then to specify the measure, what we hope to do is specify its value on a nicer generating set in a way that it can be extended to the whole \(\sigma\)-algebra in a unique way. Not all generating sets work: some contain too little information to enforce uniqueness, while some like boolean subalgebras are overkill. We are asking the question how much information do I need to know before I can be certain there is at most one extension?

Trivially, you can conclude that two measures are the same if their actions coincide on the entire \(\sigma\)-algebra. However, this is unnecessary: if you know two measures coincide on a countable collection of disjoint sets then they must coincide on the union. Similarly if you know two measures agree on \(X\) and \(Y \supset X\) then they must agree on \(Y\setminus X\). Call the latter property closure under local complements. (Non-standard terminology.)

Definition \(\mathcal{A} \subset 2^A\) is a \(d\)-system (or Dynkin system) if it contains \(A\) and is closed under taking local complements and countable disjoint unions.

In particular, \(d\)-systems are closed under taking complements. They are also closed under taking unions of upwards-nested sequences, i.e. if \(X_1 \subset X_2 \subset X_3 \subset ...\) are in \(\mathcal{A}\) then so is \(\bigcup X_i\). The upward-nested restatement is very nice because we can say a \(d\)-system is closed under countable union if and only if it is closed under finite union (or finite intersection, since we have complements.) In particular we have this:

Lemma A family of subsets is a \(\sigma\)-algebra if and only if it is a \(d\)-system closed under finite intersections.

Checking two measures coincide on intersections is necessary because knowing the measures of two sets does not uniquely determine the measure of their intersections.

Definition \(\mathcal{A} \subset 2^A\) is a \(\pi\)-system of it contains \(\emptyset\) and is closed under finite intersections.

Intuitively, \(d\)-systems and \(\pi\)-systems capture the ideas of 'overkill' compared to 'necessary'. This is also reflected in the requirements- \(d\) systems must contain the whole set (whose measure is ensured to be determined by \(\sigma\)-finiteness), while \(\pi\)-systems contain \(\emptyset\) (where two measures absolutely must coincide, to even qualify as measures.)

It is easy to see that \(\pi\)-closures of \(d\)-systems are always \(\sigma\)-algebras. The converse is true as well:

Lemma (Dynkin's) If \(\mathcal{A}\) is a \(\pi\)-system on \(A\), then any \(d\)-system containing \(\mathcal{A}\) also contains \(\sigma(\mathcal{A})\).

Proof We show that \(\mathcal{D}=\bigcap \{d\text{-systems containing }\mathcal{A}\}\) is itself a \(\sigma\)-algebra. It is clearly a \(d\)-system, and contains \(\mathcal{A}\). To show it is closed under finite intersections, consider \(\mathcal{D}' = \{D \in \mathcal{D}\;|\; D \cap X \in \mathcal{D} \quad \forall X \in \mathcal{D}\}\). This contains \(\mathcal{A}\):

To see this, look at \(\mathcal{D}'' = \{D \in \mathcal{A} \; | \; D \cap X \in \mathcal{D} \quad \forall X \in \mathcal{D}\}\). This is a \(d\)-system, and \(\mathcal{A}\) is a \(\pi\)-system so lies within \(\mathcal{D}''\). Then by the minimality of \(\mathcal{D}\), we have \(\mathcal{D}” = \mathcal{D}\).

But \(\mathcal{D}'\) is also a \(d\)-system, so by the minimality of \(\mathcal{D}\) we have \(\mathcal{D}' = \mathcal{D}\) which is hence closed under finite intersections. \(\square\)

This sets us up for the main result, that knowing the values of a measure on a \(\pi\)-system is /sufficient/ when the space isn't too large (i.e. the measure is finite-valued).

Theorem (Unique extension) Suppose \(\mathcal{A}\subset 2^A\) is a \(\pi\)-system on \(A\), and \(\mu_1, \mu_2\) are two finite-valued measures on \((A,\sigma(\mathcal{A}))\) that agree when restricted to \(\mathcal{A}\cup \{A\}\). Then they are equal.

Proof Let \(\mathcal{D}=\{X\subset \sigma(\mathcal{A}) \; | \; \mu_1(X) = \mu_2 (X)\}\supset \mathcal{A} \cup \{A\}\). If we show \(\mathcal{D}\) is a \(d\)-system, we are done by the lemma. If \(B,C \in \mathcal{D}\) with \(B\subset C\), then since measures are additive and finite-valued we have \(\mu_1(C\setminus B) = \mu_1(C)-\mu_1(B) = \mu_2(C)-\mu_2(B) = \mu_2(C\setminus B)\). Similarly, if \(A_1, A_2,...\) are disjoint sets in \(\mathcal{D}\) then \(\mu_1(\bigsqcup_1^\infty A_i) = \lim_{n\rightarrow \infty} \sum_1^n \mu_1(A_i) =\lim_{n\rightarrow \infty} \sum_1^n \mu_2(A_i) = \mu_2(\bigsqcup_1^\infty A_i) \). \(\square\)

Constructing the extension

While \(\pi\)-systems uniquely determine the measure on the rest of the space, that usually isn't enough information to readily study the resulting measure. To define an extension constructively, we demand slightly more structure:

Definition A ring \(\mathcal{A}\) on \(A\) is a subset of \(2^A\) containing \(\emptyset\) that is closed under finite unions and set-difference.

Rings are closed under finite intersection and symmetric differences. In fact, \((\mathcal{A}, \Delta, \cap)\) is an algebraic ring with zero \(\emptyset\). Boolean algebras then correspond to rings with a unit (the set \(A\)).

It is clear that every boolean algebra is a ring, but a ring need not contain the whole set. Intuitively, a ring cannot 'climb' to the topmost level (with just finite unions) while a boolean algebra can. For instance, all finite subsets of \(\mathbb{N}\) form a ring which isn't a boolean algebra. Thus we are still demanding less information than a boolean algebra.

We claim that knowing how a measure behaves on a generating ring is enough to construct the rest of it:

Theorem (Carathéodory's Extension) Suppose \(\mathcal{A}\) is a ring on \(A\) and \(\mu: \mathcal{A}\rightarrow[0,\infty]\) is a countably additive set-function. Then \(\mu\) can be extended to a measure on \(\sigma(\mathcal{A})\).

Countably additive set-functions on rings are termed /pre-measures/.

Proof We define the outer measure \(\mu^*: 2^A\rightarrow [0,\infty] \) by
\[\mu^*(X) = \inf\left\{\sum_1^\infty \mu(A_i) \; | \quad A_i \in \mathcal{A}, \; X \subset \bigcup_1^\infty A_i\right\} \], (assuming \(\inf \emptyset = \infty\)).

The outer measure is increasing (trivially), and countably subadditive:

To see this, suppose \(X_1,X_2,...\) is a countable sequence in \(2^A\). If \(\mu^*(\bigcup_1^\infty X_i) < \infty\), then for any \(\epsilon>0\) and \(X_n\) there is an \(\mathcal{A}\)-cover \(A_{n1},A_{n2},...\) such that \(\mu^*(X_n) + \frac{\epsilon}{2^n} \geq \sum_{i=1}^\infty \mu(A_{ni})\). Then \(A_{mn}\) is an \(\mathcal{A}\)-cover of \(\bigcup_1^\infty X_i\), so we have \(\mu^*(\bigcup_1^\infty X_i) \leq \sum_{j=1}^\infty \sum_{i=1}^\infty A_{ji} \leq \epsilon + \sum_1^\infty X_i\). Since \(\epsilon>0\) was arbitrary, we get the required inequality.

\(\mu^*\) is an /extension/ of \(\mu\), i.e. they agree on \(\mathcal{A}\):

Suppose \(X\in \mathcal{A}\). Then for any \(\mathcal{A}\)-cover \(A_1,A_2,...\) of \(X\), countable subadditivity of \(\mu\) gives us \(\mu(X) \leq \sum_1^n\mu(A_n)\). Since this is true for all covers, it must be true for the infimum over all covers i.e. \(\mu(X)\leq \mu^*(X)\). But one of these covers is \(X,\emptyset, \emptyset, ...\) so \(\mu^*(X)\leq \mu(X)\).

We say \(M \in 2^A\) is \(\mu^*\)-measurable if \(\forall X \in 2^A, \; \mu^*(X) = \mu^*(X\cap M) + \mu^*(X \cap M^c)\). Let \(\mathcal{M}\) be the collection of all such sets. This contains \(\mathcal{A}\):

If \(A_0 \in \mathcal{A}\) and \(X\in 2^A\), then subadditivity gives us

\[\mu^*(X) \leq \mu^*(X\cap A_0) + \mu^*(X\cap A_0^c).\]

On the other hand, wlog \(\mu^*(X)<\infty\) and hence for any \(\epsilon>0\) there is an \(\mathcal{A}\)-cover \(A_1,A_2,...\) such that \(\mu^*(X) +\epsilon \geq \sum_1^\infty \mu(A_i)\). Then we have \(\mathcal{A}\)-covers given as \(X\cap A_0 \subset \bigcup_1^\infty (A_0\cap A_i)\), \(X \cap A_0^c \subset \bigcup_1^\infty (A_0^c \cap A_i)\). This immediately gives us

\[ \mu^*(X\cap A_0) + \mu^*(X\cap A_0^c) \leq \sum_1^\infty \mu(A_i\cap A_0) + \sum_1^\infty\mu(A_i\cap A_0^c) = \sum_1^\infty \Mu(A_i) \leq \mu^*(X) + \epsilon .\]

Since this holds for arbitrary \(\epsilon\), we are done.

\(\mathcal{M}\) is a \(\sigma\)-algebra:

To see it is a \(\pi\)-system, observe that \(\emptyset\in \mathcal{M}\) and if \(M,N\in \mathcal{M}\) then for any \(X \in 2^A\) we have

\begin{align*}
\mu^*(X) &= \mu^*(X \cap M) + \mu^*(X \cap M^c) \\
&= \mu^*(X\cap M \cap N) + \mu^*(X \cap M \cap N^c) + \mu^*(X \cap M^c )\\
&= \mu^*(X\cap M \cap N) + \mu^*(X \cap M \cap N^c) + \mu^*(X \cap (M \cap N)^c \cap M^c )\\
&= \mu^*(X\cap (M \cap N)) + \mu^* (X \cap (M\cap N)^c \cap M) + \mu^*(X \cap (M \cap N)^c \cap M^c) \\
&= \mu^*(X\cap (M\cap N)) + \mu^* (X\cap (M\cap N)^c)
\end{align*}

Hence it is closed under taking finite intersections. To see it is a \(d\)-system, see that is closed under taking complements from definition. Now if \(M_1, M_2, ...\) is a collection of disjoint \(\mu^*\)-measurable sets then for any \(X\in 2^A\), we have

\begin{align*}
\mu^*(X)&=\mu^*(X \cap M_1) + \mu^* (X \cap M_1^c) \\
&= \mu^*(X\cap M_1) + \mu^* (X\cap \underbrace{M_1^c \cap M_2}_{M_2}) + \mu^* (X \cap M_1 ^c \cap M_2^c) \\
&\vdots \\
&= \sum_1^n \mu^*(X\cap M_i) + \mu^* (X \cap (\bigsqcup_1^n M_i)^c)
\end{align*}

for all finite \(n\). Since \(\mu^*\) is increasing we have \(\mu^*(X\cap (\bigsqcup_1^nM_i)^c)\geq \mu^*(X\cap (\bigcup_1^\infty M_i)^c)\), i.e. \(\mu^*(X)\geq \sum_1^n \mu^*(X\cap M_i) + \mu^* (X\cap (\bigsqcup_1^\infty M_i)^c)\). This must also hold in the limit, and then using countable subadditivity we get \(\mu^*(X)\geq \sum_1^\infty \mu^*(X\cap M_i) + \mu^*(X\cap (\bigsqcup_1^\infty M_i)^c) \geq \mu^*(X\cap \bigsqcup_1^\infty M_i) + \mu^*(X\cap (\bigsqcup_1^\infty M_i)^c)\). On the other hand, subadditivity gives us \(\mu^*(X\cap \bigsqcup_1^\infty M_i) + \mu^*(X \cap (\bigsqcup_1^\infty M_i)^c) \leq \mu^*(X)\).

This simultaneously shows us \(\mu^*\) is countably additive, and hence a measure on \(\mathcal{M}\)! Since \(\mu\) extends to a measure on atleast one \(\sigma\)-algebra containing \(\mathcal{A}\), it extends to the smallest one, \(\sigma(\mathcal{A})\). \(\square\)

As we saw in the previous section, this extension is unique if it turns out that \(\mu(A)<\infty\). We can in fact do better, and allow cases where \(A\) is the analogue of countable infinities:

Definition A set-function \(\mu\) on \(A\) is \(\sigma\)-finite if \(A\) can be covered by countably many \(\mu\)-finite sets.

This helps avoid edge cases like for example the ring on \(\mathbb{R}\) generated by semi-open intervals \((a,b]\) where each interval has pre-measure \(\infty\). This can be extended in two ways- either let everything non-empty in the \(\sigma\)-algebra go to \(\infty\), or simply the counting measure (where singleton sets have measure \(1\)). Note that the second one doesn't arise from Caratheodory.

Lemma The extension given by Caratheodory's theorem is unique if the pre-measure is \(\sigma\)-finite.

Proof By \(\sigma\)-finiteness of \(\mu\), we have \(A = \bigcup A_i\) for countably many \(A_i \in \mathcal{A}\), such that \(\mu(A_i)<\infty\). By closure properties of the ring \(\mathcal{A}\), we can assume the sets are disjoint. Then for any \(i\), \(\mathcal{A}_i=\{X\cap A_i | X \in \mathcal{A}\}\) is a ring (in particular, a \(\pi\)-system) on \(A_i\) that generates the \(\sigma\)-algebra \(\sigma(\mathcal{A}_i)=\{X\cap A_i | X \in \sigma(\mathcal{A})\}\). The uniqueness theorem tells us that the extensions \(\mu|_{\mathcal{A}_i} \rightarrow \mu^*|_{\sigma(\mathcal{A}_i)} \) are unique. But then any \(X\in \sigma(\mathcal{A})\) can be written as \(\bigsqcup_1^\infty (X\cap A_i)\). Since the value of \(\mu^*\) is uniquely determined on each \(X\cap A_i \subset \sigma(\mathcal{A}_i)\), we are done. \(\square\)
