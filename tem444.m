f = @(x) x.^5 - 4.*x*2 + 5;			
xx=0:0.25:10;					
yy = f(xx);						
plot(xx,yy,'bo-','LineWidth',1.5)		
hold on
plot([0 xx(end)],[0 0],'k','LineWidth',1.5)		
grid on
legend('y = x.^5 - 4.*x*2 + 5')
hold off
x1 = input('Початкове наближення x1 = ');
x2 = input('Початкове наближення x2 = ');
tol = 1e-8; max_i = 40;
[x,i,err]  = m_cyr (f,x1,x2, max_i,tol);
if err == 0
	disp(strcat('кількість ітерацій = ',num2str(i)))
    disp(strcat('точність = ',num2str(tol)))
    disp(strcat('корінь = ',num2str(x)))
  else
	disp('Щось пішло не так')
end




