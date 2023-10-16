x=0:0.2:300;
y1=-2*x+220;
y2=(-1/2)*x+130; 
y3=(-5/4)*x+160; 
plot(x, y1, x, y2, x, y3);
grid; 
hold on 
for c=0:60:1460 
y=-3/2*x+c/8; 
plot(x,y,'black');
grid on;
end
 
X=linprog(-[8; 12],[2 4;0.5 0.25;2 2.5;],[440;65;320]) 