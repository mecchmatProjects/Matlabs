fminsearch(@ff,0) 
%polyder(ff) 
fzero(inline('2*x+3'),0) 
ff(ans)
function y=fff(x)
y=x(1)^2+x(2)^2;
return

x=fminunc(@fff,[3 3])


function [y,dy]=fff1(x)
y=x(1)^2+x(2)^2; % функци
dy=[2*x(1),2*x(2)]; % градиент

fminunc(@fff1,[3 3],optimset('Gradobj','on'))

x= -1.9;
y=2.0;
f='100*(x(2)-x(1)^2)^2+(1-x(1))^2'; % описание функции 
GRAD='[100*(4*x(1)^3-4*x(1)*x(2))+2*x(1)-2; 100*(2*x(2)-2*x(1)^2)]'; % описание градиента >>OPTIONS = optimset(OPTIONS,'gradobj','on'); % подключение опции градиентного поиска 
[x,fval] = fminunc({f,GRAD},[-1.9, 2],OPTIONS) x = 1.0000 1.0000 fval = 1.2371e-015 % результат 

