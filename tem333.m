clear
clc
n = 6;
A = wilkinson(n);
A = A*A'
for i = 1:n
    A(i,i)=A(i,i)+16*(i-1);
end
b = ones(n);
x = fact_LU(A,b)
R = rref([A, b]);
x1 = R(:, n+1)
