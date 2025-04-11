#import "../typology(typst)/utils_example.typ":*

  #set text(..default_text_parm)
  #set par(..default_par_parm)
  #set table(stroke:none)
  #set pagebreak(weak:true)
  
  #set image(height: 5cm, width: 6.67cm)
  #set grid(columns: 2, gutter: 10pt)

  #show figure.where(kind: image):set figure(..default_FOI_parm)
  #show figure.where(kind: table):set figure(..default_FOT_parm)
  #show figure.caption:set text(size:font_size_zh.WuHao)
  #show figure.where(kind: table): set figure.caption(position:top)
  
  #show heading.where(level: 1):set heading(numbering: "1")
  #show heading.where(level: 2):set heading(numbering: "1.1")

  #show math.equation:set text(font: ("New Computer Modern Math","Songti SC"))

#[
  #set align(center)
  #set text(size: font_size_zh.SanHao)
  信息论笔记
]
#Section("1-绪论",sdisp: none)
#Paragraph[
  信息论的产生：Shannon 通信的数学理论，1984
]
#Paragraph[
  信息论的研究对象是通信系统，研究目的是使信号有效可靠的传输。
]
#Paragraph[
  通信系统组成：信源、编码器、信道（噪声）、译码器、信宿
]
#Paragraph[
  信息：本质是不确定性，包括信号、消息等形式。通信系统中实际传输的是信号，本质内容是信息。
]
#Paragraph[
  信息论的主要内容：一个概念，三个定理
  #nlist(
    [信息的度量：],[
      无失真信源编码:$R>=H <=> exists$
    ],[
      信道容量和可靠传输:$R<C <=> P_E -> 0$
    ],[
      信息率失真理论: $R>R(D) <=> overline(D)<=D$
    ]
  )
]


#Section("2-信息的度量",sdisp: none)

  自信息: 随机变量某一取值所含的信息 $I(x)= - log p(x)$


  联合自信息: $I(x,y)=- log p(x,y)$


  条件自信息: $I(x|y)=-log p(x|y)$ 满足 $I(x,y)=I(x)+I(x|y)$


  信息熵: 随机事件所含信息 $H(X)=E_(p_X(x))[I(x)] = sum_x - p(x) log p(x)$


  联合熵: $H(X Y)=sum_x sum_y - p(x y) log p(x y)$


  条件熵: $H(X|Y)=sum_x sum_y - p(x y) log p(x|y)$


  相对熵:(又称K-L散度) $D(P||Q)=sum_x - P(x) log (P(x))/(Q(x))$


  平均互信息: 
  $I(X|y)=sum_x p(x|y) log (p(x y))/(p(x)p(y))$
  $I(X;Y)=sum_x sum_y p(x y) log (p(x y))/(p(x)p(y))$


  平均条件互信息：$I(X;Y|Z)=sum_(x,y,z) p(x y z) log (p(x|y z))/(p(x|z))$

#SubSection("性质")

  熵的性质: 对称性、非负性、扩展性、可加性、极值性、一一对应变换下的不变性


  互信息的性质：


THE $D(P||Q)>=0)$

proof $D(P||Q)>=sum_x P (1-Q/P)=sum_x P-Q = 0$

THE $H(X|Y)<=H(X)$

THE $("凸函数的性质")f(sum a_i b_i)>= sum a_i f(b_i) quad (sum a_i =0,a_i->=0)$

THE $H(X Y)=H(X)+H(Y|X)$

EXT 熵的链规则

THE $H(X)<= log n "仅当等概分布"$

THE $I(X|y)>=0 "仅当"X,{y,overline(y)}"独立"$

THE $I(X;Y)=H(X)+H(Y)-H(X Y)$

THE $I(X;Y Z) = I(X;Y)+I(X;Z|Y)$

THE $I(X;Y|Z)>=0 "仅当"p(x|z)=p(x|y z)$

EXT 平均互信息的链原则


#Section("3-离散信源",sdisp: none)
#SubSection("分类")
#Paragraph[
  按符号集的有限性; 按信源和符号的依赖关系(记忆性);
  按统计特性(平稳性)
]
#SubSection("信源的描述")
?对单符号信源, 可用$p_i$描述, 
#SubSection("信源的扩展")
#nlist(
  [等长消息扩展:],[
    变长消息扩展:
  ]
)
#SubSection("信源的熵")

DEF N次扩展源平均符号熵: $H_N (X) = N^(-1)H(X_1...X_N)$

EXT 极限符号熵 $H_(infinity)(X)$

THE 若$H(X)<infinity$有 
$ 
  &H(X_N|X_1..) "不增"\
  &H_N (X)>=H(X_N|X_1...)\
  &H_N (X) "不增"\
  &H_(infinity)(X)=lim H(X_N|X_1...)
 $

