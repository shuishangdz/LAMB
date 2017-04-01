function  BB2=sanc0450gfunc2(f,c)
%   此处显示详细说明
d1=0.001;
d2=0.001;
A1=sanc0450gfunc11(f,c,d1);

            % A2=sanc0450gfunc11(f,c,d2);
            % A3=A2*A1;
            % A4=A3([3,5,6],1:3);
            % BB2=det(A4)
            
 
            
 x=30*pi/180;
A2=sanc0450gfunc1(f,c,d2,x)
A3=A1*A2*A1;

% 
% A3=A2*A1;
A4=A3([4,5,6],1:3);
BB2=det(A4)



end

