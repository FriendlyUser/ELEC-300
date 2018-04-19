%% ELEC 300 Spring 2018
% 15.7 Nillison
% 
% 
% 
% 
% 
% 
% 
% Sketch the bode plot of $H(s)=\frac{10}{s(s^2+s+16)}$
%%
Q2H = tf([10],[1 1 16 0])
BodePlotGui(Q2H)
%% 
% 
% 
% The approximation is pretty good.
%%
figure
bode(Q2H)
%% 
% Question 3 (similar to 14.20) Nillison, taken from
% 
% *Alexander 6th edition 14.40 *A parallel resonance circuit has a resistance 
% of
% 
% 2 k? and half-power frequencies of 86 kHz and
% 
% 90 kHz. Determine:
% 
% (a) the capacitance
% 
% (b) the inductance
% 
% (c) the resonant frequency
% 
% (d) the bandwidth
% 
% (e) the quality factor
%%
u = symunit
fc1 = 86*u.kHz
fc2 = 90*u.kHz
R   = 2*u.kOhm
% Calculations
wc1 = 2*pi*fc1
wc2 = 2*pi*fc2
B = wc2 - wc1
w0 = sqrt(wc1*wc2)
Q  = w0 / B
C  = Q/(w0*R)
Cans  = rewrite(C,u.nF)
L  = 1/(w0^2*C)
Lans  = rewrite(L,u.H)
%% 
% 
% 
% Design a first-order highpass filter using a non-inverting op amp. The 
% transfer function is given by
% 
% $$H(s)= \frac{1+10^{-3}s}{10^{-3}s}$$
% 
% Something like the picture below, where Zf = 1/(sC), where C = 100nF, Zi 
% = 10 k Ohm.
% 
% 
% 
% 
% 
% *13.45 *For the circuit shown in Fig. 13.110, find the value of the average 
% power absorbed by the 8-?
% 
% resistor.
% 
% 
% 
% 
% 
% Question 6) The voltage transfer function of a system is characterized 
% by the following pole-zero plot and a constant of K=100. What is the system's 
% output voltage $v_o(t)$if it is excited by an input voltage of 1 u(t) V?
%%
G6s = zpk([0],[-6-j*8 -6+j*8],100)
pzmap(G6s)
%%
syms s
% Found the impulse response
timeFun = ilaplace(s/(s^2+12*s+100))
ezplot(timeFun)
% step response 
timeFun2 = ilaplace(1/(s^2+12*s+100))
ezplot(timeFun2)
step(G6s)
%% 
% 
% 
% 
% 
% 18.19 Nllison
% 
%     
% 
% 
% 
% 
% 
% 
% 
%