#SubSection("Markov链")

DEF 随机序列中任一变量只依赖前一个变量

DEF 齐次markov链: $p_(i j)$与时间无关

DEF $p_(i j)$ 称由i转移到j的概率, 矩阵形式为 $bold(P)$

EQ Kolmogorov等式 $P^(m+n)=P^m P^n$

Markov链的平稳分布满足 $pi^T = pi^T P$,总存在概率矢量解。
考虑$lim P^k = mat(pi^T;...)$的收敛性？

#SubSection("markov信源")
DEF：有限状态机模型$x_k -> s_k ->...$,状态$s_k$的数目为Markov链阶数。

PROP markov性：输出符号只与当前状态有关;
Unifiliarity(单线性)：$s_k,x_k$唯一确定$s_(k+1)$

#SubSection("markov链N次扩展源熵的计算")
将mth markov链变为mth markov信源得到
$H(X_1...X_N)=H(S_(m+1))+sum_(k=m+1)^N H(S_(k+1)|S_k) = H(pi) + (N-m) pi^T dot h$
其中$[h_i]=[sum_y -p_(i j) log p_(i j)]$
从而得到平均符号熵$H_N (X)=N^(-1)(H(pi)+(N-m)pi^T h)$
#SubSection("markov源符号熵的计算")
(假设平稳)markov链熵率
$H_(infinity)(X)=pi^T h = H(S_(k+1)|S_k)$

THE $H(X_k|s_1=j,X_1...)=sum_i p(s_k=i|s_1=j) H(X|s_k=j)$

THE markov源熵率 $H_(infinity)(X)=H(X|S)=sum pi_i H(X|s=i)$

#SubSection("相关性与剩余度")
平稳有记忆信源可用马氏链近似：
$ 
  & H_0(X) &=& log n quad (n"为符号集大小")("-1阶熵")\
  & H_1(X)&=&H(X_1)("零阶熵")\
  &H_2(X)&=&H(X_2|X_1)\ 
  &&&...("熵率")
 $

#Paragraph[]
DEF $
      cases(
        "剩余度" gamma=1-H_(infinity)/H_0\
        "信源效率" eta=H_(infinity)/H_0
      )
    $



#Section("5-无失真信源编码",sdisp: none)
#SubSection("分类")
分组码：对信源符号分组编码，码符号序列称为码字；奇异码：码字互不相同的编码；
唯一可译码；异前置码(和即时码等价)；
#SubSection("定长码")
N长信源序列唯一可译条件：$n^N<=r^l$
\
\
THE 渐进均分定理

1. 对离散无记忆信源，$forall epsilon,delta>0, exists N_0, forall N>=N_0,$
$ |N^(-1)log p(arrow(x))+H(X)|<delta "x称典型序列,否则x出现的概率小于"epsilon $

2. \*典型序列概率估计 $p(arrow(x))=2^(-N(H(X)plus.minus delta))$

3. \*典型序列个数估计 $N_G = (1-sigma/2 plus.minus sigma/2)2^(N(H(X)plus.minus delta))$

4. \*AEP(平稳遍历信源) (推论)

5. 定长码编码定理: 若 $l/N log r >= H(X) + delta$ 则N足够大时存在译码差错无限小

6. 定长码长度下界: $N_0>= (sigma^2)/(epsilon^2 delta^2)=(eta/(1-eta))^2 1/(H^2 (X)) sigma^2 / epsilon$




#SubSection("变长码")

THE 异前置码存在的充要条件 $sum r^(-l_i)<=1$

THE 长N信源序列变长码编码定理 $H(X)/(log r)<= overline(l) < H(X)/(log r)+1/N$

#SubSection("最优编码")

THE 二元Huffman编码是最小平均码长准则下的最优编码,Shannon编码是(渐进意义/竞争最优准则)下的最优编码

其他编码方法: 算术编码, LZ编码

Huffman编码方法: (1)按概率从大到小排列, 最小2项编码末尾大1小0,2项概率相加得到新信源,重复该过程

算数编码方法:
$ 
  (L_i,H_i)=L_(i-1) +Delta_(i-1)(l_i',h_i')\
  Delta_i = H_i - L_i\
  L_0 = 0, H_0 = 1
 $
#SubSection("码率,编码效率,信息传输速率的定义")
$ 
  R=(l log r)/N &or &overline(l) log r\
  eta = (N H)/(l log r) & or &(H)/(overline(l) log r)\
  R_c=(N H)/l & or &H/(overline(l))
 $
#SubSection([*无失真编码定理(1st)*])
$ 
  R>=H <=> "存在无失真信源编码"
 $





#Section("6-离散信道及容量",sdisp: none)
#SubSection("信道的分类")
无噪信道:分为无损信道(1-n,y无损恢复x),确定信道(n-1,x确定y),无扰信道(1-1)

