function [y] = runge_kutta(f,x,y0,max_i,tol)
    switch nargin
	case [0 1 2]
		y = NaN;
		warning('runge_kutta: Недостатня кількість аргументів')
		return
	case 3
		tol = 1e-6;   
        max_i = 1e6;
	case 4
		tol = 1e-6;
    end
    
    if ~(max_i>0 && tol > 0 && tol < 1)
        y = NaN;
		warning('runge_kutta: Невірні параметри')
		return
    end
    
    y=zeros(1, length(x));
    y(1)=y0;
    for i = 2:length(y)
        h=x(i)-x(i-1);
        k1=f(x(i-1),y(i-1));
        k2=f(x(i-1)+h/3,y(i-1)+k1*h/3);
        k3=f(x(i-1)+2*h/3,y(i-1)+2*k2*h/3);
        y(i)=y(i-1)+4*h*(k1+3*k3);
    end
end