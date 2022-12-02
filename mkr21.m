% варіант 17
clear, clc

f = @(x, u) sin(x+2*u^2)-(7+x)*u;
a=1;
b=4;
h=0.01;
x=[a:h:b];
u0=1;
u = runge_kutta(f,x,u0,1e6,1e-6);
h_disp = 0.2;
t_rk = a:h_disp:b;
u_rk=u(1:h_disp/h:length(u));
[t_ode, u_ode] = ode45(f,[a b],u0);

plot(t_rk, u_rk, 'b', t_ode, u_ode, 'r');
legend("Розв'язок метолом Рунге-Кутта", "Розв'язок методом ode45")
title("Розв'язки диференціального рівняння")
xlabel("x")
ylabel("u")
grid on