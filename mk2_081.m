function mk2_081
    clear all, close all, clc

    a = 0; b = 3; hv = 0.2;
    % задання X - сітки виведення розв'язку
    n = 16; X = linspace(a, b, n); 
    Y = zeros(1, n);  % "заготовка" вектора розв'язку

    % обираємо крок із необхідної теоретичної точності O(h^2)=1е-4
    h = 0.01;
    % Початкові умови (Y - м.Рунге-Кутта, YY - ode23)
    Y(1) = 1; YY = Y;
    for k = 2 : n
    % Знаходимо розв'язок на кожному інтервалі виведення
        kp = k - 1; y = Y(kp);
        y = runge_k2(@f, X(kp), X(k), h, y);
        Y(k) = y;
        ye = Y(kp);
        [x, y] = ode23(@f, [X(kp) X(k)], ye);
        % з y беремо кінцеве значення (в точці X(k))
        m = length(y); YY(k) = y(m);
    end

    % будуємо графіки наближених розв'язків
    plot(X, Y, 'b:', X, YY, 'k-')
    title('Задача Коші: u''=(2+0.23x)u+sin(x+2u^2), u(0)=1')
    xlabel('x'), ylabel('u(x)')
    legend('м.Р-К O(h^2)','ode23','Location','Best')
    grid on
end

function v = f(x, u)
% опис функції правої частини рівняння u'=f(x,u)
    v = (2 + 0.23.*x).*u + sin(x + 2.*u.*u);
end

function y = runge_k2(f, xbeg, xend, h, y)
% опис функції м.Рунге-Кутта 2-го порядку точності
%  Вхідні параметри :
%   f    - права частина f(x,u);
%   xbeg - початок інтервалу інтегрування;
%   xend - кінець інтервалу інтегрування;
%   h    - фіксований крок інтегрування;
%   y    - значення функції в точці x=xbeg;
%  Вихідні параметри :
%   y    - значення функції в точці x=xend.
    hh = 0.5 .* h; ht = h; 
    x = xbeg;
    while x < xend
        K1 = f(x, y);
        xp = x; x = x + ht;
        if x > xend
            x = xend; ht = x - xp;
            hh = 0.5 .* ht;
        end
        K2 = f(x, y + ht .* K1);
        y = y + hh .* (K1 + K2);
    end
end