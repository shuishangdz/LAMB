function x5=rayleigh(f,ct)
% x5=0?rayleigh??????
% ct?rayleigh????
% f???
n=3;   %n????
kk=2*pi*f/ct;  %kk???
zb(1:n)=[300,450,700];  %??????
hb(1:n)=[100,150,225];  %??????
md(1:n)=[1800,1900,2000];  %?????
h(1:n-1)=[1,0];            %?????
for k=1:n
    vp(k)=sqrt(ct^2/zb(k)^2-1);
    vs(k)=sqrt(ct^2/hb(k)^2-1);
    t(k)=1-ct^2/(2*hb(k)^2);
    g(k)=ct^2/(2*hb(k)^2);
end
for k=1:n-1
    r(k)=vp(k)^2;
    s(k)=vs(k)^2;
    p(k)=vp(k)*kk*h(k);
    q(k)=vs(k)*kk*h(k);
    a(k)=cos(p(k));
    b(k)=cos(q(k));
    c(k)=sin(p(k))/vp(k);
    d(k)=sin(q(k))/vs(k);
    l(k)=hb(k+1)^2*md(k+1)/(hb(k)^2*md(k));
end
x1=1+vp(n)*vs(n);
x2=t(n)+vp(n)*vs(n);
x3=i*vp(n)*g(n);
x4=-i*vp(n)*g(n);
x5=-t(n)^2-vp(n)*vs(n);
for k=2:-1:1;
    x1=x1/l(k);
    x5=x5*l(k);
    p1=-t(k)*x1+(1+t(k))*x2+x5;
    p2=x1-2*x2-x5;
    p3=g(k)*x3;
    p4=-g(k)*x4;
    p5=-t(k)^2*x1+2*t(k)*x2+x5;
    q1=a(k)*b(k)*p2+c(k)*d(k)*p5-a(k)*d(k)*p3-b(k)*c(k)*p4;
    q2=a(k)*d(k)*s(k)*p2-b(k)*c(k)*p5+a(k)*b(k)*p3-c(k)*d(k)*s(k)*p4;
    q3=b(k)*c(k)*r(k)*p2-a(k)*d(k)*p5-c(k)*d(k)*r(k)*p3+a(k)*b(k)*p4;
   q4=c(k)*d(k)*r(k)*s(k)*p2+a(k)*b(k)*p5+b(k)*c(k)*r(k)*p3+a(k)*d(k)*s(k)*p4;
    x1=q1-q4+2*p1;
    x2=t(k)*q1-q4+(1+t(k))*p1;
    x3=g(k)*q2;
    x4=-g(k)*q3;
    x5=-t(k)^2*q1+q4-2*t(k)*p1;
end
