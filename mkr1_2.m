n = 6;
A = magic(n);
A = A * A';
for i=1:n
    for j=1:n
        if i~=j
            A(i, j) = A(i, j)/15;
        end
    end
end
b = [];
for i=1:n
    b = [b, (-1)^i];
end
b = b' .* diag(A);

disp("Розв'язок fact_QR");
x = fact_QR(A, b)
disp("Розв'язок методами matlab");
x = A\b