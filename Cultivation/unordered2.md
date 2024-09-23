*来源:电子书*

## 极限

1. **Q**
   $$\frac{1}{n} \sum_{i=1}^n \cos \frac{(2i-1)\pi}{4n}$$
   **A**
   $$=\frac{1}{n\cdot 2 \sin\frac{4}{4n}} \sum_{i=1}^n 2 \sin\frac{\pi}{4n}\cos\frac{(2i-1)\pi}{4n}$$
   $$=...\sum \sin\frac{i\pi}{2n} + \sin\frac{(-i+1)\pi}{2n}$$
   $$=\frac{\sin\frac{n\pi}{2n}-\sin 0}{2n\sin\frac{\pi}{4n}}$$

2. **Q**
   $$\lim_{n\to \infin} \tan^n\left(\frac{\pi}{4}+\frac{2}{n}\right)$$
   **A**
   $$=\lim_{n\to\infin} \left( 1+\frac{2\tan\frac{2}{n}}{1-\tan\frac{2}{n}} \right)^n$$
   $$=e^{ \lim 2n\tan\frac{2}{n} / (1-\tan\frac{2}{n}) }$$

3. $x-1<[x]\le x$
4. $证\quad \lim_{n\to\infin}\sum_{i=1}^n\frac{1}{i} - \ln n存在$
5. $证\quad \lim \cos ... \cos x \quad 存在$
6. **Q**
   $$\lim_{n\to\infin} n^2 \left( \arctan\frac{a}{n}-\arctan\frac{a}{n+1} \right)$$
7. $\lim n \sin(2\pi e n!)$
8. $\lim \sum \frac{i}{a^i}$

## 一元函数

1. **Q**
   $$在(-\delta,\delta)内f(x+y)=\frac{f(x)+f(y)}{1-f(x)f(y)}且f'(0)=1求证f(x)可导$$
   **A**
   $$\frac{f(x+y)-f(x)}{y}=\frac{f(y)}{y}\cdot \frac{1+f^2(x)}{1-f(x)f(y)}$$

2. $$|\sum a_k\sin kx|\le|\sin x|,\quad |\sum a_{n+1-k}\sin kx|\le|\sin x|\quad \to |\sum a_k|\le\frac{1}{n+1}$$
3. **Q**
   $$\partial_x^n (1-x^m)^n$$
   **A**
   $$\text{let}\quad u=(1-x)^n,\quad v=(1+x+...+x^{m-1})^n$$
   $$\text{then}\quad u^{(0)}(1)=...=u^{(n-1)}=0,\quad v^{(0)}(1)=m$$
   $$(uv)^{(n)}(1)=\sum C^k_n u^{(k)}v^{(n-k)}|_{x=1}=\frac{m}{n}\quad\text{(?)}$$
4. **Q**
   $$\arctan^{(n)}(x)=(n-1)!\cos^n(y)\sin\left( (n+1)(y+\frac{\pi}{2}) \right)$$