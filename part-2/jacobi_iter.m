% Program 2.2  Jacobi Method
% Inputs: full or sparse matrix a, r.h.s. b,
%         number of Jacobi iterations k
% Output: solution x
function [x, N] = jacobi_iter(A,b,x0, e, M, N)
len = length(A);
D = zeros(len, len);
d = [1;1;1];
x = x0;
for l = 1 : len
    D(l,l) = A(l,l);
end
A = A - D;
for m = 1 : M
  N = m;
  x = (b - A * x) ./ d;
  if (m > 1)
    app = abs(norm(x-xt));
    if (ge(e,app))
        return
    end
  end
  xt = x;
end               % End of Jacobi iteration loop
if (N == M)
    x = NaN;
end
