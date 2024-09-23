# 12 静电场

## 12.1 电荷基本属性
**12.1.1** 电荷守恒, 电荷量子性

**12.1.2** 电荷相互作用
    
库仑定律, 叠加定理
$$F=\frac{q_1q_2\mathbf{e_r}}{4\pi\varepsilon_0r^2}$$

## 12.2 电场

**12.2.1**定义

**12.2.2**叠加原理

**12.2.3** 常见电场
- 点电荷
  $$E=\frac{q\mathbf{e_r}}{4\pi\varepsilon_0r^2}$$
- 电荷元表达
  $$\text{d}q=\begin{cases}
    \rho\text{d}V & ()\\
    \sigma\text{d}S & ()\\
    \lambda\text{d}l & ()\\
  \end{cases}$$
- 偶极矩
  $$\begin{cases}
    E_A=\frac{\mathbf{p_e}}{2\pi\varepsilon_0r^3} & (轴线)\\
    E_B=-\frac{\mathbf{p_e}}{4\pi\varepsilon_0r^3} & (垂线)\\
  \end{cases}$$
- 圆环
  $$E=\frac{q}{4\pi\varepsilon_0}\frac{x}{(R^2+x^2)^{3/2}}\mathbf{e_x}$$
- 圆盘
  $$E=\frac{\sigma}{2\varepsilon_0}\left[ 1-\frac{x}{\sqrt{R^2+x^2}} \right]\mathbf{e_x}\approx ...$$
- 均匀带电球体$...\frac{r}{R^2}(r<R)$
- 带电细棒
  $$E_x=\frac{\lambda}{4\pi\varepsilon_0a}(\sin\theta_2-\sin\theta_1)\quad(x_1\to x_2)$$
  $$E_y=\frac{\lambda}{4\pi\varepsilon_0a}(\cos\theta_1-\cos\theta_2)=...$$
- 带电柱面
  $$E=\frac{\lambda}{4\pi\varepsilon_0r}\quad (r>R)$$


# 12.4 静电场环路定理

**12.4.1**环路定理

**12.4.2**电势, 电势差

**12.4.3**电势叠加定理

**12.4.5** 常见电势
- 偶极子
  $$U(r)=\frac{\mathbf{p\cdot e_r}}{4\pi\varepsilon_0 r^2}$$
- 圆环
  $$U(x)=\frac{q}{4\pi\varepsilon_0}\frac{1}{\sqrt{R^2+x^2}}$$
- 圆盘
  $$U(x)=\frac{\sigma}{2\varepsilon_0}\left[ \sqrt{R^2+x^2}-x \right]$$
- 均匀带电球体
  $$U(r)=\frac{q}{4\pi\varepsilon_0}\frac{\frac{3}{2}R^2-\frac{1}{2}r^2}{R^3}$$
- 圆柱面
  $$U(r)= \quad - \quad \frac{\lambda}{2\pi\varepsilon_0}\begin{cases}
    \ln \frac{R}{r_0} & (r<R)\\
    \ln \frac{r}{r_0} & (r>R)
  \end{cases}$$

# 12.5 电势与场强的关系

$$E=-\nabla U$$