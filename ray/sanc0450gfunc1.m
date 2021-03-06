function BB2=sanc0450gfunc1(f,c)
%%参数输入parametic

d1=0.001; %单位为米(m)
d2=0.003;

e1=4.12e9;   %第一层有机玻璃弹性模量
v1=0.393;   %第一层有机玻璃泊松比
rou1=1180;%第一层有机玻璃密度（氮化硅）
% %钢声学参数
% e2=204e9;   %第一层基体弹性模量
% v2=0.288;   %第一层基体泊松比
% rou2=7852;%第二层基体密度（钢）
%铝声学参数
e2=72e9;   %第一层基体弹性模量
v2=0.33;   %第一层基体泊松比
rou2=2700;%第二层基体密度（钢）

%% 主体程序

%第一层空气底部
D1b=[1 0
     0 1
     0 0
     0 0];
 
%第二层陶瓷涂层
u1=0.5*e1/(1+v1);   %第一层陶瓷涂层拉梅常数
r1=v1*e1/((1+v1)*(1-2*v1));   %第一层陶瓷涂层拉梅常数
c1l=sqrt((r1+2*u1)/rou1);c1t=sqrt(u1/rou1);
a11=sqrt((c/c1l)^2-1);a12=-a11;a13=-sqrt((c/c1t)^2-1);a14=sqrt((c/c1l)^2-1);
W11=a11;W12=-a11;
W13=-1/a13;W14=1/a13;
D111=u1*((a13)^2-1);D112=u1*((a13)^2-1);
D113=-2*u1;
D121=2*u1*a11;D121=2*u1*a11;
D123=u1*((a13)^2-1)/a13;D124=-u1*((a13)^2-1)/a13;

X1=[1     1     1    1     
    W11  -W11  W13  -W13   
    D111 D111 D113  D113   
    D121 -D121 D123 -D123];

 E11=exp(sqrt(-1)*a11*d1*2*pi*f/c);
 E12=exp(-sqrt(-1)*a11*d1*2*pi*f/c);
 E13=exp(sqrt(-1)*a13*d1*2*pi*f/c);
 E14=exp(-sqrt(-1)*a13*d1*2*pi*f/c);

 %======计算B1==========
 D1=[E11 0 0 0
     0 E12 0 0
     0 0 E13 0
     0 0 0 E14];
 B1=X1*D1*inv(X1);
 
 
 D2t=[0 0 0 0
     0 0 0 0   
     D111 D111/E12 D113  D113/E14   
     D121 -D121/E12 D123 -D123/E14];
   
 D2b=[E11     1     E13    1     
    W11*E11  -W11  W13*E13  -W13   
    D111*E11 D111 D113*E13  D113   
    D121*E11 -D121 D123*E13 -D123];
 

  
 %第三层陶瓷基体 
u2=0.5*e2/(1+v2);   %第一层基体拉梅常数
r2=v2*e2/((1+v2)*(1-2*v2));   %第一层基体拉梅常数
c2l=sqrt((r2+2*u2)/rou2);c2t=sqrt(u2/rou2);
a21=sqrt((c/c2l)^2-1);a22=-a21;a23=-sqrt((c/c2t)^2-1);a24=sqrt((c/c2l)^2-1);
W21=a21;W22=-a21;
W23=-1/a23;W24=1/a23;
D211=u2*((a23)^2-1);D212=u2*((a23)^2-1);
D213=-2*u2;
D221=2*u2*a21;D221=2*u2*a21;
D223=u2*((a23)^2-1)/a23;D224=-u2*((a23)^2-1)/a23;

