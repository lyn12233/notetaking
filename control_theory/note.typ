#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set text(font: ("SimSun","Times New Roman"),top-edge: 1em,bottom-edge: 1em)
#set par(leading: 10pt,spacing: 10pt, first-line-indent: (amount: 20pt, all: true))
#set page(paper: "a4")

#show heading.where(level: 1): set text(size: 22pt)
#show heading.where(level: 2): set text(size: 18pt)
#show heading.where(level: 3): set text(size: 16pt)

#set heading(numbering: "1.1")
#show heading: set text(font: ("SimHei"))

#show math.equation: set block(breakable: true)
#show math.equation: set text(font:("New Computer Modern Math","SimSun"))

#show raw: set text(font:("SimHei"))

#[
  #set align(center)
  #set text(size: 30pt, font: ("SimHei"))
  计算机控制理论笔记
  #v(20pt)
]

本课程讲述在自动控制理论中针对可用计算机控制的离散闭环负反馈系统的分析和设计。

主要内容为闭环控制系统模型：

#[
  #set align(center)
  #set text(size: 10pt)
  #grid(stroke: 1pt, columns: 1fr, inset: 10pt,
  diagram(
    node-stroke: 1pt,spacing: 3em,
    node((0,0), text(size:8pt)[CMP], shape:circle, radius: 8pt),
    edge((-1,0), "r", "-|>", [+], label-pos: 0.9),
    edge((-1,0), "r", [给定值 $r(t)$], label-pos: -50%, label-side: center),
    edge((0,0), "r", "-|>", [#text(size: 8pt)[偏差 ]$e(t)$]),
    node((1,0), [控制器 $D(z)$]),
    edge("r", "-|>", [$u(t)$]),
    node((2,0), [执行器/被控对象/增益 $G(z)$]),
    edge("r,d,l,l", "-|>"),
    edge((3,0), "r", "-|>", [被控变量 $y(t)$]),
    node((1,1), [测量]),
    edge("l,u", "-|>", [-], label-pos: 0.9),
  )
  )
]

在这样的控制模型中，计算机系统包括D/A转换、数字计算机、A/D转换3个部分。控制过程包括数据采集、决策、控制、信息管理等。

系统中存在的信号种类由模拟信号、采样信号和数字信号，转换关系：

#[
  #set align(center)
  #set text(size: 10pt)
  #grid(
    stroke: 1pt, columns:1fr, inset: 10pt,
    diagram(
      node-stroke: 1pt, spacing: (6em,3em),
      node((0,0),[模拟信号]),
      edge("r", "-|>", [采样]),
      node((1,0),[采样信号]),
      edge("r", "-|>", [量化，编码]),
      node((2,0),[数字信号]),
      edge("d,l,l,u", "-|>", [解码，保持])
    )
  )
]

= 计算机控制导论

== 计算机系统概述

计算机控制系统包括被控对象，执行机构，测量装置和计算机系统。计算机系统的三大要素时D/A转换器，A/D转换器和数字计算机。计算机控制系统的优点：略。

== 计算机控制系统的发展与应用

略

== 计算机控制理论与设计

略

= 信号分析

== 控制系统中信号的分类

- 从时间上分: 连续时间信号，离散时间信号
- 从幅度分布上分：连续信号，离散信号，数字信号(幅度可以用二进制编码表示的信号)
`存在歧义？`

== 理想采样过程

$ f_s (t) = f(t) delta_T (t) = sum_(k=0)^(infinity) f(k T) delta (t - k T)\
F_s (s) = 1/T sum_(n=-infinity)^(+infinity) F(s + j n omega_s) $

采样定理：略。实际问题中处理采样失真的方法：(1)尽可能减小采样频率；(2)低通滤波器对信号预处理。

== 信号的恢复和重构

理想恢复过程，即使用低通滤波器：$f_r (t) = sum_(k=- infinity)^(+infinity) f (k T) "Sa"(omega_s / 2 (t - k T))$

