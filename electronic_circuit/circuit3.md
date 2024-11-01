# 3 场效应管(field effect transistor)
分类:
- 结型(junction fet)
- 金属-氧化物-半导体型(metal-oxide semiconductor FET)

## 3.1 MOS场效应管
分类:
- 增强型/耗尽型(enhancement/depletion)
- N/P沟道
*主要探讨N沟道EMOS*

### 3.1.2 工作原理
**反型层**: P参杂以N载流子为多子

电极: Source(源极), Gate(栅极), Drain(漏极)

1. 截止区:
   
    $v_{GS}\le V_{GS(th)}$
    在 $V_{GS(th)}$ 附近为亚阈区
2. 非饱和区:
   
    $$v_{GS}>V_{GS(th)},\quad 0<v_{DS}<v_{GS}-v_{GS(th)}$$

3. 饱和区:

    $$v_{GS}>V_{GS(th)},\quad v_{DS}>v_{GS}-v_{GS(th)}$$

    靠近漏极电压小,出现**预夹断**, $i_D$恒定, $v_{DS}$对$i_D$的影响为**沟道调制效应**。
### 3.1.3 EMOS特性

伏安特性:
    - 输出特性$v_{DS}\to i_D$
    - 转移特性$v_{GS}\to i_D$

稳压二极管保护:

**衬底效应**:
$$\eta=\frac{g_{mb}}{g_m},\quad(i_D=g_mv_{gs}+g_{mb}v_{bs}+g_{ds}v_{ds})$$

### 3.1.4 DMOS特性

以参杂N/P薄层形成导电沟道, $v_{GS(th)}<0$

### 等效电路

**大信号模型**

$$i_D=\frac{\mu_nC_{OX}W}{l}\left((v_{GS}-V_{GS(th)})v_{DS}-\frac{1}{2}v_{DS}^2\right)\\
=\begin{cases}
    \frac{\mu_nC_{OX}W}{l}(v_{GS}-V_{GS(th)})v_{DS} & v_{DS}\ll ...\\
    \frac{\mu_nC_{OX}W}{2l} (v_{GS}-V_{GS(th)})^2 & 饱和区
\end{cases}$$
*注* : $i_D$达到饱和区不再增加

饱和区沟道调制
$$i_D=...\left(1-\frac{v_{DS}}{V_A}\right)=...(1+\lambda v_{DS})$$
$\lambda=-\frac{1}{V_A}$为沟道调制系数

**小信号模型**

$i_d=g_mv_{gs}+g_{ds}v_{ds}$ ,则

$$g_m =\frac{\partial i_d}{\partial v_{ds}} =2\sqrt{ \frac{\mu_nC_{OX}W}{2l} I_{DQ}(1+\lambda V_{DSQ}) }$$

$$g_{ds}=...=\frac{\lambda}{1+\lambda V_{DSQ}} I_{DQ} \approx \lambda I_{DQ}$$

其中输出电阻 $r_{ds}=g_{ds}^{-1}$
*注* : 小信号模型在饱和区下。

$\mu=g_mr_{ds}=v_{ds}/v_{gs}$
为放大因子

寄生电容:

### 3.1.6 EKV MOS模型
用于解决亚阈区特性

反型系数:
$$\text{IC}=\frac{I_D}{2n\mu_0C_{OX}V_T^2(W/L)}$$

特性:
$$i_D=2n\mu_0C_{OX}V_T^2(W/L)\left[\ln\left(1+e^{\frac{v_{GS}-V_{GS(th)}}{2nV_T}} \right) \right]^2$$

### 3.1.7 BSIM3模型
### 3.1.8 4种MOS管比较

$|v_{GS}|$ 足够大则工作, $|v_{DS}|$ 足够大则处于饱和区, P沟道相对为负值
, 耗尽型(D)在GS短接下导通

## 3.2 结型场效应管(JFET)

$$i_D=\frac{I_{DSS}}{V_{GS(off)}^2}\left((v_{GS}-V_{GS(off)})v_{DS}-\frac{1}{2}v_{DS}^2\right)$$
$$R_{(on)}=\frac{V_{GS(off)}^2}{2I_{DSS}}\cdot\frac{1}{v_{GS}-V_{GS(off)}}$$

大信号$i_D'=... (1-\frac{v_{GS}}{V_A})$

与MOSFET类似