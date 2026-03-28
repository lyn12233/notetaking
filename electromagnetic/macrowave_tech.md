# 微波技术与天线

## 0 绪论

微波是指频率范围 $  $ (对应真空中波长 $  $) 的电磁波, 在实际应用中具有性质:

- 高频特性: 波长不满足远小于期间尺寸, 不能用路论的方法分析
- 穿透电离层能力强, 广泛应用于通信
- 似光性: 在宏观物体尺寸上具有明显的衍射,反射等光的性质
- 量子特性: 可以用于分析分子精细结构

微波技术的基本研究方法是通过求解微分方程分析电磁场的性质

## 1 传输线理论

### 1.1 引言

**DEF**: TEM 波: 电场和磁场都只有一个方向的分量, 且互相正交; TE: 传播方向上没有电场分量; TM: 传播方向上没有磁场分量

**DEF** 传输线: 引导电磁波沿着一定方向传输的媒介; 分布参数: 单位距离上的电阻, 电感, 电导, 电容等;

## 1.2 传输线波动方程

传输线的模型为: 

定义 $  $ 为源到负载的方向, 原点为源; $  $ 为负载到源的方向, 原点为负载; 记传输线长度 $  $, 满足 $  $;

**时域传输线基本方程**:

$$ \begin{cases}
    \partial_z u = - R i - L \partial_t i\\
    \partial_z i = - G u - C \partial_t u\\
\end{cases} $$

定义频域的形式 $U,I$:

$$\begin{cases}
    u = \mathrm{Re} [ U(z) e^{i \omega t} ]\\
    i = \mathrm{Re} [ I(z) e^{i \omega t} ]\\
\end{cases}$$

定义 $ \gamma = \sqrt{(R + j\omega L) (G + j\omega C)} $ 为传播常数, $ \gamma = \alpha + j\beta $, $ \alpha $ 为衰减因子, $ \beta $ 为相位因子(相当于波数), $ Z_0 = \sqrt{\frac{R + j\omega L}{G + j\omega C}} $ 为特征阻抗;

传输线方程解的形式包括:

- $ z $ 方向上, 按 $ \pm z $ 传播方向分解:
    $$ \begin{cases}
        U(z) = A e^{-\gamma z} + B e^{\gamma z}\\
        I(z) = \frac A {Z_0} e^{-\gamma z} - \frac B {Z_0} e^{\gamma z}\\
    \end{cases} $$
- $ s $ 方向上, 按负载初值 $ U_l, I_l $ 确定:
    $$ \begin{cases}
        U(s) = U_l \ch \gamma s + I_l Z_0 \sh \gamma s \\
        I(s) = \frac {U_2}{Z_0} \sh \gamma s + I_2 \ch \gamma s\\
    $$

## 1.2 传输线低损耗近似

在 $  $ 时, 存在近似 $  $;

在后面的内容中不考虑损耗;

## 1.3 均匀无耗传输线参数

波导波长 $\lambda_g = \frac {2\pi}{\beta}$, 特征阻抗 $Z_0$ 表示入射电压/电流比; 群速度 $v_g = \frac{\omega}{\beta}$, 相速度 $v_p = \frac {\partial \omega}{\partial \beta}$, 无耗下相同;

电压反射系数表示入射/反射分量电压比; 电流反射系数同理; 形式为
$$ \begin{cases}
    \Gamma_U (z) = \frac B A e^{2\gamma z}\\
    \Gamma_I (z) = - \frac B A e^{2\gamma z} 
\end{cases} $$

对负载处电压反射系数: 由于负载 $Z_L$ 满足 $Z_L = U_L / I_L$, 则
$$ \begin{aligned}
    \Gamma_L = \frac{Z_L - Z_0}{Z_L + Z_0}\\
    \mathrm{also\quad} Z_L = Z_0 \frac{1+\Gamma_L}{1-\Gamma_L}\\
\end{aligned} $$

反射系数在 $s$ 方向上的表示:
$$ \Gamma(s) = \Gamma_L e^{-2\gamma s} = |\Gamma_L| e^{j(\varphi_L - 2 \beta s)} $$

驻波比:
$$ \begin{aligned}
    \rho = \frac{|U|_{\max}}{|U|_{\min}} = \frac{1 + |\Gamma_L|}{1 - |\Gamma_L|}\\
    \mathrm{also\quad} |\Gamma_L| = \frac{\rho - 1}{\rho + 1}
\end{aligned} $$

输入阻抗:
$$ \begin{aligned}
    Z_{in}(s) & = \frac {U(s)}{I(s)} \\
    & = Z_0 \frac{Z_L + Z_0 \th \gamma s}{Z_0 + Z_L \th \gamma s}\\
    & = Z_0 \frac{Z_L + j Z_0 \tan \beta s}{Z_0 + j Z_L \tan \beta s}
\end{aligned} $$

特别的, $s=(\frac 1 2 k + \frac 1 4) \lambda_g$ 时 $Z_{in} (s) = \frac{Z_0^2}{Z_L}$, 称为 **$\frac 1 4 \lambda$ 阻抗变换器**;