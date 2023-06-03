#set text(
    font: "New Computer Modern",
    size: 12pt,
)
#set math.mat(delim: "[")
#set heading(numbering: "1.")
#set page(
    numbering: "1"
)

= Introduction

== Arithmetic

- *Tropical semiring or min-plus algebra*: $(RR union {infinity}, plus.circle, dot.circle)$ where $ x plus.circle y & := min(x, y) \ x dot.circle y & := x + y $ $plus.circle$ is *tropical sum*, $dot.circle$ is *tropical product*.
- Tropical addition and multiplication are *commutative*: $ x plus.circle y & = y plus.circle x \ x dot.circle y & = y dot.circle x $
- Tropical addition and multiplication are *associative*: $ x plus.circle (y plus.circle z) & = (x plus.circle y) plus.circle z \ x dot.circle (y dot.circle z) & = (x dot.circle y) dot.circle z $
- Tropical addition and multiplication satisfy *distributivity*: $ x dot.circle (y plus.circle z) = x dot.circle y plus.circle x dot.circle z $
- As for classical addition and multiplication, $dot.circle$ has higher precedence than $plus.circle$.
- *Identity element* for addition is $infinity$, *identity element* for multplication is $0$: $ x plus.circle infinity & = x \ x dot.circle 0 & = x $
- The identity elements satisfy $ x dot.circle infinity & = infinity \ x plus.circle 0 = cases(
    0 & "if" x >= 0,
    x & "if" x < 0
) $
- $(RR union {infinity}, plus.circle, dot.circle)$ is a *semiring* rather than a ring since there exists no additive inverse.
- We have $ forall n in NN, quad (x plus.circle y)^n = x^n plus.circle y^n $ since $(x plus.circle y)^n = n dot.op min(x, y) = min(n x, n y) = x^n plus.circle y^n$.
- We have the usual operations of addition and multiplication of vectors and matrices over the tropical semiring.
- *Scalar product* of row vector with column vector: $ (u_1, ..., u_n) dot.circle (v_1, ..., v_n)^T = u_1 dot.circle v_1 plus.circle dots.h.c plus.circle u_n dot.circle v_n $
- Product of column vector and row vector: $ (u_1, ..., u_n)^T dot.circle (v_1, ..., v_n) = mat(u_1 dot.circle v_1, ..., u_1 dot.circle v_n; dots.v, dots.down, dots.v; u_n dot.circle v_1, ..., u_n dot.circle v_n) $ so $((u_1, ..., u_n)^T dot.circle (v_1, ..., v_n))_(i j) = u_i dot.circle v_j = u_i + v_j$.
- A matrix has *tropical rank $1$* if it can be expressed in the form of the product above.
- *Monomial* is product of variables $x_1, ..., x_n$ (repetition allowed). They map $RR^n -> RR$.
- A tropical monomial is a linear function with integer coefficients.
- *Tropical polynomial* is finite linear combination of tropical monomials: $ p(x_1, ..., x_n) = a dot.circle x_1^(i_1) dots.h.c x_n^(i_n) plus.circle b dot.circle x_1^(j_1) dots.h.c x_n^(j_n) plus.circle dots.h.c $ where $a, b, ... in RR$, $i_1, j_1, ... in ZZ$. Tropical polynomials map $RR^n -> RR$.
- Clasically, $ p(x_1, ..., x_n) = min(a + i_1 x_1 + dots.h.c + i_n x_n, b + j_1 x_1 + dots.h.c + j_n x_n, dots.h.c) $.
- *Key properties of $p$*:
    - $p$ is continuous.
    - $p$ is finitely piecewise linear.
    - $p$ is *concave*: $p(1/2 (underline(x) + underline(y))) >= 1/2 (p(underline(x)) + p(underline(y)))$.
- Every function satisfying these properties can be expressed as minimum of finite set of linear functions.
- *Lemma*: the set of tropical polynomials in $n$ variables is equal to the set of piecewise-lienar concave functions on $RR^n$ with integer coefficients.
- A tropical linear polynomial has roots at points where it is non linear, i.e. where at least two of its monomial terms are equal (at these points there are "bumps" on its graph).
- Every tropical polynomial function can be uniquely expressed as tropical product of tropical linear functions. *Note*: it is not true that every tropical polynomial factors into linear functions, but every tropical polynomial is equal to another tropical polynomial which *can* be factored into tropical linear functions. This only holds in one variable.
- The *convex hull* of a set of points $S$ is set of all linear combinations of points in $S$. Geometrically, it is the smallest convex polygon or polyhedron containing each point in $S$.
- Let $f(x, y)$ be classical or tropical polynomial. Its *Newton Polygon*, $"Newt"(f)$ is the convex hull in $RR^2$ of every point $(i, j)$ such that $x^i y^j$ appears in expansion of $f(x, y)$.

== Dynamic Programming

- For an $n$ node weighted directed graph $G$, its *adjacency matrix* is $D_G := (d_(i j))$ where $d_(i i) = 0$, $d_(i j)$ is the weight of the edge from node $i$ to $j$ and $d_(i j) = infinity$ if this edge does not exist. Note that if $G$ is undirected, $d_(i j) = d_(j i)$ so $D_G$ is symmetric.
- *Proposition*: let $D_G^(dot.circle (n - 1)) = D_G dot.circle dots.h.c dot.circle D_G$ for an $n$ node weighted directed graph $G$. Then $\(D_G^(dot.circle (n - 1))\)_(i j)$ is the length of a shortest path from $i$ to $j$.
- We have the (informal) relation $ "tropical" = lim_(epsilon -> 0) log_epsilon ("classical"(epsilon)) $
- Going from classical to tropical arithmetic is called *tropicalisation*.
- The *tropical determinant* of $X = (x_(i j))$ is defined as $ "trop" det(X) := plus.circle.big_(pi in S_n) x_(1 pi(1)) dot.circle dots.h.c dot.circle x_(n pi(n)) $ where $S_n$ is symmetric group. This is also the definition of the *tropical permanent* of $X$.
- The tropical determinant is the solution to the *assignment problem*: if there are $n$ jobs and $n$ workers, and assigning job $i$ to job $j$ costs $x_(i j)$, the lowest possible cost is $"trop" det(X)$.

== Plane Curves

- The *hypersurface* $V(p)$ of a tropical polynomial $p: RR^n -> RR$ is defined as the set of all points in $RR^n$ where the minimum is attained at least twice. Equivalently, $underline(v) in V(p)$ iff $p$ not linear at $underline(v)$. $V(p)$ can be thought of as the set of roots of $p$.
- A *plane tropical curve* is the hypersurface of a polynomial of two variables.