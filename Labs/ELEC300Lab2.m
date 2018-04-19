%% ELEC 300 Prelab 2

syms C R s
Zc = 1/(s*C)
Zr = R
Zeq = Zc/(Zr+Zc)
Q1ans = simplify(Zeq)
w0 = R*C
% substitute values now
%%
syms R1 R2 C

Zc2 = 1/(s*C)
Zc2R2 = Zc2+R2 
Zeq2 =  Zc2R2/(R1+Zc2R2)
Q2ans = simplify(Zeq2)