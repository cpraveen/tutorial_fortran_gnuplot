set size square
set nokey
set contour
set nosurface
set view 0,360
set cntrparam levels 25
#set cntrparam levels incremental 0, 0.1, 1.0
set term table
set out 'table.dat'
splot 'u.dat' u 1:2:3 w l
set term x11
set xlabel 'x'
set ylabel 'y'
p 'table.dat' w l
