clear all, clc;
a=0;
b=3;
h=0.2;
y0=1;
z0=1;
[x,y]=euler_mod(a,b,h,y0,z0);
disp([x' y'])
%%%%ode23%%%%
[t,Y] = ode23(@vdp1,[0 3],[1;1]);
plot(x,y,t,Y(:,1))
grid on
xlabel('x')
ylabel('y')
title('solution')
legend('ye','yt')
function dydt = vdp1(t,y)
dydt = [y(2); sin(2 * t * y(1)) - 3.3 * y(1) + (4.34 + t) * y(2)];
end

function [x,y] = euler(a,b,h,y0,z0)
n = (b-a)/h;
x(1) = a;
y(1) = y0;
z(1) = z0;
for i=1:n
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + h * z(i);
    z(i+1) = z(i) + h * (sin(x(i) * y(i) * 2) - 3.3 * y(i) + (4.34 + x(i)) * z(i));
end
y=y;
end
