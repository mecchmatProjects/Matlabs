%%  pl11_5.m
clear; clc
syms x h;
zmh = sym('u(x-h)');
z0h = sym('u(x)');
zph = sym('u(x+h)');
sm = taylor(zmh, 7, x, h);
sp = taylor(zph, 7, x, h);
Oh = simplify((sm-2*z0h+sp)/h^2-diff(z0h,x,2));
Oh = subs(Oh, x, 'Xi'); Oh = collect(Oh);
z = char(Oh); k = findstr(z,'h'); z = z(k(end-1)+3:end);
Oh = simple(sym(z))
