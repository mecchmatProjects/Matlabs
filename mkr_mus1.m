function x = fact_QR(A,b)
[L,U,P]  = lu(A);
x = U \ (L \ (P * b));

% 1.1
function [x,i,err] = m_piter(f,x,max_i,tol)
i=0;
x0=x;

while 1
    x = x0;
    i=i+1;
    df = (f(x+1e-6)-f(x-1e-6))/2e-6;
    g = -1/(df+1);
    if i>max_i
        break
    elseif abs(f(x)) <=tol
        break
    else
        x0 = x + g*f(x);
    end
end

% 1.3
%%%%%%%%%%%%%
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

% 1.3
%%%%%%%%%%%%%%
n = 6;
A = magic(n);
A = A * A';
for i=1:n
    for j=1:n
        if i~=j
            A(i, j) = A(i, j)/15;
        end
    end
end
b = [];
for i=1:n
    b = [b, (-1)^i];
end
b = b' .* diag(A);

disp("Розв'язок fact_QR");
x = fact_QR(A, b)
disp("Розв'язок методами matlab");
x = A\b

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = @(x) (2*x + 10)^(1/4);

disp("методом простих ітерацій");
disp(fminbnd(f, 0, 1));
disp("методом m_piter"); 
disp(m_piter(f, 0, 100, 1e-5))



%2.1
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

% 2.2
clear, clc
a = 0; b = 2;
f = @(x) -(4.6*x + 1);
g = @(x) cos(2*x);
F = @(x, u) [u(2); -f(x)*u(1) + g(x)];
G = @(ua, ub) [ua(2) + 2*ua(1); ub(2) - 2];

t = a:0.05:b;
res = bvp4c(F, G, bvpinit(t, [0 0]));
plot(res.x, res.y(1,:), 'r', res.x, res.y(2,:), 'b')
legend("Розв'язок", "Похідна")
grid on

% 2.3
clear, clc
syms x;
f(x) = (x^2 + 3)/(x^2 - 3*x + 8);
T = taylor(f,x,'Order',5);
F = int(T,x);

if diff(F,x) ~= T
    error('diff(F,x) ~= T');
end

X = 0:0.1:4;
plot(X, f(X), 'r', X, T(X), 'b');
legend("f(x)", "T(x)")
grid on

% runge.m
function y = runge(f, ab, u0, h, tol)
    a = ab(1);
    b = ab(2);
    x = a:h:b;
    y = zeros(1, length(x));
    y(1) = u0;
    for i = 2:length(y)
        ii = i-1;
        k1=f(x(ii), y(ii));
        k2=f(x(i), y(ii) + k1*h);
        y(i)=y(ii) + 0.5*(k1 + k2);
    end
end
