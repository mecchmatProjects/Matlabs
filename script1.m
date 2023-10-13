

% this is our matlab script

x = 23^22;

% disp("x=");
% disp(x);

z = [1 3 4];

y = z .* z;

m = magic(3)
m1 = ones(1,4)
m2 = zeros(3, 1)

m4 = ones(2,3,4,5);

m2(1,2) = 2;
m2(2,2) = 5;

m2(1,:) = 8;

field1 = 'grn';
value1 = 123;


field2 = 'kop';
value2 = 12;

G1 = struct(field1, value1, field2, value2);

G1.grn = 345;

G1.(field1);
G1.('kop');


Komirka ={G1, 456546, 'ryadok', [45 34; 55 88]};

l = Komirka{1}.grn;

h = Komirka{4}(:,1);


yy = y(1) * sin(x) + l^3 / 567.879 +exp(5);
disp(yy)



