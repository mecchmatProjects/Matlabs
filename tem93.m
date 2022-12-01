clear, clc
beep off

% лекція 9 завдання 2
a=0;
b=1;
f = @(x, u) [u(2); u(3); u(4); sin(1-x)+u(2)*x^2-4*u(1)];
g = @(ua, ub) [ua(1)-2;ub(1)-1;ub(2)-2;ub(3)];
sol = bvp4c(f, g, bvpinit(a:0.05:b, [0 0 0 0]));
plot(sol.x, sol.y(1, :), 'r-')