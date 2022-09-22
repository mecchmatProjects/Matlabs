clear, clc
X = 5:10;
A = (sin(X).*cos(X)).^2;
B = log(X+2)./X;
C = exp(X./(X.^2)).^(-2);
D = A+B;
S = A.^(2/3).*sqrt(C.^3)./(B+D).^2