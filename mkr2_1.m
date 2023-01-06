% Найбльше значення ode23 ~1e+3, а у Рунге-Кутта ~1e+8
% тому графік значень ode23 виглядає як пряма лінія
clear, clc
f = @(x,u) sin(x + 2*u^2) + u*(2 + 0.23*x);
a = 0; b = 3; h = 0.2;
u0 = 1;
runge_y = runge(f, [a b], u0, h, 1e-4);
[ode23_x, ode23_y] = ode23(f, [a b], u0);

plot(a:h:b, runge_y, 'b', ode23_x, ode23_y, 'r');
legend("Рунге-Кутта 2-го порядку", "ode23");
title("Розв'язки диференціального рівняння");
xlabel("x");
ylabel("u");
grid on;