set table "gnuplot/ELEC300A3Structure/1.table"; set format "%.5f"
set samples 50.0; set parametric; plot [t=0:4] [] [] log10(10**t),-20*log10(abs(1/sqrt(1+(0.006*10**t)**2)))+ 20*log10(abs(1/sqrt((1-(10**t/100)**2)**2+(2*0.3*(10**t/100))**2)))
