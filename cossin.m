x=linspace(0,2*pi,50);
y1=cos(x);
y2=sin(x);
XX=[x',y1',y2'];
save cossin.dat XX -ascii
