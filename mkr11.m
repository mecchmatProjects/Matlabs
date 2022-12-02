% варіант 2
clear, clc

f = @(x) sinh(x/3)+2;
f_der = @(x) cosh(x/3)/3;
a = 6.2;
b = 8.4;
h = 0.2;
x = a:h:b;
y = f(x);
n = (b-a)/h;
t = input("Значення дійсного числа t:");

p = polyfit(x, y, n);
p_der = polyder(p);

interpolated_der = f_der(t);
f_der = polyval(p_der, t);

trapz_integral = trapz(x, y);
simp_integral = quad(f, a, b);

disp("Похідна від ІП="+interpolated_der+" Точне значення="+f_der);
disp("Інтеграл по м.трапецій="+trapz_integral+" по Сімпсону="+simp_integral);
