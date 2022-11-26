clear, clc
syms x;
f = (x + 2)^2 / (x^2 + 4*x + 5);

T = taylor(f,x,'Order',7); %розклад по Тейлору
T = collect(simplify((T))); %спрощення+перетворення в поліном
F = int(T,x); %інтегруємо

if collect(simplify(diff(F,x))) == T
    disp('F`(x)=T(x)')
else
    disp('F`(x)~=T(x)')
end
X=0:0.01:3; %сітка значень Х
ff=subs(f,x,X); %значення f на сітці
TT=subs(T,x,X); %значення Т на сітці
plot(X,ff,'g-',X,TT,'r-'), grid on
legend('f(x)', 'T(x)')