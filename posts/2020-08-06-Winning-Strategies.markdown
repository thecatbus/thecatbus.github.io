---
title: Winning Strategies
author: Parth
date: 6 August 2020
tags: combinatorics
---

<div class="teaser"> 
The summer of 2020 found me working on set theoretic questions with Dr Thomas Forster-- one of the first tasks he set me was to read about Conway's Sylver Coinage. This simple question opens up a discussion of the theory of Gale-Stewart games, where two players take turns to build infinite sequences of natural numbers. The winner is decided based on whether or not the resulting sequence has some property-- and knowing things as simple as the cardinality of all winning configurations can reveal a lot about whether the game has a winning strategy, i.e. is rigged in favour of one of the players. 
</div>
<!--more-->

# The Mintmaster and her Apprentice

The following question was posed by John Conway in chapter 18 of _Winning Ways_.

<div class="block">
<sc>Sylver Coinage</sc> The mintmaster (Alice) and her apprentice (Bob) take turns quoting denominations of coins greater than 1, on the condition that the denomination of any new coin should not be achievable by using combinations of previous coins. The first person with no playable move loses. Is there a winning strategy?
</div>

In other words, the players take turns naming positive integers greater than 1 that are not the sum of non-negative multiples of previously named integers; the first one to not be able to do so loses. This is a two-player game of _perfect information_-- both players know everything about what has been played and what can be played, and there is no chance involved. The players alternate playing natural numbers, building a possibly infinite sequence (called a _play_ of the game) in the process. 

The entire game can then be encoded as a _game tree_: a directed graph whose nodes are tuples in $\mathbb{N}^{<\omega}$, which represent truncations of the plays at various points in time. The edges of the graph represent moves, so the progress of a play can be tracked by walking down the graph. For example, $()\rightarrow(2)\rightarrow(2,3)$ is a relatively short play in which Alice loses. Odd length plays will then correspond to wins for Alice, and even length plays will correspond to wins for Bob. Plays that last forever will have to be declared a draw, in which case the notion of a 'winning strategy' makes no sense.

# Termination?

It is not obvious at all if this game will even end always: it is clearly unbounded, since given any $N\in \mathbb{N}$ it is possible to have a game of length $N+1$, simply by looking at the play $(N+2,N+1,N,...,2)$.

<div class="block">
<sc>Exercise</sc> Show that Sylver coinage is unboundedly unbounded, i.e. for any $N\in \mathbb{N}$ it is possible to play $N+1$ moves without making the game bounded.
</div>

A natural thing to try is looking at coprime numbers and using Bezout's theorem, an elementary number theoretic result which says that two integers $m$ and $n$ are co-prime if and only if there are integers $p,q$ such that $pm+qn=1$. Suppose two of the moves are co-prime integers $m,n$ ($>1$) then there are non-negative integers $p,q$ with $pm-qn=1.$ Given an integer $M\geq q(q-1)n$, we can find integers $r\geq q(q-1)$ and $0\leq s \leq n-1$ such that
$$M =rn+s= rn + s(pm-qn) = \underbrace{sp}_{\geq 0}m + \underbrace{(r-sq)}_{\geq 0}n.$$
Hence if any two moves are coprime, the game immediately becomes bounded. The bound we have found is rather weak: James Joseph Sylvester (after whom the game is named) proved that if $m,n$ are co-prime positive integers, $(m-1)(n-1)-1$ is the largest integer that cannot be written as a sum of non-negative multiples of $m$ and $n$.

We don't need to limit ourselves to pairwise co-prime plays. A natural extension of Bezout's theorem is the fact that for positive integers $a_0,...,a_n$, it is possible to choose non-negative integers $p_1,...,p_n$ such that
$$\gcd(a_0,...,a_n)=p_0a_0+p_1a_1+...+p_{n-1}a_{n-1}-p_na_n.$$
(Proving this result is a simple exercise in induction.) Then the same analysis as above can be used to show that the game becomes bounded as soon as the $\gcd$ of all the moves becomes 1. 

