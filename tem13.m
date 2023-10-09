clear, clc
a = zeros(3, 1);
b = zeros(3, 1);
c = zeros(3, 1);
for i=1:3
    s = append("a(", num2str(i), ") = ");
    x = double(input(s));
    a(i,1) = x;
end
for i=1:3
    s = append("b(", num2str(i), ") = ");
    x = double(input(s));
    b(i,1) = x;
end
for i=1:3
    s = append("c(", num2str(i), ") = ");
    x = double(input(s));
    c(i,1) = x;
end
x = cross(a, b)
H = x'*c