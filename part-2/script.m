format long
%For Jacobi
A = [1 1/2 1/3; 1/2 1 1/4; 1/3 1/4 1];
b = [.1;.1;.1];
M = 100;
e = .00005;
xapx = [0;0;0];
xext = [9/190;28/475;33/475]
for j = 1 : M
    x0 = [-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);];
    [x, N] = jacobi_iter(A, b, x0, e, M)
    xapx = xapx + x;
end
xapx = xapx ./ M;
disp('Xapprox =');
disp(xapx);
disp('Xexact =');
disp(xext);
disp('Error of approximation =');
xerror = abs(norm(xapx - xext));
disp(xerror)

% y = gs_iter(A,b,M)
cd('../');
