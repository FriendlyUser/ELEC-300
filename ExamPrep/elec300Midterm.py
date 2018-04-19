# -*- coding: utf-8 -*-
"""
ELEC 300 Midterm Prep, creating bode plots and perhaps symbolic sympy
Created on Sat Feb 17 15:00:56 2018

@author: David Li
"""

from scipy import signal
import matplotlib.pyplot as plt

s1 = signal.lti([1250], [1, 1250])
print(s1)
w, mag, phase = signal.bode(s1)
plt.figure()
plt.semilogx(w, mag)    # Bode magnitude plot
plt.figure()
plt.semilogx(w, phase)  # Bode phase plot
plt.show()