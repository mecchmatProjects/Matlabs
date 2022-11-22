function mk2_082
    clear all, close all, clc
    
    %Створюємо структуру sol_init початкових даних із m точок,
    %рівномірно розподілених на відрізку [a, b] зі значенями y=[1; 2]
    a = 0; b = 2; m = 51;
    xx = linspace(a, b, m); yy = [1; 2];
    sol_init = bvpinit(xx, yy);
    
    % Розв'язуємо задачу :
    sol = bvp4c(@F, @G, sol_init);
    
    % Виведення результатів на згученій сітці:
    N = 101; x = linspace(a, b, N);
    Y = deval(sol, x);

    % побудова 2-х підграфіків :
    subplot(1,2,1)     % для u(x)
    plot(x, Y(1,:),'k -')
    axis([-0.1 2.1 -1.1 2.1])
    title('Розв''язання КЗ для ЗДР')
    xlabel('x'), ylabel('u(x)')
    legend('u(x)','Location','Best'), grid on
    
    subplot(1,2,2)     % для u'(x)
    plot(x, Y(2,:),'r :')
    axis([-0.1 2.1 -1.1 2.1])
    title('Похідна від розв''язку КЗ')
    xlabel('x'), ylabel('u''(x)')
    legend('u''(x)','Location','Best'), grid on  
end

function dydf = F(x, y)
% опис функції правої частини рівняння U'=F(x,U)
    dydf = [y(2); cos(2.*x) + (4.6.*x + 1).*y(1)];
end

function bc = G(ya, yb)
% опис крайових умов
    bc = [ya(2)+2.*ya(1); yb(2)-2];
end