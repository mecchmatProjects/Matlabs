function x = f_QR(A,b)
[Q,R,P] = qr(A);
x = P*(R\(Q'*b));
end