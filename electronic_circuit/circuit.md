# 1 二极管
二极管: diode
本征半导体: intrinsic semiconductor

热平衡载流子浓度值
$$n_i=AT^{3/2}e^{-\frac{-E_{g0}}{2kT}}$$
其中 $A_{Si}=3.88e16cm^{-3}K^{-3}, A_{Ge}=1.76e16,k=8.63e-5eV/K,E_{g0,Si}=1.21eV,E_{g0,Ge}=0.785eV$

N型: 施主杂质(donor); P型: 受主杂质(acceptor)

空穴: positive hole

多/少子热平衡浓度:
$$n_0p_0=n_i^2\\ \begin{cases}
    n_0=N_d+p_0 & \text{N, donor}\\
    p_0=N_a+n_0 & \text{P, acceptor}\\
\end{cases}$$

导电原理:
  - 漂移: 受电场作用的定向移动 $J_t=1e\cdot(pmu_p+nmu_n)E$
  - 扩散: 浓度差引起的定向移动 $J_{nd}=qD_n\partial_xn,...$

热电压: $V_T=\frac{kT}{q}=26\text{mV}$

内建电位差: $V_B\approx V_T \ln \frac{N_aN_d}{n_i^2}$

阻挡层宽度(突变结) $\frac{x_n}{x_p}=\frac{N_a}{N_d}$

二极管伏安特性
$$I=I_S(e^{\frac{V}{V_T}}-1)$$
导通电压$V_{on,Si}=0.6\sim 0.8,\quad V_{on,Ge}=0.2\sim 0.3V$

击穿特性:
  - 雪崩击穿: 载流子碰撞价电子,参杂浓度低,电压高
  - 齐纳击穿: 阻挡层内中性原子电离,参杂浓度高,电压小

温度特性

电容特性
  - 势垒电容 $C_T=\frac{C_T(0)}{(1-V/V_B)^n}$
  - 扩散电容 $C_D=k_D(I-I_S)$

开关特性(导通性,截止性)

## 1.3 二极管分析方法
数学模型
$$I=I_S(e^{\frac{V-Ir_S}{nV_T}}-1)$$
其中 $I_S$ 为反向饱和电流

大信号模型(理想二极管+导通电压+电阻)

小信号模型(电阻+肖特基电阻$r_j=V_T/I_Q$)

分析方法: 图解分析,等效分析

## 1.4 二极管应用
## 1.5其他二极管
