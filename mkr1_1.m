f = @(x) sinh(2*x);
fd = @(x) 2*cos(2*x);
a = -1.8;
b = 1.2;
h = 0.2;
n = (b-a)/h;
x = a:h:b;
y = f(x);
t = input("t: ");

p = polyfit(x, y, n); % інтерполяційний поліном
pd = polyder(p); % похідна від ІП
id = fd(t); % Похідна від ІП
f_der = polyval(pd, t); % Точне значення
trapz_integral = trapz(x, y); % Інтеграл по м.трапецій
simp = integral(f, a, b); % по Сімпсону

disp("Похідна від ІП=" + id + " Точне значення=" + f_der);
disp("Інтеграл по м.трапецій=" + trapz_integral + " по Сімпсону=" + simp);