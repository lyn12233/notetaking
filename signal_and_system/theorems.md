# Chapter 1

信号的分类: 确定和随机信号, 连续/离散时间信号, 周期和非周期信号, 功率和能量信号, 有/无时限信号, 有始有终信号, (非)因果信号$f(t)=f(t)U(t)$

常用连续时间信号:
- 单位跃阶信号
- 单位门信号$G_{\tau}(t)=U(t+\tau/2)-U(t-\tau/2)$
- 单位冲激信号
  $$\begin{cases}
    (抽样性)& \int^{\infin}_{\infin}f(t)\delta(t-t_0) \text{d}t= f(t_0) \\
    (奇偶性)& \delta(t)=\delta(-t)\\
    (展缩)& \delta(at)=\frac{1}{a}\delta(t) 
  \end{cases}$$

- $U(t)$与$\delta(t)$的关系: 显然
- 单位冲激偶信号$\delta'(t)=\lim_{\tau\to 0}\frac{1}{\tau}[\delta(t+\tau/2)-\delta(t-\tau/2)]$
  $$\begin{cases}
    f(t)\delta'(t)=f(0)\delta'(t)-f'(0)\delta(t)\\
    \int^{\infin}_{\infin} f(t)\delta'(t)=-f'(0)    
  \end{cases}$$

- 单位符号信号
  $$\text{sgn}(t)=U(t)-U(-t)=2U(t)-1$$

- 抽样信号
  $$\text{Sa} (t)=\frac{\sin t}{t}$$
  $$\int^{\infin}_0 \text{Sa}(x)dx=\frac{\pi}{2}$$
  **proof** let $I(a)=\int^{\infin}_0 \frac{\sin x}{x}e^{-ax}dx$, then $I'(a)=\int^{\infin}_0 - \sin x e^{-ax} dx = -\Im \int^{\infin}_0 e^{-ax+ix} dx = -\Im \frac{1}{-a+i}=\frac{1}{a^2+1}$, thus $I(a)=\arctan(a)+c, \because I(\infin)=0,\therefore I(0)=\frac{\pi}{2}$

时域变换: 折叠, 时移, 展缩, 倒向

时域运算: 相加, 相乘, 数乘, 微分, 积分

系统的分类: 动/静态系统, (非)线性系统, 时不变系统 (能与$\ast \delta(t-t_0)$交换), (非)因果系统(能与$\cdot U(t-t_0)$交换), 连续/离散时间系统

线性时不变系统的性质: 线性, 时不变性

# Chapter 2 
**时域分析**

**经典时域分析法**

特解的形式:
$$\sum_{k=0}^L E_kt^ke^{at}\quad a=\lambda_{i_1}...\lambda_{i_r} \quad \to \quad \sum_{k=0}^{L+r}B_kt^ke^{at}$$

**零输入响应算子求解法**

算子表示
$$D(p)y(t)=N(p)f(t)\quad 记H(p)=\frac{N(p)}{D(p)}$$

**响应的线性特性**
- 响应的可分解性
- 零状态响应线性
- 零输入响应线性

**零状态响应卷积积分法**
$$\delta(t)\to h(t)$$

利用$H(p)$求冲击响应
$$\begin{matrix}
    h(t)&=&H(p)\delta(t)\\
&=& \sum_i \frac{K_i}{(p-p_i)^{r_i}}\delta(t) + \sum_i B_i p^i
\end{matrix}$$
$$\frac{K}{(p-p_i)^{r_i}}\quad \to \quad \frac{K}{(r-1)!}t^{r-1}e^{p_i t}U(t)$$

*常见的$H(p)$*

卷积的上下限, 性质: 交换律, 分配律, 结合律, 与积分/微分可交换

*卷积积分表*

$$y(t)=f(t)\ast h(t)\quad (只在线性非时变系统)$$

**求解步骤** $h(t)\to y(t)$

卷积积分的数值计算

# Chapter 3
**连续信号频域分析**

**线性时不变(LTI)系统的特征函数**

依$y(t)=\int^{\infin}_{-\infin} h(\tau) f(t-\tau) \text{d} \tau \sim f(t)$, 满足$f(t-\tau)=f(t)K(\tau)\quad(\forall t,\tau)$, $\frac{f(t-\tau)}{f(t)}=\text{const}, \therefore f(t)=ke^{\eta t}$。说明系统特征函数为所有复指数

**完备正交函数集**
正交, 归一化, 正交复变函数集, 完备

$$f(t)=c_if_i(t),\quad c_i=\frac{\int f(t)\dot f_i(t)\text{d}t}{\int f_i(t)\dot f_i(t)\text{d}t}$$

*常见的正交函数集*

$$\{\cos n \Omega,, \sin m \Omega\}\\
\{e^{-in\Omega t}\}\\
\{\text{Sa}(\frac{\pi}{T}(t-nT))\}$$
- **proof**
  对$\int^{\infin}_{-\infin} \text{Sa}(x-\pi n)\text{Sa}(x-\pi m)$构造围道
  $$\int_{C_\infin^-}...=0(\text{Jordan}),\quad \int_{\delta_m},\quad \int_{\delta_n},\quad ...$$
  根据小圆弧定理, 仅当奇点重合时原积分不为零

