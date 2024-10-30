# 4 放大器

### 4.1.2 放大器性能指标

- 电阻:
    $$R_i=v_i/i_i,\quad R_o=v/i(开路)$$
- 增益:
    $$\begin{cases}
        A_v=v_o/v_i&\\
        A_i=i_o/i_i&\\
        A_g=i_o/v_i&(transconductance)\\
        A_r=v_o/i_i&(transresistance)
    \end{cases}$$

- 负载开路和短路时的增益

    $$A_v=A_{vt}\frac{R_L}{R_o+R_L}\quad(\text{t: trennen})$$
    $$A_i=A_{in}\frac{R_o}{R_o+R_L}\quad(\text{n: nieder})$$
- 源增益

**频率响应** : 
$$A(\omega)_{\text{dB}}=20\lg \frac{A(\omega)}{1 \text{rad}\cdot s^{-1}}$$
$$\text{BW}=f_H-f_L$$
**失真** : 频率失真, 瞬变失真, 非线性失真

## 4.2 基本放大器

*分析要点: 输出, 响应的正负关系*

nomenclature
- $R_L$ : 负载电阻
- $R_L'$ : 负载与某电阻并联
- $R_o'$ : 负载与某电阻并联, 整体对应的输出电阻
- $R_D,R_S,R_C,R_E$ : 控制输出的电阻
- $R_s$ : 输入电源内阻
### 4.2.1 


