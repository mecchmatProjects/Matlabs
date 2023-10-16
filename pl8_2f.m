function F = pl8_2f(t, U)     %  опис підфункції
% функція правої частини системи
    function f = fs   % вкладена функція
        f = A.*(U(kp)+U(k)+U(km)).*(U(kp)-U(km))+ ...
            B.*(U(kpp)-2.*(U(kp)-U(km))-U(kmm));
    end
    global A B n3 n2 n1 n
    F = zeros(n, 1);
    kmm = n2; km = n1; k = 1; kp = 2; kpp = 3; F(k) = fs();
    kmm = n1; km = n;  k = 2; kp = 3; kpp = 4; F(k) = fs();
    for k = 3 : n2
        kmm = k-2; km = k-1; kp = k+1; kpp = k+2; F(k) = fs();
    end
    kmm = n3; km = n2; k = n1; kp = n; kpp = 2; F(k) = fs();
    kmm = n2; km = n1; k = n;  kp = 2; kpp = 3; F(k) = fs();
end