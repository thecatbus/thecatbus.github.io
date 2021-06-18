---
title: Why is Lambda Calculus
author: Parth
date: 5 October 2020
tags: foundations
---

<div class="teaser"> 
Alonzo Church's Lambda Calculus is what makes type-free functional programming work. A powerful model of computation, at its heart is a very simple abstract rewrite system-- a directed graph. This short article touches upon why Lambda-calculus might be a natural thing to think about, and presents an elegant proof of the Church-Rosser theorem.
</div>
<!--more-->

# Functions in Intention

In the Zermelo-Fraenkel view of mathematical foundations, sets are first-class objects. Everything you can talk about, can be encoded as a set-- sets are sets, ordered pairs $(a,b)$ are sets $\{\{a\},\{a,b\}\}$, and functions are sets of ordered pairs. A function, then, is nothing more than a dictionary which takes an object and associates it to exactly one other object almost artificially. This viewpoint is great for thinking about 'arbitrary' functions, permutations are great examples. But is that really all there is to it? When asked what is $2+3$ your computer does not open the $+$-dictionary and look up $(2,3)$, instead it takes the input and performs a series of logical operations on the input to convert it to the desired result. (Indeed, storing the entire $+$-dictionary is not even physically possible, let alone reasonable.)

And in intention, that is what you would expect a function to be-- a recipe, a rule of computation, a 'box' which takes in some object and spits out another (depending only on the input). This completely different approach to foundations of mathematics, where functions are first-class objects, led to what is called Lambda calculus. This provides a rich language where, unlike sets which are simple unordered lists, functions are living breathing objects that take arguments and can be composed. We then have a very powerful model of computation.

# The Language $\Lambda$

Suppose $\texttt{square}$ defines a function that takes in $x$ and spits out $x^2$. This 'rule applied to object' approach can be written symbolically in a variety of ways-

\begin{gather*}
\texttt{square}(x)=x^2 \\ \\
x\xrightarrow{\texttt{square}}x^2 \\ \\
\texttt{square}=\lambda x .x^2
\end{gather*}

The last one is due to Alonzo Church, who (quite arbitrarily) chose $\lambda$ to denote a quantifier that specifies what object the rule should be applied to. Church's notation has one notable advantage over the rest-- the name of the function and its description are separated and made equivalent; writing $(\lambda x. x^2)$ is the same as writing $\texttt{square}$. To see how powerful this is, contrast how the two systems would express the same fact:

\begin{gather*}
(\lambda x.x^2)3=9 \\ \\
\texttt{square}(x)=x^2, \quad \texttt{square}(3)=9
\end{gather*}

The latter system (which most mathematicians are used to) needs to introduce an arbitrary name to express even the simplest of facts, whereas Church's notation reduces the name to what it should be-- mere convenience. Multi-argument functions would then be written like $\texttt{sum}=\lambda xy.x+y$, a function that takes in two numbers and returns their sum. Frege realised that by letting the output itself be a function, this input-output correspondence could be made one-to-one while keeping all the expressive power. Then by partially applying $\texttt{sum}$ to a single argument $a$, we get another function $\texttt{sum}\, a = \lambda x. (x + a)$. This in turn means that the original function can be written as $\texttt{sum}= \lambda y . \texttt{sum}\, y \,(x) = \lambda y.\lambda x. x + y$. Although originally due to Frege, this idea of partially applying functions was rediscovered by Haskell Curry and is called _currying_: it says functions $X\times Y \rightarrow Z$ are the same as functions $X \rightarrow (Y \rightarrow Z)$. And this should be natural, for the first corresponds to $Z^{X\times Y}$ while the latter is $(Z^Y)^X$.

In principle, these ideas could lead to a foundation for all mathematics, solely in terms of functions and their application. The $\lambda$-calculus is an attempt at capturing this idea, that eventually paved the way for modern functional programming. This formalization by Alonzo Church gave, at the very least, an elegant notation for manipulating functions.

## Conventions

Still keeping the old convention, we choose to read $\lambda x y z .F$ as $\lambda x.(\lambda y.( \lambda z. F))$.
Left associativity is the natural convention to follow for application- $Fxyz=((Fx)y)z$.

<div class="definition">
<sc>Definition</sc> The set of $\lambda$-terms is defined inductively as:

