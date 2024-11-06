# 恒定磁场

## 1 电流, 电流密度, 连续性方程

$$\nabla j = \frac{\text{d}\rho}{\text{d}t}$$

## 2 磁场的描述

磁感应强度定义: $B=\frac{F_{\max}}{qv}$

## 3 磁场的性质

**比奥萨尔(Biot-Savart)定律**

$$\text{d}B=\frac{\mu_0I}{4\pi r^2}(-\mathbf{e_r})\times \text{d}\mathbf{l}$$

$$\mu_0=4\pi\times10^{-7}N\cdot A^{-1}$$

**常见磁场**

1. 长直导线

$$B=\frac{\mu_0I}{4\pi d}(\cos\theta_1-\cos\theta_2)$$

2. 圆环

$$B=\frac{\mu_oIR^2}{2\left(R^2+x^2\right)^{\frac{3}{2}}}$$

3. 螺线管

$$B=\begin{cases}
    \frac{\mu_0nI}{2}(\cos\theta_1-\cos\theta_2)&\\
    0&(螺线管外)\\
\end{cases}$$

4. 点电荷

$$B=\frac{\mu_0q\mathbf{v}\times\mathbf{e_r}}{4\pi r^2}$$

5. 磁矩

$$B=\frac{\mu_0 p_m}{2\pi x^3}$$
$$M=B\times p_m$$

6. 载流平面

$$B=\frac{\mu_0j_S}{2}$$

## 4 磁场的高斯定理

$$\oint_S B\cdot \text{d}S=0$$

## 5 安倍环路定理

$$\oint_L B\cdot\text{d}l=\mu_0\sum I$$

## 6 磁场对电荷的作用

受力, 倾斜磁场中延螺旋线运动

霍尔效应

$$U=K\frac{IB}{d}$$
$$K=\frac{1}{nq}$$

# 7 磁场对电流的作用

**磁力做功**

# 8 磁介质

磁化的机理

磁化强度和磁场强度

$$M=\frac{\sum p_m}{\Delta V}=\mu_0\Xi_mH$$

$$H=\frac{B}{\mu_0\mu_r}$$

有磁介质时的安备环路定理(考虑传导电流 $I_c$ 和磁化电流 $I_m$ )

$$\oint\frac{B}{\mu_0}\cdot\text{d}l=\sum (I_c+I_m)=\oint H\cdot\text{d}l+\oint M\cdot\text{d}l$$