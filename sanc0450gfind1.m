
function c=sanc0450gfind1(c0,c1,c2,cm1,cm2,f)
A1=sanc0603gfunc2(f,c0);
A1=abs(A1);
A2=sanc0603gfunc2(f,c1);
A2=abs(A2);
A3=sanc0603gfunc2(f,c2);
A3=abs(A3);
A4=sanc0603gfunc2(f,cm1);
A4=abs(A4);
A5=sanc0603gfunc2(f,cm2);
A5=abs(A5);
A=[A1 A2 A3 A4 A5];
    AA=min(A);
    if AA==A1
       c=c0;
    elseif AA==A2
       c=c1;
    elseif AA==A3
       c=c2;
    elseif AA==A4
       c=cm1;
    elseif AA==A5
       c=cm2;
    end 
   
    