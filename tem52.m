clear, clc
a = 0;
b = 10;
n = 10;
X = linspace(a, b, n + 1)
T = linspace(a, b, 10*n + 1);
Y = randi(100, 1, n + 1)

% сплайн нульового степеня
F(:) = interp1(X, Y, T, 'nearest'); 
F
plot(T, F)
grid on