- Variables are $\lambda$-terms.
- If $M,N$ are $\lambda$-terms then so is $MN$. Terms formed this way are called application terms.
- If $M$ is a $\lambda$-term and $x$ is a variable then $\lambda x . M$ is a $\lambda$-term. Terms formed this way are called abstraction terms.
</div>

This is a purely syntactic notion-- we now have a set of all possible terms made out of functions, abstraction and application. I like to think of application explicitly as a binary relation and compare the definition of $\lambda$-terms with how one would inductively define the set of terms for a given predicate logic.

## Term equivalence and Hyperintention

The question of when two functions are the same raises profound questions-- if your view is limited to the extensional perspective of functions-as-dictionaries, then it is reasonable to call two functions the same if they are the same dictionary. But what about the intentional variant, functions-as-rules? On the domain of all neutral atoms the functions $\texttt{Number_of_electrons}$ and $\texttt{Number_of_protons}$ have the same behaviour as dictionaries, but they are clearly different in intention. What about $\lambda x. (x+1)$ and $\lambda x.  (x+2-1)$? You know they mean the same thing, even though they appear different as rules. Lambda-calculus treats them differently, and is hence a hyperintensional theory. Since $\lambda$-terms are finite strings of symbols, we write $M\equiv N$ ($M$ is identical to $N$) if they correspond to exactly the same string.

This is more restrictive than it should be-- for $\lambda x. x$ and $\lambda y.y$ are not identical. Indeed, relabelling all occurrences of any bound variable should not change the meaning of the term. Call such a transformation (replacing all bound occurrences of $x$ in $M$ with $y$) an $\alpha$-reduction. Call two terms $\alpha$-equivalent if there is a sequence of alpha reductions from one to the other. In abuse of notation, I shall use $\equiv$ to denote this relation henceforth. We shall also assume that no term shall have a variable occuring as both free and bound (by applying enough $\alpha$-reductions to ensure this is true.)

Similarly one would naturally expect $\lambda x. (Mx)$ to be the same function as $M$, however they are syntactically very different. Hence we introduce the notion of an $\eta$-reduction: if $T$ is a term, we replace some subterm of form $\lambda x.(Mx)$ with $M$.

# Computation

The final reduction in our toolbox is what enables us to use our functions, by allowing them to accept inputs. If $M$ and $N$ are $\lambda$-terms, we write $[N/x]M$ for the term obtained by replacing every free occurence of $x$ inside $M$ with $N$. Thus if $x$ is bound in $M$ then $[N/x]M\equiv M$. 

The quantifier $\lambda$ and the binary relation of application work in synchrony-- application indicates that the second term acts as an argument to the first, and abstraction with $\lambda$ binds that argument to some variable. This forms the most important computational step in $\lambda$-calculus, a $\beta$-reduction. In particular, the term $(\lambda x.M )N$ $\beta$-reduces to $[N/x]M$. 

More generally for a term $T$, call a subterm a $\beta$-redex if it has form $(\lambda x. M )N$. We say there is a $1$-step $\beta$-reduction from $T$ to $T'$ (written $T\rightarrow_{1\beta} T'$) if $T'$ is obtained by replacing a single $\beta$-redex $(\lambda x. M) N$ in $T$ with $[N/x]M$. Write $\rightarrow_{*\beta}$ for the transitive closure.

Terms without $\beta$-redexes are said to be $\beta$-normal or $\beta$-irreducible. If $M\rightarrow_{*\beta}N$ and $N$ is $\beta$-normal, we say $N$ is a $\beta$-normal form of $M$.

These relations (and their equivalence closures) form an abstract rewriting system, and a very powerful model of computation. A $\lambda$-computation involves simply walking down the so-created digraph, and any relevant problem could be appropriately encoded in the terms such that walking down the tree would mean successively simplifying the problem and working towards a solution. Let us encode a very simple system as an example:

## A model of Boolean algebra

Since Boolean algebra revolves around two truth-values, one possible way to encode them is in the form of a choice:

$$\texttt{True}=\lambda xy.x \quad \quad \texttt{False}=\lambda xy.y$$

This has the advantage that one can encode "$\texttt{if} \; P \; \texttt{then} \; Q \; \texttt{else}\;R$" simply as the term $PQR$: if $P$ is $\texttt{True}$ then the term automatically $\beta$-reduces to $Q$. The following are possible encodings of the logic gates: I encourage you to verify they work as intended.

