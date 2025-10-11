# 数字信号处理
## 1 绪论
##  离散时间信号和系统

### 2.1 离散时间信号

**离散时间信号**是一个序列; 可以表示为 $\{x(n)\}\; n=0,\pm 1,...$ ,
离散时间信号不等同于**数字信号**, 其幅度不是量化的; 若序列的数字频率为 $\frac{\2\pi}{\omega} = \frac p q \quad (p,q \in \mathbb{Z})$, 则称为**周期**序列; 序列的基本运算有相加, 相乘, 移位, 反转, 加窗, 卷积等;

### 2.2 离散时间系统

**离散时间系统系统**是一个序列到序列的映射; 满足齐次性和可加性的系统称为线性系统; 与移位可交换($y(n-k)=T[x(n-k)]$)的系统称为时不变系统; 线性时不变系统称为Linear Time Invariant System(LTI system);

离散时间序列的卷积定义为 $a(n)\ast b(n) = \sum_{k=-\inf}^{+\inf} a(k)b(n-k)$, 对线性时不变系统具有性质 $y(n)=x(n)\ast T[\delta(n)]$, 其中 $h(n)=T[\delta (n)]$ 称为**单位取样响应**;
可以用 $h(n)$ 代表一个LTI系统;

离散时间序列的卷积满足交换律, 结合律, 分配率; 描述LTI系统可以用级联/并联形式的**系统框图**;

### 2.3 系统的稳定性和因果性

def LIT的稳定性: $|x(n)|<M$ 则 $|y(n)|<N$; 因果性: $h(n)<0\forall n<0$ 

theorem: LTI稳定则 $h(n)$ 绝对可和 $\sum |h(n)|<+\inf$

> proof: constuct $x(n)=h^*(-n)/|h(-n)|$

### 2.4 连续信号的采样和恢复

采样: $x_s(t) = x(t)\delta_T(t) = \sum_{n=-\inf}^{+\inf}x(nT)\delta(t-nT)$, 频谱性质: $\mathscr{F}[\delta_T(t)] = \frac 1 T \delta_{\Omega}(\omega) \quad(\Omega = \frac {2\pi}{T})$

采用定理 $f_s\ge 2f_c$

使用低通滤波器重构 $H(\omega) = T \mathrm{G}_{\frac{2\pi}{T}}(\omega),\quad h(t) = \mathrm{sinc} (\frac{\pi}{T} t)$
得到 $y(t) = \sum_{k=-\inf}^{+\inf} x_a(kT) \mathrm{sinc} (\frac{\pi}{T}(t-kT))$; $y(t)=\sum x_a(kT)\varphi_k(t)$ 称为重构的内插公式;

ext: 带通信号的采样: 对窄带信号 $f\in f_0 \pm \frac 1 2 f_B,\; f_0 \ge 2f_B$, 存在采样频率 $f_s \in [2f_B,4f_B]$ 

> 上边频谐波 $f_0+kf_s\pm \frac 1 2 f_B$, 下边频 $-f_0+kf_s\pm \frac 1 2 f_B$, 不发生混叠则 $f_s\ge 2f_B$, 此条件下下边频k次谐波不与上边频混叠 $kf_s\ge 2f_0+f_B$, 得 $\min \; f_s = (2f_0+f_B)/\max\{k\in \mathbb{Z}|k\le \frac{2f_0+f_B}{2f_B}\} = (2f_0 + f_B) / \lfloor \frac{2f_0+f_B}{2f_B} \rfloor$

## 3 离散时间傅里叶变换和z变换

def: 
 - $\mathscr{F}_{\mathrm{DTFT}}[x(n)] = \sum_{i=-\inf}^{+\inf} x(n) e^{-j\omega n}$
 - $\mathscr{F}^{-1}_{\mathrm{DTFT}}[X(\omega)] = \frac 1 {2\pi} \int^{\pi}_{-\pi} X(\omega) e^{j\omega n}\mathrm{d} \omega$

prop:
 - $X(\omega)=X(\omega+2\pi)$
 - $x(n\pm n_0) \leftrightarrow X(\omega)e^{\pm j\omega n_0}$
 - $x(n)e^{\pm j \omega_0 n} \leftrightarrow X(\omega \mp \omega_0)$
 - $x^*(n)\leftrightarrow X^*(-\omega)$
 - $x(-n)\leftrightarrow X(-\omega)$
 - $nx(n)\leftrightarrow j X'(\omega)$
 - $x(n)y(n)\leftrightarrow \frac 1 {2\pi} \int^{2\pi}_0 X(\theta)Y(\omega-\theta)\mathrm{d}\theta$
 - $x(n)\ast y(n) \leftrightarrow X(\omega)Y(\omega)$
 - $\sum |x(n)|^2 = \frac 1 {2\pi} \int^{\pi}_{-\pi} |X(\omega)|^2\mathrm{d}\omega$

def:
 - $\mathscr{Z}[x(n)] = \sum_{i=-\inf}^{+\inf} x(n)z^{-n}\quad (\mathrm{ROC:}\;r_1<|z|<r_2\;\mathrm{or}\;r_1<|z|\;\mathrm{or}\; |z|<r_2)$
 - $\mathscr{Z}^{-1}[X(z)] = \frac 1 {2\pi i} \oint_{\mathrm{ROC}_n} X(z)z^{n-1}\mathrm{d}z$
> 当 $Z(n)=0\forall\; n<0$ 时, ROC边界 $|z|\le \infin$
prop:
 - $z(n\pm n_0)\leftrightarrow z^{\pm n_0}X(z)$
 - $a^nx(n) \leftrightarrow X(\frac z a)$
 - $x^*(n) \leftrightarrow X^*(z^*)$
 - $nx(n)\leftrightarrow -zX'(z)$, 改变零点处的收敛性
 - $x(n)\ast y(n) \leftrightarrow X(z)Y(z)$
 - $x(n)y(n) \leftrightarrow \frac 1 {2\pi i} \oint \frac 1 v X(v)Y(\frac z v) \mathrm{d} v$
 - $x(0)=\lim_{z\to\inf} X(z)$
 - $x(+\inf)=\lim_{z\to 1}((z-1)X(z))$

$H(z)$ 的性质和表示: $H(z)=A \frac{\prod (1-b_rz^{-1})}{\prod (1-a_kz^{-1})}$, $b_r$ 为零点, $a_k$ 为极点; 无极点称为滑动平均(MA)系统, 无零点称为有限冲激响应(FIR)系统
 - 零极点图的表示, 用零极点图估算响应/判断系统稳定性;
 - 信号流图对表示, 1型, 2型, 级联型, 并联型;
 - 差分方程表示

可实现系统差分方程系数为实系数, 考虑实系数形式 $H(z)=A \prog_{k=1}^{\lfloor N/2 \rfloor} \frac{1+b_{1,k}z^{-1}+b_{2,k}Z^{-2}}{1+a_{1,k}z^{-1}+a_{2,k}z^{-2}}$, 对应2型结构流图单元;