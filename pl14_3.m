syms a b x y;
s=solve(x^2 + a^2-45^2==0, x^2 + b^2-35^2==0, y/10-x./b==0, (x-y)/10-x/a==0);
disp(s);
e= [double(s.x) double(s.y) double(s.a) double(s.b)]
n = len(e);
for i=1:n
    if s.x(i)>0 & s.y>0 %....
        disp(s.x(i))
    end
end    
