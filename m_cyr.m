function [x,i,err]  = m_cyr (f,x1,x2,max_i,tol)
if nargin < 5
	err = -4;
elseif max_i <=0
    err = -3;
    return
elseif tol<=0 || tol >=1
    err=-2;
    return
end
for i = 1:max_i
	x = x2 - f(x2)*2*(x2-x1)/(f(2*x2-x1)-f(x1));
	x1 = x2;  x2 = x;
    if abs(x-x2)<tol
		break
    end
end
if i== max_i
    err = -1;
else
    err = 0;
end
end