| |共源(CS)|共栅(CG)|共漏(CD)|
|-|-|-|-|
|$R_i$|$R_G\to \infin$|$R'_S\parallel g_m^{-1}$|$R_G\to\infin$|
|$R_o$|$r'_{ds}=R_D\parallel r_{ds}\to R_D$|$R_D\parallel [r_{ds}+R_s+g_mR_s r_{ds}]\to R_D$|$R_s'\parallel g_m^{-1}$|
|$R_o$|$r_{ds}\parallel R_D\to R_D$|$R_o'\parallel R_D\to R_D$|$g_m^{-1}$|
|$A_v$|$-\frac{g_mR_L'}{1+g_mR_s'}\to -g_m R_L'$|$\to g_mR_L'$|$\left(1+\frac{1}{g_mR_L'}\right)^{-1}\to 1$|


### 4.2.2

| |共射(CE)|共基(CB)|共集(CC)|
|-|-|-|-|
|$R_i$|$R_B\parallel r_{b'e}$|$R_E\parallel \frac{r_{b'e}}{1+\beta}$|$R_B\parallel [r_{b'e}+(1+\beta)R_L']$|
|$R_o$|$R_C\parallel r_{ce}$|$R_C\parallel[r_{ce}+\beta \frac{R'_sr_{ce}}{R'_s+r_{be}}]$|$R_E\parallel \frac{r_{b'e}+R'_s}{1+\beta}$|
|$A_{in}$|$\beta$|$-\alpha$|$-(1+\beta)$|
|$A_v$|$-g_mR_L'$|$g_mR_L'$|$(1+\frac{r_{b'e}}{(1+\beta)R'_L})^{-1}$|

带$R_E$的共射放大器:
$$\begin{cases}
    R_i &=& R_B\parallel \left(r_{b'e}+R_E\frac{(1+\beta) r_{ce}+R_L'}{r_{ce}+R_L'+R_E}\right) \\
    R_o &=& R_C\parallel\left(r_{ce}(1+\frac{\beta R_E}{R_E+r_{b'e}+R'_s})\right)\\
    A_v &=& - \frac{\beta R'_L}{r_{b'e}+(1+\beta)R_E}
\end{cases}$$

有源负载的共射放大器:


### 4.2.3 集成MOS放大器

1. EEMOS和EDMOS
$$A_v=-\frac{g_{m1}}{g_{m2}(1+\eta_2)}$$
$$A_v=-\frac{g_{m1}}{\eta_2 g_{m2}}$$
2. CMOS
    - 电流源负载
    $$A_v=-\frac{g_{m1}}{g_{ds1}+g_{ds2}}\quad\text{or}\quad-\frac{g_{m2}}{g_{ds1}+g_{ds2}}$$
    - 推挽
    $$A_v=-\frac{g_{m1}+g_{m2}}{g_{ds1}+g_{ds2}}$$
3. 共栅和共漏

### 4.2.4 组合放大器
**共集放大器**有跟随作用

## 4.3 差分放大器

分类:
- 单端输出
- 双端输出

### 4.3.2 性能特点

共模信号(common-mode)和差模(differential-mode)信号:$1,2=c\pm\frac{d}{2}$

1. c等效电路(共射放大器)
2. d等效电路(接$2R_{EE}$的共射放大器)

共模抑制比(common-mode rejection ratio)

$$\begin{cases}
    A_{vc} &=& -\frac{g_mR_L'}{1+g_m\cdot2R_{EE}}\to -\frac{R_D}{2R_{EE}}\\
    A_{vd} &=& -g_mR_L'=-g_mR_D
\end{cases}$$

$$\begin{cases}
    A_{vc1}=A_{vc2}=A_{vc}=\frac{v_{oc1}}{v_{ic1}}\\
    A_{vd1}=-A_{vd2}=\frac{1}{2}A_{vd}
\end{cases}$$

$$K_{\text{CMR}}=\left|\frac{A_{vd}}{2A_{vc}}\right|=\left|\frac{A_{vd1}}{A_{vc1}}\right|$$

$$K_{\text{CMR}}=g_mR_{EE}$$

### 4.3.3 电路不对称的影响


1. 双端输出共模抑制比
    $$\begin{cases}
        A_{v,d\to d}=\frac{A_{v1}+A_{v2}}{2}\\
        A_{v,c\to d}=A_{vc1}-A_{vc2}
    \end{cases}$$
    $$K_{CMR}=|A_{vd\to d}/A_{vc\to d}|$$
2. 失调,温漂,调零
    - 输入失调电压
        $$V_{\text{IO}}=V_O/A_{vd}$$
        若$g_m=T_{EE}/(2V_T)$,则
        $$V_{\text{IO}}=V_T(\delta I_S/I_S+\Delta R_C/R_C)$$
    - 输入失调电流
        $$I_{\text{IO}}=|I_{BQ1}-I_{BQ2}|=I_B\Delta \beta/\beta$$
    - 总失调电压和调零
        $$V_{\text{IO}\sum}=V_{\text{IO}}+I_{\text{IO}}R_s$$
    - 温漂
        调零电路不能消除之

### 4.3.4 差模传输特性

1. BJT
    $$i_{C1}-i_{C2}=I_{EE}\th\left(\frac{v_{\text{ID}}}{2V_T}\right)$$
    范围$|v_{\text{ID}}|\le V_T$
2. MOS
    $$i_{D1}-i_{D2}=I_{SS}\left(\frac{v_{\text{ID}}}{V_{GSQ}-V{GS(th)}}\right)^2\sqrt{1-\frac{1}{4}\left(\frac{v_{\text{ID}}}{V_{GSQ}-V{GS(th)}}\right)^2}$$
    范围$|v_{\text{ID}}|\le \sqrt{2}(V_{GSQ}-V_{GS(th)})$

## 4.4 电流源电路

### 4.4.1 镜像电流源电路
#### 4.4.1.1 BJT
1. **基本镜像电流源**
    $$\begin{cases}
        I_R=\frac{V_{CC}-V_{BE(on)}}{R}\\
        I_0=\frac{I_R}{1+\frac{2}{\beta}}
    \end{cases}$$
2. 减小$\beta$影响的
3. 比例式
#### 4.4.1.2 MOS
1. 基本镜像电流源
2. 动态电流镜
3. 开关电流电路
### 4.4.2 改进的电流源电路
1. 级联型
2. Wilson电流镜
### 4.4.3 电流源的应用

## 4.5 多级放大器

## 4.6 运算放大器 \* 

## 4.7 放大器频率响应
### 4.7.1 复频域分析
**DEF** 波特:
$$A|_{dB}=20\lg A$$
根据传输算子绘制**渐进波特图**(多级点系统波特图为单极点线性叠加)

上限角频率
$$\text{where}\quad A(s)=\frac{A_0}{\prod (s+j\omega_{p_i})},\quad A(j\omega_H)=\frac{A_0}{\sqrt{2}}$$
$$\omega_H=\frac{1}{\sqrt{\sum \frac{1}{\omega_{p_i}^2}}} \approx \omega_{p_1}\quad(\omega_{p_1}\le 0.25\omega_{\min 2} 则称为主极点)$$


**DEF** 截止角频率$\omega_\beta$,$\omega_\alpha$,特征角频率$\omega_T$(T: trait),
分别对应$\beta\to\beta/\sqrt{2}$,$\alpha\to\alpha/\sqrt{2}$,$\beta\to 1$
通常$\omega_\alpha>\omega_T\gg\omega\beta$

### 4.7.2 CE,CB,CC频率特性
**METHOD** miller's equivalence:
$$\begin{cases}
    Y_1(s)=Y(s)\left(1-A(s)\right)\\
    Y_2(s)=Y(s)\left(1-\frac{1}{A(s)}\right)
\end{cases}$$
#### 共源放大器

高频等效
$$A(s)=\frac{sR_L'C_{b'c}-g_mR_L}{1+sR_L'C_{b'c}}\quad(R_L'=R_L\parallel R_C\parallel r_{ce})$$

miller等效
$$\begin{cases}
    Y_1(s)=sC_{b'c}(1+g_mR_L')\to sC_{M1}\\
    Y_1(s)=sC_{b'c}(1+\frac{1}{g_mR_L'}) \to sC_{M2}\\
\end{cases}$$

简化等效
$$\begin{cases}
    R_t&=(R_s'+r_{bb'})\parallel r_{b'e}\\
    C_t&=C_{b'e}+C_{M1}=\left(1+\frac{g_mR_L'C_{b'c}}{C_{b'e}}\right)\\
    &\to DC_{b'e}\quad(D为miller倍增因子)
\end{cases}$$

$$\begin{cases}
    \omega_\beta=\frac{1}{r_{b'e}(C_{b'e}+C_{b'c})}\\
    \omega_T=\beta\omega_\beta\approx g_m/C_{b'e}\\
    \omega_\alpha=(\beta+1)\omega_\beta
\end{cases}$$

#### 共发放大器


## 4.8 放大器噪声 \*