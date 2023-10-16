clear, clc;

%34

pi
eps
realmin
realmax

%35

1 && 0
1 || 0

%36

a = double(input("a = "));
b = double(input("b = "));
c = double(input("c = "));
a*b ~= 0
a>b
abs(a) >= 0
abs(abs(a) - abs(b)) <= abs(a+b)
abs(a + b) <= abs(a) + abs(b)
b^2 - 4*a*c >= 0

%37

p = true;
q = false;
r = true;
x = double(input("x = "));
y = double(input("y = "));
p || q
p && q && r
~q || p % my implementation of implication
x < y || x == y
y >= x && x + y >= 0 && y <= 1
(x-1)^2 + (y-2)^2 >= 9 && (x-3)^2 + (y+1)^2 <= 25
0 < x && x <= 1

%38

Z = [1-2i, 1+3i, 1+2i, 2, 5i, 0];
abs(Z)
angle(Z)
real(Z)
imag(Z)

%39

Z*Z'

%40

m = uint32(input("m = "));
n = uint32(input("n = "));
den = gcd(m, n)
di = m * n / den

%41

Y = double(input("Y = "))
chain = rat(Y) %chain fraction
ratio = rats(Y) %rational fraction

%42

X = [-1.9,-0.2,3.4, 5.6,7.0];
X1=ceil(X)
X2=floor(X)
X3=round(X)
X4=fix(X)

% 43

x=uint32(input("x = "));
y=uint32(input("y = "));
remain=rem(x,y)