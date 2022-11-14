function mk1_082
    clear all, clc

    n = 6; A = wilkinson(n); A = A * A';
    for i = 1:n
        A(i,i) = A(i,i) + 24.*(i-1);
    end

    while 1
        b = input('? Вектор-стовбець правої частини СЛАР\n');
        [i, j] = size(b);
        if i == n & j == 1 % перевірка розмірності і що b є col-вектор
            break
        end
    end

    disp('Матриця СЛАР'), A
    disp('Вектор правих частин СЛАР'), b

    x = fact_LU(A, b);
    disp('Розв''язок СЛАР LU-методом'), x

    X = rref([A, b]); X = X(:, n+1);
    disp('Розв''язок СЛАР приведенням до ступінчатої форми'), X
end

function x = fact_LU(A, b)
% Розв'язок СЛАР A*x=b LU-методом
    [L, U, P] = lu(A);
    x = U \ (L \ (P * b));
end