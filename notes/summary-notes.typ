#import "./template.typ": template, trop
#show: template

#outline()
#pagebreak()

= Introduction

== Arithmetic

- *Tropical semiring or min-plus algebra*: $(RR union {oo}, plus.circle, dot.circle)$ where $ x plus.circle y & := min(x, y) \ x dot.circle y & := x + y $ $plus.circle$ is *tropical sum*, $dot.circle$ is *tropical product*.
- Tropical addition and multiplication are *commutative*: $ x plus.circle y & = y plus.circle x \ x dot.circle y & = y dot.circle x $
- Tropical addition and multiplication are *associative*: $ x plus.circle (y plus.circle z) & = (x plus.circle y) plus.circle z \ x dot.circle (y dot.circle z) & = (x dot.circle y) dot.circle z $
- Tropical addition and multiplication satisfy *distributivity*: $ x dot.circle (y plus.circle z) = x dot.circle y plus.circle x dot.circle z $
- As for classical addition and multiplication, $dot.circle$ has higher precedence than $plus.circle$.
- *Identity element* for addition is $oo$, *identity element* for multplication is $0$: $ x plus.circle oo & = x \ x dot.circle 0 & = x $
- The identity elements satisfy $ x dot.circle oo & = oo \ x plus.circle 0 & = cases(
    0 & "if" x >= 0,
    x & "if" x < 0
) $
- $(RR union {oo}, plus.circle, dot.circle)$ is a *semiring* rather than a ring since there exists no additive inverse.
- We have $ forall n in NN, quad (x plus.circle y)^n = x^n plus.circle y^n $ since $(x plus.circle y)^n = n dot.op min(x, y) = min(n x, n y) = x^n plus.circle y^n$.
- We have the usual operations of addition and multiplication of vectors and matrices over the tropical semiring.
- *Scalar product* of row vector with column vector: $ (u_1, ..., u_n) dot.circle (v_1, ..., v_n)^T = u_1 dot.circle v_1 plus.circle dots.h.c plus.circle u_n dot.circle v_n $
- Product of column vector and row vector: $ (u_1, ..., u_n)^T dot.circle (v_1, ..., v_n) = mat(u_1 dot.circle v_1, ..., u_1 dot.circle v_n; dots.v, dots.down, dots.v; u_n dot.circle v_1, ..., u_n dot.circle v_n) $ so $((u_1, ..., u_n)^T dot.circle (v_1, ..., v_n))_(i j) = u_i dot.circle v_j = u_i + v_j$.
- A matrix has *tropical rank $1$* if it can be expressed in the form of the product above.
- *Monomial* is product of variables $x_1, ..., x_n$ (repetition allowed). They map $RR^n -> RR$.
- A tropical monomial is a linear function with integer coefficients.
- *Tropical polynomial* is finite linear combination of tropical monomials: $ p(x_1, ..., x_n) = a dot.circle x_1^(i_1) dots.h.c x_n^(i_n) plus.circle b dot.circle x_1^(j_1) dots.h.c x_n^(j_n) plus.circle dots.h.c $ where $a, b, ... in RR$, $i_1, j_1, ... in ZZ$. Tropical polynomials map $RR^n -> RR$.
- Classically, $ p(x_1, ..., x_n) = min(a + i_1 x_1 + dots.h.c + i_n x_n, b + j_1 x_1 + dots.h.c + j_n x_n, dots.h.c) $.
- *Key properties of $p$*:
    - $p$ is continuous.
    - $p$ is finitely piecewise linear.
    - $p$ is *concave*: $p(1/2 (underline(x) + underline(y))) >= 1/2 (p(underline(x)) + p(underline(y)))$.
- Every function satisfying these properties can be expressed as minimum of finite set of linear functions.
- *Lemma*: the set of tropical polynomials in $n$ variables is equal to the set of piecewise-linear concave functions on $RR^n$ with integer coefficients.
- A tropical linear polynomial has roots at points where it is non linear, i.e. where at least two of its monomial terms are equal (at these points there are "bumps" on its graph).
- Every tropical polynomial function can be uniquely expressed as tropical product of tropical linear functions. *Note*: it is not true that every tropical polynomial factors into linear functions, but every tropical polynomial is equal to another tropical polynomial which *can* be factored into tropical linear functions. This only holds in one variable.
- The *convex hull* of a set of points $S$ is set of all linear combinations of points in $S$. Geometrically, it is the smallest convex polygon or polyhedron containing each point in $S$.
- Let $f(x, y)$ be classical or tropical polynomial. Its *Newton Polygon*, $"Newt"(f)$ is the convex hull in $RR^2$ of every point $(i, j)$ such that $x^i y^j$ appears in expansion of $f(x, y)$.

== Dynamic Programming

- For an $n$ node weighted directed graph $G$, its *adjacency matrix* is $D_G := (d_(i j))$ where $d_(i i) = 0$, $d_(i j)$ is the weight of the edge from node $i$ to $j$ and $d_(i j) = oo$ if this edge does not exist. Note that if $G$ is undirected, $d_(i j) = d_(j i)$ so $D_G$ is symmetric.
- *Proposition*: let $D_G^(dot.circle (n - 1)) = D_G dot.circle dots.h.c dot.circle D_G$ for an $n$ node weighted directed graph $G$. Then $\(D_G^(dot.circle (n - 1))\)_(i j)$ is the length of a shortest path from $i$ to $j$.
- We have the (informal) relation $ "tropical" = lim_(epsilon -> 0) log_epsilon ("classical"(epsilon)) $
- Going from classical to tropical arithmetic is called *tropicalisation*.
- The *tropical determinant* of $X = (x_(i j))$ is defined as $ trop det(X) := plus.circle.big_(pi in S_n) x_(1 pi(1)) dot.circle dots.h.c dot.circle x_(n pi(n)) $ where $S_n$ is symmetric group. This is also the definition of the *tropical permanent* of $X$.
- The tropical determinant is the solution to the *assignment problem*: if there are $n$ jobs and $n$ workers, and assigning job $i$ to job $j$ costs $x_(i j)$, the lowest possible cost is $trop det(X)$.

