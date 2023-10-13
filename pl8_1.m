function pl8_1
%% Приклади розв'язання задачі Коші для ЗДР
% (рівняння Лотки-Вольтерри) для моделювання
% процесу "хижак-жертва".
clear all, close all, clc
global alf bet
 
alf = 1; bet = 2.5;
Y0 = [1; 1];       % вектор початкових умов
[T, Y] = ode45(@f91, [0 25], Y0); % розв'язання системи
plot(T, Y(:,1), T, Y(:,2),'r','LineWidth',2), grid on
legend('u','v','Location','Best')
title('Модель "хижак-жертва" ( {\alpha} = 1, {\beta} = 2.5 ) ' )
xlabel('t'), ylabel('u,v'), pause, close all
 
plot(Y(:,1), Y(:,2), 'b','LineWidth',2), hold on
alf = 2.5; bet = 1;
[T, Y] = ode45(@f91, [0 25], Y0);
plot(Y(:,1), Y(:,2), 'r','LineWidth',2), grid on
title('Фазові траєкторії')
xlabel('u'), ylabel('v')
ch=legend('{\alpha}=1, {\beta}=2.5',...
    '{\alpha}=2.5,{\beta}=1','Location','Best')
set(ch,'Fontsize',12)
 
function F = f91(t, U)  
% підфункція правої частини системи
global alf bet
F = [U(1).*(1 - alf .*U(2)); U(2).*(bet.*U(1) - 1)];
