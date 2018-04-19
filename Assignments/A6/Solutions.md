#### ELEC 300 Assignment 6

##### Problem 1 (Nilison 10th edition 9.74)
Assume that $M^\prime= k M$ and $\omega = 4 \text{krad/s}$. 

![0.1faebosdkp1](\:storage\0.1faebosdkp1.png)

- Find the value of k so that the input impedance Zab is purely resistive.

- Calculate Zab. 

![0.ww1wo5l7etg](\:storage\0.ww1wo5l7etg.png)


##### Problem 2 (Nilison 10th edition 9.76)

Find the steady-state expressions for currents $i_g(t)$ and $i_L(t)$ if $v_g(t)=168 \cos(800t) V$.

![0.n36e2onvck](\:storage\0.n36e2onvck.png)


![0.cbu2wuhcluu](\:storage\0.cbu2wuhcluu.png)


##### Problem 3 (Alexander 6th edition 4.48)
![0.8oolwv0hxin](\:storage\0.8oolwv0hxin.png)



![0.ncw356m3c3](\:storage\0.ncw356m3c3.png)

![0.iz7xcob2qv](\:storage\0.iz7xcob2qv.png)



##### Problem 4 and 5 (Laplace transforms)

Find the inverse Laplace transform of the following functions:

$$F(s)=\frac{20(s+2)}{s(s^2+6s+25)}$$
 $$F(s)=\frac{6s^2+36s+20}{(s+1)(s+2)(s+3)}$$
 
 Find f(t) given that: 
 $$F(s)=\frac{s^2+4s}{s^2+10s+26}$$
 $$F(s)=\frac{5s^2+7s+29}{s(s^2+4s+29)}$$
```octave:elec300A6.m
%% ELEC 300
% Assignment 6
% Laplace Transform equations
format compact
syms s
fact = [1 6 25]
p = roots(fact)

poly4a = 20*(s+2)/(s*(s^2+6*s+25))
partfrac4a = partfrac(poly4a)
ilaplace(poly4a)

%%

poly4b = (6*s^2+36*s^2+20)/((s+1)*(s+2)*(s+3))
partfrac4b = partfrac(poly4b)
ilaplace(poly4b)

%%
poly5a = (s^2+4*s)/(s^2+10*s+26)
partfrac5a = partfrac(poly5a)
ilaplace(partfrac5a)
%% 

poly5b = (5*s^2+7*s+29)/(s*(s^2+4*s+29))
partfrac5b = partfrac(poly5b)
ilaplace(partfrac5b)
```