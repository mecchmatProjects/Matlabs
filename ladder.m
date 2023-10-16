function fn=ladder(p)
x=p(1); y=p(2); a=p(3); b=p(4); 
f(1)=x^2 + a^2 - 45^2; f(2)=x^2 + b^2 - 35^2; 
f(3)=y/10 - x/b; f(4)=(x-y)/10 - x/a;
fn=f(:);