X2=[1     1     1    1     
    W21  -W21  W23  -W23   
    D211 D211 D213  D213   
    D221 -D221 D223 -D223];

 E21=exp(sqrt(-1)*a21*d2*2*pi*f/c);
 E22=exp(-sqrt(-1)*a21*d2*2*pi*f/c);
 E23=exp(sqrt(-1)*a23*d2*2*pi*f/c);
 E24=exp(-sqrt(-1)*a23*d2*2*pi*f/c);

 %======计算B1==========
 D2=[E21 0 0 0
     0 E22 0 0
     0 0 E23 0
     0 0 0 E24];
 B2=X2*D2*inv(X2); 
 
 E21m=exp(sqrt(-1)*a21*d2*pi*f/c);%本来是d2*2*pi*f/c，因为是在板的中间，故板厚为原来的一般，才有了式中没有2的原因。在半中间做的原因是对称和反对称之间的关系在中间层可以有判断条件。
 E22m=exp(-sqrt(-1)*a21*d2*pi*f/c);
 E23m=exp(sqrt(-1)*a23*d2*pi*f/c);
 E24m=exp(-sqrt(-1)*a23*d2*pi*f/c);

 DD=[E21m 0 0 0
     0 E22m 0 0
     0 0 E23m 0
     0 0 0 E24m];
B2m=X2*DD*inv(X2);%三层模型时，在半中间做的原因是对称和反对称之间的关系在中间层可以有判断条件。
 
 
D3t=[1     1/E22     1    1/E24     
    W21  -W21/E22  W23  -W23/E24   
    D211 D211/E22 D213  D213/E24   
    D221 -D221/E22 D223 -D223/E24];
    
D3b=[0 0 0 0
    0 0 0 0
    D211*E21 D211 D213*E23  D213   
    D221*E21 -D221 D223*E23 -D223];%二层模型时，

D4t=[1 0
     0 1
     0 0
     0 0]; %二层模型时，此处收尾。
 
 
D3b3=[E21     1     E23    1     
    W21*E21  -W21  W23*E23  -W23   
    D211*E21 D211 D213*E23  D213   
    D221*E21 -D221 D223*E23 -D223];%三层模型时，

D4t3=[1     1/E12     1    1/E14     
    W11  -W11/E12  W13  -W13/E14   
    D111 D111/E12 D113  D113/E14   
    D121 -D121/E12 D123 -D123/E14];%三层模型时，上下均为陶瓷涂层，因此第四层和第二层中陶瓷涂层一样参数

D4b3=[0 0 0 0
    0 0 0 0     
    D111 D111 D113  D113   
    D121 -D121 D123 -D123];%三层模型时，上下均为陶瓷涂层，因此第四层和第二层中陶瓷涂层一样参数

 D5t=[1 0
     0 1
     0 0
     0 0];%三层模型时，


 
 D2=[D1b -D2t zeros(4,4) zeros(4,2)
     zeros(4,2) D2b -D3t zeros(4,2)
     zeros(4,2) zeros(4,4) D3b -D4t];%二层模型时，全局矩阵法

 D3=[D1b -D2t zeros(4,4) zeros(4,4) zeros(4,2)
     zeros(4,2) D2b -D3t zeros(4,4) zeros(4,2)
     zeros(4,2) zeros(4,4) D3b3 -D4t3 zeros(4,2)
     zeros(4,2) zeros(4,4) zeros(4,4) D4b3 -D5t];%三层模型时，全局矩阵
 
 
 

 
% %  %%% 1、传递矩阵法计算陶瓷涂层频散特性，三层模型，上下为陶瓷涂层，中间为基体，各向同性。
  B=B1*B2*B1;
  BB1=B(3:4,1:2); %%不区分对称模型和非对称模型
  BB2=det(BB1);
% %  
 %%% 2、传递矩阵法计算陶瓷涂层频散特性，三层模型，上下为陶瓷涂层，中间为基体，各向同性。
%  Bm=B2m*B1;
%  BB1=B([2,4],1:2) %%对称模型
%  BB2=det(BB1);
%  
%%% 3、传递矩阵法计算陶瓷涂层频散特性，三层模型，上下为陶瓷涂层，中间为基体，各向同性。
%  Bm=B2m*B1;
%  BB1=B([1,3],1:2) %%反对称模型
%  BB2=det(BB1);
%  
% 
% %% 4、全局矩阵法计算陶瓷涂层，二层模型，各向同性。
%    BB2=det(D2);
%  
%  %%% 5、全局矩阵法计算陶瓷涂层，三层模型，各向同性。
% BB2=det(D3);
 
end

  
