#import "../typst_utils/utils.typ": *

#Section("绪论")
#SubSection("数字信号处理的基本概念")
#SubSection("信号的基本概念")
#SubSection("数字信号处理的应用")
#SubSection("研究内容")
#FLI() 模拟信号采样; 离散信号分析; 信号处理的快速算法和特殊算法;
#Section("离散时间信号和系统")
#SubSection("离散信号的基本概念")
#SubSection("离散时间序列")
#SubSub("离散时间信号的定义")
#FLI() Def1. 离散时间信号(即离散时间序列): 时间上取离散值的信号; 数字信号: 时间和幅度上去离散值的信号;
#SubSub("常用基本序列")
#FLI() Theorem1. 离散时间信号为周期序列的充要条件: $(2 pi)/(omega) = p/q$
#SubSub("序列的基本运算")
#FLI() 基本运算: 相加, 数乘, 移位; 其他: 相乘, 反转, 加窗;

#SubSection("离散时间系统")
#SubSub("系统的定义")
#SubSub("线性离散时间系统")
#SubSub("非时变离散时间系统")
#SubSub("线性时不变系统")
#SubSub("离散卷积的计算")
#SubSub("离散卷积的计算性质")
#SubSection("系统的因果性和稳定性")
#SubSub("稳定性")
#SubSub("因果性")
#SubSection("连续时间信号采样")
#SubSub("采样的概念")
#FLI() $x_s (t) = x_a (t) delta_T (t)$ 其中下标s表示sample, 下标a表示analog, $delta_T (t) = sum_n delta (t-n T)$
#SubSub("采样过程中的频谱变化")
#FLI() $delta_T (omega) = 1/T sum_k delta (Omega - (2 pi k)/T)$
#SubSub("低通信号采样定理")
#FLI() Theorem1. (Nyquester) $f_s < 2 f_c$, 其中下标c表示cut-off;
#SubSub("信号重构与恢复")
#FLI() 通过理想低通滤波器: $y(t)=sum x_a (k T) phi_k (t)$, 其中插值函数 $phi_k (t) = "Sa" ((pi)/(T) (t - k T))$;
#SubSub("带通信号采样*")

#Section("离散时间傅里叶变换(DTFT)和Z变换")
#SubSection("LIT系统对正弦信号的响应")
#FLI() 若令 $x(n) = A e^(j omega h)$ 则 $x(n) ast h(n) = x(n) H(e^(j omega))$, 其中定义 $H(e^(j omega)) = sum h(k) e^(j omega k)$;
#SubSection("DTFT")
#SubSub("DTFT定义")
#FLI() Def1. 定义:

$
  X(e^(j omega)) & = sum_(n = - inf)^(+ inf) x(n) e^(- j omega n) \
            x(n) & = 1/(2 pi) integral^(pi)_(-pi) X(e^(j omega)) e^(j omega n) "d" omega
$
#SubSub("DTFT性质")
#FLI() 线性, 时移, 频移, 对称, 微分, 卷积, Parseval定理 $sum |x(n)|^2 = 1/(2 pi) integral |X|^2 "d" omega$

#FLI() DEf1. 共轭(反)对称序列:
$
  X_e (e^(j omega)) & = 1/2 (X(e^(j omega)) + X^* (e^(-j omega))) \
  X_o (e^(j omega)) & = 1/2 (X (e^(j omega)) - X^* (e^(-j omega)))
$
满足 $"DTFT"[ "Re"[x(n)]] = X_e (e^(j omega)), "DTFT"[j thin"Im"[ x(n)]] = X_o (e^(j omega))$

#SubSub("DTFT的物理性质和计算")

#SubSection("离散LTI系统频域表示方法")
#SubSection("离散时间信号的Z变换")

#SubSub("z变换的定义和收敛域")
#FLI() Def1. Z变换
$
  X(z) = scr(Z) [x(n)] & = sum x(n) z^(-n) \
                  x(n) & = "Res"[X(z)z^(n-1) , 0] = 1/(2 pi j) integral.cont X(z) z^(n-1) "d" z
