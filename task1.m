clear, clc

f = @(x) asinh(x/2) - 0.8;
df = @(x) log(x/2 + sqrt(1 + (x/2)^2));
a = 0; b = 2.6;
h = .2;

n = 1 + uint16((b-a)/h);
ls = linspace(a, b, n);
fls = f(ls);

%Interpolation polynom
ipol = polyfit(ls, fls, n-1);

% Differentiation
t = input("Введіть знаення t:");

pd = polyval(polyder(ipol), t);
d = df(t);

%Integration
i = 2:n;
ti = sum((fls(i) + fls(i-1)))*(h/2);
si = integral(f, a, b);

%Results
disp("Похідна від ІП = " + num2str(pd))
disp("Точне значення = " + num2str(d))
disp("Інтеграл по м.трапецій = " + num2str(ti))
disp("Інтеграл по методу Сімпсона = " + num2str(si))