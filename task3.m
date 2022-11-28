clear all, clc;
syms x;

f = (x ^ 2 + 1 ) / (x ^ 2 + 3 * x + 15);

Polynom = taylor(f,  x, 'Order', 4);

F = int(Polynom, x);
dF = diff(F, x);

fplot(f, [0 3])
hold on
fplot(Polynom, [0 3])
grid on

disp('function')
disp(F)
disp('Series for function')
disp(Polynom)
disp('Integral')
disp(F)
disp('dF')
disp(dF)