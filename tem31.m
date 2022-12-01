clear, clc
n = input('Розмір матриці: n = ');
A = zeros(n);
for i = 1:n
    for j = i:n
	    s = ['A(',num2str(i), ', ', num2str(j), ') = '];
	    A(i, j) = input(s);
        A(j, i) = conj(A(i, j));
    end
end

L = zeros(n);

for i = 1:n
    for j = 1:i
        %формули
        s = 0;
        for k = 1:j-1
            s = s + L(i, k) * conj(L(j, k));
        end
        if i == j
            L(i, j) = sqrt(A(i, j) - s);
        else
            L(i, j) = (A(i, j) - s) / L(j, j);
        end
    end
end

LT = L';

display(L*LT);