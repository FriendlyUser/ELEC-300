%% ELEC 300 Assignment 5
u = symunit
format compact
format short
%% Question 1
% 14.34
syms RL
% Using Textbook Values
R = 2.4*u.kOhm
L = 2*u.uH
C = 50*u.pF
Qlimit = 7.5 % Circuit should not drop below Q < 10.
w0 = simplify(1/(sqrt(L*C)));
w0 = rewrite(w0,u.rad/u.sec)
w0 = vpa(w0,5)

Qactual = w0*R*C
Qactual = simplify(Qactual)

% Use Voltage Divider
eqnRL = RL/(RL+R)*Qactual==Qlimit
RLvalue = solve(eqnRL,RL);
% Find the value of the load resistor
RLvalue = vpa(RLvalue,10)
%fprintf('The value of the load resisitor is %4.5f', RLvalue)
%%
% Using Assignment Values
R = 5*u.kOhm
L = 2*u.uH
C = 50*u.pF
Qlimit = 10 % Circuit should not drop below Q < 10.
w0 = simplify(1/(sqrt(L*C)));
w0 = rewrite(w0,u.rad/u.sec);
w0 = vpa(w0,5)

Qactual = w0*R*C;
Qactual = simplify(Qactual)

% Use Voltage Divider
eqnRL = RL/(RL+R)*Qactual==Qlimit
RLvalue = solve(eqnRL,RL);
RLvalue =vpa(RLvalue,10)

%% Question 2
% 14.42
f0 = 5*u.kHz
Q  = 20
C  = 500*u.nF
w0 = 2*pi*f0
L = rewrite(1/(w0^2*C),u.H)
vpa(L,10)
beta = w0/Q
R = rewrite(1/(beta*C),u.Ohm)
%% Question 3
% 15.7 
% Use symbolic toolbox to verify algebra

%% Question 4
%
