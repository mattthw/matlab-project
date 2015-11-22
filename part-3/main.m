%script for second half of part 3
[A] = generate_matrices();
data = zeros(1000,4); %1=determ,2=tracem,3=colorm(count)
for n=1:1000;
    disp(sprintf('gathering matrix "A" data %g of 1000', n));
    [e_value, e_vector, count] = power_method(A(:,:,n),[1;0],0.00005,100);
    determ=(A(1,1,n)*A(2,2,n)-A(1,2,n)*A(2,1,n));
    tracem=(A(1,1,n)+A(2,2,n));
    data(n,1)=determ;
    data(n,2)=tracem;
    data(n,3)=count;
    data(n,4)=e_value;
end
determinantOfA=data(:,1);
traceOfA=data(:,2);
countOfA=data(:,3);
eigenvalue=data(:,4);
% get data for inverse of A
[A_inverse] = inverse(A);
data_inverse = zeros(1000,4); %1=determ,2=tracem,3=colorm(count),4=eigenvalue
for n=1:1000;
    disp(sprintf('gathering matrix "A^-1" data_inverse %g of 1000', n));
    [e_value, e_vector, count] = power_method(A_inverse(:,:,n),[1;0],0.00005,100);
    determ=(A_inverse(1,1,n)*A_inverse(2,2,n)-A_inverse(1,2,n)*A_inverse(2,1,n));
    tracem=(A_inverse(1,1,n)+A_inverse(2,2,n));
    data_inverse(n,1)=determ;
    data_inverse(n,2)=tracem;
    data_inverse(n,3)=count;
    data_inverse(n,4)=e_value;
end
determinantOfA_inverse=data_inverse(:,1);
traceOfA_inverse=data_inverse(:,2);
countOfA_inverse=data_inverse(:,3);
eigenvalue_inverse=data_inverse(:,4);
T = table(determinantOfA,traceOfA,countOfA,eigenvalue,determinantOfA_inverse,traceOfA_inverse,countOfA_inverse,eigenvalue_inverse);
% T(1:5,:)
filename='results.csv';
writetable(T,filename);
disp('drawing scatter plot for A and A^-1...');
doScatter(determinantOfA,traceOfA,[],countOfA,determinantOfA_inverse,traceOfA_inverse,countOfA_inverse)
