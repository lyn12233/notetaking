#import "../typst_utils/utils.typ":*

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

#Paragraph[
  本课程主要包括随机信号分析, 信号检测盒信号估计3个部分, 实际只涉及随机信号分析部分.
]

#Section("随机信号处理基础")

#SubSection("信号处理概述")

#FLI() 本章介绍了信号的分类, 特征和窄带信号的定义等, 引入零中频处理技术, 复信号等概念, 略. 以下通常考虑连续信号而非离散信号.

#SubSection("随机变量和特征函数")

#FLI() 包括随机变量的概率密度, 期望, 方差, 协方差, 独立性, 相关性, 变换性质等, 略. 符号约定如下

#figure(table(
  columns: (1fr, 4fr),
  stroke: 0.5pt,
  inset: 10pt,
  [$m_X$], [期望 $E[X]$],
  [$m_(i j) quad m_i$], [(混合)(原点)矩 $E[X^i Y^j] quad E[X^i]$],
  [$C_(i j) quad C_i quad C_(X_i X_j)$],
  [(混合)中心矩\ $E[(X-m_X)^i (Y-m_Y)^j]$, $D[X]$, $E[(X_i-m_(X_i))^2 (X_j - m_(X_j))^2]$],
))

#FLI() 随机变量的变换性质简记为 $p(y_1,y_2) = p(x_1,x_2) |(partial (x_1,x_2))/(partial (y_1,y_2))|$

#FLI() *DEF* 特征函数

$ Phi_X (omega) = E[e^(j omega X)] = integral e^(j omega x) p(x) dif x $

#FLI() *PROP* 特征函数的性质

- $Phi_X (omega)$ 存在, 且 $|Phi_X (omega)| <= Phi_X (0) = 1$.
- 若 $Y=a X+b$ 则 $Phi_Y (omega) = Phi_X (a omega) e^(i omega b)$.
- 若 $X_1, X_2$ 统计独立, $Y=X_1 + X_2$, 则 $Phi_Y (omega) = Phi_(X_1) (omega) Phi_(X_2) (omega)$ .
- 与原点矩的关系: $(dif^k Phi_X (omega))/(dif omega^k)|_(omega = 0) = j^k m_k$ 也可以表示为泰勒展开的形式 $Phi_X (omega) = sum j^k m_k omega^k/k!$

#FLI() 二维特征函数

$ Phi_(X_1,X_2) (omega_1 omega_2) = E[e^(j omega X_1) e^(j omega X_2)] $

#FLI() *PROP*
- 统计独立 $<-> Phi_(X_1,X_2) (omega_1, omega_2) = Phi_(X_1) (omega_1) Phi_(X_2) (omega_2)$
- 一致连续
- $Phi_(X_1,X_2) (omega_1, 0) = Phi_(X_1) (omega_1)$

#Section("随机信号分析")

#SubSection("随机过程")

#FLI() *DEF* 随机过程: 信号随时间变化不具备某种明确的变化规律.

#SubSub("随机过程的统计特性")

#FLI() *DEF* 随机过程的多维概率分布和概率密度函数: 略

#FLI() *DEF* 自相关函数

$ R_X (t_1, t_2) = E[X(t_1) X(t_2)] = integral.double x_1 x_2 p(x_1,x_2; t_1, t_2) thin dif x_1 dif x_2 $

#SubSub("独立, 正交, 相关性")

#FLI() *DEF* 统计独立, 正交, 相关:
- $p(x_1,x_2;t_1,t_2)=p(x_1;t_1)p(x_2,t_2)$ 称在 $t_1$ 和 $t_2$ 时刻统计独立
- $R_X (t_1,t_2)=0$ 称在 $t_1$ 和 $t_2$ 时刻正交
- $C_X (t_1,t_2)$ 称在 $t_1$ 和 $t_2$ 时刻不相关

#SubSub("特征函数")

#FLI() *DEF* 特征函数 $Phi_X (omega_1,...;t_1,...) = E[e^(i omega_1 X (t_1)) dot ...]$