\begin{gather*}
\texttt{Not}=\lambda x. x \; \texttt{True} \; \texttt{False} \\
\texttt{And} = \lambda x y . x \; (y \; \texttt{True} \; \texttt{False})\; \texttt{False} \\
\texttt{Or}=\lambda x y . x \; \texttt{True} \; (y \; \texttt{True} \; \texttt{False})
\end{gather*}

<div class="block">
<sc>Exercise</sc> Encode $\texttt{Xor}$, $\texttt{Implies}$, $\texttt{Equal}$, $\texttt{Equivalent}$.
</div>

## Consistency

A natural question that arises is the meaningfulness of this computation-- it is not a very useful system if it cannot distinguish between $\texttt{True}$ and $\texttt{False}$. We need some notion of consistency. Of course $\lambda$-calculus is not a logical theory so it does not make sense to ask if it proves false statements. We can however generalise the principle of explosion to call the theory _inconsistent_ if it equates all pair of terms.

Since each reduction corresponds to a logical simplification, we see that two $lambda$-terms are equivalent if they lie in the same connected component of the directed graph. Church and Rosser proved the remarkable result that there is a natural injection $$\{\beta-\texttt{irreducible terms}\}\rightarrow \{\texttt{connected components of the graph}\}$$ i.e. each connected component of the graph has at most one irreducible term, to which every point in the component can be reduced. It immediately follows that distinct $\beta$-normal forms like $\texttt{True}$ and $\texttt{False}$ cannot be equated, and the model of computation is consistent. The result is called the Church-Rosser Theorem.

# The Church-Rosser Theorem

An abstract rewriting system (such as $\lambda$-calculus) is a relation $\rightarrow$ on a set of points, thereby forming a directed graph. We say $y$ is a _successor_ of $x$ (written $x \xrightarrow{*} y$) if there is some finite sequence of reductions from $x$ to $y$ (including $x\xrightarrow{*}x$). Points $x$ and $y$ are _connected_ (written $x \overset{*}{\leftrightarrow} y$) if they are connected on the undirected graph (formed by forgetting directionality of $\rightarrow$). Points $x$ and $y$ are _joinable_ (written $x \downarrow y$) if they have a common successor.

<div class="definition">
<sc>Definition</sc> We say $\rightarrow$ has the _Church-Rosser Property_ if any two connected points are joinable. In symbols, $x \overset{*}{\leftrightarrow} y \Rightarrow x \downarrow y$. </div>

Our task is then to precisely show that $\beta$-reduction has the Church-Rosser property.  We show that the Church-Rosser property is equivalent to a simpler property, confluence.

<div class="definition">
<sc>Definition</sc> A reduction $\rightarrow$ is _confluent_ if for every $x,y_1,y_2$ such that $y_1 \xleftarrow{*}x \xrightarrow{*} y_2$ there is a $z$ such that $y_1 \xrightarrow{*}z\xleftarrow{*} y_2$. </div>

In other words, all diversions eventually meet in a confluent system. This should be a natural property to desire in your rewrite system-- think about how you simplify $1 \times 2 + 3 \times 4$: there are two distinct redexes $1\times 2$ and $3 \times 4$, but the choice of which way you go does not influence the final answer.

<div class="theorem">
<sc>Lemma</sc> The Church-Rosser property is equivalent to confluence, i.e. a reduction is confluent iff it has the Church-Rosser property.
</div>

<div class="proof">
<sc>Proof</sc> It is clear that confluent systems have the Church-Rosser property. For the converse, observe that if $x\overset{\ast}\leftrightarrow y$, then there are points $x_1,x_2,...,x_n$ (not necessarily distinct) such that $x\xleftarrow{\ast}x_1\xrightarrow{\ast}x_2\xleftarrow{\ast}x_3\xrightarrow{\ast}...\xrightarrow{\ast}y$. Now the Church-Rosser property allows us to 'complete the squares' as in the figure: 
<img src="../images/Confluence-iff-CR.png" width=900"/> 
Repeatedly using this gives a $z$ such that $x\xrightarrow{\ast}z\xleftarrow{\ast}y$. $\square$
</div>
 
<div class="theorem">
<sc>Theorem</sc> (Church-Rosser) $\beta$-reduction is confluent.
</div>

