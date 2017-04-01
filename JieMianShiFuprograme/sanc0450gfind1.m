
function cc=sanc0450gfind1(c0,c1,c2,cm1,cm2,f)
A1=sanc0450gfunc2(f,c0);
A1=abs(A1);
A2=sanc0450gfunc2(f,c1);
A2=abs(A2);
A3=sanc0450gfunc2(f,c2);
A3=abs(A3);
A4=sanc0450gfunc2(f,cm1);
A4=abs(A4);
A5=sanc0450gfunc2(f,cm2);
A5=abs(A5);
A=[A1 A2 A3 A4 A5];
    AA=min(A);
    if AA==A1
       cc=c0;
    elseif AA==A2
       cc=c1;
    elseif AA==A3
       cc=c2;
    elseif AA==A4
       cc=cm1;
    elseif AA==A5
       cc=cm2;
    end 
end
   
    