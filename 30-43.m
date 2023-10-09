
%30
n = 3;
X = [];
for i = 1:n
    s = ['X('int2str(i)')='];
    x = input(s);
    X = [X,x];
end
Y = zeros(n,1);
for i = 1:n
    s = ['Y('int2str(i)')='];
    Y(i) = input(s);
end
    nX = 0;
    for i = 1:n
        nX = nX+X(i)^2;
    end
    nX = sqrt(nX);
    nY = sgrt(sum(Y.^2));

    if nX ~ = 0 && nY ~ = 0
        X = X./nX;
        Y = Y./nY;
        display(X)
        display(Y)
        disp(['cos(X,Y) =' num2str(X*Y)])
    else
        disp ('Помилка: Один з векторів є нульовим!!!')
    end

%31
a = [1;2;3]
b = [4;5;6]
c = [7;8;9]
x = a.*b
H = x.*c

%34
pi
eps
realmin
realmax

%39
Z = [1-2i, 1+3i, 1+2i, 2, 5i, 0]
R = Z.* Z'

%40
m = 3
n = 18
G = gcd(m,n)
V = lcm(m,n)

%41
Y = 55.55555
D = rat(Y)
B = rats(Y)

%42
x = 78
y = 56
K = rem(x,y)
