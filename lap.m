function [x1]=lap(f,a,b,ss)
syms x;
f = str2func(['@(x)' char(f(x))]);
xi1=a;
x2=f(xi1);
while (abs(x2-xi1)>ss)
    xi1=x2;
    x2=f(xi1);
end
x1=xi1;
end