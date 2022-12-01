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