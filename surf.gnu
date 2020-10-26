set size square
set nokey
set contour
set surface
set cntrparam levels 25
splot 'u.dat' u 1:2:3 w l lt 1
