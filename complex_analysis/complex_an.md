# 复变分析
 参考：
## 定义
1. 复平面
   - 辐角：
     $$\text{Arg}(z)=\arg(z)+2k\pi$$
     $$\arg(z)=\theta,\theta\pm\pi,\pm\frac{\pi}{2}\in\pm\pi$$
2. 复数的四则运算
3. 复共轭
4. 复数的乘幂，开方
   - **De Moivre** 
5. 复球面，无穷远点， $\infty$ 的定义
6. 复变函数极限，连续，可导，微分
   - 可微： $f(z_0+\Delta z)=f(z_0)+f'(z_0)\Delta z+\rho(\Delta z)\Delta z$
## 解析函数
解析的定义：**邻域内处处可导**
1. C-R方程(Cauchy-Riemann)：
   $$a=\partial_xu=\partial_yv,\quad b=\partial_xv=-\partial_yu$$
2. 解析的充要条件：可微且满足C-R方程
3. 初等函数的解析性
   - 指数函数：不取零值，周期性，复平面解析
   - 对数函数：除原点和负实轴处处解析
     $$\ln(z)=\ln|z|+i\arg(z)$$
     $$\text{Ln}(z)=\ln(z)+2ik\pi$$
   - 幂函数：除原点和负实轴处处解析, $a=\frac{m}{n}\to n值函数$
   - 三角函数
   - 双曲函数
4. 解析的充要条件：u，v是共轭调和函数
## 复变积分
1. 存在条件：在光滑曲线上连续
   $$\int_Cfdz=\int_Cudx-vdy+i(vdx+udy)$$
2. Cauchy积分定理(在D内解析，C上连续)
3. 变上限积分
4. 复合闭路定理
5. Cauchy积分公式，求导公式，推广
   $$f(z_0)=\frac{1}{2\pi i}\int_C\frac{f(z)}{z-z_0}dz$$
   $$f^{(n)}(z)=\frac{n!}{2\pi i}\int_C\frac{f(z)}{(z-z_0)^{n+1}}dz$$
   - **Morera**(2)的逆定理
   - **Liouville**解析且有界，则恒为常数
## 幂级数
## 留数
1. 孤立奇点：去心邻域内解析
  - 可去奇点
  - m级极点
  - 本性奇点
2. 奇点和零点的关系
3. 留数
4. 无穷远点的留数 