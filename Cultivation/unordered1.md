1.  [求和的积分中值定理](https://www.bilibili.com/video/BV1f4421U7W4)
    
  **Q** $f\in [0,1],\ \int^1_0f(x)dx=1/3,\quad prove \ that \ \forall n\in N,\quad \exists \xi_1,\dots,\xi_n \ s.t.\ \sum(f(\xi_i)-\xi_i^2)=0$

   **A** 
   $$\int^1_0 f(x)-x^2\text{d}x=0$$
   $$\sum_{k=1}^n  \int_{\frac{k-1}{n}}^{\frac{k}{n}}  f(x)dx = \sum_{k=1}^n  \frac{f(\xi_k)}{n}  = 0$$

2.  [基本微分不等式构造](https://www.bilibili.com/video/BV1HH4y1c7ZJ)
   
   **Q** $f,g\in C[0,1]$是正值函数, $\exists C_1,C_2 \ s.t. \ \forall t>0,\ \int^t_0g(s)ds \le C_1 \quad \text{and} \quad f(t) \le C_2 \left(2+\int^t_0f(s)g(s)ds\right) \ln \left(2+\int^t_0f(s)g(s)ds\right)$
   。
   $\text{prove} \ \exist M>0 \ s.t. \ f(t)\le M$

   **A** 
   $$let \quad F(t) = \int^t_0f(s)g(s)ds$$
   $$then \quad F'(t) = g(t)f(t) \le g(t)\cdot C_2 \cdot (2+F(t))\ln(2+F(t))$$
   $$\therefore \int^{F(x)}_0\frac{dy}{(2+y)\ln(2+y)} \le C_2 \int^x_0 g(t)dt \le C_1C_2$$
   $$\because \int^{\infin}_0\frac{dy}{(2+y)\ln(2+y)}=+\infin, \to F(x)\le M$$

3. [双中值](https://www.bilibili.com/video/BV11w4m1r7yV)
   
   **Q** $f(0)=1,f(a)=0,\ then \ \exists x_1,x_2 \ s.t. \ f'(x_1)f'(x_2)=\frac{1}{a^2}$

   **A** $f'(\xi_1)f'(\xi_2) = \frac{1-f(x_0)}{x_0} \frac{f(x_0)}{a-x_0}$ , $\exists x_0$ 满足 $f(x_0) = \frac{x_0}{a} \ or \ \frac{a-x_0}{a}$

4. [经典积分不等式](https://www.bilibili.com/video/BV1o4421Z7s8)

   **Q** $f \in C[0,1],\ xf(y)+yf(x) \le 1, \quad prove \ \int^1_0f(x)dx \le \frac{\pi}{4}$

   **A** 
   $$\int^1_0 f(\sin\theta)d\sin\theta = \int^{\pi/2}_0 \cos\theta f(\sin\theta)d\theta = \int^{\pi/4}_0 \cos\theta f(\sin\theta) + \sin\theta f(\cos\theta) \le \frac{\pi}{4}$$

5. [幂平均不等式和*Stolz*推论](https://www.bilibili.com/video/BV1kT421r7BH)
   
   **Q** $a_n>0,\ \lim a_n = a,\ prove \ \lim (\frac{\sqrt[n]{a_1}+\cdots + \sqrt[n]{a_n}}{n})^2 = a$

   **A** 
   $$LHS \ge \lim_{n\to \infin} \sqrt[n]{a_1\cdots a_n} = \lim_{n\to \infin} \frac{a_1\cdots a_{n+1}}{a_1\cdots a_n} = a$$
   $$LHS \le \lim_{n\to \infin} \frac{a_1+\dots +a_n}{n} = a$$

6. [泰勒](https://www.bilibili.com/video/BV144421D7xt)
   
   **Q** $f'(0)=0,\ |f'''(x)|<1,\quad prove \ \int^1_0 (x-1/2)f''(x)dx < 1/12$

   **A** 
   $$LHS \le \int^1_0 (x-\frac{1}{2})(f''(x)-f''(a))dx \lt \int^1_0 |x-\frac{1}{2}||x-a|dx < 12 \quad 0<a<1$$

7. [线代](https://www.bilibili.com/video/BV1Yx4y1x7wD)

   **Q** $A,B \in C^{n\times n},\ rank(AB-BA+I)=1,\quad prove \ tr(ABAB)-tr(A^2B^2) = n(n-1)/2$

   **A** 由秩1矩阵的性质
   $$\exists \ \alpha\beta^T = AB-BA+I$$
   $$tr((AB-BA)^2) = tr(ABAB-AB^2A-BA^2B+BABA)
   = tr(2ABAB-2A^2B^2) \\ = tr((\alpha\beta^T-I)^2) = (n-1)^2+n-1$$

8. [求和](https://www.bilibili.com/video/BV1Ux4y1x7iG)

   $$\lim_{n \to \infin} \frac{1}{n} \sum_{k=1}^{n^2} \frac{1}{\sqrt{n^2+k}} \\ = \lim \frac{1}{n^2} \sum \frac{1}{\sqrt{1+\frac{k}{n^2}}} = \int^1_0 (1+x)^{-1/2}dx = 2\sqrt{2}-2$$

9. [泰勒积分余项, 拟合](https://www.bilibili.com/video/BV1YM4m127MK)
    
    **Q** 
    $$\lim_{n \to \infin} n \int^1_0 \sum_{k=n}^{\infin} \frac{x^k}{k} f(x) dx$$

    **A**
    $$n \int^1_0 \sum_{k=n}^{\infin} \frac{x^k}{k} dx = n \sum_{k=n}^{\infin} \int^1_0 \frac{x^k}{k} dx = \sum_{k=n}^{\infin} \frac{n}{k(k+1)} = 1 \quad \tag{1}$$
    $$\sum_{k=n}^{\infin} \frac{x^k}{k} = \frac{1}{n!} \int^x_0 (x-t)^{n-1} (\ln(1-t))^{(n)} dt = \int^x_0 (x-t)^{n-1}(1-t)^{-n} \quad \tag{2}$$
    给定 $\delta \in (0,1)$ , 
    $$\left| n \int^1_0 \sum_{k=n}^{\infin}\frac{x^k}{k} (f(x)-f(1)) \right|  \le  2 \sup_{x \in [0,1]} f(x) \ \int^{1-\delta}_0 \int^x_0 (x-t)^{n-1}(1-t)^{-n} \ dt \ dx  +  \sup_{x \in [1-\delta,1]} |f(x)-f(1)| \cdot 1$$
    其中
    $$\begin{align*}\int^{1-\delta}_0\int^x_0 (x-t)^{n-1}(1-t)^{-n} \ dt \ dx \le&
      (1-\delta)\int^{1-\delta}_0 (1-\delta-t)^{n-1}(1-t)^{-n}dt\\
      =& (1-\delta)^n \int^{1-\delta}_0 (\frac{1-\delta-t}{(1-\delta)(1-t)})^{n-1}(1-t)^{-1}dt \\
      <& (1-\delta)^n \int^{1-\delta}_0 e^{-(n-1)\frac{\delta t}{(1-\delta)(1-t)}}(1-t)^{-1} dt \\
      \to& 0 \quad (n \to \infin) \end{align*}$$
    $$\therefore \lim_{n \to \infin} \left| \int^1_0 \sum_{k=n}^{\infin} \frac{x^k}{k} (f(x)-f(1)) \right| \le \sup_{x \in (1-\delta,1)}|f(x)-f(1)| \to 0 \quad (\delta \to 0)$$

10. [积分不等式]()
    
    **Q** $f \in C^1,\ f(x) \ge 0, \quad prove \ \left| \int^1_0f^3(x)dx - f^2(0) \int^1_0f(x)dx \right|  \le \max |f'(x)| \cdot (\int^1_0 f(x)dx)^2$

    **A**
    $$LHS = \left|\int^{0}_{F(0)-F(1)}(f^2(x)-f^2(0)) \ d(F(x)-F(1))\right| = \left| \int^1_0 2f(x)f'(x)(F(x)-F(1))\ dx \right| \\ \le \max|f'(x)| \left| 2 \int^1_0 f(x) \int^1_x f(y) \ dydx \right| = RHS$$

11. [洛必达](https://www.bilibili.com/video/BV1FS411w7uz)
    
    **Q** $f \in D(0,\delta),\ \lim_{x \to 0^+} (f(x)-\lambda x f'(x))=0,\quad prove \ \lim_{x \to 0^+}f(x)=0$

    **A**
    构造 $y=Cx^{-1/\lambda}$ 欲使 $f'(x)=0$
    $$\lim f(x) = \lim \frac{x^{-1/\lambda} f(x)}{x^{-1/\lambda}} \\= \lim \frac{-\frac{1}{\lambda} x^{-1/\lambda} f(x) + x^{-1/\lambda} f'(x)}{-\frac{1}{\lambda} x^{-1/\lambda}} \\= \lim (f(x)-\lambda x f'(x))$$

12. [零点极限](https://www.bilibili.com/video/BV1Py411i77z)

    **Q** $x^n+2023x=2023$ 正根为 $x_n$, 证 $\lim x_n = 1$, 求 $\lim \frac{nx_n^n}{\ln n}$

    **A** 
    $$0<x_n<1,\ n = \frac{\ln(2023-2023x_n)}{\ln x_n}$$
    $$\begin{align*}\lim \frac{nx_n^n}{\ln n} =& \lim \frac{\frac{\ln(2023-2023x_n)}{\ln x_n} e^{\frac{\ln(2023-2023x_n)}{\ln x_n} \ln x_n}}{\ln(\frac{\ln(2023-2023x_n)}{\ln x_n})} \\ =& 2023\lim \frac{(x_n-1)\frac{\ln(2023-2023x_n)}{\ln x_n}}{\ln(\frac{\ln(2023-2023x_n)}{\ln x_n})} \\ =& -2023 \lim \frac{\ln(2023-2023x_n)}{\ln(\frac{\ln(2023-2023x_n)}{\ln x_n})} \\ =& -2023\lim \frac{\frac{1}{x_n-1}}{\frac{1}{(2023-2023x_n)\ln(2023-2023x_n)} - \frac{1}{x_n\ln x_n}}\end{align*}$$

13. [级数求和]()
    $$\begin{align*}
      \sum_{k=1} \frac{(-1)^{k+1}}{k} \sum_{n=1} \frac{1}{k2^n+1} =& 
      \sum_k ... \sum_n \int^1_0 x^{k2^n} dx \\
      =& \sum_n \int^1_0 \ln(1+x^{2^n})dx\\
      =& \int^1_0 -\ln(1-x) + \ln(1-x^{2n})|_{n \to \infin} dx \\
      =& \int^1_0 -\ln(1-x) dx\\
      =& 1
    \end{align*}$$