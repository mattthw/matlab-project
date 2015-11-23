%script for second half of part 3
[A] = generate_matrices();
[A_inverse] = inverse(A);
data = zeros(1000,5); %1=determ,2=tracem,3=eigenvalue,4=colorm(count),5=colorm_inverse
for n=1:1000;
    disp(sprintf('gathering matrix "A" data %g of 1000', n));
    [e_value, e_vector, count] = power_method(A(:,:,n),[1;0],0.00005,100);
    determ=(A(1,1,n)*A(2,2,n)-A(1,2,n)*A(2,1,n));
    tracem=(A(1,1,n)+A(2,2,n));
    data(n,1)=determ;
    data(n,2)=tracem;
    data(n,3)=e_value;
    data(n,4)=count;
    [e_value, e_vector, count] = power_method(A_inverse(:,:,n),[1;0],0.00005,100);
    data(n,5)=count;
end
determinantOfA=data(:,1);
traceOfA=data(:,2);
eigenvalue=data(:,3);
countOfA=data(:,4);
countOfA_inverse=data(:,5);

% create table and scatter plots
T = table(determinantOfA,traceOfA,eigenvalue,countOfA,countOfA_inverse);
filename='results.csv';
writetable(T,filename);
disp('drawing scatter plot for A and A^-1...');
createfigure(determinantOfA,traceOfA,[],countOfA)
createfigure2(determinantOfA,traceOfA,[],countOfA_inverse)
