function [h,g] = nlcon(x) 
h = []; 
g = x(1)^2+x(2)^2-1; 
return