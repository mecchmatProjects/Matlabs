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