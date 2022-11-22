% Ì-פאיכ   mk2_083.m
clear all, close all, clc

syms x;

f = (x^2 + 3) / (x^2 - 3*x + 8);

T = taylor(f); T = collect(simplify((T)))
F = int(T,x)

if collect(simplify(diff(F,x))) == T
    disp('F''(x)=T(x)')
else
    disp('F''(x)#T(x)')
end

ezplot(f,[0,4]), hold on
ezplot(T,[0,4]), hold off, grid on
legend('f(x)', 'T(x)')