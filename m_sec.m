function [x,i,err] = m_sec(f,x,x1,max_i,tol)
    switch nargin
	case [0 1 2]
		x = NaN;
		warning('m_sec: Недостатня кількість аргументів')
		return
	case 3
		tol = 1e-4;   
        max_i = 1e6;
	case 4
		tol = 1e-4;
    end
    if ~(max_i>0 && tol > 0 && tol < 1)
        x = NaN;
		warning('m_sec: Невірні параметри')
		return
    end
    
    prev = x;
    curr = x1;
    for m = 1:max_i
        new = curr - f(curr) * (curr - prev) / (f(curr) - f(prev));
        prev = curr;
        curr = new;
        x=curr;
        i=m;
        err=abs(curr-prev);
        if abs(curr - prev) < tol
            return
        end
    end
end