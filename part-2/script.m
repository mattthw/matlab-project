%For Jacobi
A = [1 1/2 1/3; 1/2 1 1/4; 1/3 1/4 1];
b = [.1;.1;.1];
M = 100;
e = .00005;
for j = 1 : 100
    x0 = [-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);];
    [x, N] = jacobi_iter(A, b, x0, e, M)
end
cd('../');
