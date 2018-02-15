set table "gnuplot/ELEC300A3Structure/2.table"; set format "%.5f"
set samples 50.0; set parametric; plot [t=0:4] [] [] log10(10**t),--180/3.1415957*atan(0.006*10**t)+ 180/3.1415957*(atan((100**2-(10**t)**2)/(2*0.3*100*10**t))-3.1415957/2)
