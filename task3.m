clear, clc

f = @(x) nthroot(5*x + 13.35, 5);
fz = @(x) x - f(x);

[x, i, err] = m_es(f, 1, 1000, 1e-12);
disp("Розв'язок своїм методом " + num2str(x))
zero = fzero(fz, 1);
disp("Розв'язок вбудованим методом " + num2str(zero))


function [x, i, err] = m_es(f, x, max_i, tol)
    if (max_i <= 3) || (tol >= 1) ||  (tol <= 0)
        return
    end
    x0 = x;
    i = 0;
    while i < max_i
        x1 = f(x0);
        % disp(x1)
        x2 = f(x1);
        % disp(x2)
        x3 = (x0*x2 - x1*x1) / (x0 - 2*x1 + x2);
        err = abs(x3-x2);
        if err < tol
            break
        end
        x0 = x3;
        x = x0;
        % disp(x0)
        i = i + 3;
        %disp(i)
    end
end