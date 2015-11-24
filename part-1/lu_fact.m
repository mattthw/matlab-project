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

