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
满足 $"DTFT"[Re[x(n)]] = X_e (e^(j omega)), "DTFT"[j Im[ x(n)]] = X_o (e^(j omega))$

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

#Section("")
#Section("")
#Section("")
#Section("")
#SubSection("")
