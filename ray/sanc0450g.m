 
clear
clc
m=1;
df=5000;
dc=500;     %用df和dc的目的用于计算群速度。
for f=50:df:1000000
    for c=10:dc:8000
      tol=100;
      while tol>10;%从c循环中取一个速度，然后确定这个速度周围当中行列式最小的值。
      c1=c+tol;
      c2=c+2*tol;
      cm1=c-tol;
      cm2=c-2*tol;
      c=sanc0450gfind1(c,c1,c2,cm1,cm2,f);%五点二分法找出极小值（粗略求解）   
      tol=tol/2;
      end    
      c1=c-tol;
      c2=c+tol;
      cos=sanc0450gpan1(c1,c,c2,f);%精确求解
      if cos<=0;%精确求解
          u(m)=f;
          v(m)=c;
          if m>=2
              ddc=v(m)-v(m-1);
              ddf=u(m)-u(m-1);
              cg(m)=v(m)-u(m)*0.001*ddc/ddf;   %群速度表达式，忽略了厚度。本应 cg=c*(1-f*d*dc/dfd)
          end
          m=m+1;
      end
    end
end


plot(u/1000000,v/1000,'r.')
hold on;
xlabel('f(MHz)')
ylabel('c(km/s)')
 
wv=[u;v];   