== Plane Curves

- The *hypersurface* $V(p)$ of a tropical polynomial $p: RR^n -> RR$ is defined as the set of all points in $RR^n$ where the minimum is attained at least twice. Equivalently, $underline(v) in V(p)$ iff $p$ not linear at $underline(v)$. $V(p)$ can be thought of as the set of roots of $p$.
- A *plane tropical curve* is the hypersurface of a polynomial of two variables.
- $V(p)$ for $p(x, y)$ is finite graph in $RR^2$, with bounded and unbounded edges, all edge gradients rational, satisfying the following *balancing condition* around each node $(x, y)$:
    - Translate $(x, y)$ to $(0, 0)$. The sum of the first nonzero lattice vectors on the lines in the directions of edges adjacent to $(x, y)$ is zero. (TODO: define a lattice vector).
- The planar graph dual to $V(p)$ for $p(x, y)$ is a subdivision of $"Newt"(p)$ into smaller polygons. If the polygons are triangles, this is called a *triangulation*. It is *unimodular* if each division is a triangle of area $1\/2$ (in this case, $V(p)$ is a *smooth tropical curve*).

= Building Blocks

== Fields

- Let $K$ be a field. $K^*$ is the set of nonzero elements of $K$.
- *Valuation* on $K$ is function $"val": K -> RR union {oo}$, satisfying:
    - $"val"(x) = oo <==> x = 0$,
    - $"val"(x y) = "val"(x) + "val"(y)$,
    - $"val"(x + y) >= min{"val"(x), "val"(y)}$
- Often we restrict to $"val": K^* -> RR$.
- The *value group* $Gamma_"val"$ of $(K, "val")$ is the image of $"val"$ and is an additive subgroup of $RR$: $ Gamma_"val" := "val"(K^*) $
- The *trivial valuation* is $"val"(a) = 0$ for every $a in K^*$.
- $(lambda dot.op "val"): K -> R union {oo}$ is a valuation for any $lambda > 0$ so can assume $Gamma_"val"$ contains $1$.
- *Lemma*: $"val"(x) != "val"(y) ==> "val"(x + y) = min("val"(x), "val"(y))$.
- *$p$-adic valuation* on $QQ$ is $"val"_p(q) = k$ where $q = p^k a \/ b$, $(a, b) in ZZ^2$, $p divides.not a$, $p divides.not b$.
- The *complex Puiseux series* is a field defined as $ CC{{t}} = {c_1 t^(e_1) + c_2 t^(a_2) + dots.h.c: c_i in CC, a_1 < a_2 < a_3 < dots.h.c in QQ} $ where $a_1, a_2, ...$ have a common denominator. This can be written as $ CC{{t}} = union.big_(n >= 1) CC\(\(t^(1\/n)\)\) $ where $CC\(\(t^(1\/n)\)\)$ is the field of Laurent series in the variable $t^(1\/n)$.
- A natural valuation on $CC{{t}}$ is given by $"val"(c(t)) = e_1$ where $c(t) = c_1 t^(e_1) + c_2 t^(e_2) + dots.h.c$, $e_1$ is the smallest power of $t$ that appears in the expansion of $c(t)$.
- A field $K$ is *(algebraically) closed* if every non-constant $p(x) in K[x]$ has a root in $K$.
- The *characteristic* of a field $K$, $"char"(K)$ is the smallest $n in NN$ such that $n dot.op 1 = 0$. If no such $n$ exists, the field has *characteric zero*.
- *Theorem*: $K = KK{{t}}$, for $KK$ a field, is algebraically closed if $KK$ is algebraically closed and of characteristic zero.

== Algebraic Varieties

- $n$-dimensional *affine space* over field $K$ is defined as $ AA_K^n = AA^n = K^n $
- $n$-dimensional *projective space* over field $K$ is defined as $ PP_K^n = PP^n = (K^(n + 1) - {underline(0)}) \/ tilde.op $ where $forall lambda != 0, underline(v) tilde.op lambda underline(v)$. Points in $PP^n$ are equivalence classes of lines through origin.
- $n$-dimensional algebraic torus is defined as $ T_K^n = T^n = {(a_1, ..., a_n): a_i in K^*} $
- *Coordinate ring* of affine space $AA^n$ is $K[x_1, ..., x_n]$.

== Grobner bases

- Let $f = sum_(underline(u) in NN^(n + 1)) c_(underline(u)) x^(underline(u))$. The *tropicalisation* of $f$, $trop(f): RR^(n + 1) -> RR$ is given by $ trop(f)(underline(w)) = min{"val"(c_(underline(u))) + underline(w) dot.op underline(u): u in NN^(n + 1) "and" c_(underline(u)) != 0} $ where $underline(w) dot.op underline(u)$ is the classical dot product. So $trop(f)$ is obtained by replacing addition with tropical addition, multiplication with tropical multiplication, and coefficients with their valuations.

= Tropical Varieties

== Hypersurfaces

- The *tropical hypersurface* is defined as $ trop(V(f)) := {underline(w) in RR^n: "minimum in " trop(f)(underline(w)) "is achieved at least twice"} $
- Let $F$ be a tropical polynomial, then $ V(F) := {underline(w) in RR^n: "minimum in" F(underline(w)) "is achieved at least twice"} $
- So $trop(V(f)) = V(trop(f))$.