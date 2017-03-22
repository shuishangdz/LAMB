
function cos=sanc0450gpan1(c1,c0,c2,f)
A1=sanc0603gfunc2(f,c1);
A0=sanc0603gfunc2(f,c0);
A2=sanc0603gfunc2(f,c2);
a1=real(A1);
b1=imag(A1);
a2=real(A2);
b2=imag(A2);
d0=sqrt((a2-a1)^2+(b2-b1)^2);
d1=abs(A1);
d2=abs(A2);
cos=(d1^2+d2^2-d0^2)/(2*d1*d2);
