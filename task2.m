A = wilkinson(6);
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