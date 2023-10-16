close all, clear all, clc
n = 7;
A = magic(n);
A = A*A';
for i = 1:n
  for j = 1:n
    A(i, j) = A(i, j)./20;
  end
end
b = diag(A)./5;
x = f_QR(A,b);
[Q,R] = rref(A);
disp(x);