%30
X = 1:10
Y = randi(50,10,1)
normalize(X)
normalize(Y)
Cosine = dot(X,Y)/(norm(X)*norm(Y))

%31
A = magic(3);
a = A(1, :)
b = A(2, :)
c = A(3, :)
x = cross(a,b)
H = dot(x,c)

%32
X = 5:10
A = (sin(X).*cos(X)).^2
B = (log(X+2))/X
C = (exp(X/X.^2)).^(-2)
D = A+B
S = (A.^(2/3)*sqrt(C^3))/(B+D).^2

%34
pi
eps
realmin
realmax

%35-36
a = input('a = ');
b = input('b = ');
c = input('c = ');
a*b ~= 0
a>b
abs(a)>=0
abs(abs(a)-abs(b))<=abs(a+b)
abs(a+b)<=abs(a)+abs(b)
b^2 - 4*a*c>=0

%37
p = input("p = ");
q = input("q = ");
r = input("r = ");
x = input("x = ");
y = input("y = ");
p|q;
p&q&r;
all(ismember(p,q));
x<y|x==y;
y>=x&y+x>=0&y<=1;
(x-1).^2 +(y-2).^2>=9&(x-3).^2+(y+1).^2<=25;
0<x<=1;

%38
Z = [1-2i,1+3i,1+2i,2,5i,0];
M = [abs(Z);angle(Z);real(Z);imag(Z)]

% 39
dot(Z, conj(Z))

%40
m = 12345;
n = 38;
nsd=gcd(m,n)
nsk=lcm(m,n)

%41
Y = exp(1);
rat(Y)
rats(Y)

%42
X = [-1.9 -0.2  3.4  5.6  7.0];
X1 = ceil(X)
X2 = floor(X)
X3 = round(X)
X4 = fix(X)

%43
x = 125;
y = 19;
rem(x,y)
