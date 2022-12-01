clear, clc
beep off

% лекція 9 завдання 1
a=0;
b=2;
A=[3,-1;-1,19];
f = @(x, u) A*u;
g = @(ua, ub) [ua(1)-0; ub(2)-2];
sol = bvp4c(f, g, bvpinit(a:0.1:b, [0 0]));
plot(sol.x, sol.y(1, :), 'r-', sol.x, sol.y(2, :), 'r--')
legend("u(1)", "u(2)")