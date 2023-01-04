function x = fact_QR(A,b)
[L,U,P]  = lu(A);
x = U \ (L \ (P * b));
end