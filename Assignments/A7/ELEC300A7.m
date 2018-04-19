%% ELEC 300 Assignment 7
%% 13.9
syms s
ZR = 140
ZL = s*5e-3
ZC = 1/(s*1.25e-6);
ZC = vpa(ZC,5)
Zeq = ZR+ZL+ZC;
Zeq = simplifyFraction(Zeq)
H = ZC/Zeq
Vi = 90 /s
vo = ilaplace(Vi*H)

%%

C = 312.5e-6
R = 100
L = 500e-3
ZC2 = 1/(s*C)
ZR2 = R
ZL2 = s*L
Zeq = ZC2 + ZR2 + ZL2;
Zeq = vpa(simplifyFraction(Zeq),10)
Vi = 75/s
Is = Vi/Zeq;
Is = partfrac(Is)
it = ilaplace(Is)

%% 13.43
% No Initial Conditions
%%
% Removing current source, 
ZR31 = 40
ZR32 = 80
ZC3  = 1/(s*31.25e-6)
ZL3  = s*400e-6
V1   = 400/s

% 400 mH in parallel with 80 ohms in parallel with 31.25 uF in series with
% 40 Ohm
ZEQV31 = (1/ZR32+1/ZC3+1/ZL3)^(-1);
ZEQV31 = simplifyFraction(ZEQV31)

v1 = ilaplace(V1*(ZR31/(ZEQV31+ZR31)))
%%
% Removing voltage source
syms V02
eqn2 = V02/40+V02*s/32000+(V02-480/s)/(0.4*s+80)==0
V02 = solve(eqn2,V02)
V02Roots = factor(V02)
%%
% Removing current source
syms V01
eqn1 = (V01-400/s)/40+V01*s/32000+V01/(80+0.4*s) == 0
V01 = solve(eqn1,V01)
V01Roots = factor(V01)
%%
% Taking partial fractions and then inverse laplace transform
V0 = V01 + V02;
V0 = simplifyFraction(V0)
V0pf = partfrac(V0)
vo = ilaplace(V0pf)

%% 16.62 (Alexander)
% see solutions manual
%% 13.28
% Problem 5

%% 
% Last problem (couldn't find it)
syms s k
P6M = [2+1/s -(1/s+k); ...
        -1/s 2+1/s+0.5/s]
charPoly = det(P6M)

    