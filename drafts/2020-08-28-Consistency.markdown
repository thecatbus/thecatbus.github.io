[latexpage]

Some mathematical expressions might not appear correctly in your device. In that case, right-click the expression and open the image in a new tab to view the full text.
If I had a dollar for every time someone showed me a "proof" of \(1 = 2\) with a smug smile claiming maths is broken, I'd have, well, many dollars.

For the most part, proofs in mathematics are considered to be the ultimate tests of truth- if you can write a proof of it, it must be true, and moreover, a good mathematician must back every assertion with a proof on paper. But given enough thought, this correspondence is not at all obvious, and the fact that syntax - sequences of symbols - does mirror semantics - the "truth", whatever that is- is a remarkable fact to be marvelled at. Better, an assertion that needs to be proven, mathematically of course. This study of meta-mathematics, of proofs and propositions as objects in themselves,  was started off by David Hilbert, and revolves around the question of "what can be proven?"

Formalising Logic

We start off by moving into a meta-logic and defining our objects of interest. Most of mathematics can be done in what is called a formal system, which consists of

A set of symbols, called the signature, further characterised as:
Variable-symbols \(\{x_1,x_2,x_3,..\}\). 
Function-symbols and predicate-symbols, which have an associated natural number called arity.
Auxiliary logical symbols.
A set of terms, the elements of which are finite strings of symbols defined inductively:
Every variable symbol is a term.
If \(f\) is an \(n\)-ary function symbol and \(t_1,t_2,...,t_n\) are terms, then \(ft_1t_2...t_n\) is a term.
 A set of predicates, or well-formed formulae (wfs) defined inductively:
If \(R\) is an \(n\)-ary predicate-symbol and \(t_1,t_2,...,t_n\) are terms, then \(Rt_1t_2...t_n\) is a predicate. Predicates formed this way are called atomic formulae.
Appropriate application of logical connectives and quantifiers to existing predicates generates new ones.
A set of closed (without any free-variables) wfs, the elements of which are called axioms of the system.
A finite set of relations between wfs, the elements of which are called rules of inference. 
A formal system sets up an environment for writing proofs, where the first three elements dictate what can be written- variables and terms have been defined in a way that under the right interpretation, they correspond to concrete objects in the universe (or placeholders for them). Predicates, then, correspond to assertions that say how these objects relate to each other, and can be true or false based on the semantic truth in a universe. 

Elements 4 and 5 describe a framework of writing proofs- sequences \(\phi_0, \phi_1,...,\phi_n\) of predicates where \(\phi_0\) is formed from conjunctions and disjunctions of axioms, and \(\phi_{i-1}, \phi_i\) is in some rule of inference. In fact, the rules of inference can be thought of as inducing a directed graph on the set of all predicates (and conjunctions/disjunctions thereof), and then a proof of \(P\) from \(Q\) is a path from \(Q\) to \(P\) on this graph. The set of points reachable from the axioms should, in that case, ideally be exactly those sentences that are semantically true. Of Course, you could have entirely bogus rules of inference and deduce "cheese is bad" (objectively false) from \(0=0\). The task then, is to characterise the "good" rules of inference.

Notation: If the rule of inference \(r\) relates two wfs as \(P \rightarrow_r Q\), it is customary to write \(\dfrac{P}{Q}(r)\), or simply \(\dfrac{P}{Q}\) when it is clear what the rule of inference is. The wf on the top is called the "premise", while the one below is called the "consequence", and we read it as "infer \(Q\) from \(P\) using the rule \(r\)". Since axioms are typically not inferred from anything, they are written with an empty premise as \(\dfrac{}{P}\).

Propositional Logic

A classic example of a formal system is propositional calculus, where there are no function or predicate symbols, and the logical symbols \(\supset, \wedge, \neg\). The axioms are the families of wfs 

\(P \supset (Q \supset P)\)
\((P \supset (Q \supset R) )\supset (P\supset Q) \supset (P\supset R)\)
\(\neg (\neg P) \supset P\)
where \(P,Q,R\) can be any terms.  The rules of inference are: 

\begin{align*} \textrm{Weak rules: }& \dfrac{P \wedge P \wedge A}{P \vee A} \textrm{(Consolidation)}\qquad \dfrac{P \wedge A}{P} \textrm{ (Simplification) }  \\ \textrm{Strong rules: }& \dfrac{P \wedge (P \supset Q) \wedge A \vee B}{Q \wedge A \vee B} \textrm{ (Modus Ponens) } \end{align*}

Then, for instance, a proof of \(P \supset P\) looks like

