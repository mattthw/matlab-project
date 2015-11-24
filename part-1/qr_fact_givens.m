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
