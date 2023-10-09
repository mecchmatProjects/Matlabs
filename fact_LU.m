function x = fact_LU(A,b)
[L,U,P]  = lu(A);
x = U \ (L \ (P * b));
end