#FLI() *PROP* 相关函数和特征函数的关系: $R_X (t_1, t_2) = partial_(omega_1) partial_(omega_2) Phi_X (omega_1, omega_2; t_1, t_2) |_(omega_1 = omega_2 = 0)$

#SubSub("平稳随机过程")

#FLI() *DEF* 狭义和广义平稳

- 狭义平稳: $p(x_1,...;t_1,...)=p(x_1,...;t_1+tau,...)$
- 广义平稳: $E[X(t)]=m_X, thin R_X (t_1,t_2)=R_X (tau)$

#FLI() *DEF* 平稳随机过程的时间平均统计特性: 包括时间均值, 时间自相关函数, 时间方差等. 如对样本函数 $x(t)$, 若 $chevron.l x(t) chevron.r = lim_(T->infinity) 1/T integral_0^T x(t) dif t$ 存在, 则称为其时间均值.

#SubSub("各态历经过程")

#FLI() *DEF* 广义的各态历经性(Ergodicity): 广义平稳的随机过程集合平均统计特性等于时间平均统计特性 $chevron.l x(t) chevron.r attach(=, t: p) m_X , space chevron.l r(tau) chevron.r attach(=, t: p) R_X (tau)$.

#SubSub("平稳随机过程的相关函数")

#FLI() *PROP* 平稳随机过程相关函数的性质:
- $R(tau)=R(-tau)$
- $R(0)>=|R(tau)|$
- $R(tau)=C_X (tau)+m_X^2$
- $R(infinity)=m_X^2$ 表示直流功率, $R(0)=m_X^2 + sigma_X^2$ 表示总功率.

#FLI() *DEF* 相关系数 $r_X = (C_X)/(sigma_X^2)$, 相关时间 $tau_0 = integral_0^(infinity) r(t) dif t$ 或 $tau_0 space "s.t." space r (tau_0) = 0.05$.

#SubSub("互相关函数")

#FLI() *DEF* 平稳过程之间的广义联合平稳, 各态历经性

#FLI() *DEF* 平稳随机过程的独立, 相关性, 正交性和各态历经性
- 统计独立(m+n维联合概率分布等于各自分布的乘积): $p_(n+m) = p_n p_m$
- 不相关: $C_(X Y) = 0, space R_(X Y) = m_X m_Y$
- 正交: $R_(X Y) = 0$
- 各态历经: $chevron.l R_(x y) (tau) chevron.r = R_(X Y) (tau)$

#FLI() *PROP* 平稳随机过程互相关函数的性质
- $R_(X Y) (tau) = R_(X Y) (-tau)$
- $R_(X Y)^2 (tau) <= R_X (0) R_Y (0) <= 1/4 (R_X (0) + R_Y (0))^2$ (同理 $C_(X Y)^2 <= sigma_X sigma_Y$)

#SubSub("功率谱密度")

#FLI() *DEF* 功率谱密度函数: 对任一样本 $x(t)$, 记 $X_T (omega) = integral_(-T/2)^(T/2) x(t) e^(-j omega t) dif omega$, 若 $G_x (omega) = lim_(T-> infinity) 1/T |X_T (omega)|^2$, 则称 $G_x (omega)$ 为样本 $x(t)$ 的功率谱密度. 称 $G_X (omega) = E[ G_x (omega) ]$ 为平稳随机过程 $X(t)$ 的功率谱密度.

#FLI() *THEOREM* 维纳-辛钦定理(Wiener-Khinchin):

$ G_X (omega) = integral R_X (tau) e^(-j omega tau) dif tau $

also $G_X (tau) attach(arrow.r, t: scr(F)) R_X (omega)$.

*PROOF*
$
  G_X (omega) &= E[ lim_(T->infinity) 1/T integral_(-T/2)^(T/2) X_T (t_1) e^(- j omega t_1) dif t_1 integral_(-T/2)^(T/2) X_T^* (t_2) e^(j omega t_2) dif t_2 ] \
  &= lim_(T->infinity) 1/T integral_(-T/2)^(T/2) integral_(-T/2)^(T/2) E[X_T (t_1) X_T (t_2)] e^(-j omega t_1 + j omega t_2) dif t_1 dif t_2 \
  & ("let" space t_1-> tau=t_1-t_2, space "then" space J=1)\
  & ...
