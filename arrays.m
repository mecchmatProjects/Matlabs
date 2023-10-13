

a = [1, 2, 3];
b = 1:2:10;
b1 = linspace(0,0.1,5);

c = magic(3);
c1 = [1, 2, 3 ; 3, 4, 5];
c2 = zeros(4);
c3 = eye(3);
c4 = ones(3)* 1.2;

d1 = zeros(2,5);
d2 = ones(1,5);
d3 = rand(5,1);

f = d2*d3;

g = d2 + d3;

g1 = d2' + d3;

norm(c4);

det(c4);

rank(c4)

t = rand(5)

d1 = det(t)

tinv = inv(t)

r = tinv * t

r1 = eye(5);

r_diff = r - r1

if all(abs(r_diff)<0.00001)
    disp('ok');
end
















