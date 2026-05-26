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

定义 $z$ 为源到负载的方向, 原点为源; $s$ 为负载到源的方向, 原点为负载; 记传输线长度 $l$, 满足 $z=l-s$;

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

定义 $\gamma = \sqrt{(R + j\omega L) (G + j\omega C)}$ 为传播常数, $\gamma = \alpha + j\beta$, $\alpha$ 为衰减因子, $\beta$ 为相位因子(相当于波数), $Z_0 = \sqrt{\frac{R + j\omega L}{G + j\omega C}}$ 为特征阻抗;

传输线方程解的形式包括:

- $z$ 方向上, 按 $\pm z$ 传播方向分解:
    $$ \begin{cases}
        U(z) = A e^{-\gamma z} + B e^{\gamma z}\\
        I(z) = \frac A {Z_0} e^{-\gamma z} - \frac B {Z_0} e^{\gamma z}\\
    \end{cases} $$
- $s$ 方向上, 按负载初值 $U_L, I_L$ 确定:
    $$ \begin{cases}
        U(s) = U_L \ch \gamma s + I_L Z_0 \sh \gamma s \\
        I(s) = \frac {U_L}{Z_0} \sh \gamma s + I_2 \ch \gamma s\\
        \end{cases}
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

输入阻抗也可以用反射系数表示:

$$\begin{aligned}
    Z_{in} (s) = Z_0 \frac{1 + \Gamma (s)}{1 - \Gamma (s)}\\
    \mathrm{also\quad} \Gamma (s) = \frac{Z_{in} - Z_0}{Z_{in} + Z_0}
\end{aligned}$$

> 证明: 
> $$Z_{in} = Z_0 \frac{(1 + j \tan \beta s) + \Gamma_L(1 - j \tan \beta s)}{(1 + j \tan \beta s) + \Gamma_L (j \tan \beta s - 1)}$$

## 1.4 行波/驻波状态, 输入阻抗和负载性质分析

### 行波/驻波状态分析

$$\begin{cases}
    U(s) = A e^{j\beta s} (1 + \Gamma_L e^{-2j\beta s})\\
    I(s) = \frac A {Z_L} e^{j\beta s} (1 - \Gamma_L e^{-2j\beta s})\\
\end{cases}$$

可知 $\varphi_L - 2 \beta s = 2 n \pi$ 为电压波腹/电流波节, $\varphi_L - 2 \beta s = (2n + 1) \pi$ 时为电压波节/电流波腹;

### 纯阻抗负载

- $Z_L = R_L = 0$ 时, $\Gamma_L = -1$, 全反射
- $Z_L = R_L < Z_L$ 时, 负载处为电压波节点
- $Z_L = R_L = Z_L$ 时, $\Gamma_L = 0$ 无反射
- $Z_L = R_L > Z_L$ 时, 负载处为电压波腹点
- $Z_L = \inf$ 时, $\Gamma=1$, 全反射

### 纯电抗负载

$|\Gamma_L| = 1$, 全反射, $\arg \Gamma_L$ 表示入射波和反射波在负载处的相位差;

## 1.5 阻抗圆图

对 $Z_{in}$ 归一化: $\tilde{Z}_{in} = Z_{in} / Z_0$;
在以 $(\mathrm{Re}[\Gamma (s)], \mathrm{Im}[\Gamma (s)])$ 张开的复平面上, $Z_{in} = \tilde R + j \tilde X$ 与 $\Gamma$ 的关系构成共形映射:
- 等电阻圆: $(\frac{\tilde{R}}{1 + \tilde{R}},0) \phi \frac 1 {1+\tilde R}$ 经过 $(1,0)$
- 等电抗圆: ...

导纳圆同理?

## 1.6 阻抗匹配

按匹配的目的分:
- 信号源共轭匹配: 使信号源输出最大功率
- 信号源匹配: 使信号源无反射的输出
- 负载阻抗匹配: 使终端没有反射

实现负载阻抗匹配的方法:
- $\frac 1 4 \lambda$ 阻抗变换器
- 多节 $\frac 1 4 \lambda$ 阻抗变换器/指数型阻抗变换器(具有更宽的频带)
- 单支节匹配
- 多支节匹配(使用阻抗圆图分析)

