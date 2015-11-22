%script for second half of part 3
% A = [3 4;3 1];
% v = [1;0];
% t = 1/5;
% s = 10;
% [e_value, e_vector, count] = power_method(A,v,t,s)
[A] = generate_matrices();
[A_inverse] = inverse(A);
A_powers = zeros(1,3,1000);
for n=1:30;
    disp(sprintf('computing power %g of 1000', n));
    [e_value, e_vector, count] = power_method(A(:,:,n),[1;0],0.00005,100);
    disp(sprintf('eigenvalue: %g',e_value));
    disp('eigenvector:');
    disp(e_vector);
    disp(sprintf('count: %g',count));
    disp('----------------------');
    % A_powers(:,:,n)=[e_value, e_vector, count];
end
% A_powers(:,:,14)