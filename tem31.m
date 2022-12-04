clear all, clc
A = [10     3     1i     1+2i
    3     20     3     1-2i
     1i     3     30     5i
    1-2i     1+2i     -5i     40]
m=length(A);

data_array_s=zeros(m,m);              
data_array_d=zeros(m,m);                
data_array_s(1,1)=sqrt(abs(A(1,1)));  
data_array_d(1,1)=sign(A(1,1));       
for j=2:m
  data_array_s(1,j)=A(1,j)./data_array_s(1,1);   
end

for i=2:m                  
  for j=3:m
    sum_s=0;
    sum_d=0;
    for k=1:(i-1)
      sum_s+=data_array_d(k,k)*(abs(data_array_s(k,i)))^2;
      sum_d+=(conj(data_array_s(k,i))).*data_array_s(k,j);
    end;
    data_array_s(i,i)=sqrt(abs(A(i,i)-sum_s));
    data_array_d(i,i)=sign(A(i,i)-sum_s);
    data_array_s(i,j)=(A(i,j)-sum_d)./data_array_s(i,i);
  end;
end;
disp('S:');
disp(data_array_s);


disp('S*:');       
disp(data_array_s);

H=A-data_array_s'*data_array_d*data_array_s
disp(all(all(abs(H)<1e-12)));