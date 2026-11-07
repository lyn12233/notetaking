#import "../style.typ": get_thesis_by_name

#let thesis = get_thesis_by_name("lyn12233.note.1")

#show: thesis.begin
#show: thesis.main_body

#align(center, text(size: 20pt, "计算方法笔记") + v(0pt) + text("2026.11.2"))

= 绪论

== 误差的来源
模型误差, 观测误差, 截断误差, 舍入误差;

== 误差的度量

绝对误差 $ e(x^*) = x^* - x $
绝对误差限 $ epsilon(x^*) quad "s.t." quad e(x^*) <= epsilon(x^*) $
相对误差 $ e_r (x^*) = (x^* - x)/x^* $
相对误差限类似;

真实值 $x^*$ 的近似值标准形式: $ x^* = plus.minus 10^m times (a_1 times 10^(-1) + ... a_n times 10^(-n)) $
性质:
- 有效数字推导误差限: $ |e(x^*)| <= 1/2 times 10^(m-n)\
  |e_r (x^*)| <= 1/2 times 10^(1-n) $
- 相对误差限推导有效数字位数 $n$: $ n = min n quad "s.t."quad |e_r (x^*)| <= 1/(2(a_1 + 1)) times 10^(1-n) $

误差/误差限的传播公式: $ e(y^*) approx sum_(i=0)^n partial_i f(x_1^*, ... x_n^*) e (x_i^*)\
e_r (y^*) approx sum_(i=0)^n (x_i^*)/(y^*) partial_i f(x_1^*, ... x_n^*) e_r (x_i^*) $

== 设计数值算法的原则
- 避免相近的数相减
- 避免绝对值很小的数做分母
- 选用数值稳定性好的算法

= 非线性方程组的解法

== 一般思路
- 问题的形式: 围绕求解 $f(x) = 0$, 构造迭代 $x <= phi(x)$, 并使其满足 Lyapunov 稳定条件;
- 隔根区间: 若区间 $[a,b]$ 只包含一个根, 则称为隔根区间;

== 二分法
- 存在性: $f(x)$ 在 $[a,b]$ 连续, 且 $f(a) f(b) < 0$;
- 迭代过程: 构造一系列有根区间: $(a,b), (a_1, b_1), (a_2,b_2),...$
- 终止条件: $x^* = 1/2 (a_k + b_k)$, 由于 $|x_k - x^*| <= 1/2^k (a+b)$ 则在条件 $epsilon$ 下迭代次数 $ k = min k quad "s.t." quad 1/2^k (a+b) <= epsilon $

== 迭代法
=== 简单迭代法
直接构造 $x_(n+1) = phi(x_n)$ 其中 $phi(x) = x <=> f(x) = 0$

*全局收敛定理*:
+ $phi in C^1 [a,b]$
+ $phi(x) in [a,b]$
+ $exists 0<L <1 "s.t." forall x in [a,b] |phi'(x)| <= L$

推论: 简单迭代法的误差估计 $ |x_k - x^*| <= L^k/(1-L) |x_1 - x_0| $ 其中 $x_0$ 为初值;

局部收敛定理: 将隔根区间变为 $U(x^*, delta)$

*(Definition) 迭代法收敛的阶* $ lim_(k->infinity) |e_(k+1)/e_k^p| = c in (0,1) $
称为 p 阶收敛;

性质: 对简单迭代 $c=L$ 一阶收敛;

=== Atiken 加速迭代

利用 $L approx (x_(k+2) - x^*)/(x_(k+1) - x^*) approx (x_(k+1) - x^*)/(x_k - x^*)$ 得到Atiken加速公式: $ y_k = x_k - (x_(k+1) - x_k)^2/(x_(k+2) - 2 x_(k+1) + x_k) $
其中 ${y_k}^infinity_(k=0)$ 代表"加速"得到的另一组序列;

=== Steffensen 迭代法

对 Atiken 迭代将 ${y_k}$ 嵌入 ${x_k}$ 得到
$ cases(s = phi(x_k), t= phi(s), x_(k+1) = x_k - (s - x_k)^2/(t - 2s + x_k)) $

=== Newton 迭代法

