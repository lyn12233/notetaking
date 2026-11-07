#import "../style.typ": get_thesis_by_name

#let thesis = get_thesis_by_name("lyn12233.note.1")

#show: thesis.begin
#show: thesis.main_body

== 不等式问题

Q. $lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n)$

A.

$
  & (integral^b_a e^(-n t^2) "d" t )^(1/n) quad (b>a>=1) \
  & = (integral^(a + delta)_a e^(-n t^2) "d" t + integral^b_(a+delta) e^(-n t^2) "d" t)^(1/n) \
  & >= ( integral^(a+delta)_a e^(-n (a+delta)^2) "d" t + integral^b_(a+delta) e^(-n t) "d" t)^(1/n) \
  & = (delta e^(-(a+delta)^2) + 1/n (e^(-n (a+delta)) - e^(-n b)) )^(1/n) \
  & -> e^(-(a+delta)^2) quad (n -> inf, thin forall thin delta)
$
故 $sup thin e^(- (1+delta)^2) <= lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n)$ 又因 $lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n) >= (e^(-n))^(1/n)$ 故 $lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n) = e^(-1)$

Q. $f(x)>0$ 在 $[0,1]$ 连续, 证 $integral^1_0 ln f(x) "d" x <= ln (integral^1_0 f(x) "d" x)$

A.
$ g(x) = (f(x))/(integral^1_0 f(x') "d" x') $
在 $[0,1]$ 连续, 原问题等价于 $integral^1_0 ln g(x) "d" x <=0 quad (integral^1_0 g(x) "d" x = 1)$, 显然

Q. ${f_n}$ 满足
$
  integral^1_0 f_1 (x) "d" x & >= integral^1_0 f_0 (x) "d" x \
                 f_(n+1) (x) & = (2 f^2_n (x) )/( f_n (x) + f_(n-1) (x) )
$
证 $integral^1_0 f_n (x) "d" x$ 递增收敛

A.
$
  f_(n+1) - f_n & = ( f^2_n - f^2_(n+1) ) / ( f_n + f_(n+1) ) \
                & = ( ( f_n - f_(n-1) )^2 + f^2_n - f^2_(n-1) ) / ( 2( f_n + f_(n-1) ) ) \
                & >= ( f^2_n - f^2_(n-1) ) / ( 2( f_n + f_(n-1) ) ) \
                & = ( f_n - f_(n-1) )/2
$
