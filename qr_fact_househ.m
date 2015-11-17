function [Q,R,error]=qr_fact_househ(A)

%A Cornell website was used to help make this function
%as http://www.cs.cornell.edu/~bindel/class/cs6210-f09/lec18.pdf

n=length(A);
R=A; 
Q=eye(n); 
for k=1:n-1
    x=zeros(n,1);
    x(k:n,1)=R(k:n,k);
    g=norm(x);
    v=x; v(k)=x(k)+g;
    s=norm(v);
    if s~=0, w=v/s; u=2*R'*w;
    R=R-w*u'; 
    Q=Q-2*Q*(w*w'); 
    end
end
C=zeros(n);
for i=1:n	
	for j=1:n	
			C(i,j)=C(i,j) + Q(i,:) * R(:,j);   
	end	
end	
errorMatrix = C - A;
maxError = max(errorMatrix);
minError = min(errorMatrix);
error = max(abs(maxError),abs(minError));
