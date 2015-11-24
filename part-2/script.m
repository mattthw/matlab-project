format long
%For Jacobi
A = [1 1/2 1/3; 1/2 1 1/4; 1/3 1/4 1];
b = [.1;.1;.1];
M = 100;
e = .00005;
xapx = [0;0;0];
xext = [9/190;28/475;33/475];
jacobi_N = 0;
jacobi_arr = zeros(100, 2);
for j = 1 : M
    x0 = [-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);];
    [x, N] = jacobi_iter(A, b, x0, e, M);
    xapx = xapx + x;
    jacobi_arr(j, 1) = norm(x0-xext);
    jacobi_arr(j, 2) = N;
    jacobi_N = jacobi_N + N;
end
xapx = xapx ./ M;
disp('Jacobi x approximation =');
disp(xapx);
disp('Jacobi x exact =');
disp(xext);
disp('Error of approximation for Jacobi =');
xerror = abs(norm(xapx - xext));
disp(xerror)
jacobi_N = jacobi_N / 100

%For Gauss-Siedel
yapx = [0;0;0];
yext = [9/190;28/475;33/475];
gs_N = 0;
gs_arr = zeros(100, 2);
for j = 1 : M
    x0 = [-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);-1 + 2.*rand(1,1);];
    [y, N] = gs_iter(A, b, x0, e, M);
    gs_arr(j, 1) = norm(x0-yext);
    gs_arr(j, 2) = N;
    yapx = yapx + y;
    gs_N = gs_N + N;
end
yapx = yapx ./ M;
disp('Gauss-Siedel x approximation =');
disp(yapx);
disp('Gauss-Siedel x exact =');
disp(yext);
disp('Error of approximation for Gauss-Siedel =');
yerror = norm(yapx - yext);
disp(yerror)
gs_N = gs_N / 100

%Ratio
Ratio = jacobi_N / gs_N

createfigure(gs_arr(:,1), gs_arr(:,2), [], 'blue', jacobi_arr(:,1), jacobi_arr(:,2), 'black')

cd('../');
