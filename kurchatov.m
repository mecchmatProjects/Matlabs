function x = kurchatov (f,x1,x2,tol,maxIter)
% Функція для розв'язання рівняння f(x)=0 методом Курчатова з почат. 
% наближенням x1, x2 та точністю tol.
% Аргументи:
% f - функція рівняння;
% x1, x2 - два початкових наближення;
% tol - точність, необов'язковий, якщо він не заданий, то tol = 1e-4.
% maxIter - максимальна кількість ітерацій в методі Курчатова,
%				необов'язковий, якщо він не заданий, то maxIter = 1e6.
% Результати:
% x - наближений розв'язок рівняння, якщо він знайдений, або 
%		NaN, якщо ні.

switch nargin
	case [1 2]
		x = NaN;
		warning('kurchatov: Недостатня кількість аргументів')
		return
	case 3
		tol = 1e-4;   maxIter = 1e6;
	case 4
		maxIter = 1e6;
end
for i = 1:maxIter
	x = x2 - f(x2)*2*(x2-x1)/(f(2*x2-x1)-f(x1));
	if abs(x-x2)<tol
		return
	end
	x1 = x2;  x2 = x;
end
x = NaN;
warning('newton: Метод розбігається')
end