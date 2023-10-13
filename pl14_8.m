f=inline('x(1)^2+x(1)*x(2)+2*x(2)^2');
x=fmincon(@(x) f(x),[1;1],[],[],[],[],[],[],[[],@(x)nlcon(x)]) 
x1=fminunc(@fff,[3 3])