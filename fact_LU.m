function [x] = fact_LU(A, b)
    switch nargin
	case [0 1]
		x = NaN;
		warning('fact_LU: Недостатня кількість аргументів')
		return
    end
    
    n = size(A);
    if n(1) ~= n(2)
        x = NaN;
		warning('fact_LU: Матриця не квадратна')
        return
    end
    n = n(1);
    x=zeros(1, n);

    for i=1:n
        [a, j] = max(abs(A(i, :)));
        if a == 0
            x = NaN;
		    warning('fact_LU: Матриця вироджена')
            return
        end
        if j ~= i
            A([i,j],:) = A([j,i],:);
            b([i,j]) = b([j,i]);
        end
        L = eye(n);
        L(j,j)=1/A(j,j);
        for k=j+1:n
            L(k, j) = -A(k, j)/A(j,j);
        end
        A=L*A;
        b=L*b;
    end
    for i=n:-1:1
        s=0;
        for j=i+1:n
            s=s+A(i,j)*x(j);
        end
        x(i)=b(i)-s;
    end
end