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
