% варіант 17
clear, clc

a=0;
b=3;
f = @(x, u) [u(2); 3*exp(-x)+u(1)*(0.3*x.^2+4)-4*u(2)];
g = @(ua, ub) [ua(2)+2*ua(1)-1;ub(2)+2*ub(1)-1];

t = a:0.05:b;
sol = bvp4c(f,g,bvpinit(t, [0 0]));
plot(sol.x, sol.y(1,:), 'b', sol.x, sol.y(2,:), 'r')
legend("Розв'язок", "Похідна розв'язку")
grid on