平稳无记忆信道模型: ${X,p_(i j),Y}$
#SubSection("单符号离散信道容量")
DEF $C=max_(p(x)) I(X;Y) = max_(p_i) sum p_i p_(i j) log (p_(i j))/(q_j)$,
其中$q_j=sum_k p_k p_(k j)$

信道容量计算: 

(1)对对称信道,有:

THE *对称信道输入等概率时达到容量* $C=H(Y)|_(p(x)=1/r) - H(p_(1 1),p_(1 2),...)$

(2) 迭代法求解 

(3) 利用充要条件$I(a_i ; Y)<=C quad("当"p(a_i)>0"时取等")$求解

#SubSection("信道容量代数")
THE 对马氏链 $X->Y->Z$,$I(X;Z)<=I(X;Y) and I(X;Z)<= I(Y;Z)$

EXT 数据处理定理 $I(U;V)<=I(X;Y)$

级联信道$C<=C$,并联信道$C'=sum C_i$;和信道$C'=log 2^(C_i)$;无记忆N次扩展信道 $C^N =N C$
#SubSection("多维矢量信道容量")
THE $ 
      cases(
        H(Y^N|X^N)<=sum H(Y_i|X_i) quad"仅当信道无记忆"\
        H(X^N|Y^N)<=sum H(X_i|Y_i) quad 
      )
     $
THE 对离散无记忆信道 $I(X^N;Y^N)<=sum (X_i;Y_i)$

#SubSection("有约束信道容量")
?






#Section("7-有噪信道编码",sdisp: none)
#SubSection("判决和译码规则")
DEF 判决函数 $g(y=b_i)=a^*$

DEF 平均错误率 $P_E = 1- sum_y P(X=g(b_i),Y=b_i)=^Delta p(x^* y)$

#SubSection("最佳判决准则")
最大后验概率(maximum a posteriori,map):$g(y)="argmax"_x p(x|y)$

最大似然准则(maximum likelihood,ml): $g(y)="argmax"_x p(y|x)$
#SubSection("信道编码和最佳译码")
DEF 汉明距离: $d_H(x,y)=sum |x_i-y_i|$

DEF (n,k)二元线性分组码:?

THE $d_H>=2t+1$ $arrow.l.r.double$ 可以纠正r个错误

THE 对二元无记忆信道，最大似然准则等价于最小汉明距离准则；对无记忆加性高斯信道，最大似然准则等价于最小欧式距离准则

常见的分组码：重复码、奇偶校验码等,非分组码包括算数编码等

#SubSection("Fano不等式")

THE Fano不等式(疑义度上界)$
  H(X|Y)<=H(p_E;1-p_E)+p_E log (r-1) quad "仅当" P(X!=x^* , Y=y)=P_E / (r-1)"时取等"
  $

#SubSection("有噪信道编码定理")
DEF\* $delta-"联合典型序列"$: $n_(i j)=n p_i p_(i j) (1 plus.minus delta)$

THE\* 联合典型序列的概率估计:$p(arrow(x),arrow(y))=2^(-n H(X Y)(1plus.minus delta))$

THE\* 联合典型序列个数估计: 若X,Y独立,$arrow(x),arrow(y)$为$delta-"典型序列"$,
$arrow(x)arrow(y)$构成$delta-"联合典型序列"$,则给定$arrow(y)$,$arrow(x)$的个数
$|F_(arrow(y))|<=2^(n H(X|Y)+delta(H(X Y)+H(Y)))$

THE *有噪信道编码定理*: 对离散无记忆平稳信道,信道容量C,信息传输速率R,若$R<C$
存在(M,n)码,n足够大时可使$P_E$无限小;反之对任意编码$P_E>0$

THE *信源信道编码定理*: 对离散无记忆平稳信道,每秒容量C,信源每秒熵H,若$H<C$则存在编码系统...


#SubSection("纠错码技术")\*







#Section("4-连续信息与连续信源",sdisp: none)
#SubSection("差熵的导出:量化逼近法")
DEF 差熵(微分熵)将区间[a,b]分为N份,
$ 
  H(X)=-lim_(N-> infinity)sum_(i=1)^N p(x_i) Delta log p(x_i) - lim_(N-> infinity)log Delta
 $
其中定义差熵$h(X)=-lim_(N-> infinity)sum_(i=1)^N p(x_i) Delta log p(x_i)=integral_a^b -p(x) log p(x) dif x$

例题:高斯信源的熵$h(X)=1/2 log 2pi e sigma^2$

类似可定义$h(X Y),h(X|Y), I(X;Y)$

#SubSection("差熵的性质")

条件不增性;可加性(链法则)

