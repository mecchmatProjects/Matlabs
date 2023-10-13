%% pl7_1.m
% Побудова графіка бігучої хвилі по нескінченній струні
clear all, close all, clc
% знаходимо загальний розв'язок одновимірного хвильового рівняння :
maple('eq:=pdsolve(diff(u(x,t),t,t)-a^2*diff(u(x,t),x,x)=0, u(x,t))');
maple 'q2:=subs([_F1=F1,_F2=F1, a=2],eq)'; % виконуємо підстановки
u = maple('rhs(q2)');                      % u - рядкового типу  
U = @(x,t)eval(u);                         % eval - обчислює рядковий вираз
x = linspace(-10,10,201);                  % задаємо сітку по x
Ni = 51;
SNi1 = int2str(Ni/2); SNi2 = int2str(Ni);  % номера стоп-кадрів
t = 0; tay = 0.1;
for i = 1:Ni                               % номер кадра анімації
   y = U(x,t);
   plot(x,y,'LineWidth',2); axis([x(1),x(end), -0.5, 2.2]), grid on
   legend(strcat('u(x,',num2str(t),')'))
   M(i) = getframe;                        % зберігаємо графік в масиві кадрів
   switch int2str(i)
       case {'1',SNi1,SNi2}
           pause
   end
   t = t+tay;
end
movie(M);                                  % анімація