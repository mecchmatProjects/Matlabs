clc, close, clear

a = 0; b = 3;
h = 0.2;
% x = linspace(a, b, 1 + uint((b-a)/h));

f = @(x, u) [u(2); sin(2*x*u(1)) + (4.34 + x)*u(2) - 3.3*u(1)];

u0 = [1; 1];

[ts, ys] = Euler(f, [a, b], u0, h);
ax = [-0.2 3.2 -0.2+min(ys(:, 1)) .2+max(ys(:, 1))];
plot(ts, ys(:, 1), 'g')
axis(ax)

[ots,oys] = ode23(f,[a,b],u0);

hold on
plot(ots, oys(:, 1), 'r')

legend('Euler method','ode23')

function [ts,ys] = Euler(f,tv,y0,h)
  t0 = tv(1); T = tv(2);
  N = 1 + uint16((T-t0)/h);
  ts = zeros(N+1,1); ys = zeros(N+1,length(y0));
  t = t0; y = y0;                  % initial point
  ts(1) = t; ys(1,:) = y;
  for i=1:N
    s = f(t,y);                    % evaluate direction field at current point
    y = y + s*h;                   % follow line with slope s from t to t+h
    t = t + h;
    ts(i+1) = t; ys(i+1, :) = y;   % store y(1),y(2) in row of array ys
  end
end

%% task2.m

clc, close, clear

a = 0;    b = 2;					
q = @(x) -(2.4 + x);					
f = @(x) x.^2 .* (1 - 2.1 * sin(x));		
g0 = 1;   g1 = 0;					
F = @(x,u) [u(2);...				
			-q(x)*u(1)+f(x)];
G = @(ua,ub) [ua(1); ...	
				  ub(2) + 2*ub(1) - 1];
x = [a b];							
u_init = [0 0];					
solinit = bvpinit(x,u_init);	
sol = bvp4c(F,G,solinit);		

subplot(2,1,1);
plot(sol.x,sol.y(1,:), 'r-','LineWidth',1.5,'MarkerFaceColor','y')
legend('Function')
grid
subplot(2,1,2);
plot(sol.x,sol.yp(1,:),'b-','LineWidth',1.5,'MarkerFaceColor','y')
legend("Derivative")
grid

%% task3.m
clc, close, clear

syms x

f = @(x) (x.^2 + 1)./(x.^2 + 3*x + 15);
T =  taylor(f, x, 'Order', 4);

F = int(T, x);
dF = diff(F, x);

fplot(f, [0 3])
hold on
fplot(T, [0 3])
grid on
legend("Function", "Derivative")

disp('function')
disp(f)
disp('Series for function')
disp(T)
disp('Integral')
disp(F)
disp('dF')
disp(dF)
