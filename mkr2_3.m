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