# 2 规则波导

## 2.1 规则波导传输的一般理论

空间中的波动方程 
$$\begin{cases}
    \nabla^2 \vec{E} + K^2 \vec{E} &=0\\    
    \nabla^2 \vec{H} + K^2 \vec{H} &=0\\    
\end{cases}$$
其中 $K=\omega \sqrt{\mu\epsilon} = \frac{2\pi}{\lambda}$ 为**波数**

令波导延伸方向为z方向, 根据不变性 $\vec{E}(u,v,z) = \vec{E}_t(u,v) E_z(z)$, 由分离变量法 $E_z = A^{+} e^{-\gamma z} + A^{-} e^{\gamma z}$, 得到:

- **纵向分量**
  $$\nabla_t^2 E_z + K_c^2 H_z = 0$$
  其中 $\nabla_t^2 = \partial_u^2 + \partial_v^2$, $K_c^2 = \gamma^2 + K^2$ 为**截止波数**
- **横向分量**
    $$\hat{z} \times (\nabla \times \vec{E}) = \nabla_t \vec{E}_z + \gamma \vec{E}_t = - j \omega \mu \hat{z} \times \vec{H}$$


对**波型**的分类:
- **TM波**: 磁场只有横向分量 (对电场纵向分量的求解 $\vec{E}_t = -\frac{\gamma}{K_c^2} \nabla_t E_z$, $\vec{H} = \frac{j \omega \epsilon}{K_c^2} \nabla \times (\hat{z} H_z)$)
- **TE波**: 电场只有横向分量(同理 $\vec{E}_t = - \frac{j \omega \mu}{K_c^2} \nabla \times (\hat{z} H_z)$, $\vec{H}_t = - \frac{\gamma}{K_c^2} \nabla_t H_z$)
- TEM波
- 混合波形

传播条件: 在无耗情况下, 波的相位常数 $\beta^2=K^2-K_c^2$, $K$ 由频率和介质决定, $K_c$ 由波导尺寸决定, 对应**截止波长** $\lambda_c = \frac{2\pi}{K_c}$. 因此波导内只能传输 $K > K_c$ 的波.

群速度和相速度: $v_p = v/\sqrt{1-(\lambda/\lambda_c)^2}$, $v_g = v \sqrt{1-(\lambda/\lambda_c)^2}$, 满足 $v_g v_p = v^2$, $\lambda_g = v_p / f$(相速度决定波导波长), $\beta = \frac{2\pi}{\lambda_g}$.

波阻抗为波导中的波横向电场/磁场比, 例 $Z_{\mathrm{TE}} = \frac{\gamma}{j \omega \epsilon}$

## 2.2 矩形波导

### 2.2.1 波型

矩形波导的描述: $0\le x\le a, 0\le y\le b$, $H_x|_{x=0,a} = H_y|_{y=0,b} = 0$

TE/TM波的解: 
- 对TE波, 带入 $E_z= E_0 \sin(\frac{m\pi x}{a}) \sin(\frac{n\pi y}{b}) e^{-j \beta z}$ 和 $\gamma=j\beta$ 得到:
    $$\begin{cases}
        E_x = - \frac{j \beta}{K_c^2} \frac{m\pi}{a} E_0 \cos(\frac{m \pi x}{a}) \sin(\frac{n\pi y}{b}) e^{-j \beta z}\\
        E_y = - \frac{j \beta}{K_c^2} \frac{n\pi}{b} E_0 \sin(\frac{m\pi x}{a}) \cos(\frac{n\pi y}{b}) e^{-j \beta z} \\
        ...
    \end{cases}$$

截止波数包含2个自由度: $K_c^2 = (\frac{m\pi}{a})^2 + (\frac{n\pi}{b})^2$, 对应不同的波型模式

### 2.2.2 矩形波导的主模TE10

**场的结构**: 

$$\begin{cases}
    E_y = -j \frac{\omega \mu a}{\pi} H_0 \sin(\frac{\pi x}{a}) e^{-j \beta z}\\
    H_x = j \frac{\beta a}{\pi} H_0 \sin(\frac{\pi x}{a}) e^{-j \beta z}\\
    H_z = H_0 \cos(\frac{\pi x}{a}) e^{-j\beta z}
