function x = solve_lu_b(A,b)
%Penn State's math website was used when creating this function
%at https://www.math.psu.edu/shen_w/451/NoteWeb/SL/slides5.pdf
n = length(b); 
[L,U,~] = lu_fact(A);
y = zeros(n,1);
x = zeros(n,1);
for k=1:n-1 
    for i=k+1:n
        ymult = L(i,k)/L(k,k);
        for j=k+1:n
            L(i,j) = L(i,j)-ymult*L(k,j);
        end
    b(i) = b(i)-ymult*b(k);
    end
end
 
y(n) = b(n)/L(n,n);
for i=n-1:-1:1
    sum = b(i);
    for j=i+1:n
        sum = sum-L(i,j)*y(j);
    end
    y(i) = sum/L(i,i);
end

for k=1:n-1 
    for i=k+1:n
        xmult = U(i,k)/U(k,k);
        for j=k+1:n
            U(i,j) = U(i,j)-xmult*U(k,j);
        end
    y(i) = y(i)-xmult*y(k);
    end
end

x(n) = y(n)/U(n,n);
for i=n-1:-1:1
    sum = y(i);
    for j=i+1:n
        sum = sum-U(i,j)*x(j);
    end
    x(i) = sum/U(i,i);
end


function[L,U,error] = lu_fact(A)

%Rosetta Code and Yasin Shiboul's code was used in making this function
%At http://rosettacode.org/wiki/LU_decomposition 
%and http://www.mathworks.com/matlabcentral/fileexchange/7779-
%lu-factorization-by-doolittle-s-method/content/Doolittle.m

n=size(A);
U=zeros(n);
L=zeros(n);
for j=1:n
    L(j,j)=1;
end
for j=1:n
    U(1,j)=A(1,j);
end
for i=2:n
    for j=1:n
        for k=1:i-1
            s1=0;
            if k==1
                s1=0;
            else
            for p=1:k-1
                s1=s1+L(i,p)*U(p,k);
            end
            end
            L(i,k)=(A(i,k)-s1)/U(k,k);
         end
         for k=i:n
             s2=0;
           for p=1:i-1
               s2=s2+L(i,p)*U(p,k);
           end
           U(i,k)=A(i,k)-s2;
         end
    end
end
C=zeros(n);
for i=1:n	
	for j=1:n	
			C(i,j)=C(i,j) + L(i,:) * U(:,j);   
	end	
end	
errorMatrix = C - A;
maxError = max(errorMatrix);
minError = min(errorMatrix);
error = max(abs(maxError),abs(minError));