实际通常使用零阶外推插值，即零阶保持器(Zero Order Holder, ZOH)：$f_r (t) = (f(t) delta_T (t) ) times.o G_T (t - T/2)$，其中 $$ 为门函数，得到响应函数 $G_H (s) = (1 - e^(-T s))/s$

== 采样周期的选择

一般采用经验方法，略。

= 计算机控制系统的数学描述

== 差分方程描述离散系统

略

== Z变换

定义：
$ X(z) = scr(Z) [x(n)] = sum_(n=-infinity)^(+infinity) x(n) z^(-n) $

性质：
$ 
  scr(Z)[x(n-n_0)] = X(z) z^(-n_0)\
  scr(Z)[x(n) a^(-n)] = X(a z)\
  lim_(k->infinity) x(n) = lim_(z->1) (z-1) X(z)\
  x(0) = lim_(z->infinity) X(z)\
 $

`讲义中使用Z变换直接作用于时间连续函数，即默认` $hat(x)(n) = x(n T)$ `。`

终值定理成立的条件：$(1-z^(-1))X(z)$ 所有极点位于单位圆内。

本课程的要点：(1)时域到Z域；(2)S域到Z域；(3)长除法求Z反变换。

== 脉冲传递函数

即离散线性时不变系统的冲激响应函数。要点：(1)物理可实现条件，即 $G(z) = (b_0 z^m + ... +b_m)/(z^n + ... + a_n)$, $n>=m$；(2)脉冲传递函数和差分方程的关系。

== 离散系统的方块图分析

`不知所云。主要方法是先列出s域的式子，然后以采样开关为分隔作z变换。`

= 计算机控制系统的稳定误差分析

== 连续控制系统稳定性分析
#grid(columns: 1fr,stroke: 1pt, inset: 10pt,
diagram(
  spacing: 1em,
  node((0,0),[系统响应函数极点全部位于左半平面]),
  edge("r", "-|>"),
  node((1,0), [特征方程零点全部位于左半平面]),
  edge("r", "-|>"),
  node((2,0), [Routh 判据])
)
)

略。

== s平面与z平面的映射关系

略。

== 离散控制系统稳定性分析

Jury判据，即使 $a_0 z^n + ... + a_n = 0 space (a_0>=0)$ 所有零点位于单位圆内的条件

$ a_0 & quad & a_1 & quad ... & a_n\
 a_0 - (a_n)/(a_0) a_n & quad & a_1 - (a_n)/(a_0) a_(n-1) & quad ... & 0\
 ... $ 
 
#par(first-line-indent: 0pt)[所有 $n+1$ 个首项大于零。]  

`Jury判据为考察重点。通常不涉及首项为零点情况。`

主要结论：采样系统稳定性比连续系统差；采样周期越小，稳定性越强。

== 离散控制系统稳态误差分析

稳态误差的定义并由终值性质：
$ e_("ss") = lim_(t->+infinity) e(t) = lim_(s->0) (s R(s))/(1+ G(s)) $

若 $G(s) = k/(s^v) (1+...)/(1+...)$ 表示有 $v$ 个积分环节，则对于 $R(s) ~ O((1/s)^(v+1))$ 的输入来说稳态误差存在。

DEF：$v$ 对应 $v$ 型系统。常见的为0型，I型和II型系统。稳态误差为零的系统称为无差系统，为有限值称为有差系统。稳态误差系数 $K_p = lim G(s)$, $K_v = lim s G(s)$, $K_a = s^2 G(s)$。单位速度 $R(s) = 1/s^2$，单位加速度 $R(s) = 1/s^3$。

常见稳态误差：

#[
  #set align(center)
  #table(columns: 4, inset: 10pt,align: center,
    [],[$ 1/s $],[$ 1/s^2 $],[$ 1/s^3 $],
    [0],[$ 1/(1+K_p) $],[$infinity$],[$infinity$],
    [I],[$0$],[$ 1/(K_v) $],[$infinity$],
    [II],[$0$],[$0$],[$ 1/K_a $],
  )
]

