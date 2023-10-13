function pl8_2
%% Приклади використання солверів для жорстких СЗДР
%  Застосування м.Роте для початково-крайової задачі
%  для рівняння Кортевега-де Фріза з періодичними
%  крайовими умовами на відрізку x Є [l,r].
clear all, close all, clc
global A B n3 n2 n1 n

% параметри крайової задачі :
T = 30; l = 0; r = 2.*pi; b = 0.1;
% завдання просторової сітки :
n = 93; x = linspace(l, r, n);
% завдання сітки отримання розв'язку :
m = 75; Tt = linspace(0, T, m);

U0 = @(x)(sin(x));   % функція початкових умов
Y0 = (U0(x))';       % вектор початкових умов

% допоміжні величини :
n1 = n-1; n2 = n-2; n3 = n-3; h = x(2)-x(1);
A = -1./(6.*h); B = -b./(2.*h.^3);

[t, Y] = ode23s(@pl8_2f, Tt, Y0);  % розв'язання задачі

% побудова сіток для виведення графіка розв'язку
[Mx, Mt] = meshgrid(x, t');
% виведення графіка наближеного розв'язку u(x,t)
surfl(Mx, Mt, Y)
shading interp, colormap pink
title('КЗ для рівняння Кортевега-де Фріза')
xlabel('x'), ylabel('t'),zlabel('u')
pause
contour(Mx, Mt, Y, 10)
xlabel('x'), ylabel('t')
colormap hsv
disp(strcat('Виконання 1-го закону збереження(імпульсу)=',...
            num2str(abs(h.*trapz(Y0-Y(m,:)')),13)))
disp(strcat('Виконання 2-го закону збереження (енергії)=',...
            num2str(abs(h.*trapz(Y0.^2-Y(m,:).^2')),13)))
end


function F = pl8_2f(t, U)     %  опис підфункції
% функція правої частини системи
    function f = fs   % вкладена функція
        f = A.*(U(kp)+U(k)+U(km)).*(U(kp)-U(km))+ ...
            B.*(U(kpp)-2.*(U(kp)-U(km))-U(kmm));
    end
    global A B n3 n2 n1 n
    F = zeros(n, 1);
    kmm = n2; km = n1; k = 1; kp = 2; kpp = 3; F(k) = fs();
    kmm = n1; km = n;  k = 2; kp = 3; kpp = 4; F(k) = fs();
    for k = 3 : n2
        kmm = k-2; km = k-1; kp = k+1; kpp = k+2; F(k) = fs();
    end
    kmm = n3; km = n2; k = n1; kp = n; kpp = 2; F(k) = fs();
    kmm = n2; km = n1; k = n;  kp = 2; kpp = 3; F(k) = fs();
end