$

#SubSub("Z变换的性质和定理")

#FLI() Prop. 性质: 线性, 移位, 乘实指数, 微分, 复共轭, 初值, 终值 $lim_(n->inf) x(n) = "Res"[X(z),1] = lim_(z->1)[(z-1)X(z)]$; 卷积; Parseval定理;

#SubSub("Z反变换*")

#SubSection("系统函数")
#SubSub("系统函数的定义")
#SubSub("用系统函数描述系统的稳定性")
#FLI() Theorem1. 系统稳定充要条件: $sum |h(k)| < + inf <-> {z| |z| = 1} in "ROC"$; 进一步对稳定因果系统 $"ROC": R_- < |z| <= +inf$

#FLI() Def. MA系统/有限冲击响应(FIR); $H(z) = sum_(n=0)^(M) b_n z^(-n)$; AR系统/无限冲击响应(IIR): $H(z) = (1-sum_(k=1)^(N) a_k z^(-k))^(-1)$;

#SubSub("通过系统函数估算频率响应")
#FLI() 通过零极点图的形式: $H(e^(j omega)) = H(z)|_(z=e^(j omega)) = A (product ...) / (product ...)$

#SubSection("常系数差分方程和信号流图表示")
#FLI() 差分方程 $$ 对应于 $$;
#SubSub("信号流图的定义")
#FLI() 信号流图的基本组成: 加法器, 乘法器(数乘), 单位时延;
#SubSection("IIR滤波器信号流图")
#FLI() 直接1型, 直接2型: $H(z) = A (sum b_r z^(-r))/(1 - sum a_k z^(-k))$

#FLI() 级联型: $H(z) = A product (1+b_(1 k) z^(-1) + b_(2 k) z^(-2))/( 1- a_(1 k) z^(-1) - a_(2 k) z^(-2))$(由标准二阶直接2型网络级联); 并联型: $H(z) = A sum ...$

#SubSub("FIR滤波器信号流图")
#FLI() 直接型, 并联型

#Section("离散傅里叶变换(DFT)及应用")

#SubSection("离散傅里叶级数(DFS)")
#FLI() Nomenclature. 周期序列用 $tilde(x)(n)$ 表示, 满足 $tilde(x)(n)=tilde(x)(n+k N)$; 若定义主值序列 $x(n)= tilde(x)(n) R_N (n)$, 则由主值序列延拓东过程表示为 $tilde(x)(n) = x((n))_N$;

#FLI() Def. W因子: $W_N = e^(-j (2 pi)/(N)), W_N^(k n) = (W_N)^(k n)$, 显然 $W_N$ 满足正交性 $sum_0^(N-1) W_N^(k n) = N delta(n%N)$

#FLI() Def. DFS综合式(对DTFT取主值序列得出) $tilde(X)(k) = sum_(n=0)^(N-1) tilde(x)(n) W_N^(k n), tilde(x)(n) = 1/N sum_(k=0)^(N-1) tilde(X)(k) W_N^(-k n)$;

#FLI()  Prop. DFS的性质: 线性, 时域移位, 频域移位, 周期卷积

#SubSection("离散傅里叶变换")

#SubSub("DFT的定义")
#FLI() Def. DFT变换的定义: $X (k) = sum_(n=0)^(N-1) x (n) W_N^(k n), x (n) = 1/N sum_(k=0)^(N-1) X(k) W_N^(-k n) quad n, k = 0, ..., N-1$

#FLI() Def2. 圆周卷积 $x(n) ast.op.o y(n) = [sum_(m=0)^(N-1) x(m) y((n-m))_N] R_N (n)$

#SubSub("DFT的性质")
#FLI() Pro. DFT的性质: 线性, 圆周移位($"DFT" [x(n) W_N^(l n)] = X((k+l))_N R_N (k)$), 对称性($"DFT"[x^* (n)] = X^* (N-k)$), 圆周卷积($"DFT"[x(n) y(n)] = 1/N X(k) ast.op.o Y(k)$), Parseval; (_注意DFS和DFT性质的区别:卷积和移位的形式区别_)