$

_note_: 定理在绝对可积条件和平稳性下成立

#SubSub("复功率谱")

#FLI() *DEF* 单边功率谱密度 $F_X (omega) = 2G_X (omega) U (omega)$

#FLI() *DEF* 复随机变量: $Z=X+j Y$; 中心化复随机变量: $accent(Z, circle) = Z - m_Z$, 复随机变量的独立, 相关和正交性(略).

#FLI() *DEF* 复随机信号的相关函数 $R_(Z_1 Z_2) (t_1 , t_2) = E[Z_1^* (t_1) Z_2 (t_2)]$ (第一项取共轭)

#FLI() *DEF* 希尔伯特变换: $H(omega) = -j "sgn" (omega), h(t) = 1/(pi t)$, 对信号的作用为 $hat(X) = X(t) times.o h(t)$

#FLI() *PROP* Hilbert 变换实现 $+90degree$ 相移, 意义是(1)由实信号构造复信号同时实部和虚部正交, 即解析复信号; (2) 构造单边功率谱并不改变信号的实部.

#FLI() *DEF* 解析复信号/随机过程: $tilde(X) (t) = X (t) + j hat(X) (t)$

#FLI() *PROP* 解析复随机过程的性质
- 若 $X, hat(X)$ 联合平稳, 则 $R_(X hat(X)) (tau) = R_(hat(X) X) (-tau), R_(X hat(X)) (tau) = - R_( X hat(X)) (-tau)$ ((1) 由定义对任意 $R_(X Y)$ 成立, (2) 由Hilbert卷积得).
- $R_(tilde(X)) (tau) = R_X (tau) + R_(hat(X)) (tau)+j( R_(X hat(X)) (tau) - R_(hat(X) X) (tau) )=2(R_X (tau) + R_(X hat(X)))$
- $G_(tilde(X)) (omega) = 4 G_X (omega) U(omega)$

#FLI() *EXAMPLE* 窄带随机过程包络特性:
- 记 $Y(t) = A(t) cos(omega_0 t + phi(t))$, $tilde(Y) (t) = tilde(A) (t) e^(j omega_0 t)$, 则 $R_(tilde(Y)) (tau) = R_(tilde(A)) (tau) e^(j omega_0 t)$. $G_(tilde(Y)) (omega) = G_(tilde(A)) (omega - omega_0)$
- 记 $Y(t)=A_c (t) cos omega_0 t - A_s (t) sin omega_0 t$, $A_c$, $A_s$ 称为正交分量, 可知是零均值平稳正态过程, 则 $A_c$, $A_s$ 可以表示为 $A_c (t) = Y (t) cos omega_0 t + hat(Y) (t) sin omega_0 t, space A_s (t) = -Y(t) sin omega_0 t + hat(Y)(t) cos omega_0 t$, 得到 $R_c (tau) = R_Y (tau) cos omega_0 tau + R_(Y hat(Y)) (tau) sin omega_0 tau = R_s (tau)$, $R_(c s) (tau) = -R_Y (tau) sin omega_0 tau + R_(Y hat(Y)) (tau) cos omega_0 tau = - R_(s c) (tau)$.

#SubSub("窄带正态过程的包络和相位")

#FLI() *EXAMPLE* 窄带正态随机过程包络和相位特性:
- $A_c , A_s$ 统计独立(由正交得出)
- 变换 $ cases(
    A=sqrt(A_c^2 + A_s^2),
    phi=arctan (A_s)/(A_c)
  ) $
  得到 $p(A,phi)=A/(2 pi sigma^2) e^(-A^2/(2 sigma^2)) quad (A>=0)$, 得到 $ cases(p(A)=A/sigma^2 e^(-A^2/(2 sigma^2)), p(phi)=(1)/(2 pi)) $
  说明给定时刻 $t$ 随机变量 $A(t), phi(t)$ 统计独立.