切线法: $ x_(k+1) = x_k - (f(x_k))/(f'(x_(k))) $

*(Definition) Newton 迭代法的局部收敛定理*
$x^*$ 为单根, 且 $f in C^2 (U(x^*, delta))$

*(Definition) Newton 迭代法的非局部收敛定理*
+ 对任意 $x in [a,b]$, 使 $f'(x)$, $f''(x)$ 连续不变号;
+ 存在 $x_0 in [a,b]$, 使 $f(x_0) f''(x_0) > 0$

*(Variant) Newton 下山法* $ x_(k+1) = x_k - lambda (f(x_k))/(f'(x_k)) $ 若有 n 重根, 则令 $lambda = n$

*(Variant) 割线法* $ x_(k+1) = x_k - (f(x_k) (x_k - x_(k-1)))/(f(x_k) - f(x_(k-1))) $

= 线性代数方程组的解法

== 一般思路
对问题 $ cases(
  a_(11) x_1 + a_(12) x_2 + ... + a_(1 n) x_n & = b_1,
  a_(21) x_1 + a_(22) x_2 + ... + a_(2 n) x_n & = b_2,
  quad quad ...,
  a_(n 1) x_1 + a_(n 2) x_2 + ... + a_(n n) x_n & = b_n
) $
在线性代数方法中, 对增广矩阵做行变换得到阶梯型矩阵;

== Gauss 消去法

进行行变换 $E(i, j; k)$, 第 $i$ 轮消去 $i$ 列下三角部分, 解的形式 $ x_n & = b^[n]_n / a^[n]_(n n) \
x_i & = (b^[n]_i - sum_(j=i+1)^(n) a^[n]_(i j) x_j
      )/( a^[n]_(i i)) quad (i = n-1 , ..., 1) $

解决 Gauss 消去计算不稳定的方法:
- 列主元消去法;
- 全主元消去法;

== 矩阵三角分解方法

=== Doolittle 分解和 Crout 分解
$ A = L U quad cases("Doolittle: L 为单位下三角矩阵", "Crout: U 为单位上三角矩阵") $

*(Algorithm) Doolittle 分解公式*: 由 $ a_(i j) = sum_(k=1)^(min(i, j)) l_(i k) u_(k j) $
得到 $ u_(i j) & = a_(i j) - sum_(k=1)^(i-1) l_(i k) u_(k j) quad (j = i,..., n) \
l_(i j) & = 1/(u_(j j)) (a_(i j) - sum_(k=1)^(i-1) l_(i k) u_(k j)) quad (i = j+1 ,...,n) $
计算顺序为 $u_(1 j),l_(i 1), u_(2 j), l_(i 2),...$

例: 对*三对角矩阵*的 Doolittle 分解:

=== Cholesky 分解 (平方根法)

$ A = L^T L $
$A$ 正定时分解存在; 限定 $L$ 对角元正时分解唯一确定;

== 矩阵迭代法

=== 矩阵范数及其性质
见附录;

=== 简单迭代法
$ x^((k+1)) = B x^((k)) + g $
收敛条件是 $rho(B) < 1$

=== Jaccobi 迭代法
对方程组 $A x = b$ 做加法分解 $ A = L + D + U $
则 $ A x = b\ => D x = - (L+U) x + b \
=> x^((k+1)) = - D^(-1) (L+U) x^((k)) + D^(-1) b $
收敛点充要条件是迭代矩阵 $ B_("J") = - D^(-1) (L+U) $ 的谱半径小于 1; 充分条件是 $A$ 严格对角占优;

=== Gauss-Seidel 迭代法
对简单迭代公式 $x <= B x+ g$ 做加法分解 $ B = B_1 + B_2 $ 则
$ x^((k+1)) = (I - B_1)^(-1) B_2 x^((k)) + (I - B_1)^(-1) g $
其中 $B_1$ 为无对角元素的下三角阵; $B_2$ 为上三角阵; 对应迭代矩阵 $ B_("GS") = (I - B_1)^(-1) B_2 $

=== Jaccobi 方法对应的 Gauss-Seidel 迭代
对 $B_("J")$ 做分解: $ - D^(-1) (L+U) = - D^(-1) L - D^(-1) U = B_1 + B_2 $
得到 $ x^((k+1)) = -(D + L)^(-1) U x^((k)) + (D+L)^(-1) b $
迭代矩阵 $ B_("JGS") = -(D+L)^(-1) U $

=== SOR: 逐次超松弛迭代
$ x^((k+1)) = (1- omega) x^((k)) + omega D^(-1) (b - (L+U) x^((k))) $
- 收敛必要条件 $0<omega < 2$;
- 若 $A$ 正定且 $0<omega <2$, 则收敛;
- 若 $A$ 严格对角占优且 $0<omega <=1$, 则收敛;

最佳松弛因子 $ omega_("opt") = 2/(1+sqrt(1 - rho^2 (B_("J")))) $

= 函数插值
== 一般思路
- 插值条件: $phi(x_i) = f(x_i)$
- 插值的类型: 外插和内插; 多项式/有理函数/三角函数插值;
- 插值误差: $R_n (x) = f(x) - phi(x)$
== 拉格朗日插值
对于 $n+1$ 个点:
$ L (x) = sum_(i=0)^n l_n (x) y_i $
其中插值基函数 $ l_i (x) = (product_(j!=i) (x - x_j))/(product_(j != i) (x_i - x_j)) $
满足 $l_i (x_j) = delta_(i j)$

记 $omega_(n+1) (x) = product_(j=0)^n (x - x_j)$, 则 $ l_i (x) = (omega_(n+1) (x))/((x - x_i) omega'_(n+1) (x_i)) $

若 $f(x)$ 存在 $n+1$ 阶导数则 $ R_n = (f^((n+1)) (xi))/((n+1)!) omega_(n+1) (x) $

对应误差限 $ |R_n| <= M/((n+1)!) |omega_(n+1) (x)| $

推广: 反插值法求解 $f(x) = k$ 问题;

== 牛顿插值
*(Definition) 差商* $ f[x_1, x_2] = (f(x_1) - f(x_2))/(x_1 - x_2)\
f[x_1 ,... ,x_k] = (f[x_1,...,x_(k-1)] - f[x_2,...,x_k])/(x_1 - x_k) $
Newton 插值的递推公式: $ N_k (x) = N_(k-1) (x) + f[x_0,...,x_k] omega_k (x) $
Newton 插值公式: $ N_k (x) = f(x_0) + sum_(i=0)^k f[x_0,...,x_i] omega_i (x) $

余项和差商的关系: $f[x_0,...,x_k, x] = (f^((k+1))(xi))/((k+1)!)$

== 等距节点插值

采样点满足 $x_i = x_0 + h i$ 称为等距节点, $h$ 为步长;

*(Definition) 差分* $ Delta y_1 = y_2 - y_1\
Delta^n y_1 = Delta^(n-1) y_2 - Delta^(n-1) y_1 $

差分的性质:
- $f[x_0,...,x_n] = (Delta^n y_0)/(n! h^n)$
- $Delta^n y_0 = sum_(i=0)^n (-1)^i binom(i, n) y_(n-i)$
- $Delta^n y_0 = h^n f^((n)) (xi)$
前向插值公式, 即将 $x = x_0 + t h, x_i = x_0 + i h$ 带入 Newton 插值公式:
$ N_n (x_0 + t h) = f(x_0) + sum_(k=0)^n binom(k, t) Delta^k f(x_0) $
($binom(k, t)$ 分子部分由 $omega_k (x)$ 引出)

== Hermite 插值
插值条件: $ cases(H(x_i) = f(x_i), H'(x_i) = f'(x_i)) $
插值基函数的构造: $ cases(alpha_i (x_j) = delta_(i j), alpha'_j (x_i) = 0)
quad cases(beta_j (x_i) = 0, beta'_j (x_i) = delta_(i j)) $

== 分段插值
分段线性插值, 则误差限为 $1/8 M_2 h^2$;

= 曲线拟合的最小二乘法
== 一般方法
拟合参数数量小于样本数, 不能在采样点准确拟合, 应当使 $sum (phi(x_i) - y_i)^2$ 最小;
== 线性方程组的最小二乘解
矛盾方程组 $A x = b$ 的最小二乘解为 $ (A^T A)^(-1) A^T b $
对应的 $A^T A x = A^T b$ 称为正则方程组;

== 曲线的最小二乘拟合
构造曲线拟合模型 $phi(x)$, 再解矛盾方程组 $phi(x_i) -> y_i$;

决定系数 $R^2= (sum (tilde(y)_i - overline(y))^2)/(sum (y_i - overline(y))^2)$

= 数值微分与数值积分
== 数值微分
=== Tailor 展开法
=== 插值法
两点公式 $ f'(x_0) & = 1/h (f(x_1) - f(x_0)) - h/2 f''(xi_1) \
f'(x_1) & = 1/h (f(x_1) - f(x_0)) + h/2 f''(xi_2) $
三点公式 $ f'(x_0) & = 1/(2 h) (-3 f(x_0) + 4 f(x_1) - f(x_2)) + h^2/3f'''(xi_1) \
f'(x_1) & = 1/(2 h) (f(x_2) - f(x_0)) - h^2/6 f'''(xi_2) \
f'(x_2) & = 1/(2 h) (f(x_0) - 4 f(x_1) + 3 f(x_2)) + h^2/3 f'''(xi_3) $
=== Richardson 外推法
若存在近似 $S^* (x;h)$, 则利用 $S^* (x; h/2)$ 消去误差中 $h$ 阶数最低的项;

== Newton Cotes 求积公式
=== 公式推导
若 $integral_a^b f(x) dif x = sum_(k=0)^n A_k f(x_k) + R_n (x)$ 则
$ A_k = integral_a^b l_k (x) dif x $

若 ${x_i}_(i=0)^n$ 为 $[a,b]$ 上的等距节点, 则 $n=0,1,2,4$ 分别称为中点求积公式, 梯形求积公式 (Trapezoid), Simpson 求积公式和 Cotes 公式:
$ (b-a) f((a+b)/2) $
$ (b-a) (1/2 f(a) + 1/2 f(b)) $
$ (b-a) (1/6 f(a) + 4/6 f((a+b)/2) + 1/6 f(b)) $
$ (b-a) (7/90 f(x_0) + 32/90 f(x_1) + 12/90 f(x_2) + 32/90 f(x_3) + 7/90 f(x_4)) $

$n$ 阶 Newton-Cotes 求积公式的权重 $A_k/(b-a)$ 记作 $C^((n))_k$; 一般形式为
$ integral_a^b f(x) dif x approx (b-a) sum_(k=0)^n C^((n))_k f(x_k) $

=== 误差分析
*(Definition) 代数精度* $max space m space "s.t." space integral_a^b P_m (x) dif x = sum A_k f(x_k)$ 求积公式对 m 次多项式准确成立, 对 m+1 阶多项式不能准确成立;

结论: n 阶 Newton-Cotes 求积公式代数精度不低于 n (n 为偶数时具有 n+1 阶代数精度);

积分公式的截断误差即余项的积; 对拉格朗日余项求积:
$
  R_n [f] & = integral_a^b (f^((n+1)) (xi))/((n+1)!) omega_(n+1) (x) dif x \
          & = (f^((n+1)) (eta))/((n+1)!) integral_a^b omega_(n+1) (x) dif x
$
对 $n=0,1,2,4$, 有
$ R_0 [f] = (b-a)^3/24 f''(eta) $
$ R_1 [f] = -(b-a)^3/12 f''(eta) $
$ R_("Simpson") = - (b-a)/180 ((b-a)/2)^4 f^((4)) (eta) $
$ R_("Cotes") = -(b-a)/945 ((b-a)/4)^6 f^((6)) (eta) $

对舍入误差的稳定性和收敛性: $n->infinity$ 不收敛; $|R_n| <= (b-a) sum |C^((n))_k| |e_k|$,
$C^((n))_k$ 全为正时能够保证计算稳定;

== 复化求积公式 (Composite Quadrature)
方法: 将 $[a,b]$ 划分为 $N$ 个区间 $[x_(n k), x_(n (k+1))] quad (k=0,..., N-1)$, 步长为 $h$;
=== 常用公式和误差
复化梯形公式和复化 Simpson 公式:
$ T_N = h/2 (f(a) + 2 sum_(i=1)^(N-1) f(x_k) + f(b) ) $
$ S_N = h/6 (f(a) + 4 sum_(i=0)^(N-1) f(x_(2k+1)) + 2 sum_(i=1)^(N-1) f(x_(2 k)) + f(b)) quad (x_i = x_0 + h/2 i) $

截断误差:

$ R_1^((N)) = - (b-a)/12 h^2 f''(eta) $
$ R_2^((N)) = - (b-a)/2880 h^4 f^((4)) (eta) $

=== 区间分半逐次求积法
使用后验方法估计误差, 复化求积步长逐次分半; 终止条件是 $ |I_(2^(k+1) N) - I_(2^k N)| < epsilon $

考虑对应 $n=1$ 的复化梯形公式 $ I & = T_N - (b-a)/12 h^2 f''(eta_1) \
  & = T_(2N) - (b-a)/12 (h/2)^2 f''(eta_2) $
当 2 阶导数为常数时 $(I - T_N)/(I - T_(2N)) = 4$,
从而 $4/3 T_(2N) - 1/3 T_N approx I$ 具有 2 阶代数精度;
可以证明唯一等价于 Simpson 公式(?);
得到:

*(Definition) Romberg 求积法*
$ S_N = T_(2N) + 1/(4-1) (T_(2N) - T_N) $
$ C_N = S_(2N) + 1/(4^2-1) (S_(2N) - S_N) $
$ R_N = C_(2N) + 1/(4^3 - 1) (C_(2N) - C_N) $

== Gauss 求积公式
考察 $n+1$ 个非等间距采样点及对应权重, 待求参数有 $2n+2$ 个自由度, 故能达到 $2n+1$ 阶代数精度; 对应节点 $x_k$ 称为高斯点;

= 常微分方程初值问题的数值解法
== 问题描述
$ cases((dif y)/(dif x) = f(x,y), y(x_0)=y_0) $
解存在的条件即 Lipschiz 条件;

== Euler 法与梯形法
设节点 $x_n = x_0 + n h$ 则
$ "((Explicit) Euler)" quad y(x_(n+1)) = y(x_n) + h f(x_n, y(x_n)) $
$ "((Implicit) Euler)" quad y(x_(n+1)) = y(x_n) + h f(x_(n+1), y(x_(n+1))) $

$ "(Trapezoid)" quad y_(n+1) = y_n + h/2 (f(x_n, y_n) + f(x_(n+1), y_(n+1))) $

梯形法是隐式的, 一般进行简单迭代:
$ y_(n+1)^((k+1)) = y_n + h/2 (f(x_n, y_n) + f(x_(n+1), y_(n+1)^((k)))) $
梯形法迭代收敛的 Lipschiz 条件:
$ |(partial f)/(partial y)| <= L, space 1/2 h L < 1 $

== Euler 预估校正公式
梯形法取 $y_(n+1) = y_(n+1)^(1)$ 得到:
$
  cases(
    "预估公式" quad y^((0)) = y_n + h f(x_n, y_n),
    "校正公式" quad y_(n+1) = y_n + h/2 (f(x_n, y_n) + f(x_(n+1) , y_(n+1)^((0))))
  )
$

== Runge-Kutta 方法
$
  cases(
    y_(n+1) & = y_n + c_1 k_1 + ... + c_N k_N,
    k_1 & = h f(x_n, y_n),
    k_2 & = h f(x_n + alpha_2 h, y_n + beta_(21) k_1),
    & space dots.v,
    k_N & = h f(x_N + alpha_N h, y_n + beta_(N 1) k_1 + ... + beta_(N, N-1) k_(N-1))
  )
$
原理: $ y(x_(n+1)) = y(x_n) + h y' + 1/2 h^2 y''+... \ "where" cases(y' &= f & quad ->k_1, y'' &= f_x + f f_y &quad -> k_2, &space dots.v) $

对 $N=2$, 令 $c_1 = 1/4, c_2 = 3/4, c_2 alpha_2 = 1/2, c_2 beta_(12) = 1/2$ 可以使局部截断误差达到 $O(h^4)$, 称为 Heun 方法:
$
  cases(
    y_(n+1) & = y_n + 1/4 k_1 + 3/4 k_2,
    k_1 & = h f(x_n, y_n),
    k_2 & = h f(x_n + 2/3 h, y_n + 2/3 k_1)
  )
$
若令 $c_1 = c_2 = 1/2, alpha_2 = beta_(21) = 1$ 则为 Euler 预估校正方法;
== 数值解的稳定性分析
若 $lambda$ 满足 $y' = lambda y$, 则显式 Euler 方法的稳定要求 $|1+ lambda h|<1$, 梯形法要求 $|1/2 lambda h| < 1$, 2 阶 Ronge-Kutta 法要求 $|1 + lambda h + 1/2 (lambda h)^2| <1$;

== 线性多步法

#show: thesis.tailof_main

= 附录: 数学原理, 推导和例题
