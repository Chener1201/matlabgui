function [x1]= pptt(f,a,b,ss)
syms x;
fxi = str2func(['@(x)' char(f(x))]);
fxi1 = str2func(['@(x)' char(diff(f(x)))]);
fxi2 = str2func(['@(x)' char(diff(diff(f(x))))]);
x0 = 0;
for i=a:ss:b
    if (fxi(i)*fxi2(i))>0
        x1 = i;
        break;
    end
end
while (abs(x1-x0)>ss)
 x0 = x1;
 x1 = x0-fxi(x0)/fxi1(x0);
end
end
