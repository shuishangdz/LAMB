
function B2=sanc0450gfunc1(f,c,d,x)

%完全脱层，这是材料的设置
b11=10000;
b12=10000;
b13=10000;
b22=10000;
b23=10000;
b33=10000;
b44=10000;
b55=10000;
b66=10000;
% %滑移连接
% b11=100;
% b12=100;
% b13=100;
% b22=100;
% b23=100;
% b33=13920000000;
% b44=100;
% b55=100;
% b66=100;

%刚性连接
% b11=160730000000;
% b12=6440000000;
% b13=6440000000;
% b22=13920000000;
% b23=6920000000;
% b33=13920000000;
% b44=3500000000;
% b55=7070000000;
% b66=7070000000;
rou=1200;

   
% x2=(30/180)*pi;
G2=cos(x);S2=sin(x);
c211=b11*G2^4+b22*S2^4+2*(b12+2*b66)*S2^2*G2^2;
c212=(b11+b22-4*b66)*S2^2*G2^2+b12*(S2^4+G2^4);
c213=b13*G2^2+b23*S2^2;
c216=(2*b66+b12-b11)*S2*G2^3+(b22-b12-2*b66)*G2*S2^3;
c222=b11*S2^4+2*(b12+2*b66)*S2^2*G2^2+b22*G2^4;
c223=b23*G2^2+b13*S2^2;
c226=(b12+2*b66-b11)*G2*S2^3+(b22-b12-2*b66)*S2*G2^3;
c233=b33;
c236=(b23-b13)*S2*G2;
c245=(b44-b55)*S2*G2;
c244=b44*G2^2+b55*S2^2;
c255=b55*G2^2+b44*S2^2;
c266=(b11+b22-2*b12-2*b66)*S2^2*G2^2+b66*(S2^4+G2^4);

F211=c211-rou*c^2;
F212=c216;
F213=c213+c255;
F222=c266-rou*c^2;
F223=c236+c245;
F233=c255-rou*c^2;

p21=c244*c233;
p22=F222*c233+F233*c244-F223^2;
p23=F222*F233;
p24=c233*c245;
p25=c233*F212+F233*c245-F213*F223;
p26=F212*F233;
p27=F223*c245-F213*c244;
p28=F212*F223-F213*F222;

det2=p21*c255-p24*c245;
A21=(p21*F211+p22*c255-p24*F212-p25*c245+p27*F213)/det2;
A22=(p22*F211+p23*c255-p25*F212-p26*c245+p28*F213)/det2;
A23=(p23*F211-p26*F212)/det2;
%if det1~=0
AB2=[1 0 A21 0 A22 0 A23];
[mm2,nn2]=size(AB2);
if nn2<7
   return
end

AC2=roots(AB2);
a21=AC2(1);
%a12=AC1(2);
a23=AC2(3);
%a14=AC1(4);
a25=AC2(5);
%a16=AC1(6);

V21=(F223*(F211+c255*a21^2)-(F212+c245*a21^2)*F213)...
   /(F213*(F222+c244*a21^2)-(F212+c245*a21^2)*F223);
W21=a21*(F223*(F211+c255*a21^2)-...
   (F212+c245*a21^2)*F213)/((F212+c245*a21^2)...
   *(F233+c233*a21^2)-F213*F223*a21^2);
V23=(F223*(F211+c255*a23^2)-(F212+c245*a23^2)...
   *F213)/(F213*(F222+c244*a23^2)-...
   (F212+c245*a23^2)*F223);
W23=a23*(F223*(F211+c255*a23^2)-...
   (F212+c245*a23^2)*F213)/((F212+c245*a23^2)...
   *(F233+c233*a23^2)-F213*F223*a23^2);
V25=(F223*(F211+c255*a25^2)-...
   (F212+c245*a25^2)*F213)/(F213*...
   (F222+c244*a25^2)-(F212+c245*a25^2)*F223);
W25=a25*(F223*(F211+c255*a25^2)-...
   (F212+c245*a25^2)*F213)/((F212+c245*a25^2)...
   *(F233+c233*a25^2)-F213*F223*a25^2);
D211=c213+c236*V21+c233*a21*W21;
D213=c213+c236*V23+c233*a23*W23;
D215=c213+c236*V25+c233*a25*W25;
D221=c255*(a21+W21)+c245*a21*V21;
D223=c255*(a23+W23)+c245*a23*V23;
D225=c255*(a25+W25)+c245*a25*V25;
D231=c245*(a21+W21)+c244*a21*V21;
D233=c245*(a23+W23)+c244*a23*V23;
D235=c245*(a25+W25)+c244*a25*V25;

X2=[1    1    1    1     1    1
   V21  V21   V23  V23   V25  V25
   W21  -W21  W23  -W23  W25  -W25
   D211 D211  D213 D213  D215 D215
   D221 -D221 D223 -D223 D225 -D225
   D231 -D231 D233 -D233 D235 -D235];
   
   E21=exp(sqrt(-1)*a21*d*2*pi*f/c);
   E22=exp(-sqrt(-1)*a21*d*2*pi*f/c);
   E23=exp(sqrt(-1)*a23*d*2*pi*f/c);
   E24=exp(-sqrt(-1)*a23*d*2*pi*f/c);
   E25=exp(sqrt(-1)*a25*d*2*pi*f/c);
   E26=exp(-sqrt(-1)*a25*d*2*pi*f/c);
   
   D2=[E21 0   0    0    0    0
       0   E22 0    0    0    0
       0   0   E23  0    0    0
       0   0   0    E24  0    0
       0   0   0    0    E25  0
       0   0   0    0    0   E26];
    
   B2=X2*D2*inv(X2);
  
 
end

  