More generally, if the first $n+1$ moves are $a_0,...,a_{n}$ then the allowable moves are restricted to only finitely many multiples of $\gcd(a_0,...,a_{n})$, or non-multiples of the $\gcd.$ Let $\phi(a_0,...,a_{n})$ denote the number of multiples of $\gcd(a_0,...,a_{n})$ that are allowable next moves. Define a function on the nodes of the game-tree by $\Phi(a_0,...,a_{n})=(\gcd(a_0,...,a_{n}),1+\phi(a_0,...,a_n)).$ One of two things can happen:

- the next integer played $a_{n+1}$ is a multiple of $\gcd(a_0,...,a_n)$. Then $\gcd(a_0,...,a_{n+1})=\gcd(a_0,...,a_n)$ and $\phi(a_0,...,a_{n+1})<\phi(a_0,...,a_n)$,

- or the next integer played $a_{n+1}$ is any non-multiple of $\gcd(a_0,...,a_n)$, and necessarily $\gcd(a_0,...,a_{n+1})<\gcd(a_0,...,a_n)$.

In either case, we can say that $\Phi(a_0,...,a_{n+1})< _{lex}\Phi(a_0,...,a_{n})$ where $< _{lex}$ is the lexicographic order on $\mathbb{N}^2$.
Thus $\Phi$ is a monotone decreasing function from the game-tree to $(\mathbb{N}^2,<_{lex})$. Since the latter is a well-order, it is clear that any play of Sylver coinage must be finite: any infinite play would give an infinite descending chain in $\mathbb{N}^2$. Thus the game terminates, and accordingly one of the players must win-- there can be no ties.

<div class="remark">
<sc>Remark</sc> If there is one thing you take away from what we have done so far, it is the neat trick of finding some monotone function into a known well-order to show that a chain terminates. In fact this is not a mere 'trick' but a reflection of the deeper fact that there is always a monotone function from any terminating chain into the canonical well-order of the ordinals. Infact, the ordinals are the terminal object in the category of well-founded relations, where the morphisms are _parsimonious monotone functions_.
</div>

# More general games

We can now talk about if it is always possible to force a win in a play of Sylver coinage. In fact, we can talk about this in a more general setting of _Gale-Stewart games_:

<div class="definition">
<sc>Definition</sc> A _Gale-Stewart game_ is a two-player game of perfect information where the players take turns to build an infinite sequence of natural numbers, called a _play_ of the game. The first player is said to win if the play is an element of a _payoff set_ $A\subseteq \mathbb{N}^\omega$, and the second player wins otherwise. 
</div>

Conventionally, player one and player two will be referred to as Alice and Bob respectively.

Since the game is entirely determined by the payoff set, we denote the game by $G(A)$. Such games can be encoded, like Sylver coinage, in game-trees which necessarily are non-terminating here. How could this definition be of any use? Most games we care about don't allow unrestricted moves-- but we can get around that by declaring the first player to make an illegal move automatically lost. What about terminating games? The solution is simple-- just imagine the players kept playing even after there were no legal moves left. The player who lost has to make the first illegal move, and so still loses in the 'infinite' play. Thus the notion of a Gale-Stewart game is very broad, and can be used to talk about most two player games as long as the moves can be encoded as natural numbers.

# Winning the game

A _strategy_ for Alice is a function on even-length tuples that determines the next move (a strategy for Bob is defined likewise, on odd-length tuples.) Strategies just encode the players responses to each situation, and making aggressively bad moves is also a strategy as is the strategy given by a constant function $- \mapsto 1$. A winning strategy is a strategy using which the player can win, no matter what the other player responds with. An intelligent player will, then, always play according to a winning strategy if there is one. A game is _determined_ if one of the players has a winning strategy, its called so because if two intelligent players play the game the outcome is already determined. Some results are natural-- for instance, if the payoff set is too small in relation to all possible plays ($\mathbb{N}^\omega$), then Alice cannot have a winning strategy.

<div class="theorem">
<sc>Theorem</sc> If $A\subset \mathbb{N}^\omega$ is a countable payoff set, then the game $G(A)$ is determined.</div>
<div class="proof">
<sc>Proof</sc> We use Cantor's diagonalization argument to construct a strategy for Bob. Write $A=\{(a_{i,1},a_{i,2},...)|i=1,2,...\}.$ He then plays so that the $2i^\text{th}$ number in the play is $(a_{2i,2i}+1)$. The play then cannot be a member of the payoff set, hence Bob wins. $\square$
</div>

