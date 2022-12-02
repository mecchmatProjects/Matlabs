% варіант 2
clear, clc

n = 7;
b=[1:n]';
A = wilkinson(n);
A = A * A';
for i=1:n
    A(i, i) = A(i, i) + 15*(i-1);
end
disp("Розв'язок, отриманий факторизацією:")
x = fact_LU(A, b)
disp("Розв'язок, отриманий знаходженням оберненої матриці:")
x=inv(A)*b;
x=x'