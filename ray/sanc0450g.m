 
clear
clc
m=1;
df=5000;
dc=500;     %��df��dc��Ŀ�����ڼ���Ⱥ�ٶȡ�
for f=50:df:1000000
    for c=10:dc:8000
      tol=100;
      while tol>10;%��cѭ����ȡһ���ٶȣ�Ȼ��ȷ������ٶ���Χ��������ʽ��С��ֵ��
      c1=c+tol;
      c2=c+2*tol;
      cm1=c-tol;
      cm2=c-2*tol;
      c=sanc0450gfind1(c,c1,c2,cm1,cm2,f);%�����ַ��ҳ���Сֵ��������⣩   
      tol=tol/2;
      end    
      c1=c-tol;
      c2=c+tol;
      cos=sanc0450gpan1(c1,c,c2,f);%��ȷ���
      if cos<=0;%��ȷ���
          u(m)=f;
          v(m)=c;
          if m>=2
              ddc=v(m)-v(m-1);
              ddf=u(m)-u(m-1);
              cg(m)=v(m)-u(m)*0.001*ddc/ddf;   %Ⱥ�ٶȱ��ʽ�������˺�ȡ���Ӧ cg=c*(1-f*d*dc/dfd)
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


