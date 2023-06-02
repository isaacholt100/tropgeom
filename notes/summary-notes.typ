#set text(
  font: "New Computer Modern"
)

= Introduction

- *Tropical semiring or min-plus algebra*: $(RR union {infinity}, plus.circle, dot.circle)$ where $ x plus.circle y & := min(x, y) \ x dot.circle y & := x + y $ $plus.circle$ is *tropical sum*, $dot.circle$ is *tropical product*.
- Tropical addition and multiplication are *commutative*: $ x plus.circle y & = y plus.circle x \ x dot.circle y & = y dot.circle x $
- Tropical addition and multiplication are *associative*: $ x plus.circle (y plus.circle z) & = (x plus.circle y) plus.circle z \ x dot.circle (y dot.circle z) & = (x dot.circle y) dot.circle z $
- Tropical addition and multiplication satisfy *distributivity*: $ x dot.circle (y plus.circle z) = x dot.circle y plus.circle x dot.circle z $
- As for normal addition and multiplication, $dot.circle$ has higher precedence than $plus.circle$.
- Polynomials and rational functions defined over tropical semiring are piecewise linear.
- *Identity element* for addition is $infinity$, *identity element* for multplication is $0$: $ x plus.circle infinity & = x \ dot.circle 0 = x $
- The identity elements satisfy $ x dot.circle infinity & = infinity \ x plus.circle 0 = cases(
    0 & "if" x >= 0,
    x & "if" x < 0
) $
- $(RR union {infinity}, plus.circle, dot.circle)$ is a *semiring* rather than a ring since there exists no additive inverse.
- We have $ forall n in NN, quad (x plus.circle y)^n = x^n plus.circle y^n $ since $(x plus.circle y)^n = n dot.op min(x, y) = min(n x, n y) = x^n plus.circle y^n$.