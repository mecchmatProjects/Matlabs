%	Тема 3. № 1 Розклад LDL' для 3-діагональної матриці:
%					||c1  a1  0   0  ...  0   0 ||
%					||a1  c2  a2  0  ...  0   0 ||
%			 A =	||0   a2  c3  a3 ...  0   0 ||  =  L * D * L',
%					||..........................||
%					||0   0   0   0  ...  an  cn||
%								
%					||L1   0   0  0 ...  0   0 ||
%					||l1  L2   0  0 ...  0   0 ||
%			 L =	||0   l2  L3  0 ...  0   0 ||,
%					||.........................||
%					||0   0   0  0  ... ln  Ln ||
%
%					||signL1  0  0   0  ...  0  0 ||
%					||0   signL2  0  0  ...  0  0 ||
%			 D =	||0   0   signL3  0 ...  0  0 ||.
%					||............................||
%					||0   0   0  0  ...  0  signL3||
clear,clc
n = input(' Розмір A: n = ');
%============== Вводимо вектори a, c
a = zeros(1,n-1);		

disp('Вектор а')
for i = 1:n-1
	s = ['a(',num2str(i),') = '];
	a(i) = input(s);
end
disp('Вектор c')
c = zeros(1,n);
for i = 1:n
	s = ['c(',num2str(i),') = '];
	c(i) = input(s);
end
%перевіряємо чи виконуються умови діагональної переваги
diagonal=zeros(1,n);
diagonal(1)=logical(abs(c(1))>abs(a(1)));
for i=2:n-1
    diagonal(i)=logical(abs(c(i))>abs(a(i-1))+abs(a(i)));
end
diagonal(n)=logical(abs(c(n))>abs(a(n-1)));
while ~all(diagonal(:)== 1)
    disp('не виконані умови діагональної переваги, введіть заново')
    a = zeros(1,n-1);		

disp('Вектор а')
for i = 1:n-1
	s = ['a(',num2str(i),') = '];
	a(i) = input(s);
end
disp('Вектор c')
c = zeros(1,n);
for i = 1:n
	s = ['c(',num2str(i),') = '];
	c(i) = input(s);
end
diagonal=zeros(1,n);
diagonal(1)=logical(abs(c(1))>abs(a(1)));
for i=2:n-1
    diagonal(i)=logical(abs(c(i))>abs(a(i-1))+abs(a(i)));
end
diagonal(n)=logical(abs(c(n))>abs(a(n-1)));
end

d = ones(1,4);	l = zeros(1,n-1);
L = zeros(1,n);
L(1) = sqrt(c(1));	l(1) = a(1)/L(1);
for i = 2:n-1
	L(i) = sqrt(c(i)-(l(i-1))^2);
	l(i) = a(i)/L(i);
	
end
L(n)=sqrt(c(n)-(l(n-1))^2);
for i=1:n
    d(i)=sign(L(i))*d(i);
end

%============= Матричний вигляд L та D
L = diag(L)+diag(l,-1);
D = diag(d);
LT=L';
display(L)
display(D)
display(LT)
%============= Перевірка результату
disp('L * D * LT = ')
display(L*D*LT)