Thus countable payoff sets are always determined. Assuming the continuum hypothesis, this says that player one has a winning strategy only if the payoff set has cardinality $2^{\aleph_0}$. This result is in fact true even without assuming the continuum hypothesis.

Terminating games correspond to _decidable_ payoff sets-- a set $A\subset \mathbb{N}^\omega$ is decidable if for any $\bar{a}\in \mathbb{N}^\omega$, a finite initial segment of $\bar{a}$ determines whether $\bar{a}\in A$ or $\bar{a}\in \mathbb{N}^\omega \setminus A$. To show all decidable sets are determined, we will use the notion of a _position_ being determined. 

Observe that given any node $s$ of the game-tree, the subtree with root at $s$ itself determines a game (all plays of the game have $s$ appended at the start.) Restricting the payoff set to this subtree, we can ask if there is a winning strategy for either player in the subtree, if there is one we will call the position (node) determined in favour of that player. Colour a node red if it is determined in favour of Alice, and blue if it is determined in favour of Bob. Then the basis of our proof relies on determinacy of nodes propagating up the tree.

(Terminology: node $s$ is a 'direct successor' of node $t$ in the directed graph if there is an edge from $s$ to $t$.)

<div class="theorem">
<sc>Theorem</sc> If $A\subset \mathbb{N}^\omega$ is decidable, then the game $G(A)$ is determined.
</div>

<div class="proof">
<sc>Proof</sc> Since the game terminates, the end positions are determined in favour of the winner and every end position has a colour. Call a position _even_ if it is Alice's chance to move (i.e. the associated tuple has even length), call it _odd_ otherwise. Propagate determinacy up the tree as follows:
if an even posion has a direct successor which is coloured red, then the position itself is determined in favour of Alice (since she can just move to the red node and force a win from there). If all the successors are coloured blue, then there is nothing she can do to win and the node itself is determined in favour of Bob. Likewise for odd nodes.
Now every node above the end positions must be determined in favour of one of the players, and this is true for the empty node (start of the game) as well-- thus the game itself is determined. $\square$
</div>

We have thus answered Conway's question-- Sylver coinage is determined. It is a powerful results with many restatements, my favourite one being the following:

<div class="block">
<sc>Exercise</sc> Show that for any $X\subset \{1\}^\ast$, the language $X^\ast$ is regular.
</div>
In the rest of the article we will try to extend the above ideas.

# The Gale-Stewart Theorem

Phrased differently, the proof of determinacy of decidable sets goes as follows: if the game is terminating and Alice does not have a winning strategy, then at every stage there is something Bob can do so that Alice cannot force a win; and since the game is terminating this must mean that it is a win for him. This idea can be used to study determinacy of semi-decidable sets, i.e. sets whose membership can be determined in a finite time but the membership of their complements might take infinite time to verify. A rather silly example of a Gale-Stewart game with a semi-decidable payoff set is the game where the two players build an infinite sequence, and player one wins if an even number is played at any stage (player two wins otherwise.) Of course, this is determined because player one simply has to play $2$ on her first move.

<div class="theorem">
<sc>Theorem</sc> (Gale-Stewart, 1953) If $A\subset \mathbb{N}^\omega$ is semi-decidable, then the game $G(A)$ is determined.
</div>

<div class="proof">
<sc>Proof</sc> Since the payoff set $A$ is semi-decidable, Alice wins if and only if she manages to move to a red coloured node in finite time. If Alice has a winning strategy, there is nothing to show. Otherwise, Alice has no winning strategy in $G(A)$ and we can build a strategy for Bob that avoids red nodes inductively as follows: if it is Alice's turn on a non-red node, she cannot move to a red node. Since none of the nodes Alice reaches are red, they must all have atleast one non-red direct successor, so Bob can move to that non-red node. Since the base case (root of the game-tree) is not red by assumption, Bob has a strategy that will never reach a red node in finite time, and thus the game is determined in favour of Bob. $\square$
</div>