- 二维分布: 对随机过程 $A_c$, $A_s$, 时刻 $t_1 = 0$, $t_2 = tau$, 四维概率密度表示为 $ p(A_c, A_s, A_(C tau) , A_(s tau)) &= \
  p(x_1,x_2,x_3,x_4) &= 1/(4 pi^2 |C|^(1/2)) exp [ -1/(2 |C|^(1/2)) sum_(i,j) C_(i,j) (x_i-m_i)(x_j-m_j) ]\
  &= 1/(4 pi^2 |R|^(1/2)) exp [ -1/(2 |R|^(1/2)) (sigma^2 (A_c^2 + A_s^2 + A_(c tau)^2 + A_(s tau)^2) - 2 A(tau) (A_c A_(c tau) + A_s A_(s tau))) ] $
  其中 $A(tau) = R (tau), sigma^2 = R(0)$, $|C| = |R| = (sigma^4 - A^2 (tau))^2$. 变换得 $ p(A, A_tau, phi, phi_tau) &= (A A_tau)/(4 pi^2 |R|^(1/2)) exp [ -1/(2 |R|^(1/2)) (sigma^2 (A^2 + A^2_tau)) - 2 A(tau) A A_tau cos (phi - phi_tau) ] \
  & quad quad (A, A_tau >=0, 0<=phi, phi_tau <= 2 pi) $
  可以得到包络和相位作为随机过程不统计独立.

#FLI() *EXAMPLE* 随机初相正弦信号+正态噪声 $Y(t) = A cos (omega_0 t + theta) + n(t)$
- 分解 $Y(t) = A_c (t) cos omega_0 t - A_s (t) sin omega_0 t$: $ cases(A_c (t) = A cos theta + n_c (t), A_s (t) = A sin theta + n_s (t)) $
  给定 $theta$: $ cases(
    p(A_c | theta) = 1/(sqrt(2 pi) sigma) exp(- (A_c - A cos theta)^2/(2 sigma^2)),
    p(A_s | theta) = 1/(sqrt(2 pi) sigma) exp(- (A_s - A sin theta)^2/(2 sigma^2))
  ) $
  联合概率密度: $ p(A_c , A_s | theta) = 1/(sqrt(2 pi) sigma) exp(- (A_c^2 + A_s^2 + A^2 - 2 A A_c cos theta - 2 A A_s sin theta)/(2 sigma^2)) $
  变换得: $ p(r, phi | theta) = r/(sqrt(2 pi) sigma) exp(- (r^2 + A^2 - 2 A r cos(phi-theta))/(2 sigma^2)) $
  一维分布: $ cases(
    p(r | theta) = r/(sigma^2) exp(- (r^2+A^2)/(2 sigma^2)) thin I_0((r A)/sigma^2) quad ("Rice 分布"),
    p(phi | theta) = ...
  ) $
- 讨论包络的概率分布: 归一化 $v=r/sigma$, $q=A/sigma$ 得 $p(v) = v e^(-(v^2+q^2)/2) thin I_0 (v q)$. 小信噪比下近似瑞利分布, 大信噪比近似正态分布.
- 讨论相位分布: 略

#SubSub("窄带随机过程包络平方的分布")

#FLI() 使用 $u=r^2$ 表示包络平方, $v = u/(sigma^2)$ 表示归一化的包络平方, 则:

#FLI() *EXAMPLE* 窄带正态噪声加正弦信号的包络平方分布:

$
  p(u) & = 1/(2 sigma^2) exp ( - (u+A^2)/2 sigma^2 ) thin I_0 ((sqrt(u) A) / sigma^2)
$ $
  p(v) & = 1/2 exp ( - (v + A^2 \/ sigma^2)/2 ) thin I_0 (sqrt(v)A \/ sigma)
$

#FLI() *DEF* $chi^2$ 分布: 若干统计独立的标准正态随机变量的平方和服从的分布 $chi^2_n = sum_(i=1)^n X_i^2 space (X_i ~ N(0,1))$; 非中心 $chi^2$ 分布: $v = 1/sigma^2 sum (X_i + A_i)^2 space (X_i ~ N(0,sigma^2))$

