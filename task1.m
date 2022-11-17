x=1:0.2:3.4;
f=@(x)(atan(x./2)-1.5);
df=@(x)(2./(4+x.^2));
Y=f(x);
syms X;
for i = 1:length(x)
    u = x;
    u(i)=[]; % выкалываем i-й элемент
    P(i,1) = prod(X-u)/prod(x(i)-u); % рассчитываем i-й полином Лагранжа
end
YY = Y*P;
Yx = sym2poly(YY);
q=polyder(Yx);
x0=input('x0=');
dx0=df(x0);
dx0num=polyval(q,x0);
disp('Numerical diff.')
disp(dx0num);
disp('Exact diff.')
disp(dx0)
simpson(1,4)
trap(1,4)


function trap(a,b)
f = ('atan(x./2)-1.5');
F = inline(f);
h = 0.2;
    x = a:h:b;
    n = length(x);
    y = F(x);
    I = h * (y(1) / 2 + y(n) / 2);
    for j=2:n-1
        I = I + h * y(j);
    end
disp("Trap method integral:")
disp(I)
end


function simpson(a,b)
f = ('atan(x./2)-1.5');
F = inline(f);
h = 0.2;
    x = a:h:b;
    n = length(x);
    y = F(x);
    s = F(a)+F(b);
    for j=1:2:n-1
        s = s + 4 * F(a + j * h);
    end
    for j=2:2:n-2
        s = s + 2 * F(a + j * h);
    end
    I = h / 3 * s;
disp("Simpson method integral:")
disp(I)
end

