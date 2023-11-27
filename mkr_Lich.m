x=1:0.2:3.4;
f=@(x)(atan(x./2)-1.5);
df=@(x)(2./(4+x.^2));
Y=f(x);
syms X;
for i = 1:length(x)
    u = x;
    u(i)=[]; % выкалываем i-й элемент
    P(i,1) = prod(X-u)/prod(x(i)-u); % рассчитываем i-й полином Лагранжа
end
YY = Y*P;
Yx = sym2poly(YY);
q=polyder(Yx);
x0=input('x0=');
dx0=df(x0);
dx0num=polyval(q,x0);
disp('Numerical diff.')
disp(dx0num);
disp('Exact diff.')
disp(dx0)
simpson(1,4)
trap(1,4)


function trap(a,b)
f = ('atan(x./2)-1.5');
F = inline(f);
h = 0.2;
    x = a:h:b;
    n = length(x);
    y = F(x);
    I = h * (y(1) / 2 + y(n) / 2);
    for j=2:n-1
        I = I + h * y(j);
    end
disp("Trap method integral:")
disp(I)
end


function simpson(a,b)
f = ('atan(x./2)-1.5');
F = inline(f);
h = 0.2;
    x = a:h:b;
    n = length(x);
    y = F(x);
    s = F(a)+F(b);
    for j=1:2:n-1
        s = s + 4 * F(a + j * h);
    end
    for j=2:2:n-2
        s = s + 2 * F(a + j * h);
    end
    I = h / 3 * s;
disp("Simpson method integral:")
disp(I)
end


%%%%%%%%%%%%%%A = wilkinson(6);
b = [1,-1,4,2,-2,3];
x = LinearSolve(A,b);

disp('a')
disp(A)
disp('b')
disp(b)
disp('x')
disp(x)




function x=LinearSolve(A,b)

    [nRow,nCol]=size(b);
    [nRow,nCol]=size(A);

    b=b(:);

    [L,U,P] = nma_LU(A,0);
    y       = nma_ForwardSub(L,P*b);
    x       = nma_BackSub(U,y);

end


function [L,U,P]=nma_LU(A,threshold)
[nRow,nCol]=size(A);
    function flipRows()        
        [c,I]=max(abs(A(n:end,n)));
        I=I+(n-1);
        tmp=A(n,:);
        A(n,:)=A(I,:);
        A(I,:)=tmp;

        %make sure we also flip the L matrix rows to keep in sync
        tmp=L(n,:);
        L(n,:)=L(I,:);
        L(I,:)=tmp;

        %now make the elementary matrix for this move
        E(n,:)=0;
        E(n,I)=1;
        E(I,:)=0;
        E(I,n)=1;        
    end

    P=diag(ones(nRow,1));
    U=zeros(nRow);
    L=zeros(nRow);

    for n=1:nRow-1
        currentPivot=A(n,n);

        E=diag(ones(nRow,1));

        maxPivot=max(A(n+1:end,n));
        if abs(currentPivot)<eps  %zero, do row exchage always
           if abs(maxPivot)<eps  % not possible to exchange
              error 'unable to complete LU decomposition, bad A'
           else
              flipRows();        
           end
        else %not a zero pivot, but still can exchange, check threshold
          if abs(currentPivot)<abs(maxPivot)
             if abs(currentPivot-maxPivot)>=threshold
                flipRows();                      
             end
          end
        end

        P=P*E;  %update the perumtation matrix        

        for i=n+1:nRow
            L(i,n)=A(i,n)/A(n,n);
            A(i,n)=0;
            for j=n+1:nRow
                A(i,j)=A(i,j)-L(i,n)*A(n,j);
            end
        end      
    end

    L=L+diag(ones(nRow,1));    
    P=P';
    U=A;  % that is all         
end


function y=nma_ForwardSub(L,w)
    [nRow,nCol]=size(L);
    y=zeros(nRow,1);
    y(1)=w(1)/L(1,1);
    w=w(:);
    for n=2:nRow
        y(n)=( w(n) - L(n,1:n-1)*y(1:n-1) ) / L(n,n);
    end

end


function x=nma_BackSub(U,v)
    [nRow,nCol]=size(v);
    x=zeros(nRow,1);
    x(nRow)=v(nRow)/U(nRow,nRow);
    v=v(:);
    for n=(nRow-1):-1:1
        x(n)=(v(n)-(U(n,n+1:end)*x(n+1:end))) / U(n,n);
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%
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