\end{cases}$$

壁电流分布, 传输功率, 衰减和损耗: ...

**等效阻抗**:
$$Z_e = \frac b a \sqrt{\frac \mu \epsilon} \frac 1 {\sqrt{1-(\lambda/2a)^2}}$$
反映电压电流比/电压功率比/电流功率比相对值和矩形波导参数的相对关系.

### 2.2.3 矩形波导中的高次模
略

应用: 利用场结构的差异消除兼并模

### 2.2.4 激励与耦合

## 2.3 圆形波导

## 2.4 同轴线及高次模

$Z_c=\frac{138}{\sqrt{\epsilon_r}} \lg \frac b a$, $\lambda_c \approx \pi (a+b) \mathrm{(TE11)}$, $a_C \approx \frac{R}{2 Z_c}$, $R=R_S (\frac 1 {2\pi a}+ \frac 1 {2\pi b})$, $b/a=1.65$ 时功率容量最大, $b/a=3.6$ 时导体损耗最小, $b/a=2.3$ 时 $Z_c \approx 50 \Omega$

## 2.5 平行板波导
## 2.6 特殊波导

# 3 平面传输线

## 3.1 带状线

带状线的场结构近似为同轴线的场结构.

带状线主模是TEM, 特性阻抗 $Z_c \approx \frac {30\pi}{\sqrt{\epsilon_r}} \frac b {W_e + 0.441 b}$, $W_e$ 为导体带宽度, $b$ 为介质厚度.

略

## 3.2 微带线

微带线近似为双线, 主模为TEM波

等效介电常数 $\epsilon_{re} = \frac 1 2 (\epsilon_r+1) + \frac 1 2 (\epsilon_r -1) (1 + 10 \frac h W)^{-\frac 1 2}$, 

特性阻抗 $Z_c \approx \frac {60\pi}{\sqrt{\epsilon_{re}}} \frac 1 {W/2h + 1/h \ln 2 \pi e (W/2h + 0.94)}$.

损耗, 高次模: 略

耦合微带线: ?

## 3.3 其他平面传输线
略

## 3.4 平面传输线的激励与耦合
略

# 4 微波谐振腔

## 4.1 引言

意义: 路论设计的谐振回路(LC谐振回路)集总参数性能变差, 辐射和损耗急剧增加.

特点: 分布参数, 多谐性, 损耗小/频率选择性好/功率容量大

## 4.2 谐振腔的参数

### 4.2.1 谐振频率

$$\lambda_0 = \frac 1 {\sqrt{(\frac 1 {\lambda_c})^2 + (\frac p {2l})^2}} = \frac 2 {\sqrt{(\frac m a)^2 + (\frac n b)^2 + (\frac p l)^2}} \mathrm{(对矩形谐振腔)}$$

### 4.2.2 品质因数

- 固有品质因数 $Q_0 = 2 \pi \frac{W}{W_T} = \frac 2 \delta (\iiint |H|^2 \mathrm d V)/(\oiint |H_t|^2 \mathrm d S)$, $W$ 为总储能, $W_T$ 为一个周期的耗能.
- 有载品质因数 $Q_L = \omega_0 \frac{W}{P_c + P_L}$, $P_c$ 为自身损耗功率, $P_L$ 为负载损耗功率.

### 4.2.3 等效电导
略

## 4.3 矩形谐振腔


对TE101模:
$$Q_0= \frac{abl}{\delta} \frac{a^2 + l^2}{2b(a^3 + l^3) + al (a^2 + l^2)}$$

$$G_0 = \frac{R_S}{\eta^2} \frac{2b(a^3+l^3) + al (a^2 + l^2)}{2b^2 (a^2+ l^2)}$$

略

# 5 微波网络

## 5.1 引言
微波网络属于路论的范畴, 分析微波网络应当注意:
- 网络参量是相对某一工作波形而言的
- 网络的电压, 电流是等效概念, 应明确其定义
- 应确定参考面
- 参考正方向: 输入为正

