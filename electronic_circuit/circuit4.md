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
|$R_i$|$\infin$|$g_m^{-1}$|$\infin$|
|$R_o'$|$r_{ds}$|$r_{ds}+R_s+g_mR_sr_{ds}\to r_{ds}$|$g_m^{-1}$|
|$R_o$|$r_{ds}\parallel R_D\to R_D$|$R_o'\parallel R_D\to R_D$|$g_m^{-1}$|
|$A_v$|$\to -g_m(R_D\parallel R_L)$|$\to g_m(R_D\parallel R_L)$|$\to 1$|


### 4.2.2

| |共射(CE)|共基(CB)|共集(CC)|
|-|-|-|-|
|$R_i$|$r_{bb'}+r_{b'e}$|$(1+\beta)^{-1}(r_{bb'}+r_{b'e})$|$r_{bb'}+r_{b'e}+(1+\beta)R_E'$|
|$R_o'$|$r_{ce}$|$r_{ce}+\beta (R_s\parallel r_{be})$|$\to(1+\beta)^{-1}(r_{be}+R_s)$|
|$A_{in}$|$\beta$|$-\alpha$|$-(1+\beta)$|
|$A_v$|$-g_mR_L'$|$g_mR_L'$|$\to 1$|