\[\dfrac{ \dfrac{(P\supset ((Q\supset P)\supset P)) \supset ((P\supset(Q\supset P))\supset (P\supset P) )\quad \wedge \quad P\supset ((Q\supset P)\supset P)\quad \wedge \quad P\supset (Q\supset P)}{(P\supset (Q\supset P))\supset (P\supset P) \quad \wedge \quad P\supset (Q\supset P))} }{P\supset P}\]

Proofs as trees

It is worth emphasising that \(\dfrac{P}{Q}\) and \(P\supset Q\) are genuinely different- the former says it is possible to deduce \(Q\) from \(P\) in the meta-language, while the latter is a proposition saying \(P\) implies \(Q\) in propositional calculus. The difference is subtle but important, nonetheless, for consistency essentially amounts to agreement between the two.

In a similar light, the connective \(\wedge\) is an artefact of the meta-language, and to simplify notation we choose to ignore the \(\wedge\) connective and instead write \(\dfrac{P_1 \quad P_2 \;...\; P_n }{Q}\) for the inference \(\dfrac{P_1\wedge P_2 \,\wedge\, ... \wedge \, P_n}{Q}\). Adopting this convention, we tweak our notion of a proof ladder to get what is called a proof tree: For a wf \(\phi\), the proof tree for \(\phi\) is a graph in which the nodes are assigned predicates (multiple nodes might be given the same predicate), and every node can be assigned a 'level' (an ordinal) such that:

level \(0\) has the single node corresponding to \(\phi\), called the terminal wf.
there is an edge between two nodes only if they differ by exactly one level.
each node at level \(i+1\) is connected to exactly one node at level \(i\) .
each node at level \(i\) is connected to countably many (might be \(0\)) nodes at level \(i+1\), called its predecessors. Nodes with no predecessors are termed initial nodes.
there is an assignment of ordinals such that the ordinal of every node is strictly greater than that of its predecessors.
each initial node corresponds to an axiom.
the node with predicate \(Q\) has predecessors corresponding to \(P_1,P_2,...\) only if \(\dfrac{P_1 \quad P_2 \quad ...}{Q}\) is a rule of inference.
The assignment of ordinals in rule 5 is to prevent infinitely long proofs. Write \(\vdash P\) if the wf \(P\) has a proof in this fashion. These rules may be changed slightly to accommodate individual systems.

Rules of inference, then, cease to be simple binary relations and the whole structure becomes a bit more complicated than a directed graph- however, it is all syntactic sugar and it is all ultimately an abstract rewrite system as described at the start.

Consistency and Explosion

The rules of inference can be thought of as a way of propagating "truth-values", or let's say colour. Colour the axioms and their conjunctions white, and then use the rules of inference to assign the colour white to \(Q\) if \(P\) is white and \(\frac{P}{Q}\) is a rule of inference. Then all the white nodes are statements that can be proven- and for the proof system to be good, these better be semantically true (in a universe where the axioms hold).This is the idea of consistency, that there should be no proof of \(\texttt{false}\). In most systems, this corresponds to having proofs of both a sentence and a negation.

A formal system is inconsistent if there is a wf \(P\) such that \(\vdash P\) and \(\vdash \neg P\), i.e. some statement and its negation are both provable. Inconsistent systems prove too many things- in fact, inconsistent systems prove everything: given any wf \(Q\), here is a proof of it from \(\{P,\neg P\}\) in any system with Modus Ponens-
\[\dfrac{\dfrac{\genfrac{}{}{0pt}{0}{}{(\neg Q\supset \neg P)\supset ((\neg Q \supset P)\supset Q)} \qquad \dfrac{\neg P \supset (\neg Q \supset \neg P) \qquad \neg P}{\neg Q \supset \neg P} }{(\neg Q \supset P) \supset Q} \qquad \dfrac{ P\supset (\neg Q \supset P) \qquad P}{\neg Q \supset P}}{Q} \]

This is the principle of explosion: if the system is inconsistent, every predicate and its negation are theorems, and the exercise of writing proofs becomes meaningless. A consistent system proves no false statement, and then showing consistency of any extension of propositional logic amounts to finding some unprovable predicate.

Peano Arithmetic

