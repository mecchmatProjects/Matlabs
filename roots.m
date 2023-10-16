% square equation solver

a = input('a=');

b = input('b=');

c = input('c=');

while a==0
    disp('a not equal zero!!!!');
    a = input('a=');
end

[x1, x2] = sqr_roots(a,b,c);

disp(strcat('x1=', num2str(x1), ', x2=', num2str(x2)));