推广到离散系统：
$ 
  e_("ss") = lim_(z->1) ((z-1)R(z))/(1+D(z)G(z))\
  K_p = lim_(z->1) D(z) G(z), K_v = lim_(z->1) (z-1) D(z) G(z), K_a = lim_(z->1) (z-1)^2 D(z)G(z)\
 $

#[
  #set align(center)
  #table(columns: 4, inset: 10pt,align: center,
    [],[$ U(t)-> (1)/(1-z^(-1)) $],[$ t U(t) -> (T z^(-1))/((1-z^(-1))^2) $],[$ 1/2 t^2 U(t) -> (T^2 (1+z^(-1)) z^(-2))/(2(1-z^(-1))^2) $],
    [0],[$ 1/(1+K_p) $],[$infinity$],[$infinity$],
    [I],[$0$],[$ T/(K_v) $],[$infinity$],
    [II],[$0$],[$0$],[$ T^2/K_a $],
  )
]

`注：`$e_("ssr")$`表示输入R作用下的稳态误差，`$e_("ssn")$`表示噪声N作用下的稳态误差，此处略。`

零阶保持器在分析稳态误差中的意义：s域响应函数经过零阶保持器后做z变换，$G(s)$ 和 $G(z)$ 具有相同的 $K_p,K_v,K_a$。

动态误差分析：对于响应 $C(z) = R(z) Phi(z)$, 峰值时间 $t_p = T space "argmax"_n thin c(n)$，超调量 $sigma = max c(n) \/ c(infinity) - 100%$，调节时间 $t_s=?$。

`通常不考虑H(z)，响应C(z)即被控变量Y(z)。`

= 间接设计法

设计的一般步骤：(1)设计s域控制传递函数 $D(s)$；(2)选择采样周期和保持器；(3)等效离散化得到 $D(z)$；(4)检查设计指标，如稳定性等；(5)使用差分方程实现；(6)仿真检验。

== 等效离散化

等效离散化方法有：
+ 前向差分法：$s = (z-1)/T$，不能保证收敛。
+ 后向差分法：$s = (1-z^(-1))/T$
+ 双线性变换法：$s = 2/T (1-z^(-1))/(1+z^(-1))$
+ 零极点匹配法：使零极点按 $ k (product_m (s+a_i))/(product_n (s+b_i)) -> k' (product_m (z - e^(-a_i T)))/( product_n (z-e^(-b_i T)))(z+1)^(max(0,n-m)) $ 关系映射；$k'$ 可以由 $|D(j omega)| = |D(e^(j omega T))|$ 确定。
+ 脉冲响应不变法：即做z变换，或带零阶保持器的z变换。

== PID

即比例微分积分控制，差分方程的形式为

$ 
  u(n) = K_P e(n) + K_I sum_(i=0)^n e(i) + K_D (e(n)-e(n-1))
 $

- 比例调节：是即时反应，不能消除静态误差。
- 积分调节：可以消除静态误差，但容易超调。
- 微分调节：超前矫正，能克服超调，降低抗干扰能力。

PID也可以表示为增量形式：
$ 
  Delta u(n) = K_P (e(n) - e(n-1)) + K_I e(n) + K_D (e(n) - 2e(n-1) + e(n-2))
 $

PID传递函数：略。

改进方法有：
+ 梯形积分：提高积分项运算精度。
+ 多步累加提高积分的灵敏度：略。
+ 积分分离法：当误差足够小时忽略积分项。实现积分饱和抑制。
+ 遇限削弱积分：当 $u(k-1)$ 超过阈值且 $e(k)$ 同向变化，不进行积分累加。
+ 饱和停止积分：当 $u(k-1)$ 超过阈值不进行积分累加
+ 变速积分：误差越大，当前项贡献越小。
+ 不完全微分，微分先行，四点插值微分：略
+ 带死区PID算法：误差足够小则视作0。

