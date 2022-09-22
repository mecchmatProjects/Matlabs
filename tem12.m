X = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
Y = [5; 6; 3; 5; 6; 3; 5; 6; 3; 5];
nX = sqrt(sum(X.^2));
nY = sqrt(sum(Y.^2));
X = X./nX;
Y = Y./nY;
cosang = X*Y
