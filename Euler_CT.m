function [x,y] = Euler_CT(fxy,xdau,xcuoi,y0,N)
syms x y;
fxy = str2func(['@(x,y)' char(fxy(x,y))]);
h = abs(xcuoi-xdau)/N;
x = xdau:h:xcuoi;
y = x;
y(1) = y0;
for i = 1:length(y)-1
    y(i+1) = y(i) + (h/2)*fxy(x(i), y(i));
    y(i+1) = y(i) + h*fxy(x(i)+h/2, y(i+1));
end
end