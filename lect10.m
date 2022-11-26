function lect10
%% Розв'язання крайової задачі :
% 0 = U1"+3*U1(x,t) + 2*U2(x,t)+sin(x-t),
% dU2/dt = U2" + U1(x,t)*U2(x,t)*exp(x-t),
% U1'(0,t)= 0, U1(1,t) = 1 - t,
% U2(0,t) = t, U2(1,t) = 0.
% U2(x,0) = 0.5 - |x - 0.5|.
% за допомогою вбудованих функцій MATLAB.
clear; clc
m = 0; % плоска задача
xl = 0; xr = 1; x = linspace(xl, xr, 21); % сітка по x
t = linspace(0, 1, 21); % вектор по часу
% Розв'язуємо задачу
sol = pdepe(m, @koefpde, @initpde, @boundpde, x, t);
[X, T] = meshgrid(x, t);
% графіки розв'язку U1(x,t), U1(x,t)
u = sol(:, :, 1);
mesh(X, T, u); colormap gray; view(-8, 12);
title('Функція U1(x,t)');
xlabel('x'); ylabel('t'); pause;
u = sol(:, :, 2);
mesh(X, T, u); colormap gray; view(-15, 36);
title('Функція U2(x,t)');
xlabel('x'); ylabel('t');
function [c, f, s] = koefpde(x, t, u, DuDx)
% коефіцієнти рівняння
c = [0; 1];
f = [DuDx(1); DuDx(2)];
s = [3 .* u(1)+2.*u(2)+sin(x-t); u(1) .* u(2)*exp(x-t)];
function u0 = initpde(x)
% початкова умова
u0 = [0; x .* (1 - x)];
function [pl, ql, pr, qr] = boundpde(xl, ul, xr, ur, t)
% коефіцієнти крайових умов
pl = [-t; ul(2)];
ql = [1; 0];
pr = [ur(1) + t - 1; ur(2)];
qr = [0; 0];
