# 常见傅里叶变换


|$f(t)$|$F(j\omega)$|
|-|-|
| $\delta(t)$ | $\mathbf{1}$ |
| $\mathbf{1}$ | $2\pi\delta(\omega)$ |
| $U(t)$ | $\pi\delta(\omega)+\frac{1}{j\omega}$ |
| $\text{sgn}(t)$ | $\frac{2}{j\omega}$ |
| $e^{-at}U(t)$ | $\frac{1}{a+j\omega}$ |
| $te^{-at}U(t)$ | $\frac{1}{(a+j\omega)^2}$ |
| $G_{\tau}(t)$ | $\tau\text{Sa}(\frac{\tau\omega}{2})$ |
| $\text{Sa}(\omega_0t)$ | $\frac{\pi}{\omega_0}G_{2\omega_0}(\omega)$ |
| $e^{-a\|t\|}$ | $\frac{2a}{a^2+\omega^2}$ |
| $e^{-\frac{t^2}{\tau^2}}$ | $\tau\sqrt{\pi}e^{-(\frac{\tau\omega}{2})^2}$ |
| $\|t\|$ | $-\frac{2}{\omega^2}$ |
| $\cos(\omega_0 t)$ | $\pi(\delta(\omega+\omega_0)+\delta(\omega-\omega_0))$ |
| $\sin(\omega_0 t)$ | $j\pi(\delta(\omega+\omega_0)-\delta(\omega-\omega_0))$ |
| $\sum F_n e^{jn\omega_0t}$ | $2\pi\sum F_n\delta(\omega-n\omega_0)$ |
| $$ | $$ |
| $$ | $$ |

# 傅里叶变换性质

|$f(t)$|$F(\omega)=\mathscr{F}[f(t)]$|
|-|-|
|$f(-t)$|$F(-\omega)$|
|$...$|$\mathscr{F}\left[\mathscr{F}[f(t)]\right]=2\pi f(-\omega)\|_{\omega=t}$|
|$f(at)$|$\frac{1}{\|a\|}F(\frac{\omega}{a})$|
|$f(t\pm t_0)$|$F(\omega)e^{\pm jt_0\omega }$|
|$f(t)e^{\pm\omega_0t}$|$F(\omega\mp\omega_0)$|
|$\text{d}_t^k f(t)$|$j^k\omega^kF(\omega)$|
|$\int^t_{-\infin}f(\tau)\text{d}\tau$|$\pi\delta(\omega)F(\omega)+j^{-1}\omega^{-1}F(\omega)$|
|$(-j)^kt^kf(t)$|$\text{d}_{\omega}^kF(\omega)$|
|$f_1\ast f_2$|$F_1\cdot F_2$|
|$f_1\cdot f_2$|$\frac{1}{2\pi} F_1\ast F_2$|
|$f(t)\sum \delta(t-nT)$|$\frac{1}{T}\sum F\left(\omega-n\omega_0\right)$|
|$...$|$W=\frac{1}{2\pi}\int F(\omega)^2\text{d}\omega$|
|$$|$$|
|$$|$$|


# 傅里叶级数
$$\begin{cases}
    a_n=F_n+F+{-n}\\
    b_n=jF_n-jF_{-n}
\end{cases}$$
$$\begin{cases}
    F_n=\frac{a_n-jb_n}{2}&(n\ge 0)\\
    F_{-n}=\frac{a_n+jb_n}{2}&(n\le 0)
\end{cases}$$

# 拉普拉斯变换
$$F(s)=\int_{0^-}^{\infin}f(t)e^{-st}\text{d}t$$
$$\mathscr{L}[f](s)|_{\sigma}=\mathscr{F}[f(t)U(t)e^{-\sigma t}](\omega)\quad s=\sigma+j\omega$$
$$\mathscr{L}^{-1}=\frac{1}{2\pi j}\int_{|}F(s)e^{st}\text{d}s$$
$$\mathscr{L}[f](s)|_{\sigma=0}=\mathscr{F}[f](\omega)$$


|$f(t)\left(=f(t)U(t)\right)$|$F(s)$|
|-|-|
|$f(at)\quad a>0$|$\frac{1}{a}F\left(\frac{s}{a}\right)$|
|$f(t\pm t_0)$|$F(s)e^{\pm t_0 s}$|
|$f(t)e^{\pm s_0 t}$|$F(s\mp s_0)$|
|$f^{(n)}(t)$|$s^nF(s)-\sum_{k=1}^{n}s^{n-k}f^{(k-1)}(0^-)$|
|$f^{(-n)}(t)$|$s^{-n}F(s)+\sum_{k=1}^{n}s^{k-n-1}f^{(-k)}(0^-)$|
|$f_1\ast f_2$|$F_1\cdot F_2$|
|$f_1\cdot f_2$|$\frac{1}{2\pi j}\int F_1(\lambda)F_2(s-\lambda)\text{d}\lambda$|
|$(-t)^nf(t)$|$F^{(n)}(s)$|
|$f(t)/t$|$\int^{\infin}_sF(\lambda)\text{d}\lambda$|
|$$|$$|

初值定理和终值定理：
$$\lim_{t\to 0^+}f(t)=\lim_{s\to \infin}sF(s)$$
$$\lim_{t\to\infin}f(t)=\lim_{s\to 0}sF(s)$$
