%%% Лихогляд_МКР2
clear all, clc;

xmesh = linspace(0,2,20);
solinit = bvpinit(xmesh, @guess);
sol = bvp4c(@bvpfcn, @bcfcn, solinit);

subplot(2,1,1);
plot(sol.x, sol.y(1,:), '-')
title('y(x)')
grid on

subplot(2,1,2); 
plot(sol.x, sol.y(2,:), '-')
title('dy/dx')
grid on

function dydx = bvpfcn(x,y)
dydx = zeros(2,1);
dydx = [y(2)
     x.^2.*(1-2.1.*sin(x)+y(1).*(2.4+x))];
end

function res = bcfcn(ya,yb)
res = [ya(2)
       yb(1)+2*yb(2)-1];
end

function g = guess(x)
g = [sin(x)
     cos(x)];
end
%%%=======
clear, clc

n = 7;
A = pascal(n);
b = -2 : 4;

B = zeros(7, 8); B(:,1:end-1) = A; B(:, end) = b;
B;
R = rref(B);
disp("Розв'язок вбудованими методами " + num2str(R(:, end)'))

x = fact_LU(A, b, n);
disp("Розв'язок власним методом " + num2str(x));

function x = fact_LU(A, b, n)
    [L, U, P] = lu(A);
    f = P*b';
    %disp(L*U)
    %disp(b)
    % Solve Ly = b for y
    y = zeros(1, n);
    y(1) = f(1)/L(1,1);
    for i = 2:n
        m = 0;
        for j = 1:i-1
            m = m + L(i, j)*y(j);
        end
        y(i) = (f(i) - m)/L(i, i);
    end
    % disp(u)
    % Solve U*x = y
    x = zeros(1, n);
    x(n) = y(n)/U(n, n);
    for i = n-1:-1:1
        m = 0;
        for j = i+1:n
            m = m + U(i, j)*x(j);
        end
        x(i) = (y(i) - m)/U(i, i);
    end
%     x = 0;
end

