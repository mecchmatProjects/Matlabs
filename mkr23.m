% варіант 17
clear, clc

syms f(x)
f(x) = (x^2)/((x+1)^2+6);
T = taylor(f, x, 6);
f_int = int(T, x);
f_int_diff = diff(f_int, x);

for i=1:10
    if abs(T(i) - f_int_diff(i)) > 0.01
        disp("Помилка інтегрування та диференціювання")
    end
end

t=0:0.1:4;
plot(t, f(t), 'b', t, T(t), 'r');
legend("Задана функція", "Формула Тейлора")
grid on