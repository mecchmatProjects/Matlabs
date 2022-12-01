clear, clc
beep off

% лекція 8 завдання 4
u0 = [1, 1]';
A = @(x, u) [998, 1998; -999, -1999]*u;
[x1, u1] = ode23s(A, [0 2], u0);
[x2, u2] = ode45(A, [0 2], u0);
disp("Число обумовленості")
cond([998, 1998; -999, -1999])
plot(x1, u1(:, 1), 'r-', x1, u1(:, 2), 'r--', x2, u2(:, 1), 'b-', x2, u2(:, 2), 'b--');