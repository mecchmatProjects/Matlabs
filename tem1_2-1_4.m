%30
X=linspace(5,50,10);
Y=rand(10,1);
X1=normalize(X);
Y1=normalize(Y);
sc_prod=X(1)*Y(1)+X(2)*Y(2)+X(3)*Y(3)+X(4)*Y(4)+X(5)*Y(5)+X(6)*Y(6)+X(7)*Y(7)+X(8)*Y(8)+X(9)*Y(9)+X(10)*Y(10)
prod=dot(X,Y);
len_x=sqrt(X(1)^2+X(2)^2+X(3)^2+X(4)^2+X(5)^2+X(6)^2+X(7)^2+X(8)^2+X(9)^2+X(10)^2);
leng=norm(X);
len_y=sqrt(Y(1)^2+Y(2)^2+Y(3)^2+Y(4)^2+Y(5)^2+Y(6)^2+Y(7)^2+Y(8)^2+Y(9)^2+Y(10)^2);
cos_xy=sc_prod/(len_x*len_y);

%31
a=[4;8;2];
b=[5;3;7];
c=[1;9;6];
vect_ab=cross(a,b);
vect_bc=cross(b,c);
H=dot(a,vect_bc);

%32
x=[5:1:10];
A=(sin(x).*cos(x)).^2
B=(log(x+2))/x;
C=1/((exp(x/x.^2)).^2);
D=A+B;
S=((A.^(2/3))*sqrt(C^3))/(B+D).^2;

%34
t=pi;
y=eps;
u=realmax;
i=realmin;

%35-36
aa=-4;
bb=9;
cc=0;
aa*bb~=0;
aa>bb;
abs(aa)>=0;
v=logical(abs(abs(aa)-abs(bb))<=abs(aa+bb));
abs(aa+bb)<=abs(aa)+abs(bb);
bb^2-4*aa*cc>=0;

%37
p=input('p=');
q=input('q=');
r=input('r=');
b1=p|q;
b2=p&q&r;
b3=p<or(q,p)==y;
b4=q>=p&y+q>=0&q<=1;
b5=(((p-1)^2+(q-2)^2)>=9)&((p-3)^2+(q+1)^2<=25);
b6=p>0&p<=1;


%38
Z=[1-2i,1+3i,1+2i,2,0];
first=[abs(Z(1)), abs(Z(2)),abs(Z(3)),abs(Z(4)),abs(Z(5))];
second=[angle(Z(1)),angle(Z(2)),angle(Z(3)),angle(Z(4)),angle(Z(5))];
third=[real(Z(1)),real(Z(2)),real(Z(3)),real(Z(4)),real(Z(5))];
fourth=[imag(Z(1)),imag(Z(2)),imag(Z(3)),imag(Z(4)),imag(Z(5))];
matrix=[first;second;third;fourth];

%39
Z2=dot(Z,conj(Z)) %скалярний добуток Z на Z*


%40
m=8;
n=59;
nsd=gcd(m,n);
nsk=lcm(m,n);

%41
y=88.56;
drib=rat(y);  %ланцюговий
drib1=rats(y);%раціональний

%42
X = [-1.9,-0.2,3.4, 5.6,7.0];
X1=ceil(X); %заокруглені до найближчого цілого, більшого
X2=floor(X); % заокруглені до найближчого цілого, меншого
X3=round(X); %заокруглені до найближчого цілого;
X4=fix(X); % отримані відкиданням дробової частини числа.

%43
x=56;
y=23;
remain=rem(x,y); %залишок від ділення x на y