## 5.2 二端口网络的参量矩阵
- Z: 阻抗矩阵(电流激励电压的系数)
    $$\binom{U_1}{U_2} = Z \binom{I_1}{I_2}$$
- Y: 导纳矩阵(电压激励电流档系数)
    $$\binom{I_1}{I_2} = Y \binom{U_1}{U_2}$$
- A: 转移矩阵(输入端激励输出端)
    $$\binom{U_1}{I_1} = A \binom{U_2}{- I_2}$$
    记 $\mathbf{A} = \binom{A\space B}{C \space D}$, $A$ 为电压传输系数, $D$ 为电流传输系数, $B$, $C$ 为端口间的转移阻抗.
- S: 散射矩阵(入射激励反射)
    $$\binom{b_1}{b_2} = S \binom{a_1}{a_2}$$
- T: 传输参量
    $$\binom{a_1}{b_1} = T \binom{b_2}{a_2}$$

## 5.3 二端口网络参量矩阵的关系

- Y, Z, A 的关系

  $$\begin{align*}
    \mathbf{Z} &= \mathbf{Y}^{-1}\\
    \mathbf{Z} &= \frac 1 C \begin{pmatrix}
        A & |\mathbf A| \\
        1 & D
    \end{pmatrix} \\
    \mathbf Y &= \frac 1 B \begin{pmatrix}
        D & - |\mathbf A|\\
        -1 & A
    \end{pmatrix}
  \end{align*}$$
- S, T的关系
    $$\begin{align*}
        \mathbf T &= \frac{1}{S_{21}} \begin{pmatrix}
            1 & - S_{22} \\
            S_{11} & - |\mathbf S|
        \end{pmatrix} \\
        \mathbf S &= \frac{1}{T_{11}} \begin{pmatrix}
            T_{21} & |\mathbf T| \\
            1 & - T_{12}
        \end{pmatrix}
    \end{align*}$$
- S, z的关系
    $$\mathbf S = (\mathbf z - \mathbf I) (\mathbf z + \mathbf I)^{-1}$$

> 对 $U$, $I$ 参量的**归一化**: $u_i = U_i / \sqrt{Z_{ci}}$, $i_i = I_i\sqrt{Z_{ci}}$, $Z_{ci}$ 为端口 $i$ 的特性阻抗. 同理定义归一化的参量矩阵 $\mathbf z$, $\mathbf y$

## 5.4 多端口网络
略

## 5.5 微波网络特性
- 互易网络: $Z^T = Z, Y^T = Y, S^T = S, |A|=|T|=1$
- 无耗网络: $S^T S^* = I$
- 对称网络: 端口序号互换参量矩阵不改变.

### 移动参考面的影响
$S' = d S d$ 其中 $d=\mathrm{diag}(e^{-j \theta_1},...)$, $\theta_i$ 为端口 $i$ 的参考面向*外*平移的相位差.

## 5.6 基本电路的网络参量
?

## 5.7 二端口网络的连接
- 串联 $z = \sum z_i$
- 并联 $y = \sum y_i$
- 级联 $t=\prod t_i$, $a=\prod a_i$

## 5.8 外部特性参量
略

# 6 基本微波无源元件
?

# 7 天线技术

## 7.1 绪论



## 7.2 电磁波辐射的基本理论

辐射场的近似:
- 远区场
- 近区场

### 7.2.1 矢量位法