A notable feature of the above proof has been the role of quantifiers for the two players-- when constructing a strategy for Bob, moves for Alice used universal quantification (because an intelligent player loses only if every possible move is bad), while moves for Bob used existential quantification (since he needs atleast one good move to win.) A game where Bob has a winning strategy thus encodes an infinite sentence starting with $\forall x_0. \exists y_0.\forall x_1. \exists y_1...$ This idea finds a lot of applicability in maths, especially in Model Theory where Ehrenfreucht-Fraisse games are used to build elementary equivalences between structures.

<div class="remark">
<sc>Remark</sc> In real analysis, this also provides a neat way to think about continuity of a function $f$ at $0$, in the form of a finite game of length two where Alice quotes an $\epsilon>0$ and Bob has to respond with a $\delta>0$, and the payoff set is $\{(\epsilon,\delta)|\exists x. |x|<\delta \wedge |f(x)-f(0)|>\epsilon\}$. If Bob has a winning strategy, then the function is continuous!

This is indeed a Gale-Stewart game despite being played over $\mathbb{R}^\omega$ instead of $\mathbb{N}^\omega$-- the two sets have the same cardinality so we can simply pick an encoding of real sequences. 
</div>

Switching the roles of Alice and Bob in the proof of Gale-Stewart theorem, we can show that sets with semi-decidable complements are also determined. In fact, the semi-decidable subsets form a topology on $\mathbb{N}^\omega$: the _Baire_ topology.

1. $\emptyset$ and $\mathbb{N}^\omega$ are clearly semi-decidable (in fact decidable.)
2. If $\{A_i\}_{i\in I}$ is a family of semi-decidable sets, and for a sequence $x$ the problem $x\overset{?}{\in}A_i$ can be determined in time $t_i \leq \infty$ then the problem $x\overset{?}{\in}\bigcup A_i$ is determined in time $\min_i(t_i)$. This corresponds to running all the Turing Machines in parallel, till one of them succeeds.
3. If $A_1$ and $A_2$ are semi-decidable sets such that the problem $x\overset{?}{\in}A_i$ is solved in time $t_i \leq \infty$, then the problem $x\in A_1\cap A_2$ is solved in time $t_1+t_2$. This corresponds to running the Turing Machines in sequence, starting one after the previous succeeds.

