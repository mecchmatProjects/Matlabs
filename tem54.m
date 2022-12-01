clear, clc
f = @(x) exp(-0.1.*x.^2).*cos(2.*x);
n = 20;
a = 0;
b = pi;
X = linspace(a, b, n+1);
Y = f(X);
T = linspace(a, b, 10*n+1);

% сплайн нульового степеня
F0(:) = interp1(X, Y, T, 'nearest');

% сплайн першого степеня
F1(:) = interp1(X, Y, T, 'linear');

% сплайн третього степеня
F3(:) = interp1(X, Y, T, 'spline');

plot(T, F0, "b-", T, F1, "r-", T, F3, "g-")