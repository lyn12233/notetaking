# 三极管

- 模式图:
  $$\begin{matrix}
        E\quad\text{(Emittor)}& \leftarrow & I_{\overrightarrow{E}_n},I_{\overrightarrow{C}_{n1}},I_{CEO}
        & \leftarrow & C\quad\text{(Collector)}\\
        &\nwarrow \quad I_{E_p}& & I_{CBO} \quad \swarrow&\\
        &\nwarrow&&\swarrow&\\
        &&B\quad \text{Base}&&
    \end{matrix}$$

- 主要讨论NPN型三极管

## 3.1 三极管工作原理

开路参数:
  - 集电结反向饱和电流: $I_{CBO}$
  - 穿透电流: $I_{CEO}$

节点方程: $I_E=I_C+I_B$

电流传输放大系数:
  - 共基极: 
    $$\begin{matrix}
        \overline{\alpha} &=& I_{C_{n1}}/I_E\\
        &=& \frac{I_{E_n}}{I_E}\cdot\frac{I_{C_{n1}}}{I_{E_n}} &\quad(\eta_E\eta_B)
    \end{matrix}$$
  - 共发射极:
    $$\begin{matrix}
        \overline{\beta} &=& \frac{\overline{\alpha}}{1-\overline{\alpha}}\\
        &=& \frac{I_C-I_{CBO}}{I_B+I_{CBO}}
    \end{matrix}$$

*减小寄生电流的条件*

### 2.1.2 电流传输方程

1. **共基极**
   $$I_C=\overline{\alpha}I_E+I_{CBO}$$
2. **共发射极**
   $$I_C=\overline{\beta}I_B+I_{CEO},\\
   其中\quad I_{CEO}=(1+\overline{\beta})I_{CBO}$$
3. **共集电极**
   $$I_E=(1+\overline{\beta})I_B+I_{CEO}$$

## 2.2 三极管模型

### 2.2.1 Ebers-Moll模型

通过发射结、集电结的电流:
$$\begin{cases}
  I_{\overleftarrow{F}}=I_{EBS}(\exp(\frac{v_{BE}}{V_T})-1)\\
  I_{\overrightarrow{R}}=I_{ECS}(\exp(\frac{v_{CE}}{V_T})-1)\\
\end{cases}$$

电流相互作用:
$$\begin{pmatrix}
  I_E\\I_C
\end{pmatrix} = \begin{pmatrix}
  1 & -\overline{\alpha}\\
  \overline{\alpha} & -1
\end{pmatrix}\cdot\begin{pmatrix}
  I_F\\I_R
\end{pmatrix}$$

通常忽略$I_R,I_{CBS}$

### 2.2.2 共发射极等效电路

**1. 大信号电路模型**

1. 放大
   
   $I_B\approx \frac{I_S}{\beta}e^{V_{BE}/V_T}$只受发射结控制
   温度的影响:

   $$\begin{cases}
    \Delta \beta / \beta = 0.005\sim 0.01 \frac{\Delta T}{1K}\\
    \Delta V_{Be(on)}\downarrow /\Delta T = -(2\sim 2.5)mV/K\\
    I_{CBO} \sim 2^{T/10}
   \end{cases}$$
2. 饱和

   $$\begin{cases}
    V_{BES}\approx V_{BE(on)}=0.7V\\
    V_{BCS}\approx V_{BC(on)}=0.4V\\
    V_{CES}\approx 0.3V & (共发射极)
   \end{cases}$$
  
3. 截止

**2. 小信号模型**

*符号约定* : $v_{BE}=V_{BE}(直流)+v_{be}(交流)$

根据肖特基电阻:
$$r_{be}=\frac{V_T}{I_{BQ}}=(1+\beta)\frac{V_T}{I_{EQ}}=(1+\beta)r_e$$
其中$r_e$是BE间实际存在的电阻

$v_{be}$控制$i_c$的作用:
$$i_c=g_mv_{be}$$

得到
$$g_m=\frac{\beta}{r_{be}}\approx \frac{I_{CQ}}{V_T}\approx 38.5V^{-1} I_{CQ}$$

基极串联电阻$r_{bb'}$, 发射结扩散电容$C_{b'e}$, 集电结势垒电容$C_{b'c}$


### 2.2.3 伏安特性

1. 放大区
   
   厄尔利电压(early voltage)和基区宽度调制(base-width modulation)
   $$i_C \approx I_Se^{v_{BE}/V_T}\left(1-\frac{v_{CE}}{V_A} \right)$$
   $$r_{ce}=\frac{\partial v_{CE}}{\partial i_C}= \left| \frac{V_A}{I_{CQ}} \right|$$ 

   $\beta$与$i_C$的关系

2. 截止区

  $i_E=0$, 可以视作$i_C=I_{CBO}\approx 0$

3. 饱和区/反向工作区
  $$v_{CE}<0.3V$$

4. 击穿区
5. 极限参数
  $$V_{(BR)CEO},I_{CM},P_{CM}$$

### 2.2.4 频率参数

$$\beta(\omega)=\frac{\beta_0}{1=j\frac{\omega}{\omega_{\beta}}}$$

  ,$\omega_{\beta}=\frac{1}{r_{b'e}(C_{b'c}+C_{b'e})}$为转折点角频率

$$\omega_T=\beta_0\omega_{\beta}$$为特征角频率, 此时失去放大能力

$\alpha$ 的转折点角频率 $\omega_{\alpha}=(1+\beta)\omega_{\beta}$

## 2.3 三极管分析方法
## 2.4 应用
电流源, 放大器, 跨导线性电路, TTL (transistor-transistor logic)电路