function [xhouseh,xgivens,househerror,givenserror] = solve_qr_b(A,b)

b=b';
boriginal=b;
n = length(b); 
[Q,R] = qr_fact_househ(A);
xhouseh = zeros(n,1);
Qt = Q';
bt = b';
Qtb=zeros(n,1);
for x=1:n	
 for y=1:n
  Qtb(x)=Qtb(x) + Qt(x,y) * bt(y);
 end
end	
for z=1:n-1 
 for x=z+1:n
  xmult = R(x,z)/R(z,z);
 for y=z+1:n
  R(x,y) = R(x,y)-xmult*R(z,y);
 end
 Qtb(x) = Qtb(x)-xmult*Qtb(z);
 end
end
xhouseh(n) = Qtb(n)/R(n,n);
for x=n-1:-1:1
 sum = Qtb(x);
 for y=x+1:n
  sum = sum-R(x,y)*xhouseh(y);
 end
 xhouseh(x) = sum/R(x,x);
end

Ax=zeros(n,1);
for i=1:n
 for j=1:n
  Ax(i,1)=Ax(i,1) + A(i,j) * xhouseh(j,1);
 end
end
errorvector = Ax-boriginal;
maxError=max(errorvector);
minError=min(errorvector);
househerror = max(abs(maxError),abs(minError));

[Q,R] = qr_fact_givens(A);
xgivens = zeros(n,1);
Qt = Q';
bt = b';
Qtb=zeros(n,1);
for x=1:n	
 for y=1:n
  Qtb(x)=Qtb(x) + Qt(x,y) * bt(y);
 end
end	
for z=1:n-1 
 for x=z+1:n
  xmult = R(x,z)/R(z,z);
 for y=z+1:n
  R(x,y) = R(x,y)-xmult*R(z,y);
 end
 Qtb(x) = Qtb(x)-xmult*Qtb(z);
 end
end
xgivens(n) = Qtb(n)/R(n,n);
for x=n-1:-1:1
 sum = Qtb(x);
 for y=x+1:n
  sum = sum-R(x,y)*xgivens(y);
 end
 xgivens(x) = sum/R(x,x);
end

Ax=zeros(n,1);
for i=1:n
 for j=1:n
  Ax(i,1)=Ax(i,1) + A(i,j) * xgivens(j,1);
 end
end
errorvector = Ax-boriginal;
maxError=max(errorvector);
minError=min(errorvector);
givenserror = max(abs(maxError),abs(minError));
end


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
end


function [Q,R,error] = qr_fact_givens(A)

%A website was used to help make this function
%at http://polytopes.net/courses/Stat624S08/tutorial4.pdf

n = length(A);
Q = zeros(n);
for x=1:n
 Q(x,x)=1;
end
R = A;
for y = 1:n
 for x = n:-1:(y+1)
  G = eye(n);
  [cos,sin] = getcosandsin( R(x-1,y),R(x,y));
  G([x-1, x],[x-1, x]) = [cos -sin; sin cos];
  R = G'*R;
  Q = Q*G;
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
end

function [cos,sin] = getcosandsin(n1,n2)
if n2 == 0
 cos = 1;
 sin = 0;
else
 if abs(n2) > abs(n1)
 r = n1 / n2;
 sin = 1 / sqrt(1 + r^2);
 cos = sin*r;
 else
 r = n2 / n1;
 cos = 1 / sqrt(1 + r^2);
 sin = cos*r;
 end
end
end
