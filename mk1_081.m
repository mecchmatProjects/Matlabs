% mk1_081.m
clear all, clc

f = @(x)(sinh(0.5.*x)+2);

a = 6; b = 8; h = 0.2; n = 10;
x = linspace(a,b,n+1);  %  обчислюємо вектор сітки
y = f(x);             %  обчислюємо функцію на сітці

P = polyfit(x,y,n); % будуємо інтерполяційний поліном (ІП)
dP = polyder(P);      % обчислюємо похідну від ІП

while 1               % захищене введення t є [a,b]
    t = input('? t=');
    if a <= t & t <= b
        break
    end
end
dPt = polyval(dP, t);     % значення ІП в точці t
dft = 0.5.*cosh(0.5.*t);  % njxyt значення f'(t) 
disp(strcat('Похідна від ІП=',num2str(dPt),...
     '  Точне значення=',num2str(dft)))

it = h .* trapz(y);  %  м.трапецій з рівномірним кроком h
is = quad(f, a, b); %  м.Сімпсона для функції f(x) на відрізку [a,b]
disp(strcat('Інтеграл по м.трапецій=',num2str(it),...
     '  по Сімпсону=',num2str(is)))