$$A(\vec r) = \iiint \vec{J}(\vec{r}') \frac{e^{-jkR}}{4\pi R} \mathrm d V$$

### 7.2.2 基本辐射单元的辐射

- 基本电振子(远区场):
    $$\begin{cases}
        E_{\theta} = \frac{j \eta Il}{2\lambda r} \sin \theta e^{-jkr}\\
        H_{\phi} = \frac{jIl}{2\lambda r} \sin \theta e ^{-jkr}
    \end{cases}$$
    方向性函数 $F(\theta,\phi) = \sin \theta$, 辐射功率 $P_f = \iiint \frac 1 2 \vec E \times \vec H^* \mathrm d S = P_r + j P_x$, 其中辐射功率 $P_r = \frac{\eta \pi}{3} (\frac{Il}{\lambda})^2 = 40pi^1 (\frac{Il}{\lambda})^2$. 定义辐射电阻 $R_r = \frac{P_r}{2 |I|^2} = 80\pi^2 (\frac l \lambda)^2$.
- 磁振子:略
- 对称振子: 电流分布 $I(z) = I_m \sin k(l-|z|)$, 远场:
    $$E_{\theta} = \frac{j \eta I_m}{2 \pi r} e^{-jkr}[\frac{\cos(kl\cos\theta) - \cos(kl)}{\sin\theta}]$$
    对半波振子 $2l=\frac 1 2 \lambda$, $kl = \frac 1 2 \pi$, $2\theta_{0.5} = 78 \degree$, $R_r = 73.1 \Omega$, 对全波振子 $2l = \lambda$.


### 7.2.3 天线的基本参数
方向性函数 $F(\theta,\phi)$, 半功率宽度 $2\theta_{0.5}$, 主瓣宽度 $2\theta_0$, 副瓣电平 $\mathrm{SSL}_i$, (最大)方向性系数 $D(\theta_0,\phi_0) = \frac{p(\theta_0, \phi_0)}{p_{\mathrm{av}}}$, 效率 $\eta_A = \frac{\Re(P_f)}{\Re(P_{\mathrm{in}})}$, 增益 $G = \frac{p(\theta_0,\phi_0)}{\Re(P_{\mathrm{in}})/4\pi r^2} = \eta_A D(\theta_0,\phi_0)$, 输入阻抗, 轴比...

等效长度 $l_e \space \mathrm{s.t.} \space |E(\theta,\phi)| = \frac{\eta I l_e}{2\lambda r} F(\theta,\phi)$.

### 7.2.4 对称振子
略
### 7.2.5 天线阵
**方向图相乘定理**: $f = f_0 (\xi) f_{\mathrm{ar} (\eta)}$, 其中 $f_0$ 为元因子, $\xi$ 为与振元方向的夹角, $f_{\mathrm{ar}}$ 为阵因子, $\eta$ 为与阵延伸方向的夹角.

- 对二元阵的讨论: $f_{\mathrm{ar}} = \sqrt{1+m^2 + 2m \cos (kd \cos\eta - \psi)}$, (沿阵延伸到正方向看, 靠前的振元滞后 $\psi$).
- 对均匀直线阵的讨论: 
    $$F_{\mathrm{ar}} = \frac{\sin \frac{Nu}{2}}{N \sin \frac u 2} \quad (u=kd\cos\eta - \psi)$$
    - 侧射阵 $\eta= \frac \pi 2$, $\psi=0$, $2\theta_0 = \frac{2\lambda}{L} \space (L=Nd)$, $2\theta_{0.5} = 0.89\frac \lambda L$, $\mathrm{SLL}_1 = -13.2 \mathrm{dB}$, $D = \frac{2L}{\lambda}$
    - 端射阵 $\eta = 0$, $\psi = kd$, $2\theta_0 = 2 \sqrt{\frac{2\lambda}{L}}$, $2 \theta_{0.5} = 1.33\sqrt{\frac{2\lambda}{L}}$, $D= \frac{4L}{\lambda}$
    - 斜射阵 $2\theta_0 = \frac{2\lambda}{L\sin \eta_m} \space (\eta_m \gg \theta_0)$, $D = \frac{2L\sin\eta_m}{\lambda}$
    - 栅瓣条件: 使栅瓣不出现, 则 $\theta_0$ 无解, 即 $...$

## 7.3 面天线理论

### 7.3.1 等效原理和惠更斯原理
等效原理: 假想表面场源代替区域内的真实场源

基本面辐射元定义为理想电导体和磁导体, 存在 $E_y$, $H_x = E_y / \eta_0$, 作用 $\mathrm d \vec E = \frac{j E_y \mathrm d S}{2 \lambda r} e^{-jkr} (1+\cos\theta) (\hat{\theta} \sin \phi + \hat{\phi} \cos \phi)$

惠更斯原理: $\vec E = \iint_S \mathrm d \vec E$

### 7.3.4 天线的有效面积 

$$D= \frac{4\pi S \gamma}{\lambda^2} = \frac{4 \pi S_e}{\lambda^2}$$


