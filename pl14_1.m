% solution of equation
p=[1 3 2];
x1 = roots(p);
%f(x)= inline('x^2+3*x+2')
x2 = fzero (@f, -1.7);

opts=optimset('fzero');

y = polyder(p)
z = roots(y)

%z1 = diff(@f,1)
%x3 = fzero(@z1,0)
