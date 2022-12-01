clear, clc
beep off

% лекція 8 завдання 1-3
h=0.1;
a=0;
b=2;
y0=0.5;

f_cau = @(x, y, h) [2*h*x^2, x+x^3, 2*h*x-y*(x+x^3), 1+x^2, -y*(1+x^2)-h*(x^2+x^4)];
f_ode23 = @(x, y) transpose((-2.*x.*y.^2)./(1+x.^2)+(x.^2)./(1+x.*y.^2));

y_prev_cau = y0;
y_prev_symm = y0;
y_cau = [y_prev_cau];
y_symm = [y_prev_symm];
for x = a+h:h:b
    r_cau = roots(f_cau(x, y_prev_cau, h));
    y_prev_cau = r_cau(imag(r_cau) == 0 & real(r_cau) > 0);
    y_cau = [y_cau, y_prev_cau];

    r_symm = roots(f_cau(x, y_prev_symm+0.5*h*f_ode23(x, y_prev_symm), 0.5*h));
    y_prev_symm = r_symm(imag(r_symm) == 0 & real(r_symm) > 0);
    y_symm = [y_symm, y_prev_symm];
end
[t_ode, y_ode] = ode23(f_ode23, [a b], [0.5]);
plot(a:h:b, y_cau, 'b', a:h:b, y_symm, 'g', t_ode, y_ode, 'r');
