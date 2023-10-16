% Тема 7. Приклад розв'язання нелінійного рівняння методом Курчатова
% Метод реалізований у функції kurchatov(f,x1,x2,tol,maxiter)

f = @(x) 0.25*x-3*sin(x);			% Функція рівняння f(x) = 0

xx=0:0.25:10;					% Сітка для графіка
yy = f(xx);						% Значення f на сітці
plot(xx,yy,'bo-','LineWidth',1.5)		% Графік функції f(x)
hold on
plot([0 xx(end)],[0 0],'k','LineWidth',1.5)		% Вісь Ох (горизонтальна лінія)
grid on
legend('y = 0.25*x-3*sin(x)')
hold off

x1 = input('Початкове наближення x1 = ');
x2 = input('Початкове наближення x2 = ');
x = kurchatov(f,x1,x2);
if ~isnan(x)
	disp(['Розв''язок х = ',num2str(x)])
else
	disp('Упс...')
end