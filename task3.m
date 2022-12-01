clc, close, clear

syms x

f = @(x) (x.^2 + 1)./(x.^2 + 3*x + 15);
T =  taylor(f, x, 'Order', 4);

F = int(T, x);
dF = diff(F, x);

fplot(f, [0 3])
hold on
fplot(T, [0 3])
grid on
legend("Function", "Derivative")

disp('function')
disp(f)
disp('Series for function')
disp(T)
disp('Integral')
disp(F)
disp('dF')
disp(dF)
