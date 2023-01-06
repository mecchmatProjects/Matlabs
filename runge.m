function y = runge(f, ab, u0, h, tol)
    a = ab(1);
    b = ab(2);
    x = a:h:b;
    y = zeros(1, length(x));
    y(1) = u0;
    for i = 2:length(y)
        ii = i-1;
        k1=f(x(ii), y(ii));
        k2=f(x(i), y(ii) + k1*h);
        y(i)=y(ii) + 0.5*(k1 + k2);
    end
end