#SubSub("有限长序列的圆周卷积和线性卷积")

#FLI() Theorem. 记 $$ 为N点序列, $$ 为M点序列, 圆周卷积长度L, 则圆周卷积相对于线性卷积: (1) $L>=N+M-1$ 时不混叠; (2) $L<N+M-1, 2 L > N+M-1$ 时部分混叠; (3) $2 L <N+M-1$ 时全部混叠;

#SubSub("DFT与z变换, DTFT间的关系")
#FLI() 在DFT作用域上等价: $X(k) = X(z) |_(z=W_N^(-k)) = X(e^(j omega)) |_(omega = (2 pi)/N k)$

#SubSection("频域采样理论")
#FLI() Theorem. 当DFT点数不大于序列长度(即实际点数)时, $X(k)$ 不失真表示 $X(z)$ 和 $X(e^(j omega))$:

$ X(z) = sum_(k=0)^(N-1) X(k) Phi_k (z), quad (Phi_k (z)) = 1/N (1- z^N)/(1- W_N^(-k) z^(-1)) $
对 $X(e^(j omega))$ 同理;

#SubSection("DFT的应用")
#FLI() 应用: 模拟信号的数字频率分析

#FLI() Def1. 频率分辨率: 1. 物理分辨率(对 $f_1,f_2$ 进行分辨): $(2 f_s)/(N) <= |f_1 - f_2| quad "or" quad (4 pi)/(N) <= |omega_1 - omega_2|$; 2. 计算分辨率: $Delta f = (f_s)/(N)$;

#FLI() 补零技术可以提升计算分辨率而不能提升物理分辨率, 起到平滑作用; DFT会带来的误差包括混叠误差, 栅栏效应, 截断效应等(略);

#Section("快速傅里叶变换(FFT)")

#SubSection("DFT的运算特点")
#SubSection("2-base FFT算法")
#FLI() FFT是DFT的一种实现; 对 $N=2^M$ 点的FFT称为基-2FFT算法;

#SubSub("按时间抽取的FFT(DIT-FFT)")
#FLI() 若记 $x_1 (n) = x (2 n) , thin x_2 (n) = x (2 n + 1)$, 若 $N>=2$ 则
$
  X(k) & =sum_(n=0)^(N-1) x(n) W_N^(n k) \
       & = sum_(r=0)^(N/2-1) x_1 (r) W_(N/2)^(r k) + W_N^(k) sum_(r=0)^(N/2-1) W_(N/2)^(r k) \
       & = X_1 (k) + W_N^k X_2 (k) \
       & = cases(
           X_1 (k) + W_N^k X_2 (k) quad 0<=k<= N/2 - 1,
           X_1 (r) - W_N^(r) X_2 (r) quad N/2<=k<=N-1, r=k-N/2
         )
$
其中 $X_1 = "DFT" [x_1], X_2 = "DFT" [x_2]$; 可以用蝶形图表示为:

迭代形式为(?):
$
  cases(
    X_(...)^([M]) (0) = x_(...) (0),
    X_(...)^([n]) (k) = X_(...1)^([n+1]) (k) + W_N^k X_(...2)^([n+1]) (k) quad 0<=k<=N/2-1,
    X_(...)^([n]) (k) = X_(...1)^([n+1]) (k) - W_N^k X_(...2)^([n+1]) (k) quad "otherwise",
    X (k) = X^([0]) (k)
  )
$
#FLI()  FFT运算2个规律: 同址运算(in place, 即蝶形运算不需要额外的存储空间)和码位倒序($x(n)$ 到 $x_(...)(0)$ 为比特位倒序的过程);

#SubSub("按频率抽取FFT(DIF-FFT)")

#FLI() 与DIT-FFT相似, DIF按 $X(k)$ 下标拆分: $X_1 (r) = "DFT" [x(n) + x(n+N/2)], thin X_2 (r) = "DFT" [x(n) - W_N^n x(n+N/2)]$; 蝶形图表示为:

#FLI() FFT计算复杂度分析: 总复数乘: $M dot N/2$; 总复数加: $N dot M$;

#SubSub("IDFT的快速算法IFFT")
#FLI() $x(n)= 1/N ("DFT" [X^* (k)] )^*$

#SubSection("4-base FFT算法(略)")
#SubSection("实序列FFT算法(略)")
#FLI() 优化方法: 1. 同步完成2次实序列FFT运算; 2. 通过N/2点FFT;

#Section("无限冲激响应(IIR)数字滤波器设计")
#SubSection("滤波器的基本概念")
#SubSection("滤波器的技术指标")
#FLI() Def. 容限值 $k_1 , k_2$: 通带/阻带边界处(即截止频率 $Omega_p, Omega_s$)的增益 $|H(j Omega)|$; 最大起伏值 $alpha_p = - 20 lg (|H(1)|) / (|H(e^(j Omega_p))|)$, 最小衰减值 $alpha_s = - 20 lg (|H(1)|)/(|H(e^(j Omega_s)|)$; 数字滤波器参数的表示形式与之一致, 数字频率用 $omega$ 表示;
#SubSection("数字滤波器设计任务")
#FLI() IIR滤波器设计目标为 $(sum b_r z^(-r))/(1 - sum s_k z^(-k))$, FIR滤波器设计目标为 $sum b_r z^(-r)$, 二者区别较大;
#SubSection("模拟滤波器设计")
#SubSub("巴特沃斯(batter)滤波器设计")
#FLI() 设计目标 $|H(Omega)|^2 = 1/(1+(Omega / Omega_c)^2)$, 极点 $j Omega_k = s_k = e^{j pi/N k}$,
为满足因果性 $H(s) = 1/(B_N (s)) = 1/(product_(k=1)^N (s - s_k))$, 其中 $B_N (s)$ 称为归一化batter多项式;

#FLI() $N$ 与 $alpha_p , alpha_s , Omega_p , Omega_s$ 的关系和 $Omega_c in [Omega_p, Omega_s]$ 裕量:
$
  cases(
    N & >= (lg sqrt(10^(0.1 alpha_s) - 1) - lg sqrt(10^(0.1 alpha_p) - 1) ) / (lg Omega_s - lg Omega_p),
    Omega_c & = (Omega_p)/(10^(0.1 alpha_p) - 1)^(1/(2 N)) quad,
    Omega_c & = (Omega_s)/(10^(0.1 alpha_s) - 1)^(1/(2 N)) quad
  )
$

#SubSub("切比雪夫滤波器设计*")
#FLI() 设计 $|H| = 1/(1 + epsilon^2 T^2_N (Omega))$, 其中 $T_N$ 为对 $cos(N arccos(x))$ 的延拓;

#SubSection("数字滤波器设计")

#SubSub("引言")

#SubSub("冲激响应不变法")
#FLI() 对模拟滤波器的冲激响应采样得到数字滤波器的冲激响应: $h(n) = h_a (n T)$, 其中a表示analog, $T$ 为采样间隔; 若 $H_a (s)$ 具有有理分式的形式 $sum (A_k)/(s-s_k)$, 则 $H(z) = sum (A_k)/(1 - e^(s_k T) z^(-1))$; 这一变化只保持极点处的性质, 然而 $H(z) != H_a (s) |_(z = e^(s T))$;

#SubSub("双线性映射法")
#FLI() 考虑 $s= j Omega thin -> thin z = e^(j omega) thin ,quad Omega in R, omega in (-pi,pi)$ 的一对一映射, 得到 $s = 2/T (1-z^(-1))/(1+z^(-1))$ 和 $z=(1 + 1/2 T s)/( 1 - 1/2 T s)$, 称为双线性映射; 模拟频率和数字频率的关系为 $Omega = 2/T tan(omega/2)$, 在这一关系下 $H(z) = H(s)$;

#SubSub("频率变换法设计IIR带通, 带阻, 高通滤波器*")
#FLI() 直接给出频域关系 $s=s(z)$ 或 $z' = z' (z)$;
#SubSub("IIR直接设计法*")

