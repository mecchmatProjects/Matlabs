%%  pl11_7.m
clear; clc
syms x y z;
n = 3; M = [1, 2, 3; -4, 5, 6;7, -8, 9];
% Чи лежать точки на одній прямій ?
p = (M(3,:)-M(1,:))./(M(2,:)-M(1,:));
if p-p(1)==0
   disp('Точки лежать на одній прямій !')
else
   p = [x,y,z] 
   A = [p,1;M,ones(n,1)]
   d = det(A)
   P = sym(strcat(char(d),'=0'))

   disp('Рівняння площини :'); 
   disp(P);
   N = zeros(1,n); 
   A = eye(n);
   D = subs(d, p, N);
   for k = 1 : n
      N(k) = simplify(subs(d, p, A(k,:)) - D);
   end
   disp('Координати нормального вектора площини :'); disp(N);
   if D
      b = ' не';
   else
      b = '';
   end
   b = strcat('Площина',b,' проходить через O(0,0,0)');
   disp(b);
end
