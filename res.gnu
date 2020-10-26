set nokey
set logscale y
set xlabel 'Number of iterations'
set ylabel 'Residual error'
set title 'Conv of residual error for soln of Poisson equation'
p 'res.dat' u 1:2 w l lw 2
