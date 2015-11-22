function [y,N] = gs_iter(A, b, x0, e, M)
len = length(A);
D = zeros(len, len);
d = zeros(len, 1);
for l = 1 : len
    D(l,l) = A(l,l);
    d(l,1) = A(l,l);
end
A = A - D;
d = 1./d;
y = x0; 
for i = 1 : M
    N = i;
    for j = 1 : len
        y(j, 1) = (b(j, 1) - A(j,:) * y) * d(j, 1);
    end
    if (i > 1)
        app = abs(norm(y - xt));
        if (ge(e, app))
            return
        end
    end
    xt = y;
end
if (N == M)
    y = NaN;
end