In what follows, we reconstruct a proof due to [Komori, Matsuda and Yamakawa](https://www.jstor.org/stable/43651794), who improved upon Takahashi's elegant proof using the idea of parallel reductions. Since a diversion is created only when a term has multiple redexes, we employ the key idea of a Takahashi translation, which involves reducing all $\beta$-redexes in a term simultaneously.

<div class="definition">
<sc>Definition</sc> The Takahashi translation $T^*$ of a term $T$ is defined inductively on the set of terms as:
\begin{align*}
x^* &\equiv x \\
((\lambda x. M)N)^* &\equiv[N^*/x]M^* \\
(MN)^* &\equiv M^*N^* \\
(\lambda x. M)^* &\equiv \lambda x. M^* 
\end{align*}
(Rules higher up in the list are prioritized.) 

We write $M^{n*}$ for $n$ Takahashi translations successively applied to $M$.
</div>

This interacts well with $\beta$-reductions:

<div class="theorem">
<sc>Lemma</sc> If $M$ is a term and $M^*$ is its Takahashi translation then there is a reduction $M \rightarrow_{*\beta} M^*$.
</div>

<div class="proof">
<sc>Proof</sc> We induct on $\lambda$-terms: if $M$ is a variable, then there is a $0$-step reduction from $M$ to $M^*$. 

Suppose the result is true for all terms with lower complexity than $M$, then 

- If $M \equiv \lambda x. P$, then $M \equiv \lambda x.P$ which reduces to $\lambda x. P^*$ by taking a proof of $P \rightarrow_{*\beta}P^*$ and prepending $\lambda x.$ to each step.
- If $M \equiv P Q$ for $P$ not an abstraction term, then $M \equiv PQ \quad  \rightarrow_{*\beta}\quad P^* Q \quad \rightarrow_{*\beta} \quad P^*Q^* \equiv M^*$.
- If $M \equiv (\lambda x. P) Q$, then the induction hypothesis gives the reductions $M \equiv (\lambda x.P)Q \quad \rightarrow_{*\beta} \quad (\lambda x.P) Q^* \quad \rightarrow_{*\beta} \quad (\lambda x.P^*) Q^*$. Applying a single $\beta$-reduction to this term gives $[Q^*/x]P^*\equiv M^*$. $\square$
</div>

<div class="theorem">
<sc>Corollary</sc> If $m\leq n$ then $M^{m*} \rightarrow_{*\beta} M^{n*}$.
</div>

Moreover, Takahashi translations preserve the digraph structure: this should be intuitive since Takahashi translations simply specify an order for $\beta$-reductions, by dictating that you do not touch a newly created redex until you have exhausted all redexes at the base level. 

<div class="theorem">
<sc>Lemma</sc> If $M$ and $N$ are $\lambda$-terms such that $M \rightarrow_{1\beta} N$, then $M^* \rightarrow_{*\beta} N^*$
</div>

<div class="proof">
<sc>Proof</sc> We prove this by induction, considering the forms $M$ and $N$ could have and assume the statement is true for lower complexity terms.

- If $M \equiv \lambda x. P$, then $N \equiv \lambda x. P'$ for $P\rightarrow_{1\beta} P'$. Then the induction hypothesis says $P^* \rightarrow_{*\beta} P'^*$, and prepending $\lambda x.$ to each term gives a proof of $M^* \equiv \lambda x. P^* \rightarrow_{*\beta} \lambda x. P' ^* \equiv N^*.$
- If $M \equiv PQ$ for $P$ not an abstraction term, then we can have  
    - $N \equiv P' Q$  where  $P \rightarrow_{1\beta} P'$, $P'$ not an abstraction term. Take the reduction $P^* \rightarrow_{*\beta} P'^*$ and append $Q^*$ at each stage.
    - $N \equiv (\lambda x. P') Q$ where $P \rightarrow_{1\beta} \lambda x. P'$. Then $M^* \equiv P^* Q^* \rightarrow_{*\beta} (\lambda x. P'^*) Q^*$, which reduces to $[Q^*/x] P'^* \equiv N^*$.
    - $N \equiv PQ'$ where $Q \rightarrow_{1\beta}Q'$. Take the reduction $Q^* \rightarrow_{*\beta} Q'^*$ and prepend $P^*$ at each stage.
- If $M \equiv (\lambda x.P)Q$, we can have:

    - $N \equiv (\lambda x. P') Q$ for $P \rightarrow_{1\beta} P'$. Take a proof of $P^* \rightarrow_{*\beta} P'^*$ and replace each $x$ with $Q^*$ to get a proof of $M^* \equiv [Q^*/x] P^* \rightarrow_{*\beta} [Q^*/x] P'^* \equiv N^*$.
    - $N \equiv (\lambda x. P) Q'$ for $Q \rightarrow_{1\beta} Q'$. There are finitely many occurrences of x \in $P$, so finitely many occurrences of $Q^*$ in $M^*$. Each occurrence can be reduced to $Q'^*$ in finitely many steps, so we have $M^* \equiv [Q^*/x]P^* \rightarrow_{*\beta} [Q'^*/x] P^* \equiv N^*$.
    - $N \equiv [Q/x] P$: if $Q$ is not an abstraction term, then it can be observed that $[Q^*/x]P^* = ([Q/x]P)^*$. If $Q \equiv \lambda y. R$, then $M^* \equiv [\lambda y. R^* /x] P^* $ can have finitely many new redexes arising from occurrences like $\dots xT \dots$, each of which can be reduced further to get to $([\lambda y.R/x]P)^*$. (This can, and should be formally proven by induction on structure of $P$).  $\square$
</div>

<div class="theorem">
<sc>Corollary</sc> $M \rightarrow_{*\beta} N \Rightarrow M^{n*} \rightarrow_{*\beta} N^{n*}$
</div>

Lastly, we show that it is possible to 'extend' every single-step $\beta$-reduction to an entire Takahashi translation at that level.

<div class="theorem">
<sc>Lemma</sc> If $M$ and $N$ are $\lambda$-terms with $M \rightarrow_{1\beta} N$ then $N\rightarrow_{*\beta} M^{*}.$
</div>

<div class="proof">
<sc>Proof</sc> $M*$ obtained by reducing all redexes at the current level, while $N$ is obtained by reducing a single redex. $\square$
</div>

This can be generalised to the case $M \rightarrow_{n\beta} N$, but we have to keep in mind that all the reductions need not be on the same level if we create new redexes at each stage. Keeping that in mind, we have

<div class="theorem">
<sc>Lemma</sc> If $M$ and $N$ are $\lambda$-terms and $n\geq 0$ is such that $M \rightarrow_{n\beta} N$ then $N\rightarrow_{*\beta} M^{n*}$.  </div>

<div class="proof">
<sc>Proof</sc> By induction on $n$, clearly true for $n=0$. Assume true for $n$, then $M\rightarrow_{(n+1)\beta} N\Rightarrow M \rightarrow_{1\beta}R\rightarrow_{n\beta}N$ for some $R$. Using induction hypothesis, $N\rightarrow_{*\beta} R^{n*}$. Moreover, $M\rightarrow_{1\beta}R\Rightarrow R\rightarrow_{*\beta}M^*\Rightarrow R^{n*}\rightarrow_{*\beta}M^{(n+1)*}$. Then $N \rightarrow_{*\beta} M^{(n+1)*}$ $_\square$.
</div>

We are now ready to prove the confluence of $\beta$-reduction: 
<div class="theorem">
<sc>Theorem</sc> (Church Rosser) If $M, M_1, M_2$ are $\lambda$-terms such that $M \rightarrow_{*\beta}M_1$ and $M \rightarrow_{*\beta}M_2$, then there is a $\lambda$-term $N$ such that $M_1 \rightarrow_{*\beta}N$ and $M_2 \rightarrow_{*\beta}N$. In other words, $\beta$-reduction is confluent.
</div>

<div class="proof">
<sc>Proof</sc> Suppose $M \rightarrow_{m\beta} M_1$ and $M\rightarrow_{n\beta} M_2$ and wlog $n\geq m$. Then $M_2\rightarrow_{*\beta}M^{n*}$, and $M_1 \rightarrow_{*\beta} M^{m*}\rightarrow_{*\beta}M^{n*}$. $_\square$
</div>

We have thus proved one of the most important results about $\lambda$-calculus, that the computations it does are consistent. It is immediate that each term has at-most one normal form, and thus the job of the computation is to get there. For instance, we have a very elegant computer that can simplify Peano-arithmetic expressions.

# Encoding Peano arithmetic

We look at one possible encoding of $\texttt{0}$ and $\texttt{Succ}$, the Church encoding, from which the rest of Peano arithmetic follows naturally.

$$\texttt{0}= \lambda f x. x \quad \quad \texttt{Succ}=\lambda n. \lambda f x. f(nfx)$$

Essentially, the 'natural number' $\texttt{n}$ takes a function and a value as inputs, and applies the function $n$ times to the value. From this I can immediately write $\texttt{1}=\texttt{Succ}\; \texttt{0}$, and

$$\texttt{Add}=\lambda m n. m\;\texttt{Succ}\; n \quad \quad \texttt{Mult}=\lambda mn. m \; (\texttt{Add} \; n )\; \texttt{0} \quad \quad \texttt{Exp}=\lambda mn. n \;(\texttt{Mult} \; m) \;\texttt{1}.$$

<div class="block">
<sc>Exercise</sc> Encode the above directly, without referring to previously defined operations. You should discover the rather curious and simple form $\texttt{Exp}=\lambda m n . n \; m.$
</div>

<div class="block">
<sc>Difficult</sc> Encode $\texttt{Pred}$ and hence $\texttt{Minus}$.
</div>

A function $F:\mathbb{N}\rightarrow\mathbb{N}$ is said to be $\lambda$-computable if it has an encoding $f$ such that one can $\beta$-reduce $f x$ to $F(x)$. Turns out the set of all $\lambda$-computable terms is exactly the set of all Turing-computable functions, so the $\lambda$-calculus is exactly as strong as a Turing machine. This result is the _Church-Turing thesis_.

## Loop = Loop

The simplicity of $\lambda$-calculus is what makes it expressive, but also non-terminating. Not everything necessarily has a normal form, for instance the term $\texttt{loop} = (\lambda x. \, x x) (\lambda x. \, x x)$ is a fixed point of $\beta$-reduction (such programs that evaluate to themselves are termed _[Quines](https://en.wikipedia.org/wiki/Quine_(computing))_.) More generally, you have the powerful fixpoint combinator $\texttt{Y}= \lambda f. \; ( \lambda x. \, f (x x)) \,  (\lambda x. \, f (x x))$ which takes a function and returns a fixed point for it (check this!). 

These recursive terms however lead to problems-- especially if you are Haskell Curry, trying to investigate the foundations of mathematics. If $\Lambda$ (or its sister theory, Combinatory logic) provided for sound mathematical foundations, we would have a $\lambda$-term $\texttt{P}$ that acted like logical implication-- $\texttt{P}xy$ would have to correspond to $x \supset y$, and $\texttt{P} x x$ would have to be true for all $x$. The theorem $x \supset (x \supset y) \Rightarrow x \supset y$ of logic would mean $\texttt{P}x(\texttt{P}xy) = \texttt{P} x y$ would also be true. Then for any $z$, we can construct the $\lambda$-term $N = \lambda x. \texttt{P} \, x z$, which checks if $x$ implies $z$. The $\texttt{Y}$-combinator gives a fixed point for this, call it $M = \texttt{Y} N = NM$. Now starting from the axiom $\texttt{P} M M$, we have the following sequence of simplifications:
\begin{align*}
\texttt{P}MM &= \texttt{P}M(NM) \\
&= \texttt{P}M ((\lambda x. \texttt{P} x z) M ) \\
&= \texttt{P}M(\texttt{P}Mz) \\
&= \texttt{P} Mz \\
&= NM  \\
&= M
\end{align*}

But then from the same axiom we have derived both $\texttt{P}Mz \;( M \supset z)$ and $M$, and hence $z$ which was arbitrary to begin with. The system could then prove every statement and hence be utterly useless, much to Mr. Curry's disappointment. This is an instance of _Curry's Paradox_, and in words it reads "If this sentence is true, then $z$". At the heart of the paradox is self-reference, which lives in $\texttt{Y}$-- aptly called Curry's paradoxical combinator.

Such ill-foundation spells disaster, and a considerable part of the development of foundational theories is spent getting rid of self-reference. ZFC did it by the axiom of foundation, while those who preferred a functional world came up with a system of Types. But this should be the subject matter of  another post.