不具备的性质:非负性(p(x)可以未归一化);一一对应变换下的不变性

THE $y=f(x),f:RR^N -> RR^N$则$h(Y^N)=h(X^N)-integral dif V (p(arrow(x)) log |det(J)| )$,式中
$J_(i j')=(diff x_i)/(diff y^j')$

EXT $h(A dot X^N + alpha)=h(X^N)+log |det(A)|$

THE $D(p||q)>=0$

例题:多维相关高斯随机矢量的熵
若 $ p(arrow(x))=1/((2 pi)^(N/2)sqrt(det(sigma^2_(i j)))) dot 
exp(-1/2 (arrow(x)-arrow(mu))^T [sigma^2_(i j)]^(-1)(arrow(x)-arrow(mu))) $
则$ h(X^N)=N/2 log (2pi e (det(sigma^2_(i j)))^(1/N)) $

#SubSection("平均互信息的性质")
对称性;非负性;与差熵的关系;线性变换下的不变性;

#SubSection("连续最大熵定理")

THE 振幅受限的随机变量,均匀分布时取得最大熵

THE 平均功率受限的随机变量,高斯分布时取得最大熵,$h(X)=1/2 log (2pi e P)$




#Section("8-连续信道",sdisp: none)
#SubSection("定义")
时间离散连续信道:对应随机矢量
;波形信道:对应随机过程

单符号连续信道容量: $C(beta)=max {I(X;Y)|E[f(x)]<=beta}$

#SubSection("加性噪声信道容量")
DEF $Y=X+Z$,X与Z无关

PROP:...

THE 若输入限制 $f(x)=overline(x^2)<=beta=E$,加性高斯噪声方差$sigma_z$,则$C(E)=1/2 log(1+E/sigma_z^2)$

EXT 并联加性高斯噪声信道容量

#SubSection("加性高斯白噪声(AWGN)信道")
DEF 是一种波形信道,满足 $y(t)=x(t)ast g(t) + n(t) quad ("白噪声" g(t)=delta(t))$

波形信道的离散化:...

THE $C=W log (1+P/(N_0 W))$, 其中$N_0$为单边谱密度(双边为$N_0/2$),$W$为带宽,$P$为输入信号功率限制

THE AWGN信道编码定理 $R<=C$

记$E_b = P/R$为单位传输速率需要的功率,记功率利用率$(E_b)/(N_0)$,频谱利用率$R/W$,
则$ 
   & R/W <= log (1+ (E_b)/(N_0) R/W)\
   & (E_b)/(N_0) >= (2^(R/W) -1 )/(R/W)\
  $



#Section("9-信息率失真函数",sdisp: none)

#SubSection("R(D)定义和性质")

率失真函数的定义: $R(D)=min_(p(y|x) in P_D) I(X;Y)$,
其中$D$为失真测度(保真度准则),$P_D = {p(y|x)|E[d(x,y)]<=D}$,
其中$E[d(x,y)]=overline(D)=sum_(x,y) p_i p_(i j) d_(i j)$,
保真度准则规定$overline(D)<=D$

率失真函数的性质: 单调性,下凸性

D的上下界:
$ 
  D_min &= sum_i p_i min_j d_(i j)\
  D_max &= min_j sum_i p_i d_(i j)
 $

#SubSection("常见R(D)函数")
在汉明失真测度$d_(i j)=1-delta_(i j)$下:

  对二元对称?信源$R(D)=H(p)-H(D) quad (0<=D<=p)$

  对r元等概信源$R(D)=log r - D log (r-1) - H(D) quad (0<=D<=1-1/r)$

#SubSection("限失真信源编码定理")
$ 
  R>R(D) <=> exists "信源编码" E[d]<=D
 $
$ 
  C_t > R_t(D) <=> exists "信源信道编码" E[d]<=D
 $

#Section("主要论述")
经典信息论的研究对象是信源编码和信道编码

通信的结果是获得信息

改变表示不改变信息量

唯一可译是无失真/满足Kraft不等式的充分条件

$l,overline(l)$的区别

MAP可由联合概率阵/后验概率阵判决

影响译码错误率的因素: 信道统计特性+信道编译码方法

ML/MAP等价的条件: 输入等概/统计特性未知

两步编码如何达到一步编码效果: 容量大于信源熵+信源编码效率达到最大+错误率无限小?

率失真函数建立了*信息传输率*和*平均失真度*的关系.

#Section("主要证明")

1. 对r元信源$X^N$做huffman编码,等价为一r元信源,证明N足够大时,为等概信源

2. 证明噪声熵为$H(n)$

3. 证明对离散无记忆强对称信道, 最小汉明距离准则等价于最大似然译码准则.



#Section("约定")

$ p(x) <-> p_X (X=a_i) ("i可以为哑指标也可以为自由指标") $