4function mk1_083
    clear all, clc

    f = @(x)(x.*x.*(x-2)+3); % опис функції f(x)

    % пошук діапазонів коренів графічним методом
    e = 1;
    while e
        close all  % видаляємо попередній графік
        a = input('? a=');  % лівий інтервал для побудови графіка 
        b = input('? b=');  % правий
        h = input('? h=');  % крок
        X = [a : h : b];    % сітка по x
        plot(X, f(X)); grid on
        e = input('? продовжимо пошук областей з коренями (1-да | 0-ні) =');
    end

    X = input('? Початкові наближення [x0,x1]=\n');
    close all
    x0 = X(1); x = X(2);

    max_i = 50; e = 1e-8;  % ітераційні параметри
    [x, i, err] = m_sec(f, x0, x, max_i, e);
    disp(strcat('Код закінчення m_sec=',int2str(err)))
    if err == 0
        disp('Метод січних :');
        disp(strcat('ітерацій=',num2str(i),...
             ' точність=',num2str(e),...
             ' корінь=',num2str(x)))
        disp(strcat('f(x)    =',num2str(f(x))))
    end

    [x,fx,err] = fminbnd(@(x)(f(x).^2),x0-0.3,x0+0.3,...
                            optimset('TolX',e,'Display','off'));
    disp(strcat('Код закінчення fminbnd=',int2str(err)))
    disp(strcat('Корінь x=',num2str(x)))
    disp(strcat('f(x)    =',num2str(fx)))
end

function [x, i, err] = m_sec(f, x0, x, max_i, tol)
% Метод січних для знаходження кореня  f(x)=0
    if nargin < 5 % неправильна кількість вхідних параметрів
        err = -4; return
    elseif max_i <= 2 % неправильне значення max_i
        err = -3; return
    elseif tol <= 0 | tol >= 1 % точність не в діапазоні (0,1)
        err = -2; return
    end

    f1 = f(x0);
    for i = 2 : max_i
        f0 = f1; f1 = f(x); % одна ітерація - одне обчислення f
        o = (x-x0)./(f1-f0).* f1;
        x0 = x; x = x - o;
        if abs(o) < tol 
            break
        end
    end
    if i == max_i  % корінь НЕ ЗНАЙДЕНО з точністю tol
        err = -1;
    else
        err = 0;   % корінь ЗНАЙДЕНО з точністю tol
    end
end