#Section("FIR数字滤波器设计")
#SubSection("FIR数字滤波器线性相位特性")

#FLI() Nomenclature. $H(e^(j omega)) = H_g (omega) e^(- j theta (omega))$ 记 $H_g (omega)$ 为幅度特性, $theta (omega)$ 为相位特性;

#FLI() Def. 第一类线性相位: $theta (omega) = - tau omega$; 第二类线性相位: $theta (omega) = theta_0 - tau omega$;

#FLI() Theorem. 对 $N$ 点FIR滤波器(满足 $h(0)!=0, h(N-1)!+0, {h(n)}!={0}, h(x) = 0 thin (forall x >=N)$), 第一类线性相位的充要条件是 $h (n) = h (N-1-n)$, 第二类线性相位的充要条件是 $h(n) = - h (N-1-n)$;

Proof. 必要性: 相位 $theta_0 - tau omega$ 等价于 $"Im" (H(e^(j omega)) e^( j (theta_0 - omega(n - tau)) )) = 0 quad (exists theta,tau, forall omega)$,
则对 $forall n_1, h(n_1)!=0$, 有 $exists n_2 !+ n_1, "s.t." theta_0 - omega(n_1 - tau) = plus.minus (theta_0 - omega(n_2 - tau)) + k pi$ (否则 $e^(-j omega n_1)$ 不能由 ${e^(-j omega n)|n!=n_1}$ 线性表示), 则 $n_1 + n_2 = tau$ 且 $2 theta_0 = k pi$; 由边界条件 $h(0)!=0, h(N-1)!=0$ 得到 $tau=N-1$; 对第一类边界条件 $theta_0 = 0$ 有 $h(n_1) - h(n_2) = 0 thin (n_1 + n_2 = N-1)$, 对第二类边界条件 $theta_0 = - pi/2$ 有 $h(n_1) + h(n_2) = 0 thin (n_1 + n_2 = N-1)$;

充分性: 显然; 证毕

#FLI() 第一类线性相位下
$
   H_g (omega) & = sum_(n=0)^(N-1) h(n) cos(omega(n - (N-1)/2)) \
               & = sum_(n=0)^([N/2]-1) 2 h(n) cos(omega(n - (N-1/2))) , \
  theta(omega) & = - (N-1)/2 omega
$
第二类线性相位下
$
   H_g (omega) & = sum_(n=0)^(N-1) h(n) sin(omega(n - (N-1)/2)) \
               & = sum_(n=0)^([N/2]-1) 2 h(n) sin(omega(n - (N-1)/2)), \
  theta(omega) & = - (N-1)/2 omega - pi/2
$

#FLI() Prop. (1) 1st, N even: $H_g (0) = sum h(n), H_g (pi) = 0$; (2) 1st, N odd: $H_g (omega) = sum h(n), H_g (pi) = h ((N-1)/2)$; (3) 2nd, N even: $H_g (0) = 0, H_g (pi) = sum h(n)$; (4) 2nd, N odd: $H_g (0) = 0, H_g (pi) = 0$;

#SubSection("线性相位FIR滤波器的零点特性")

#FLI() 若 $r_k e^(j phi_k)$ 为线性相位FIR滤波器的零点, 则 $(r_k)^(plus.minus 1) e^(plus.minus j phi_k)$ 为一组零点, 这一组零点构成实系数方程的解, 因此线性相位FIR滤波器可以乘法分解为若干一阶/二阶/四阶多项式;

#SubSection("窗函数设计法")

#FLI() 即对理想(desired)滤波器的单位取样响应加窗 $h(n) = h_d (n) w_N (n)$, 其中 $w_N (n)$ 为 $N$ 点窗函数;

#SubSection("频率采样设计法")
#SubSub("第一类线性相位FIR滤波器的频率采样设计")
#SubSub("第二类线性相位FIR滤波器的频率采样设计")

#SubSection("切比雪夫逼近法*")
#SubSection("数字滤波器IIR/FIR比较")

#Section("数字信号处理技术的应用*")
