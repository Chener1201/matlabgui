function [x1]= ppdaycung(f,a,b,ss)
syms x;
f= str2func(['@(x)' char(f(x))]);
    x0 = a;
    x1=(a*f(b)-b*f(a))/(f(b)-f(a));
    e=abs(x1-x0);
    while e>= ss
        if f(x1)*f(a)<0
            b=x1;
        else 
             a=x1;
         end
    x0=x1;
    x1=(a*f(b)-b*f(a))/(f(b)-f(a));
    e=abs(x1-x0);
    end
end
