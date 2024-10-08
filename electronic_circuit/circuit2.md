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
2. 饱和
3. 截止

**2. 小信号模型**

*符号约定* : $v_{BE}=V_{BE}(直流)+v_{be}(交流)$

