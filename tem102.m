clear, clc

m=0;
xl=0;
xr=1;
x=linspace(xl,xr,21);
t=linspace(0,1,21);

sol = pdepe(m, @koefpde, @initpde, @boundpde, x, t);

[X, T] = meshgrid(x, t); 
u = sol(:, :, 1); 
mesh(X, T, u); colormap gray; view(-8, 12); 
title('Функція U1(x,t)'); 
xlabel('x'); ylabel('t'); pause; 
u = sol(:, :, 2); 
mesh(X, T, u); colormap gray; view(-15, 36); 
title('Функція U2(x,t)'); 
xlabel('x'); ylabel('t'); 

function [c, f, s] = koefpde(x, t, u, DuDx) 
c = [0; 1];
f = [-DuDx(1); DuDx(2)]; 
s = [2.*u(2)-3.*u(1)+sin(x-t); u(1).*u(2).*exp(x-t)];
end

function u0 = initpde(x) 
u0 = [0; x.*(1 - x)];
end

function [pl, ql, pr, qr] = boundpde(xl, ul, xr, ur, t) 
pl = [ul(1); ul(2)-t]; 
ql = [0; 0]; 
pr = [ur(1) + t - 1; ur(2)]; 
qr = [0; 0];
end