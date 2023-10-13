
%% pl7_1n.m
% Побудова графіка бігучої хвилі по нескінченній струні
clear all, close all, clc
% знаходимо загальний розв'язок одновимірного хвильового рівняння :
maple('eq:=pdsolve(diff(u(x,t),t,t)-a^2*diff(u(x,t),x,x)=0, u(x,t))');
maple 'q2:=subs([_F1=F1,_F2=F1, a=2],eq)'; % виконуємо підстановки
u = maple('rhs(q2)');              % u - рядкового типу  
U = @(x,t)eval(u);                 % eval - обчислює рядковий вираз
xb = -10; xe = 10; Nx = 201; 
x = linspace(xb,xe,Nx);            % задаємо сітку по x
tb = 0; te = 5; Nt = 51;
T = linspace(tb,te,Nt);            % задаємо сітку по t
save pl7_1n Nx Nt                  % запис Nx,Nt в *.mat файл
fp = fopen('pl7_1n.bin','wb');     % відкриття бінарного файлу
n = fwrite(fp,x,'double');         % збереження x для експорту
disp(n==Nx);
n = fwrite(fp,T,'double');        % збереження T для експорту
disp(n==Nt);
SNi1 = int2str(Nt/2); SNi2 = int2str(Nt);  % номера стоп-кадрів
for i = 1:Nt                      % номер кадра анімації
   t = T(i); y = U(x,t);          % числовий розв'язок в точці t
   n = fwrite(fp,y,'double');     % збереження u(:,t) для експорту
   plot(x,y,'LineWidth',2); axis([x(1),x(end), -0.5, 2.2]), grid on
   legend(strcat('u(x,',num2str(t),')'))
   M(i) = getframe;               % зберігаємо графік в масиві кадрів
   switch int2str(i)              % стоп-кадр для t = tb,(tb+te)/2, te 
       case {'1',SNi1,SNi2}
           pause
   end
end
fclose(fp);                       % закриття бінарного файлу
movie(M);                         % анімація
