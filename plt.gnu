set xlabel 'x'
set ylabel 'f(x)'
set title 'Plot of x versus cos(x) and sin(x)'
p 'cossin.dat' u 1:2 t 'cos(x)' w lp lt 1 pt 3, \
'cossin.dat' u 1:3 t 'sin(x)' w lp lt 2 pt 6