PID参数整定：略

== Smith预估器

Smith预估器用于在连续系统中处理纯滞后现象。

若执行器出现滞后时间 $tau$, 其响应变为 $G(z) e^(-tau s)$，则闭环传递函数 $ (Y(z))/(R(z)) = Phi(z) = (D(z) G(z) e^(-tau s))/(1 + D(z) G(z) e^(-tau s)) $

特征方程中出现超越函数项造成不稳定。在测量步骤中加入 $G_s (z) = G(z) (1-e^(-tau s))$ 处理，解得
$ 
  Y'(z) = Y(z) + E(z) D(z) G_s (z) = E(z) D(z) G(z)\
  E(z) = R(z) - Y'(z)\
  Phi(z) = (Y(z))/(E(z)+Y'(z)) = (D(z) G(z) e^(-tau s))/(1 + D(z) G(z))
 $ 

从而消除了特征方程的滞后项。

$G_s$ 称为Smith预估补偿器，框图：略。

= 直接设计法

== 概述

设计步骤：(1)获得 $G(z)$；(2)设计 $Phi(z)$；(3)求 $D(z)$；(4)差分方程实现/仿真检验。

由 $D(z) = (Phi(z))/(G(z)(1-Phi(z)))$，期望闭环传递函数应与被控对象有相同的滞后。

== 最少拍设计

参考#link("https://mnourgwad.github.io/CSE421/lectures/CSE421DigitalControlL10.pdf")以及#link("https://www.philadelphia.edu.jo/academics/amahasneh/uploads/lecture_17_Discrete%20controller%20Design_s1_21_22.pdf")。Dahlin控制被视作最小拍控制(Dead-beat Control)的平滑结果。

=== 有波纹最小拍设计

最小拍设计的目的是在最少时间内达到稳态且稳态误差为零。设计 $Phi(z) = sum C_k z^(-k)$ 为纯滞后的组合，$Phi_e (z) = sum C_k (1-z^(-1))^k$ 为差分的组合。要保证 $D = (Phi)/(G Phi_e)$ 是稳定系统，$U = D Phi_e R = (Phi R)/(G)$ 是稳定信号，$Phi+Phi_e = 1$，以及可实现性，得出设计的条件为：
+ $G(z)$ 单位圆外零点是 $Phi(z)$ 的零点
+ $G(z)$ 单位圆外极点是 $Phi_e (z)$ 的零点
+ $G(z)$ 和 $Phi (z)$ 滞后项均为 $z^(-l)$
+ 给定 $q$ 要求处理 $q$ 阶信号，即 $r(n)=n^q, e(infinity)=0$, 即 $ [(z-1) Phi (z) (-z partial_z)^q 1/(1-z^(-1)) ] |_(z=1) = 0 $

设计的形式 (对 $G(z) = z^(-l) product (1-a_i z^(-1)) \/ product (1-b_i z^(-1))^(r_i)$)：
$ 
  Phi(z) = z^(-l) product_(a_i) (1-a_i z^(-1)) F(z) \
  Phi_e (z) = product_(b_i!=1) (1-b_i z^(-1))^(r_i) (1-z^(-1))^(max(r_1,q)) F_e (z)
 $

其中 $F(z),F_e (z)$ 为多项式，由 $Phi + Phi_e = 1$ 即最小拍要求(项数最少)确定。

=== 无波纹最小拍设计

要求 $(U(z))/(R(z)) = (Phi(z))/(G(z))$ 是有限长序列，即 $G(z) | Phi(z)$。

=== 最小拍设计系统的改进
略。

== Dahlin控制算法

步骤：(1)计算 $G(z) = scr(Z) [Z(s) G(s)]$；(2)构造 $Phi(z) = (e^(-tau s))/(T_tau s + 1)$，设计参数包括惯性因子 $T_tau$，滞后时间 $tau$ 和采样频率 $T=tau\/N$；(3)计算 $D(z)$；(4)验证振铃现象并修正。