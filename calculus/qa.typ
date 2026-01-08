#import "../typst_utils/utils.typ": *

#set text(..default_text_parm)
#set par(..default_par_parm)
#set table(stroke: none)
#set pagebreak(weak: true)

#set image(..default_image_parm)
#set grid(..default_grid_parm)
#show bibliography: set grid(..default_bib_grid_parm)

#show figure.where(kind: image): set figure(..default_FOI_parm)
#show figure.where(kind: table): set figure(..default_FOT_parm)
#show figure.caption: set text(size: font_size_zh.WuHao)
#show figure.where(kind: table): set figure.caption(position: top)

#show heading.where(level: 1): set heading(numbering: "1")
#show heading.where(level: 2): set heading(numbering: "1.1")

#show math.equation: set text(font: ("New Computer Modern Math", "SimSun"))

#SubSection("不等式问题")

#FLI() Q. $lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n)$

#FLI() A.

$
  & (integral^b_a e^(-n t^2) "d" t )^(1/n) quad (b>a>=1) \
  & = (integral^(a + delta)_a e^(-n t^2) "d" t + integral^b_(a+delta) e^(-n t^2) "d" t)^(1/n) \
  & >= ( integral^(a+delta)_a e^(-n (a+delta)^2) "d" t + integral^b_(a+delta) e^(-n t) "d" t)^(1/n) \
  & = (delta e^(-(a+delta)^2) + 1/n (e^(-n (a+delta)) - e^(-n b)) )^(1/n) \
  & -> e^(-(a+delta)^2) quad (n -> inf, thin forall thin delta)
$
故 $sup thin e^(- (1+delta)^2) <= lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n)$ 又因 $lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n) >= (e^(-n))^(1/n)$ 故 $lim_(n -> inf) ( integral^2_1 e^(-n t^2) "d" t)^(1/n) = e^(-1)$

#FLI() Q. $f(x)>0$ 在 $[0,1]$ 连续, 证 $integral^1_0 ln f(x) "d" x <= ln (integral^1_0 f(x) "d" x)$

#FLI() A.
$ g(x) = (f(x))/(integral^1_0 f(x') "d" x') $
在 $[0,1]$ 连续, 原问题等价于 $integral^1_0 ln g(x) "d" x <=0 quad (integral^1_0 g(x) "d" x = 1)$, 显然