#FLI() *PROP* $chi^2$ 概率密度函数:
$ p(v) = (v^(n/2 - 1) e^(-v/2))/(2^(n/2) Gamma (n/2)) $
进一步 $v_0 = sigma^2 v$, 则 $ p(v_0) = ( v_0^(n/2 - 1) e^(-v_0/(2 sigma^2)) )/( 2^(n/2) sigma^n Gamma (n/2) ) $

#FLI() *PROOF* 利用特征函数:
$
  Phi_Y (lambda) &= integral_0^(infinity) [1/(sqrt(2 pi y)) e^(-1/2 y) ] e^(j lambda y) dif y quad quad (Y=X^2)\
  &= integral_0^(infinity) 1/(sqrt(2 pi)) y^(-1/2) e^(-(1/2 - j lambda)y) dif y\
  &= integral_0^(infinity) 1/(sqrt(2 pi)) y'^(-1/2) (1/2-j lambda)^(1/2) e^(-y') (1/2 - j lambda)^(-1) dif y quad quad (y' = (1/2 - j lambda) y)\
  &= 1/(sqrt(2 pi)) dot sqrt(pi) dot (1/2 - j lambda)^(-1/2) quad quad (Gamma(s) = integral_0^(infinity) t^(s-1) e^(-t) dif t, Gamma(1/2)=sqrt(pi))
$
进一步
$ Phi_v (lambda) = (1-j 2 lambda)^(-n/2) $ 从而 $ p(v) & = 1/(2 pi) integral_0^(infinity) Phi_v (lambda) e^(-j lambda v) dif lambda \
     & = ... $

#FLI() *PROP* 非中心 $chi^2$ 概率密度:

对 $Q=sum Y_i^2 = sum (X_i + A_i)^2$, 有
$
  p(q) = 1/(2 sigma^2) (q/lambda')^((n-2)/2) e^(-(lambda' + q)/2 sigma^2) thin I_(n/2 - 1) (sqrt(q lambda')/sigma^2)
$
令 $v=Q/sigma^2$ 得到
$
  1/2 (v/lambda)^((n-2)/2) e^(-(lambda+v)/2) thin I_(n/2-1) (sqrt(v lambda))
$
其中 $lambda' = sum A_i^2$ 称为 非中心参量, $lambda = 1/sigma^2 sum A_i^2$ 为积累后的功率信噪比.

#FLI() *PROP* 非中心 $chi^2$ 分布的性质:
- 2个独立的非中心 $chi^2$ 分布之和为非中心 $chi^2$ 分布.
- 均值 $E[v] = lambda + n$, 方差 $D[v] = 4 lambda + 2 n$.

#SubSection("随机信号通过线性系统")

#SubSub("时不变系统")

#FLI() 略

#SubSub("平稳随机过程通过LTI系统")

#FLI() *PROP* 平稳随机过程系统响应的性质:
- 平稳性不变?
- 矩分析: $         E[Y(t)] & = m_X integral h(tau) dif tau = m_X H(0) \
  E[Y(t_1)Y(t_2)] & = R_X (tau) times.o h(tau) times.o h(-tau) quad (tau = t_2 - t_1) \
  E[X(t_1)Y(t_2)] & = R_X (tau) times.o h(tau) quad (tau = t_2 - t_1) $
- 各态历经性不变?
- 频域性质: $G_Y (omega) = G_X (omega) |H(omega)|^2$. $quad (h(-tau) attach(arrow.r, t: scr(F)) H(-omega))$

#FLI() *PROP* 互功率谱: 若 $Y_1 (t) = X(t) times.o h_1(t)$, $Y_2 (t) = X(t) times.o h_2(t)$, 则 $G_(Y_1 Y_2) (omega) = H^*_1 (omega) H_2 (omega) G_X (omega)$. $quad (G_(Y_1 X) = H^*_1 (omega) G_X (omega) )$
- 可以用于求解系统频率响应
- 若 $H_1 (omega)$, $H_2 (omega)$ 频带不重叠, 则 $Y_1 (t)$, $Y_2 (t)$ 不相关.
