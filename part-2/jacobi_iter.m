
function [x, N] = jacobi_iter(A,b,x0, e, M)
n = length(b);      % find n
len = length(A);
D = zeros(len, len);
d = [1;1;1];
x = x0;
for l = 1 : len
    D(l,l) = A(l,l);
end
r = A - D;
for m = 1 : M
  N = m;
  x = (b - r * x) ./ d;
  if (m > 1)
    app = abs(norm(x-xt));
    if (e > app)
        return
    end
  end
  xt = x;
end               % End of Jacobi iteration loop
if (N == M)
    x = NaN;
end
