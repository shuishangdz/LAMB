
function  B1=wyy1(f,c,d1)
%张海燕层状各向异性第45页模型.该程序的目地就是把每一层继续100等分，
% 然后这100等分的厚度分别有一个传递矩阵B=XDU，最后把这个所有的矩阵组装成一个矩阵。然后主程序中就可以从这个组装程序中调用。
%b11=160730000000;
%b12=6440000000;
%b13=6440000000;
%b22=13920000000;
%b23=6920000000;
%b33=13920000000;
%b44=3500000000;
%b55=7070000000;
%b66=7070000000;
%rou=1200;
b11=143800000000;
b12=6200000000;
b13=6200000000;
b22=13300000000;
b33=13300000000;
b23=6500000000;
b44=3600000000;
b55=5700000000;
b66=5700000000;
rou=1560;

%==
x1=0;
G1=cos(x1);S1=sin(x1);
c111=b11*G1^4+b22*S1^4+2*(b12+2*b66)*S1^2*G1^2;
c112=(b11+b22-4*b66)*S1^2*G1^2+b12*(S1^4+G1^4);
c113=b13*G1^2+b23*S1^2;
c116=(2*b66+b12-b11)*S1*G1^3+(b22-b12-2*b66)*G1*S1^3;
c122=b11*S1^4+2*(b12+2*b66)*S1^2*G1^2+b22*G1^4;
c123=b23*G1^2+b13*S1^2;
c126=(b12+2*b66-b11)*G1*S1^3+(b22-b12-2*b66)*S1*G1^3;
c133=b33;
c136=(b23-b13)*S1*G1;
c145=(b44-b55)*S1*G1;
c144=b44*G1^2+b55*S1^2;
c155=b55*G1^2+b44*S1^2;
c166=(b11+b22-2*b12-2*b66)*S1^2*G1^2+b66*(S1^4+G1^4);
%===
A11=c133*c155;
A12=c155*(c155-rou*c^2)+c133*(c111-rou*c^2)-(c113+c155)^2;
A13=(c155-rou*c^2)*(c111-rou*c^2);
AB1=[A11 0 A12 0 A13];%张海燕层状介质第45页（3.52）数学模型
[mm1,nn1]=size(AB1);

% if nn1<5
%    return%break
% end

AC1=roots(AB1);
a11=AC1(1);a12=AC1(2);a13=AC1(3);a14=AC1(4);
a15=sqrt((rou*c^2-c166)/c144);
a16=-a15;
W11=(rou*c^2-c111-c155*a11^2)/((c113+c155)*a11);
W13=(rou*c^2-c111-c155*a13^2)/((c113+c155)*a13);
D111=c113+c133*a11*W11;
D113=c113+c133*a13*W13;
D121=c155*(a11+W11);
D123=c155*(a13+W13);
D135=c144*a15;
X1=[1     1     1    1     0    0
    0     0     0    0     1    1
    W11  -W11  W13  -W13   0    0
    D111 D111 D113  D113   0    0
    D121 -D121 D123 -D123  0    0
    0     0    0     0    D135 -D135];
 [m,n]=size(d1);
 m=1;
 B2=[];%给矩阵B2定义
 while m<=n
 E11=exp(sqrt(-1)*a11*d1(m)*2*pi*f/c);
 E12=exp(-sqrt(-1)*a11*d1(m)*2*pi*f/c);
 E13=exp(sqrt(-1)*a13*d1(m)*2*pi*f/c);
 E14=exp(-sqrt(-1)*a13*d1(m)*2*pi*f/c);
 E15=exp(sqrt(-1)*a15*d1(m)*2*pi*f/c);
 E16=exp(-sqrt(-1)*a15*d1(m)*2*pi*f/c);
 D1=[E11 0 0 0 0 0
     0 E12 0 0 0 0
     0 0 E13 0 0 0
     0 0 0 E14 0 0
     0 0 0 0 E15 0
     0 0 0 0 0 E16];
  B1=X1*D1*inv(X1);
  B2=[B2;B1];  %B2为一矩阵，该矩阵的每6层为其中某层的传递矩阵。
  m=m+1;
end
B1=B2;
end

  

