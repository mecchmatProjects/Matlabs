%%
% srq_roots.m - find 2 roots of sqr equation
% args:
% @ a - real
% @ b - real
% @ c - real
% Results:
%  x1 - real, if it exists or 'none'
%  x2 - real, if it exists or 'none'
%%

function [x1, x2] = sqr_roots(a,b,c)


x1 = 'none';
x2 = 'none';
if a==0
    return
end

d = b^2 - 4*a*c;
if d>0
    x1 = (-b - sqrt(d)) / 2.0 / a;
    x2 = (-b + sqrt(d)) / 2.0 / a;
elseif d==0
    x1 = -b / 2.0 / a;
else
    disp('no roots');
end

return
end



