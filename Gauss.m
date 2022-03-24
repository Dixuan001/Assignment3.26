function [x,L,U]=Gauss(A,b)
n=size(A,1);
L=zeros(n);
for j=1:n-1
    L(j,j)=1;
    for i=j+1:n
        m(i,j)=A(i,j)/A(j,j);
        b(i)=b(i)-m(i,j)*b(j);
        A(i,j)=0;
        L(i,j)=m(i,j);
       for k=j+1:n
            A(i,k)=A(i,k)-m(i,j)*A(j,k);
        end
    end
end
L(n,n)=1;
U=A;
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    sum=0;
    for j=n:-1:i+1
        sum=sum+A(i,j)*x(j);
    end
    x(i)=(b(i)-sum)/A(i,i);
end
x=x';


