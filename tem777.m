clear, clc
f =@(x) atan(x/2)-1;
a = 1; b = 4;
h = 0.27272727;
n = 11; %якщо n>12 показує (Warning: Polynomial is badly conditioned. 
% Add points with distinct X values, reduce the degree of the polynomial, or try centering
%and scaling as described in HELP POLYFIT. ) тому будемо брати, що n=11
%по формулі n = (b-a)/h, виходить, що n = 15, але якщо взяти h =
%0.27272727, тоді вийде n = 11
df = @(x) 1./(2*(1/4*x^2+1));
X = linspace(a,b,n+1);
Y = f(X);
P = polyfit(X,Y,n);
B = polyder(P);
t = input('Ввести значення t: ');
V = polyval(B, t);
N = df(t);
C = h.*trapz(X);
W = integral(f, a, b,"AbsTol",1e-6);

disp(['Похідна від ІП = ', num2str(V)])
disp(['Точне значення = ', num2str(N)])
disp(['Інтеграл по м.трапецій = ', num2str(C)])
disp(['Інтеграл по Сімпсону = ', num2str(W)])
