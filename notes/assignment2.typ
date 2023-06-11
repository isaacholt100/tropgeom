#import "./template.typ": template, val, trop
#show: template


Look at photo, what are possible valuations of $w_1, w_2, w_3$ if $"val"(x) = "val"(y) = 0$ assuming they satisfy the equations (assuming that they lie in the intersections of the vanishing sets).

Thoughts:
- Just wanted to clarify why we can conclude if $val(y) = 2$, $val(x) = 1$, then $val(w_1) = 1$? Is it because $w_1 - x - y = 0 ==> w_1 = x + y$?
- Let $w_1, w_2, w_3, x, y in trop(V(w_1 - x - y) sect V(w_2 - x - y^(-1)) sect V(w_3 - x - y^2))$.
- $ trop(V(w_1 - x - y) sect V(w_2 - x - y^(-1)) sect V(w_3 - x - y^2)) subset.eq \ trop(V(w_1 - x - y)) sect trop(V(w_2 - x - y^(-1))) sect trop(V(w_3 - x - y^2)) $
- Let $K = CC{{t}}$, $x, y in K$. Let $x = sum_(m = 0)^oo a_m t^(m \/ n_0)$, $y = sum_(m = 0)^oo b_m t^(m \/ n_1)$
- $val(1) = val(y y^(-1)) = val(y) + val(y^(-1)) = 0 ==> val(y^(-1)) = 0$.
- $val(y^2) = val(y) + val(y) = 0 + 0 = 0$
- So $val(w_1), val(w_2), val(w_3) >= 0$
- If $n_0 = n_1$, $val(w_1) = min{m in NN: a_m != -b_m}$.
- If $n_0 != n_1$, $ val(w_1) = min({m / n_0 in QQ: forall k in NN, m/n_0 != k/n_1 "or" a_m != b_k} \ union {k/n_1 in QQ: forall m in NN: m/n_0 != k/n_1 "or" a_m != b_k}) $
- $ y^2 = (sum_(m = 0)^infinity b_m t^(m \/ n_1))^2 = sum_(m = 0)^infinity sum_(i + j = m) b_i b_j t^(m \/ n_1) $