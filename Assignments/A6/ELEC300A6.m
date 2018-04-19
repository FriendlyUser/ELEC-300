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