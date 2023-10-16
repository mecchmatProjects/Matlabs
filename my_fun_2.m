%друге завдання в контрольній роботі
function my_fun_2
clc
a = 0; 
b = 2; 
m = 51;
N = 70;
xx = linspace(a,b,m);
yy = [0,1];
sol_init = bvpinit(xx,yy);
sol = bvp4c(@P, @D, sol_init);
x = linspace(a,b,N);
Y = deval(sol,x);
subplot(1,2,1)
plot(x,Y(1,:),'b--o')
axis([-1 2 -1 2])
title('u(x)') 
subplot(1,2,2)
plot(x,Y(2,:),'c*')
axis([-1 2 -1 2])
title('u`(x)')
end
function er = D(ya,yb)
er = [ya(2)+ya(1); yb(2)+2*ya(1)-2];
end
function dr = P(x,y)
dr = [y(2); 6.*x.*sin(2.*x)+2.45.*sqrt(x+4).*y(1) ];
end