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