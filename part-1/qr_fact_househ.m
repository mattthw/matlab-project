function [Q,R,error]=qr_fact_househ(A)

%A Cornell website was used to help make this function
%at https://www.cs.berkeley.edu/~wkahan/Math128/ReflRotn.pdf

n=length(A);
R=A; 
Q=zeros(n);
for x=1:n
    Q(x,x)=1;
end
for z=1:n-1
    x=zeros(n,1);
    x(z:n,1)=R(z:n,z);
    g=norm(x);
    v=x; v(z)=x(z)+g;
    s=norm(v);
    if s~=0, w=v/s; 
    u=2*R'*w;
    R=R-w*u'; 
    Q=Q-2*Q*(w*w'); 
    end
end
C=zeros(n);
for x=1:n	
	for y=1:n	
    C(x,y)=C(x,y) + Q(x,:) * R(:,y);   
	end	
end	
errorMatrix = C - A;
maxError = max(max(errorMatrix));
minError = min(min(errorMatrix));
error = max(abs(maxError),abs(minError));
