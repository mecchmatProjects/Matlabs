clear all, clc;

xmesh = linspace(0,2,20);
solinit = bvpinit(xmesh, @guess);
sol = bvp4c(@bvpfcn, @bcfcn, solinit);

subplot(2,1,1);
plot(sol.x, sol.y(1,:), '-')
title('y(x)')
grid on

subplot(2,1,2); 
plot(sol.x, sol.y(2,:), '-')
title('dy/dx')
grid on

function dydx = bvpfcn(x,y)
dydx = zeros(2,1);
dydx = [y(2)
     x.^2.*(1-2.1.*sin(x)+y(1).*(2.4+x))];
end

function res = bcfcn(ya,yb)
res = [ya(2)
       yb(1)+2*yb(2)-1];
end

function g = guess(x)
g = [sin(x)
     cos(x)];
end