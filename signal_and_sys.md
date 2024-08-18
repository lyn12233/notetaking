## 线性时不变系统时域分析
### 微分方程的算子表示
$$p^ny+...+y=p^mf+...+f$$
$$D(p)y(t)=N(p)f(t)$$
传输算子
$$H(p)=\frac{N(p)}{D(p)}$$
### 零输入响应的算子求解
### 冲激响应和阶跃响应
$n>m(\delta(t))/\ n \ge m(U(t))$时不含$\delta(t)$项,保证系统稳定

- 待定系数法
- 算子法
$$H(p)=\sum \frac{K_i}{(p-p_i)^{r_i}}$$
$$h_i(t)=\frac{K_i}{(r_i-1)!}t^{r_i-1}e^{p_i t} \ U(t)$$
$n=m$时$h(t)=b_m\delta(t)+...$
$$g(t)=\int^t_{0^-}h(\tau)d\tau$$

## 卷积
$$y_f(t)=f(t)\ast h(t)\\
=\int^{\infin}_{-\infin}f(\tau)h(t-\tau)d\tau$$
### 积分的上下限
- 因果信号
- 非时限信号
### 卷积的运算规律
$$\int^t_{-\infin}f_1 \ast f_2 d\tau = f_1(t) \ast \int^t_{-\infin} f_2 d\tau$$
$$p(f_1 \ast f_2) = f_1(t) \ast p(f_2)$$
$$D(f_1) \ast p(f_2) = f_1\ast f_2$$
推论
$$\delta(t-t_1)\ast \delta(t-t_2)=\delta(t-t_1-t_2)$$
$$D(f)=f \ast U$$
$$f \ast \delta^{(n)} = f^{(n)}$$
### 卷积的数值计算

# 3 连续信号频域分析
LTI系统对复指数信号的响应特性
$$e^{\eta t} \to H(\eta)e^{\eta t}$$

常见的正交函数集:
$$\{\cos nt , \sin mt\}\\
\{\exp(j\omega t)\}\\
\{Sa(\frac{\pi}{T}(t-nT))\}\\
\{Wal_k(t)\}\\
\{P_n(t)=\frac{1}{2^nn!}\frac{d^n}{dt^n}(t^2-1)^n\}$$

## 周期信号的频谱
- 单边频谱
- 双边频谱
- 频带 
  $$B_{\omega}=\frac{2\pi}{\tau}$$

## 非周期信号的频谱

## Fourier变换的性质

# 连续系统频域分析

### 复指数信号通过系统
$$y_f(t)=H(j\omega)e^{j\omega t}$$
其中
$$H(j\omega)=\int^{\infin}_{-\infin} h(t)e^{-j\omega t}dt$$

### 周期信号通过系统
$$y_f(t)=F_0+2\sum^{\infin}_{n=1} |F_n||H(j\omega)| \cos(n\omega t+ \theta(n\omega)+\varphi(n\omega))$$
### 周期信号通过系统
$$y(t)=f(t)\ast h(t) \leftrightarrow Y(\omega)=F(\omega)H(\omega)$$
$$y(t) = \mathscr{F}^{-1}[Y(\omega)]$$
### 频域系统函数
### 无失真传输条件

## 理想低通滤波器响应
$$H(j\omega)=\begin{cases}
  ke^{-j\omega t_0} & |\omega|<\omega_c\\
  0&
\end{cases}$$
$$h(t) = \mathscr{F}^{-1}[H(j\omega)] = 
\frac{\omega_ck}{\pi} \text{Sa}(\omega_c(t-t_0))$$
$$g(t)=\int^t_0h(\tau)\text{d}\tau =
\frac{k}{2}+\frac{k}{\pi}\text{Si}(\omega_c(t-t_0))$$
上升时间
$$t_r = \frac{2\pi}{\omega_c}$$

### 系统的可实现性

- 时域准则
- Paley-Wiener准则
  $$\int^{\infin}_{-\infin} \frac{\left|\ln|H|\right|}{1+\omega^2}\text{d}\omega < \infin$$
- 平方可积

## 抽样信号
$$f_s(t)=f(t)s(t)$$
- 均匀冲击采样
  $$s(t)=\sum \delta(t-nT_s) \quad \text{also} \quad S(\omega)=\sum \omega_s \delta(\omega-n \omega_s)$$
  $$F_s(\omega)=\frac{1}{2\pi}F(\omega)S(\omega)=\frac{1}{T_s}\sum F(\omega-n\omega_s)\\ \quad \text{also} \quad f_s(t)=\sum f(nT_s)\delta(t-nT_s)$$
  当 
  $$\omega_m \le \frac{1}{2}\omega_s$$ 
  时, $F_s$ 为 $F$ 的重复
- 矩形脉冲采样
  $$F_s(\omega)=\frac{\tau}{T}\sum \text{Sa}(\frac{n\omega_s \tau}{2}) F(\omega - n\omega_s)$$

**时域采样定理**

通过低通滤波器恢复
$$Y(\omega)=F_s(\omega)H(\omega)$$
$$y(t)=\sum f(nT_s)\text{Sa}(\frac{\omega_s t}{2}-n\pi)$$

频域采样定理
$$F(\omega)=\sum F(\frac{\omega_m n} {2}) \text{Sa}(\omega t - n\pi)$$


# appendix
微分方程

冲激响应

卷积积分表
