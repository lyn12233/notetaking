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

$$y(t)=f(t)\ast h(t)\quad (尽在线性非时变系统)$$