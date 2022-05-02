function [x,y] = Euler(fxy,xdau,xcuoi,y0,N)
syms x y;
fxy = str2func(['@(x,y)' char(fxy(x,y))]);
h = abs(xcuoi-xdau)/N;
x = xdau:h:xcuoi;
y = zeros(1, N+1);
y(1) = y0;
for i = 1:N
    y(i+1) = y(i) + h*fxy(x(i),y(i));
end
end
