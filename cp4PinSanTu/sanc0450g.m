
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
%       u(m)=f;
%       v(m,i)=c;
%       i=i+1;
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

% if i=1;
%             v(m,1)=c;
%          elseif i=2
%              v(m,2)=c;
%          elseif i=3
%              v(m,3)=c;
%          elseif i=4
%              v(m,4)=c;
%          elseif i=5
%              v(m,5)=c;
%          elseif i>=6;
%              v(m,i)=c;
%              
%          end
% figure;
plot(u/1000000,v/1000,'r.')
xlabel('f(MHz)')
ylabel('c(km/s)')

wv=[u;v];   
%fid1=fopen('d:\zhy1\haiyan\data\ch4\sac0750g1.m','wt');
%fprintf(fid1,'\n%d	%d',wv);
%fclose(fid1);