The connection between semi-decidability and topology of open sets is in fact deeper than that, in some sense a topology generalises the idea of semi-decidability. (See [here](https://xorshammer.com/2011/07/09/a-logical-interpretation-of-some-bits-of-topology/).)

The Gale-Stewart theorem then says that games with open (and closed) payoff sets are determined. Generalization of this result involves climbing up the _Borel heirarchy_-- the first layer is that of open and closed sets, and climbing up each layer involves taking closures of all previous levels under countable unions and intersections. Let us try going one level up-- a countable intersection of open sets is not guaranteed to be open (or closed). It is, however, guaranteed to be determined.

<div class="theorem">
<sc>Theorem</sc> If $(A_i)_{i\in \mathbb{N}}$ is a countable collection of open sets then $\bigcap_i A_i$ is determined.
</div>

<div class="proof">
<sc>Proof</sc> Since each $A_i$ is open, it comes with an associated colouring of the game tree (a node is red if Alice has a winning strategy from there, blue if Bob does). To win $\bigcap_i A_i$ means to win every $A_i$, to lose $\bigcap_i A_i$ means to lose any one of them. We think from Bob's perspective, colouring the nodes from which he has a definite winning strategy blue. An even node (Bob's turn to move) is blue in $\bigcap_i A_i$ if it is blue in some $A_n$, because from that point he can pretend he is playing $A_n$ and win $\bigcap_iA_i$. If every direct successor of an odd node is blue in some $A_i$ (not necessarily the same one) then whatever move Alice makes, she will land on a blue node in some $A_n$, hence Bob can pretend he is playing $A_n$ from that point and win the game. Propagating this half-colouring, if the root node is blue then Bob has a winning strategy in $\bigcap_i A_i$. 

If it is uncoloured, then Alice has a strategy $\sigma$ that keeps the game on uncoloured nodes. Now uncoloured nodes are red in every game, and all the $A_i$s are open (semi-decidable) so by playing according to $\sigma$ she wins any $A_i$ in a finite time $t_i<\infty$. Thus as the play continues (for infinite moves), every $t_i$ will have been passed so by playing with $\sigma$ Alice will have won every single $A_i$. Thus uncoloured nodes are in fact, red in $\bigcap_i A_i.$ $\square$
</div>

The assumption that each individual game is open is crucial, since the fact that they all can be won in some finite time implies that Alice will have won all of them 'by the end'. Why is the countability assumption important? Does the proof hold if we drop it?

# A game with no winning strategy

Martin in 1975 provided the 'ultimate result' by showing that Borel sets are determined. At this stage one is tempted to assert that perhaps every game is determined-- this suggestion is called the Axiom of Determinacy. It is, however, false within the realms of ZFC, and we can use Choice to construct a non-determined game.

Remember that a strategy (not necessarily winning) for Alice is a function from odd-length tuples to $\mathbb{N}$. For a strategy $\sigma$ for Alice, call a sequence (play) $\sigma$-compatible if it is generated when Alice plays according to $\sigma$. Then $\sigma$ is a winning strategy if and only if every $\sigma$-compatible sequence is in the payoff set, since otherwise there is some sequence of moves Bob can make that will win against $\sigma$. Likewise a strategy $\tau$ for Bob is a winning strategy if every $\tau$-compatible sequence is outside the payoff set. Then to show there is a non-determined game, we will explicitly construct the payoff set such that no strategy for either of the players is a winning strategy.

<div class="theorem">
<sc>Theorem</sc> Assuming Axiom of Choice, there is a $P\subset \mathbb{N}^\omega$ which is not determined.
</div>

<div class="proof">
<sc>Proof</sc> Observe that there are $2^\omega$ strategies, and $2^\omega$ plays compatible with any strategy. Let $S$ be the set of all strategies (for either player.) Use the Axiom of Choice to well-order this set, and construct the payoff set $P$ as follows:

For the least strategy $\sigma_0$, choose two distinct plays compatible with $\sigma$ and add one to $P$, the other to $P^c$. Now any $\sigma\in S$ has $n< 2^\omega$ predecessors. Suppose for each predecessor of $\sigma$ we have added one compatible sequence to $P$ and one to $P^c$. We haven't exhausted all of the $\sigma$-compatible sequences so it is still possible to choose a new (distinct from all previously chosen) sequence and add it to $P$, and another new compatible sequence to $P^c$. If any sequences are left over in the end, add them to $P$ or $P^c$ randomly.

Then clearly, no strategy is a winning strategy for the game corresponding to $P$. $\square$
</div>

It is worth emphasising that the game still has a winner-- just that it is impossible for either player to guarantee a win, since for every strategy Alice might play with, there is something Bob can do to win. But to know what this counter-strategy is, Bob has to know Alice's strategy in the first place and this is not possible. A strategy can only depend on the moves played so far, and is a winning strategy only if it can win every game with just this information. Of course, if Alice tells Bob what strategy she is going to use, then Bob can ensure a victory (as Tim Gowers puts it, if you put all your cards on the table right at the beginning, then you put yourself at a big disadvantage in the game.)

# More on this

This article barely scratches the surface of a rich and interesting theory of games that has deep ties with set theory. I just mentioned Martin's result in passing, and although outside the scope of this article, it is definitely worth looking at. Professor Tim Gowers has a [series of posts](https://gowers.wordpress.com/2013/08/23/determinacy-of-borel-games-i/) discussing this in detail. One might want to study the Axiom of Determinacy and its [bizarre consequences](https://mathoverflow.net/questions/129036/counterintuitive-consequences-of-the-axiom-of-determinacy). We also endowed the real line with a cool topology, and didn't do a lot with it-- there's probably a lot happening with the topological properties of games. And of course, instead of studying the games for their own merit, we can use them to encode other things. [Banach-Mazur games](https://en.wikipedia.org/wiki/Banach%E2%80%93Mazur_game) might be a good place to start looking. Lastly, if you are looking for an explicit strategy to win Sylver coinage, chapter 18 of Conway's Winning Ways has a detailed discussion of possible strategies.
