## 1.1 函数
- $f(x)+f(\frac{x-1}{x})=1+x$
- $f(x)-\frac{1}{2}f(x/2)=x^2$
- f(x)关于$A(a,y_1),B(b,y_2)$对称，讨论f(x)周期性\
  **解** $f(x)=2(y_1-y_2)+f(x+2(b-a))$\
  case $y_1=y_2$ : ...\
  case $y_1\ne y_2$ let $f(x)=px+q+\phi(x)$
## 1.2 极限
- $x_n=\frac{1}{n\cdot 2\sin{\pi/4n}}\sum_{k=1}^{n}[\sin{\frac{k\pi}{2n}}-\sin{\frac{(k-1)\pi}{2n}}]$
  
**Q** 求$y^2=x$和$y=x$围成的均匀薄板绕$l:y=kx$的转动惯量。\
**A** $T_l=\int_0^1dx\int_{-\sqrt{x}}^{\sqrt{x}}\frac{(y-kx)^2}{1+k^2}dy\\
=\frac{1}{3(1+k^2)}\int_0^1(2x^{3/2}+k^2x^{5/2})dx\\
=\frac{28+60k^2}{105(1+k^2)}$.

### 重积分证明
**Q15**  证 $\frac{\pi(R^2-r^2)}{R+K}\le\iint_D\frac{d\sigma}{\sqrt{(x-a)^2+(y-b)^2}}\le\frac{\pi(R^2-r^2)}{r-K}$,\
where  $0<K=\sqrt{a^2+b^2}<r<R$,\
$D:r\le\sqrt{x^2+y^2}\le R$.\
**A**  pass

**Q16**  $f(x)\subset C^{[a,b]}$,证
$[\int^b_af(x)dx]^2\le(b-a)\int^b_af^2(x)dx$\
**A**  $L.H.S=\int^b_adx\int^b_af(x)f(y)dy\\
\le\int^b_adx\int^b_a\frac{f^2(x)+f^2(y)}{2}dy\\
=1/2(b-a)(\int^b_af^2(x)dx+\int^b_af^2(y)dy)
=R.H.S$

**Q17** $u(x)\subset C^{[0,1]}$,and
$u(x)=1+\lambda\int^1_xu(y)u(y-x)dy$ . 
prove $\lambda\le1/2$ .\
**A** let $a=\int^1_0u(x)dx$ . then 
$a=1+\lambda\int^1_0dx\int^y_0u(y-x)dx\\
=1+a^2/2$

**Q18** $D_f:0\le x,y\le 1,|\frac{\partial^4f}{\partial x^2\partial y^2}|\le b$ ,\
prove $|\iint_Df(x,y)dxdy|\le b/144$\
**A** let $g(x)=x(x-1)y(y-1)$ , \
$\iint_D\frac{\partial^4f}{\partial x^2\partial y^2}g(x,y)dxdy=\iint_D\frac{\partial^2f}{\partial y^2}\frac{\partial^2g}{\partial x^2}dxdy=\iint_D\frac{\partial^4g}{\partial x^2\partial y^2}f(x,y)dxdy$ .\
$\therefore L.H.S=\frac{1}{4}|\iint_D\frac{\partial^4g}{\partial x^2\partial y^2}f(x,y)dxdy|=\frac{1}{4}|\iint_D\frac{\partial^4f}{\partial x^2\partial y^2}g(x,y)dxdy|\le\frac{b}{4}\iint_Dg(x,y)dxdy=R.H.S$ .

**Q20** $f(x,y)$在单位圆中有连续偏导数，圆上为零。prove $\lim_{\epsilon\to0^+}\iint_{D(\epsilon)}\frac{x\frac{\partial f}{\partial x}+y\frac{\partial f}{\partial y}}{x^2+y^2}dxdy=-2\pi f(0,0)$ . \
**A** let $x=\rho\cos\phi,y=\rho\sin\phi$ , \
$\rho\frac{\partial f}{\partial\rho}=x\frac{\partial f}{\partial x}+y\frac{\partial f}{\partial y}$ , $f(\cos\rho,\sin\rho)=0\space when\space\rho=1$ ,\
$L.H.S=\lim_{\epsilon\to0^+}\int^{2\pi}_0d\phi\int^1_\epsilon\frac{\partial f}{\partial\rho}d\rho=R.H.S$

**F** 格林公式：$\iint_Ddxdy(\frac{\partial Q}{\partial x}-\frac{\partial P}{\partial y})=\oint_L(Pdx+Qdy)$

**Q21** $D:x^2+y^2\le1,\frac{\partial^2f}{\partial x^2}+\frac{\partial^2f}{\partial y^2}=e^{-(x^2+y^2)}$ .\
prove $\iint_D(x\frac{\partial f}{\partial x}+y\frac{\partial f}{\partial y})dxdy=\frac{\pi}{2e}$\
**A** $I=\int^1_0\rho d\rho[\int^{2\pi}_0(\rho\cos\phi\frac{\partial f}{\partial x}+\rho\sin\phi\frac{\partial f}{\partial y})d\phi]=\int^1_0\rho d\rho\oint_{x^2+y^2=\rho^2}(\frac{\partial f}{\partial x}dy-\frac{\partial f}{\partial y}dx)=\int^1_0\rho d\rho\iint_{x^2+y^2\le\rho^2}e^{-(x^2+y^2)}dxdy$

**F** 二重积分的分部积分\
$\iint_Du\frac{\partial v}{\partial x}dxdy+\iint_Dv\frac{\partial u}{\partial x}dxdy=\oint_{\partial D}uvdxdy$\
$\iint_Du\frac{\partial v}{\partial y}dxdy+\iint_Dv\frac{\partial u}{\partial y}dxdy=-\oint_{\partial D}uvdxdy$\
use in *Q21*

**Q22** $\quad f(x,y)=1+\int^x_0\int^y_0f(u,v)dudv$ 在 $0\le x,y\le 1$至多有一个解。\
**A** 两个解之差 $g(x,y)=\int^x_0\int^y_0g(u,v)dudv$ \
$|g(x,y)|\le Mxy,\therefore |g(x,y)|\le\frac{Mx^ny^n}{n!n!}\to 0$

## 5.2三重积分
## 5.3第一性曲线与曲面积分
