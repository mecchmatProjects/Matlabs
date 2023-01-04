function [x,i,err] = m_piter(f,x,max_i,tol)
i=0;
x0=x;
 
while 1
    x = x0;
    i=i+1;
    df = (f(x+1e-6)-f(x-1e-6))/2e-6;
    g = -1/(df+1);
    if i>max_i
        break
    elseif abs(f(x)) <=tol
        break
    else
        x0 = x + g*f(x);
    end
end