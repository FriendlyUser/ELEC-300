%% ELEC 300 Assignment 3
% Checking out if I can check all my calculations symbolic using matlab
syms s 
%% Question 1 a)
Req1 = s*(1)/(s+1) % parallel 1H and 1 Ohm
Req2 = Req1+(1/s)% series Req1 and 1F 
Req2 = simplifyFraction(Req2) % combine into a single fraction
Req3 = Req2*1/(Req2+1) % parallel with 1 Ohm
Req3 = simplifyFraction(Req3) % get the value for Zab
[num,den] = numden(Req3) % get the numerator and denominator polynomial
%% Question 1 b)
% Find the poles and zeros
zeroes = solve(num,s)
poles = solve(den,s)

%% Question 2 a)
syms C1 C2 R1 R2
Zeq1 = R1*1/(s*C1) / (R1+1/(s*C1)) % R1 and C1 in parallel
Zeq2 = R2*1/(s*C2) / (R2+1/(s*C2)) % R2 and C2 in parallel
Zeq = Zeq1+Zeq2 % Find equivalent impendance
Zeq = simplifyFraction(Zeq)
% Voltage Division to find V(o)
Zvo = Zeq2/Zeq
Zvo = simplifyFraction(Zvo)
%Zeq = Zeq1*Zeq2/(Zeq1+Zeq2)
%Zeq = simplifyFraction(Zeq) % get the value for Zeq
%% Question 3 a)

% Q3TF = zpk([-1],[0,-10],1)
Q3TF = tf([1,1],[1,10,0])
BodePlotGui(Q3TF)
figure
% bode(Q3TF)

%% Question 4

Q4TF = tf([50,50],[1,10,100,0])
bode(Q4TF)
BodePlotGui(Q4TF)
figure

%% Question 5

Q5TF = zpk([-1,-10,-50,-200],[0,0],0.00009)
bode(Q5TF)
[num5,den5] = tfdata(Q5TF)
Q5tfnotzpk = tf([num5],[den5])
BodePlotGui(Q5tfnotzpk)

%% Question 6
syms eta
K = 10
answer = solve(1/(2*eta*sqrt(1-eta^2))==K)