$$\{w(k,t)\}\\ \{P_n(t)\}$$

**周期信号的傅里叶级数表示**

$$\begin{cases}
  a_n&=&\frac{2}{T}\int^{T/2}_{T/2}f(t)\cos(n\omega_0 t)\text{d}t\\
  b_n&=&\frac{2}{T}\int^{T/2}_{T/2}f(t)\sin(n\omega_0 t)\text{d}t
\end{cases}$$

$$F_n=\frac{1}{T}\int^{T/2}_{T/2}f(t)e^{-j\omega_0 t}\text{d}t=\begin{cases}
  \frac{a_0}{2} & n=0\\
  \frac{1}{2}(a_n-jb_n)& n>0\\
  \frac{1}{2}(a_n+jb_n)& n<0
\end{cases}$$

傅里叶级数的收敛: 略

傅里叶级数与对称性的关系

性质:
$$\begin{matrix}
  f(t-t_0)  &=&\sum F_n e^{jn\omega_0(t-t_0)}\\
  f^{(k)}(t)&=&\sum (jn\omega_0)^kF_ne^{jn\omega_0}\\
  f(t)\cos(\omega_0 t)&=&\sum \frac{F_{n-1}+F_{n+1}}{2}e^{jn\omega_0 t}\\
  f(t)\sin(\omega_0 t)&=&\sum \frac{F_{n-1}-F_{n+1}}{2j}e^{jn\omega_0 t}
\end{matrix}$$

周期信号频谱的特点: 离散性, 谐波性, 收敛性

对周期矩形信号频谱$F_n=\frac{E\tau}{T}\text{Sa}\left(\frac{n\omega_0 t}{2}\right)$的分析: 有效频谱宽度$B_\omega =\frac{2\pi}{\tau}$

功率谱

**非周期信号频谱**

傅里叶变换
$$\mathscr{F}(f)=\int^{\infin}_{-\infin}f(t)e^{-j\omega t}\text{d}t\\
\mathscr{F}^{-1}(f)= \frac{1}{2\pi} \int^{\infin}_{-\infin}f(t)e^{j\omega t}\text{d}\omega$$

典型信号的频谱函数
$$\begin{matrix}
  e^{-\alpha t}U(t) \to \frac{1}{\alpha+j\omega}\\
  e^{-\alpha |t|} \to \frac{2\alpha}{\alpha^2+\omega^2}\\
  e^{-\alpha|t|}\text{sgn}(t) \to -j\frac{2\omega}{\alpha^2+\omega^2}\\
  \text{sgn}t \to \frac{2}{j\omega}\quad (不满足绝对可积)\\
  1 \to 2\pi\delta(\omega)\\
  U(t) \to \pi\delta(t)+\frac{1}{j\omega}\\
  \delta(t) \to 1\\
  G_{\tau,E}(t) \to E\tau\text{Sa}\left(\frac{\omega \tau}{2}\right)\\
  (1-|t|/\tau)G_\tau(t) \to \tau\left(\text{Sa}(\frac{\omega t}{2})\right)^2 \quad(三角脉冲信号)
\end{matrix}$$

性质
$$\begin{matrix}
  F(t) \to 2\pi f(-\omega)\\
  f(-t) \to F(-\omega)\\
  f(at) \to \frac{1}{|a|}F(\frac{\omega}{a})\\
  f(t\pm t_0) \to F(\omega)e^{\pm j\omega t_0}\\
  e^{\pm j\omega_0 t}f(t) \to F(\omega\mp \omega_0)\\
  \frac{\text{d}^nf(t)}{\text{d}t^n} \to (j\omega)^n F(\omega)\\
  (-jt)^n f(t) \to \frac{\text{d}^nF(\omega)}{\text{d}\omega^n}\\
  \int^t_{-\infin} f(\tau)\text{d}t \to \frac{F(\omega)}{j\omega}+\pi F(0)\delta(\omega)\\
  \frac{1}{-jt}f(t)+\pi f(0)\delta(t) \to \int^\omega_{-\infin} F(\nu)\text{d}\nu\\
  f_1(t)\ast f_2(t) \to F_1(\omega)F_2(\omega)\\
  f_1(t)f_2(t) \to \frac{1}{2\pi}F_1(\omega)\ast F_2(\omega)\\
  \int f_1\dot f_2 \to \frac{1}{2\pi}\int F_1\dot F_2
\end{matrix}$$


**周期信号的傅里叶变换**
$$F(\omega)=2\pi\sum F_n\delta(\omega-n\omega_0)$$

**功率谱与能量谱**

# Chapter 4
**系统频域分析**

频域系统函数$H(\omega)=\mathscr{F}(h)$

对周期信号的响应:
$$\begin{matrix}
  f(t)=\cos(\omega t) \to y(t)=|H(\omega)|\cos(\omega t+\varphi)\\
  f(t) \to F_0+2\sum|F_n||H(n\omega)|\cos(n\omega t+\theta+\varphi)
\end{matrix}$$

对非周期信号的响应:
$$Y(\omega)=H(\omega)F(\omega)$$

**频域系统函数的求法**