We describe the formal system PA of first-order Peano arithmetic: start with the single predicate-symbol \(=\), a constant-symbol \(0\), a unary functional symbol \(\texttt{succ}\) and two binary function-symbols \(\texttt{add}\) and \(\texttt{mult}\). For convenience, write \(s'\) for \(\texttt{ succ}\,s\), \((s+t)\) for \(\texttt{ add}\,s\,t\), and \((s\cdot t)\) for \(\texttt{ mult}\, s \, t\). There is the single quantifier \(\forall\), and logical connectives \(\supset\) and \(\neg\). The axioms and rules of inference are

\begin{align*} \text{Logical axioms:}&\qquad &\dfrac{}{P \supset (Q \supset P)} \quad \quad \dfrac{}{(P\supset (Q\supset R))\supset ((P\supset Q)\supset(P\supset R))} \quad \quad \dfrac{}{(\neg P \supset \neg Q)\supset ((\neg P \supset Q)\supset P)}\\ \\ \text{Quantifier axioms:}&\qquad &\text{for a term \(t\) and wf \(P(x)\) with free variable \(x\),} \quad \dfrac{}{\forall x. P(x)\supset P(t)} \\ \\ &\qquad &\text{If \(P\) is a wf with no free occurences of \(x\),} \quad \dfrac{}{(\forall x. (P\supset Q))\supset (P\supset \forall x.Q)} \\ \\ \text{Properties of equality:}&\qquad &\dfrac{}{(a=b)\supset((a=c)\supset (b=c))} \quad \quad \dfrac{}{(a=b) \supset (a'=b')} \quad \quad \dfrac{}{(a'=b') \supset (a=b)} \quad \quad \dfrac{}{\neg(0=a')} \\ \\ \text{Properties of operations:}&\qquad &\dfrac{}{a+0=a} \quad \quad \dfrac{}{(a+b)'=a+ b'} \quad \quad \dfrac{}{a\cdot 0=0} \quad \quad \dfrac{}{a\cdot b'=a\cdot b + a} \\ \\ \text{Induction:}&\qquad & \text{for any wf \(P(x)\) with one free variable \(x\),} \quad \dfrac{}{P(0)\supset ((\forall x. (P(x)\supset P(x'))) \supset (\forall x. P(x)))} \\ \\ \text{Rules of Inference:}&\qquad & \dfrac{P \quad P\supset Q}{Q}\text{(Modus Ponens)} \quad \quad \dfrac{P}{\forall x.P}\text{(Generalization)} \end{align*}

This system of fourteen axioms and two rules of inference is pretty powerful- it is possible to deduce important results about natural numbers, rationals (even real and complex numbers!) from these axioms. But can one deduce too much from it? Our discussion on explosion shows this is equivalent to asking if \(0\neq 0\) is a theorem. Clearly it isn't an axiom, and it is not possible to deduce it from the rule of Generalization. So the only way to deduce \(0\neq 0\) is from some application of Modus Ponens- but how many cases will this break into? The problem is that Modus Ponens is the only rule of inference in the entire system, hence is way too general. Without it you can prove nothing, and with it you can prove- well, maybe even \(0\neq 0\)?

Let us define a much stronger system PA*: the signature \(\{\texttt{0, succ, add, mult, =}\}\) is the same as that of PA, and the logical connectives are \(\vee, \neg\). If we choose to use \((P\supset Q)\) as short-hand for \((\neg P \vee Q) \), then every wf of PA can be read as a wf of PA*. We now construct the axioms of PA*: take the set of all closed terms (terms without any variables), under the rewrite rules \[a+0 \rightarrow a \quad \quad a+b'\rightarrow (a+b)' \quad\quad a\cdot 0 \rightarrow 0 \quad \quad a\cdot b' \rightarrow a\cdot b + b'\]
These define an abstract rewriting system. Since closed terms are finite strings of symbols, \(\texttt{length}\) is a well defined function of closed terms. Define functions \(f,g\) from the set of closed terms to \(\mathbb{N}^2\) as follows:

\begin{align*} &f(0)=0 \qquad &f(a')=f(a)\qquad &f(a+b)=f(a)+f(b) + \texttt{length}(a) + \texttt{length}(b) \qquad &f(a\cdot b)= f(a)+f(b) \\
&g(0)=0 \qquad &g(a')=g(a) \qquad &g(a+b)= g(a)+g(b) \qquad &g(a\cdot b)= g(a)+g(b)+ \texttt{length}(a) + \texttt{length}(b) \end{align*}

Intuitively, \(f\) is the total length of arguments of \(\texttt{add}\), and \(g\) is the total length of arguments of \(\texttt{mult}\). It is not too difficult to see that if the term \(\phi_1\) reduces to \(\phi_2\), then \((g\phi_1,f \phi_1) >_{lex} (g\phi_2, f\phi_2)\). Thus we have a monotone embedding from closed terms (ordered by reduction) to \(\mathbb{N}^2\) ordered lexicographically. Since the latter is a well-order, the abstract rewriting system defined on the set of closed terms must be terminating. Moreover, if \(f\) or \(g\) is non-zero then the term must be reducible by one of the rules, so the normal (irreducible) terms must have \(f=g=0\). Thus every irreducible term is of the form \({{0''}^{...}}'\). The set of irreducibles is hence \(\{0,0',0'',...\}\), called the set of naturals. To see the rewrite system is confluent, it suffices to embed it in another confluent system. Indeed, it is possible to encode the entire system in \(\lambda\)-calculus, and since the latter is confluent (thanks to the work of Church and Rosser), the rules of arithmetic are confluent too. Thus every closed term has a unique normal form, which we call its evaluation.
For closed terms \(s,t\), we call the wf \(s=t\) correct if the evaluations of \(s\) and \(t\) coincide. Call \(s=t\) incorrect if they evaluate to unequal values. For the set of axioms of PA*, we take every correct wf and the negation of every incorrect wf. Since the terms can be evaluated in finite time, PA* is an axiomatic system.

Define the rules of inference as follows:

\begin{align*}\text{Weak rules:}& \qquad &\dfrac{A\vee P\vee Q \vee B}{A \vee Q \vee P \vee B}\text{(Exchange)} \quad \quad \dfrac{P \vee P \vee A }{P \vee A}\text{(Consolidation)} \\ \\ \text{Strong rules:}& \qquad &\dfrac{P}{A \vee P}\text{(Dilution)} \quad \quad \dfrac{\neg A \vee P \quad \neg B \vee P}{\neg(A\vee B)\vee P}\text{(De Morgan)} \quad \quad \dfrac{P \vee A}{\neg \neg P \vee A}\text{(Negation)} \quad \quad \dfrac{}{} \\ \\ & \qquad &\text{for a closed term \(t\) and wf \(P(x)\) with free variable \(x\), }\dfrac{\neg P(t) \vee A }{\neg (\forall x. P(x)) \vee A}\text{(Quantification)} \\ \\ & \qquad &\dfrac{P(0)\vee A \quad P(0') \vee A \quad P(0'')\vee A \dots }{\forall x. P(x)\vee A}\text{(Infinite induction)} \\ \\ \text{Cut:}& \qquad &\dfrac{P \vee A \quad \neg P \vee B}{A \vee B} \end{align*} 

The \(A\)s and \(B\)s in the rules are called peripheral predicates, and can be empty (except in De Morgan and Cut for obvious reasons.) Anything that is not a peripheral wf is called a principal predicate. 

Eliminating Cut

The last rule of Cut will prove to be of central importance when proving consistency of PA: the principle of explosion deduces any statement \(A\) from \(\{P,\neg P\}\) by using Cut and Dilution: \[\dfrac{\genfrac{}{}{0pt}{0}{}{P}\quad \dfrac{\neg P}{\neg P \vee A}}{A}\] An observation that should be attributed to Gentzen, Cut is essential to proving any false statement, and our strategy for proving consistency is hence Cut-elimination. Accordingly, we define some terminology and rules pertaining to it.

The principal wf \(P\) of a Cut is called the cut wf.
The number of propositional connectives and quantifiers in \(\neg P\) is called the degree of the cut. (The \(\neg\) is added to ensure every cut has a non-zero degree.)
We also make some changes to the definition of the proof-tree to accommodate the Weak rules and Cut. In particular, we demand that there is a maximal degree of the cuts that appear, and call it the degree of the proof. If there are no Cuts then the proof has degree \(0\). We slightly change the assignment of ordinals: a node is assigned an ordinal equal to its predecessor if it follows from a Weak rule of inference, and an ordinal strictly greater than all of its predecessors if it follows from a Strong rule or Cut. A thread is any sequence \(P_1P_2...\) starting at the terminal node (level \(0\)) such that \(P_{i+1}\) is a predecessor of \(P_i\). Then the sequence of ordinals corresponding to the thread is decreasing, and since the ordinals are well-founded there can only be finitely many applications of Strong rules or Cut in a thread. As for the Weak rules, Consolidation can only be applied finitely many times while Exchange splits the wfs into equivalence classes of finite size. Hence each thread can be assumed to be only finitely long. The ordinal assigned to the terminal wf is a good measure of the 'size' of the proof, and is called the ordinal of the proof.

Define a subformula of a wf inductively:

\(A\) is a subformula of \(A\).
If \(\neg P\) is a subformula of \(A\) then so is \(P\).
If \(P\vee Q\) is a subformula of \(A\), then so are \(P\) and \(Q\).
If \(P(x)\) is a wf with free variable \(x\), and \(\forall x. P(x)\) is a subformula of \(A\), then \(P(t)\) is also a subformula of \(A\) for any term \(t\) free for \(x\) in \(P\).
Given any node \(P\) of the proof-tree with subformula \(Q\), we look at all the places where \(Q\) is a subformula of the nodes. Starting at \(P\) and working upwards, this process continues through all Weak rules and Strong rules where \(Q\) is a peripheral predicate. Since each thread is finite, \(P\) must be 'introduced' to the proof as an axiom or as the main predicate of some Strong rule or Cut. The set of all occurences of \(P\) thus obtained is called the history of \(P\). Before proceeding, we prove a small result:

Lemma (Excluded middle) \(P \vee \neg P\) is a theorem for all closed wfs \(P\). 

Proof Prove by induction on number of connectives and quantifiers in \(P\): if \(P\) has no quantifiers/connectives then \(P\) is of the form \(s=t\) for closed terms \(s,t\). Then either \(P\) or \(\neg P\) is an axiom, hence \(P\vee \neg P\) follows by dilution. Suppose the claim is true up to \(n\) quantifiers and connectives. If \(P\) has \(n+1\) of them, then \(P\) must be of the form
(i) \(P\equiv A \vee B\)
Since \(A\) and \(B\) must have \(\leq n\) connectives/quantifiers, \(A\vee \neg A\) and \(B\vee \neg B\) are both theorems. Then we have a proof of \(P\vee \neg P\) as: \[ \dfrac{\dfrac{\neg A \vee A}{\neg A \vee A \vee B} \quad \dfrac{\neg B \vee B}{\neg B \vee A \vee B}}{\neg(A\vee B)\vee A\vee B}\]
(ii) \(P\equiv \forall x. A(x)\)
\(A(x)\) has \(n\) quantifiers and connectives, hence \(A(k)\vee \neg A(k)\) a theorem for every natural number \(k\). Then we have a proof of \(P\vee \neg P\) as: \[ \dfrac{\dfrac{\neg A(0) \vee A(0)}{\neg(\forall x. A(x))\vee A(0)} \quad \dfrac{\neg A(0') \vee A(0')}{\neg(\forall x. A(x))\vee A(0')} \quad \dfrac{\neg A(0'') \vee A(0'')}{\neg(\forall x. A(x))\vee A(0'')} \quad \dots }{\neg(\forall x. A(x))\vee \forall x. A(x)}\]
(iii) \(P\equiv \neg A\)
\(A\) has \(n\) quantifiers and connectives, hence \(A\vee \neg A\) is a theorem. Then using the rule of Negation, \(\neg A \vee \neg \neg A\) is also a theorem.
Observe that no Cut was used at any point. The result allows us to assume \(P\vee \neg P\) always has a proof irrespective of what \(P\) is, and this will be immensely useful in proving the results about to follow. Let us use it to show that PA* is actually stronger than PA, as claimed:

Theorem Every closed wf that is a theorem of PA is also a theorem of PA*.

Proof Every theorem of PA must be either an axiom or deducible from Modus Ponens/Generalization. 
Let us prove all axioms of PA are theorems of PA*:

(Logic 1) \(P\supset(Q\supset P)\), i.e. \(\neg P \vee (\neg Q \vee P)\)

Since \(P\vee \neg P\) is a theorem, \(P\vee \neg P \vee Q\) immediately follows from dilution.

(Logic 2) \((P \supset (Q\supset R))\supset ((P\supset Q)\supset (P\supset R))\), i.e. \(\neg(\neg P \vee \neg Q \vee R)\; \vee \; \neg(\neg P \vee Q) \; \vee \; (\neg P \vee R)\)

\[\dfrac{ \dfrac{\neg(\neg P \vee R) \vee (\neg P \vee R)}{\neg(\neg P \vee R) \vee \neg (\neg P \vee Q) \vee \neg P \vee R} \qquad \dfrac{\dfrac{\neg \neg P \vee \neg P}{\neg \neg Q \vee \neg \neg P \vee \neg P \vee R} \qquad \dfrac{\neg \neg Q \vee \neg Q}{\neg \neg Q \vee \neg Q \vee \neg P \vee R} }{\neg \neg Q \vee \neg(\neg P \vee Q) \vee \neg P \vee R} }{ \neg(\neg P \vee R \vee \neg Q) \; \vee \; \neg (\neg P \vee Q) \; \vee \; \neg P \vee R}\]

(Logic 3) \((\neg P \supset \neg Q) \supset ((\neg P\supset Q)\supset P)\), i.e. \(\neg (\neg \neg P \vee \neg Q) \; \vee \; \neg(\neg \neg P \vee Q) \; \vee \; P\) 

\[ \dfrac{ \dfrac{\dfrac{\neg P \vee P}{\neg \neg \neg P \vee P}}{\neg\neg\neg P \vee \neg(\neg\neg P \vee Q) \vee P} \qquad \dfrac{\dfrac{\dfrac{\neg P \vee P}{\neg \neg \neg P \vee P}}{\neg\neg Q \vee P \vee \neg \neg \neg P } \qquad \dfrac{\neg \neg Q \vee \neg Q}{\neg \neg Q \vee P \vee \neg Q } }{ \neg \neg Q \vee \neg (\neg \neg P \vee Q) \vee P} }{ \neg (\neg \neg P \vee \neg Q) \vee \neg(\neg \neg P \vee Q) \vee P}\]

(Quantifier 1) \((\forall x. P(x))\supset P(t)\), i.e. \(\neg(\forall x. P(x)) \vee P(t)\) 

\[\dfrac{\neg P(t) \vee P(t)}{\neg(\forall x. P(x))\vee P(t)}\]

(Quantifier 2) \((\forall x. (P\supset Q))\supset (P\supset \forall x. Q)\), i.e. \( \neg(\forall x. (\neg P\vee Q))\; \vee \; \neg P \; \vee \; \forall x. Q \)

Write \([a/x] A\) for the predicate generated by substituting the term \(a\) for every free occurence of \(x\) in \(A\). Remember that \(P\) has no free occurence of \(x\) in the axiom, so in particular \([a/x](\neg P \vee Q) \equiv \neg P \vee [a/x]Q\). \[ \dfrac{\dfrac{ \dfrac{\neg([0/x](\neg P \vee Q)) \vee [0/x](\neg P \vee Q)}{ \neg(\forall x. (\neg P \vee Q)) \vee [0/x](\neg P \vee Q) } }{ \neg(\forall x.(\neg P \vee Q)) \vee \neg P \vee [0/x]Q} \qquad \dfrac{ \dfrac{\neg([0'/x](\neg P \vee Q)) \vee [0'/x](\neg P \vee Q)}{ \neg(\forall x. (\neg P \vee Q)) \vee [0'/x](\neg P \vee Q) } }{ \neg(\forall x.(\neg P \vee Q)) \vee \neg P \vee [0'/x]Q} \qquad \dfrac{ \dfrac{\neg([0''/x](\neg P \vee Q)) \vee [0''/x](\neg P \vee Q)}{ \neg(\forall x. (\neg P \vee Q)) \vee [0''/x](\neg P \vee Q) } }{ \neg(\forall x.(\neg P \vee Q)) \vee \neg P \vee [0''/x]Q} \qquad \dots }{\neg(\forall x. (\neg P \vee Q)) \vee \neg P \vee \forall x. Q} \]

(Equality 1) \((a=b)\supset ((a=c)\supset(b=c))\), i.e. \(\neg(a=b) \vee \neg (a=c) \vee (b=c)\).

If \(b=c\) is an axiom, then done. Else, \(b\) and \(c\) have different evaluations. The evaluation of \(a\) can't simultaneously be equal to the evaluations of both, so \(\neg (a=b)\) or \(\neg(a=c)\) is an axiom. Use Dilution.

(Equality 2-4, Add/Mult 1-4) The remaining axioms of Equality, Addition and Multiplication follow immediately from rules of evaluating closed terms.

(Induction) \(P(0) \supset ((\forall x. (P(x) \supset P(x')))\supset \forall x. P(x))\), i.e. \(\neg P(0) \; \vee \; \neg(\forall x. (\neg P(x) \vee P(x')))\;\vee\; \forall x. P(x)\)

Write \(0^{(k)}\) for \(\texttt{succ succ } \overset{\text{k times}}{...} \texttt{ succ } 0\).

Claim \(\neg P(0) \; \vee \; \neg(\neg P(0)\vee P(0')) \;\vee \dots \vee \; \neg(\neg P(0^{(k)}) \vee P(0^{(k+1)}))\; \vee \; P(0^{(k+1)})\) is a theorem for all \(k\).

Prove by induction: Clearly true for \(0\). If true for \(k-1\), writing \(A\) for the peripheral \(\neg P(0) \; \vee \; \neg(\neg P(0)\vee P(0')) \;\vee \dots \vee \; \neg(\neg P(0^{(k-2)}) \vee P(0^{(k-1)}))\; \vee \; P(0^{(k-1)})\), we have \[ \dfrac{\dfrac{\dfrac{A \; \vee \; P(0^{(k)})}{A \; \vee \; P(0^{(k)}) \vee P(0^{(k+1)})}}{A \; \vee \; \neg \neg P(0^{(k)}) \vee P(0^{(k+1)})}\qquad \dfrac{\neg P(0^{(k+1)}) \vee P(0^{(k+1)})}{A \; \vee \; \neg P(0^{(k+1)}) \vee P(0^{(k+1)})}}{A \; \vee \; \neg(\neg P(0^{(k)})\vee P(0^{(k+1)})) \vee P(0^{(k+1)})} \]

Then we can use Quantification and Consolidation to deduce that \(\neg P(0) \; \vee \; \neg(\forall x. \neg P(x)\vee P(x')) \; \vee \; P(0^{(k+1)})\) is true for all \(k\geq 0\). Since \(\neg P(0)\vee \neg(\forall x. \neg P(x) \vee P(x')) \vee P(0)\) is also a theorem, we deduce from the rule of Infinite induction that \(\neg P(0) \vee \neg (\forall x. \neg P(x)\vee P(x')) \vee \forall x.P(x)\) is a theorem.

Hence all axioms of PA are provable in PA*. If \(P\) and \(P\supset Q \) (i.e. \(\neg P \vee Q\)) are theorems in PA*, then \(Q\) is also a theorem, proved by an application of Cut. Similarly, if \(P\) is a theorem then looking at the proof tree of \(P\) and replacing every instance of \(P\) in its history by \([0^{(k)}/x]P\), we see that \([0^{(k)}/x]P\) is a theorem for every \(k\), hence \(\forall x. P\) is a theorem by Infinite Induction. Thus any theorem of PA deduced using Modus Ponens or Generalization is also provable in PA*.

Consequently, if PA* is consistent, then so is PA. This is nice because we have a lot more to work with when proving the consistency of PA*- suppose \(\neg (0=0)\) is a theorem in PA*. Then we can look at the proof tree, in particular the history of \(P\equiv \neg(0=0)\). Since every thread is finite and \(P\) is not an axiom, \(P\) must be introduced in the proof via a Dilution, hence must be paired with the principle predicate of the Dilution. This means \(P\) occurs in the form \(P\vee Q\) for some theorem \(Q\). But the terminal node of the proof is \(P\) alone, so there must be some step where \(P\) is unpaired from \(Q\). Inspecting the rules of inference, the only one which allows such an unpairing is Cut. Thus if we can show that every theorem in PA* has a Cut-free proof, we can immediately conclude that the system is consistent. The next result due to Schütte does precisely that:

Theorem Given a proof of theorem \(P\) of degree \(m\), there is another proof of \(P\) of lower degree.
Proof We proceed by transfinite induction on the ordinal of the proof: If the ordinal of the proof is \(0\) it contains no Cuts so has degree \(0\).

Suppose have shown that all proofs with ordinal \(<\alpha \) can be rewritten with reduced degree. Given a proof of \(P\) of ordinal \(\alpha\), start from the terminal node and moving upwards, locate the first application of a non-weak rule, i.e. a Strong rule or Cut. If it is a Strong rule, its premises have a lower ordinal so by induction hypothesis their proofs can be rewritten with a lower degree. This must reduce the maximal degree of Cuts in the proof, so we have a new proof with lower degree. The remaining case is if the first applied non-Weak rule is a Cut (call it the last Cut):

\[\dfrac{Q\vee A \qquad \neg Q \vee B}{A \vee B}\]

By induction hypothesis, the proofs of \(Q\vee A \) and \(\neg Q\vee B\) in the proof-tree can be replaced with proofs of degree \(< m\). If we can replace the last Cut with a inference of lower degree, we have reduced the maximal degree of all Cuts in the proof and we will be done. Let us look at what the Cut formula \(Q\) could be:

Case 1: \(Q\) is an Atomic formula: Either \(Q\) or \(\neg Q\) is an axiom.

Wlog \(Q\) is the axiom, then looking at the history of \(\neg Q\) we see that it must be introduced via a Dilution. Then simply ignoring all occurences of \(\neg Q\) in the proof of \(\neg Q \vee B\), we have a proof of \(B\)(of degree \( < m\)). Diluting this we get a proof of \(A\vee B\). Thus we have eliminated the main Cut, and any other Cuts occuring must be in the proof of \(B\) hence have a degree \(< m\). 

Case 2: \(Q\equiv \neg R\) 

Rewrite the cut as follows:

\[\dfrac{\neg R \vee A \qquad \neg\neg R \vee B}{ A \vee B} \quad \rightarrow \quad \dfrac{\genfrac{}{}{0pt}{0}{}{\neg R \vee A} \qquad \dfrac{\neg \neg R \vee B \qquad \neg R \vee R}{R \vee B}}{A \vee B}\] 

The proof of \(\neg R \vee R\) was Cut-free, and both the newly introduced cuts have degree lower than \(m\). 

Case 3: \(Q \equiv \forall x. R(0)\) 

Then \(\forall x.R(x)\) are \(\neg(\forall x.R(x))\vee B\) is a premises of the Cut. We look at the history of the subformula \(\forall x.R(x)\) in the proof of \(\forall x.R(x)\vee A\). Since it cannot be an axiom, it must be introduced to the proof via a dilution or infinite induction. If the introduction was a dilution, then simply erasing all occurences of \(\forall x.R(x)\) gives a proof of \(A\), and diluting it allows us to deduce \(A\vee B\) without employing the last Cut at all. Similarly tracing the history of \(\neg(\forall x.R(x))\) in the proof of the second premise, if the introduction was a Dilution then we are done. If neither of the two was introduced via a Dilution, then \(\forall x.R(x)\) must be introduced via Infinite induction and \(\neg(\forall x.R(x))\) via Quantification. In particular there must be a inferences of the form \(\dfrac{R(0)\vee C \quad R(0')\vee C \quad ...}{\forall x.R(x)\vee C}\) and \( \dfrac{\neg R(t) \vee D }{\neg(\forall x.R(x))\vee D}\) for some closed term \(t\) (which evaluates to some natural \(0^{(n)}\)). Safely replace all occurences of \(t\) with \(0^{(n)}\) in the proof of \(\neg R(t)\vee D\) to get a proof of \(\neg R(0^{(n)})\vee D\). In all subsequent deductions that give a proof of \(\forall x.R(x) \vee A\) from \(\forall x.R(x)\vee C\), the predicate \(\forall x.R(x)\) must be peripheral, so we can replace all of its occurences by \(R(0^{(n)})\) to get a valid proof of \(R(0^{(n)})\vee A\) from \(R(0^{(n)})\vee C\). Likewise we have a proof of \(\neg R(0^{(n)}) \vee B\) from \(\neg R(0^{(n)})\vee D\). By induction hypothesis, all these proofs have degree \(< m\). Now replace the last Cut as follows: \[ \dfrac{\dfrac{\dfrac{\dfrac{R(0)\vee C \quad \dots \quad R(0^{(n)})\vee C\quad \dots }{\forall x.R(x)\vee C}}{\vdots}}{\forall x.R(x)\vee A} \qquad \dfrac{\dfrac{\dfrac{\neg R(t)\vee D}{\neg(\forall x.R(x))\vee D}}{\vdots}}{\neg(\forall x.R(x))\vee B}}{A\vee B} \quad \rightarrow \quad \dfrac{\dfrac{\dfrac{R(0^{(n)})\vee C}{\vdots}}{R(0^{n})\vee A} \qquad \dfrac{\dfrac{{\neg R(0^{(n)})\vee D}}{\vdots}}{\neg R(0^{(n)})\vee B}}{A\vee B} \] Then we have replaced the last Cut with a Cut of smaller degree. 

Case 4: \(Q \equiv R \vee S \)

Then \(\neg(R\vee S)\vee B\) is a premise of the cut. Trace the history of \(\neg(R\vee S)\)- if it was introduced by a Dilution then done, as usual. If not, then it must be introduced via De Morgans, and there is an inference of the form \(\dfrac{\neg R \vee C\qquad \neg S \vee C}{\neg (R\vee S)\vee C} \), after which we have a proof of \(\neg(R\vee S)\vee B\) from \(\neg (R\vee S)\vee C\). Replacing all occurences of \(\neg(R\vee S)\) in this proof with \(\neg R\) gives us a proof of \(\neg R \vee B\) from \(\neg R \vee C\), and likewise for \(S\). By hypothesis, all the above proofs have degree smaller than \(m\). Then replace the last Cut in the proof as:\[ \dfrac{\genfrac{}{}{0pt}{0}{}{R\vee S\vee A}\qquad \dfrac{\dfrac{\dfrac{\neg R\vee C \qquad \neg S \vee C}{\neg(R\vee S)\vee C}}{\vdots}}{\neg(R\vee S)\vee B}}{A\vee B} \quad \rightarrow \quad \dfrac{\dfrac{\genfrac{}{}{0pt}{0}{}{R\vee S\vee A} \qquad \dfrac{\dfrac{\neg R\vee C}{\vdots}}{\neg R \vee B}}{S\vee A\vee B} \qquad \dfrac{\dfrac{\neg S\vee C}{\vdots}}{\neg S\vee B}}{A\vee B}\] The number of Cuts has increased, but the degree of the proof has reduced. 

This concludes the proof, and every hence every proof can be written with Cuts of lower degree.

What we described is a new, interesting abstract rewriting system in which the objects are proofs and the reduction is as described. Since the degree of the proof is a decreasing quantity and every proof can be reduced, the rewriting system is terminating and so every proof can be reduced to a proof of degree 0, i.e. a Cut-free proof. In other words, any statement that can be proven in PA* can be proven without Cuts, hence cannot be an instance of \(\texttt{false}\). We have thus established the consistency of PA.

Notes:

I have been lazy with writing out proofs properly- in particular the rules of inference are sensitive to order: \(\frac{P}{P\vee A}\) is, strictly speaking, not a rule of inference. It is however easily seen to be simply Dilution composed with Exchange, and thus throughout I have wilfully turned a blind eye towards the Weak rules. Hence everything written in the proofs is correct modulo Weak rules (and gaps in my understanding.)
I have also not written what rule is being used at each stage of the proof, and it is now that I will employ the supreme power of saying that the task of figuring it out has been left as an exercise to the reader.
