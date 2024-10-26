# Chapter 1

**复数共轭的计算**

**辐角主值**

$$\text{arg}(z)=\begin{cases}
    \arctan(\frac{y}{x}) \quad x>0\\
    \pm \frac{\pi}{2} \quad x=0\\
    \arctan(\frac{y}{x}) \pm \pi \quad x<0,y \ne 0\\
    \pi \quad x<0,y=0
\end{cases} \in [\pi,-\pi)$$

**复数的表示形式**: 三角形式\指数形式

**THE** 
$$\text{Arg}(z_1z_2)=\text{Arg}(z_1)\text{Arg}(z_2)$$

**方根**
$$\sqrt[n]{z}=\sqrt[n]{r} \left( \cos \frac{\theta+2k\pi}{n} + i\sin \frac{\theta+2k\pi}{n} \right)$$

**DEF** 区域: 开集且连通

**DEF** 简单曲线: 光滑且无重点

**DEF** 单连通区域

**DEF** 函数的极限

**THE**
$$\lim f(z)=A \leftrightarrow \lim \text{Re}(f(z))=\text{Re}(A),...$$

**THE** 极限的运算

**DEF** 连续

**THE** $\text{Re}(f),f \pm g,f\cdot g,f \circ g$的连续性

# Chapter 2 解析函数

**DEF** 导数

导数与可微等价

**DEF** 解析: 在领域内处处可导

**THE** 解析函数和差积商, 和函数解析

**Eq** (Cauchy-Riemann) 
$$\begin{pmatrix}
    \partial_u & \partial_v\\
    -\partial_v &\partial_u
\end{pmatrix}\cdot\begin{pmatrix}
    x&y\\
    -y&x
\end{pmatrix}=\mathbf{0}$$

**THE** 
$$f(z) 在 z=x+iy可导\leftrightarrow u,v可微且满足\text{CR}方程$$

# chapter 3 复变函数积分

$$\int_C f(z)\text{d}z=\int_{t_1}^{t_2} (u+iv)(x'+iy')\text{d}t$$

**THE** 柯西古萨定理$\int_C f(z)\text{d}z=0$

**THE** 复合闭路定理, 闭路变形定理

**THE** 原函数存在的充分条件

**THE** 柯西积分公式
$$f(z_0)=\frac{1}{2\pi i}\oint_C\frac{f(z)}{z-z_0}\text{d}z$$

**ext** 高阶求导公式
$$f^{(n)}(z_0)=\frac{n!}{2\pi i}\oint_C\frac{f(z)}{(z-z_0)^{n+1}}\text{d}z$$

**DEF**共轭函数,调和共轭函数(u,v有顺序!)

# 4 级数

**DEF**复数列的收敛, 复级数的收敛, 绝对收敛

**THE** 阿贝尔定理: 复幂级数(n>0)收敛域为圆

**验证收敛的方法**: 比值法, 根植法

**THE**级数和函数解析,进而可逐项积分

## 4.3 泰勒级数
*proof:...*
$$|R_N|\le\frac{Mq^N}{1-q}\quad\text{where}q=\delta z/r,M=\max|f(z)|$$

## 4.4 洛朗级数(laurent)
$$c_n=\frac{1}{2\pi i}\oint_C\frac{f(z)}{(z-z_0)^{n+1}}\text{d}z$$

# 5 留数
**DEF**孤立奇点,可去奇点,极点,本性奇点

**PROP**本性奇点$\lim f(z)\ne \infin$且不存在

**THE**零点与极点的关系

**THE**$\infin$的奇点性质

## 5.2 留数
$$\text{Res}[f,z_0]=c_{-1}=\oint_C f(z)\text{d}z$$
**THE**留数定理

**留数的计算方法**
$$\text{Res}[f,z_0]=\frac{1}{(m-1)!}\lim_{\to z_0} \partial_z^{m-1}((z-z_0)^mf(z))\quad m=2,...$$

$$\text{Res}[f,z_0]=\frac{P(z_0)}{Q'(z_0)}$$

无穷远点的留数

## 5.3 留数的应用

- $\int^{2\pi}_0 f(\cos\theta,\sin\theta)\text{d}\theta$
$$=\oint_{|z|=1} f\left(\frac{z^2+1}{2z},\frac{z^2-1}{2iz}\right)\frac{\text{d}z}{iz}$$
- $\int^{\infin}_{-\infin}f(x)\text{d}x$
- $\int^{\infin}_{-\infin}f(x)e^{\alpha i x}\text{d}x\quad \alpha>0$
- 

## 5.4 对数留数与辐角原理\*
