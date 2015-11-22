function [x, N] = jacobi_iter(A, b, x0 , e, M)
len = length(A);
D = zeros(len, len);
d = zeros(len, 1);
x = x0;
for l = 1 : len
    D(l,l) = A(l,l);
    d(l,1) = A(l,l);
end
A = A - D;
for i = 1 : M
  N = i;
  x = (b - A * x) ./ d;
  if (i > 1)
    app = abs(norm(x - xt));
    if (ge(e, app))
        return
    end
  end
  xt = x;
end              
if (N == M)
    x = NaN;
end
