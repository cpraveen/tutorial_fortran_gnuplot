set xlabel 'x'
set ylabel 'u'
set title 'Solution of Burgers equation'

p 'init.out' t 'Initial cond' w lp lw 2, \
  'fin.out'  t 'Final   sol'  w lp lw 2

set term postscript enhanced color
set out 'sol.eps'
replot

set term x11
set out
