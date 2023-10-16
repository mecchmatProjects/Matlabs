clear,clc

x = -10:.10:10; 
y = -10:.10:10;
[X,Y]=meshgrid(x)
Z =(sin(x).*cos(y))./(x*y);
mesh(X,Y,Z)
contour(X,Y,Z)