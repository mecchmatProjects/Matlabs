f = @(x) 2.*x.^5-4.3.*x.^2+5.7;
method_division(f,-1,1,0.001)

disp(['root by fzero: ' num2str(fzero(f,0))])

function method_division(F,a,b,eps)
tmpa=a; 
tmpb=b;
for k=0:100
 c=(tmpa+tmpb)/2;
if F(c)*F(tmpa)<=0
tmpb=c;
end
if F(c)*F(tmpb)<=0
tmpa=c; 
end
fa=tmpa;
fb=tmpb;
if abs(fb-fa)<eps
    break
end
end
disp('Solution');
disp(['x = ',num2str((fa+fb)/2),',iteration = ',num2str(k)])
end