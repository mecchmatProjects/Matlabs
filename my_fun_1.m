% перше завдання з контрольної роботи
function my_fun_1
    clear 
    clc
    a = 1; 
    b = 4;
    n = 25; 
    h_v = 0.2;
    X = linspace(a, b, n); 
    Y = zeros(1, n);  
    h = 0.01;
    Y(1) = 2; 
    YY = Y;
    for k = 2 : n
        ki = k - 1; y = Y(ki);
        y = runge_kutta_4(@f, X(ki), X(k), h, y);
        Y(k) = y;
        yr = Y(ki);
        [x, y] = ode45(@f, [X(ki) X(k)], yr);
     
        p = length(y); 
        YY(k) = y(p);
    end
    plot(X, Y, 'c.-', X, YY, 'r')
    title(' u''=-(2*sqrt(x)-3)*u)+sin(2*x.^2+2.34*u^2), u(1)=2')
    legend('O(h^4)','ode45')
    
end
function y = runge_kutta_4(f, x1, x2, h, y)

    x = x1;
    while x < x2
        K1 = f(x, y);
        x = x + 0.5.*h;
        K2 = f(x, y + (0.5.*h) .* K1);
        K3 = f(x,y + (0.5.*h).*K2 );
        x = x+h;
        K4 = f(x,y + h.*K3);
        y = y + h/6 .* (K1 + 2.*K2+2.*K3+K4);
    end
end
function P = f(x, u)
    P = -(2*sqrt(x) - 3).*u + sin(2.*x.^2 + 2.34.*u.^2);
end