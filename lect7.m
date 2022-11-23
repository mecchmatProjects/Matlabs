[x,y]=meshgrid([-10:0.1:10]);
z=(sin(x).*cos(y))./(x.*y);

s=mesh(x,y,z); %графік
s.FaceColor="interp";
hold on

contour3(x,y,z); %лінії рівня
hold off