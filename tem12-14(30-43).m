%30
X=[1 2 3 4 5 6 7 8 9 10]
Y= [11;12;13;14;15;16;17;18;19;20]
normX= X/norm(X)
normY= Y/norm(Y)

p=X(1)*Y(1)+X(2)*Y(2)+X(3)*Y(3)+X(4)*Y(4)+X(5)*Y(5)+X(6)*Y(6)+X(7)*Y(7)+X(8)*Y(8)+X(9)*Y(9)+X(10)*Y(10);
q1= (X(1)^2+X(2)^2+X(3)^2+X(4)^2+X(5)^2+X(6)^2+X(7)^2+X(8)^2+X(9)^2+X(10)^2)^1/2;
q2= (Y(1)^2+Y(2)^2+Y(3)^2+Y(4)^2+Y(5)^2+Y(6)^2+Y(7)^2+Y(8)^2+Y(9)^2+Y(10)^2)^1/2;
q=q1*q2;

cosXY= p/q

%31
A=[1;2;3]
B=[2;1;-2]
C=[1;2;1]

x= cross(A,B)
% axbxc=[a,b]*c
H=x.*C

%34
pi
eps
realmin
realmax

%39
Z =[1-2i, 1+3i, 1+2i, 2, 5i, 0] 
z=Z.*Z'


%40
m= 56
n= 23
G= gcd(m,n)
L=lcm(m,n)

%41
Y = input('Y=')
W = rat(Y)
E = rats(Y)

%42
x = input('x=')
y = input('y=')
T = rem(x,y)
