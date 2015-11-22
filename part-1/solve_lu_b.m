function x = solve_lu_b(A,b)

%A website was used as help for making this function
%at http://six.cheng.cam.ac.uk/wiki/images/d/d8/Handout2.pdf

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

%Rosetta Code was used to help make this function
%At http://rosettacode.org/wiki/LU_decomposition 

n=size(A);
U=zeros(n);
L=zeros(n);
for x=1:n
    L(x,x)=1;
end
for x=1:n
    U(1,x)=A(1,x);
end
for y=2:n
  for x=1:n
    for z=1:y-1
        v1=0;
        if z==1
            v1=0;
        else
        for p=1:z-1
            v1=v1+L(y,p)*U(p,z);
        end
        end
        L(y,z)=(A(y,z)-v1)/U(z,z);
    end
     for z=y:n
         v2=0;
       for p=1:y-1
           v2=v2+L(y,p)*U(p,z);
       end
       U(y,z)=A(y,z)-v2;
     end
  end
end
C=zeros(n);
for y=1:n	
	for x=1:n	
			C(y,x)=C(y,x) + L(y,:) * U(:,x);   
	end	
end	
errorMatrix = C - A;
maxError = max(max(errorMatrix));
minError = min(min(errorMatrix));
error = max(abs(maxError),abs(minError));

