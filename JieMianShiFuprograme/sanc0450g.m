
clear
clf
clc
m=1;
for f=50:20600:3000000
    for c=10:450:4100
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
         
         m=m+1;   
     end
    end 
end

figure(1);
plot(u/1000000,v/1000,'.')
xlabel('f(MHz)')
ylabel('c(km/s)')

% wv=[u;v];   
%fid1=fopen('d:\zhy1\haiyan\data\ch4\sac0750g1.m','wt');
%fprintf(fid1,'\n%d	%d',wv);
%fclose(fid1);

