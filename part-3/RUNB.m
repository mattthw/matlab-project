%script for second half
disp('generating matrices.');
[A] = generate_matrices();
[A_inverse] = inverse(A);
data = zeros(1000,5); %1=determ,2=tracem,3=eigenvalue,4=colorm(count),5=colorm_inverse
disp('computing power method for 1000 matrices');
for n=1:1000;
    if n==0 || n==100 || n==200 || n==300 || n==400 || n==500 || n==750 || n==1000
        disp(sprintf('%g of 1000', n));
    end
    [e_value, e_vector, count] = power_method(A(:,:,n),[1;0],0.00005,100);
    determ=(A(1,1,n)*A(2,2,n)-A(1,2,n)*A(2,1,n));
    tracem=(A(1,1,n)+A(2,2,n));
    data(n,1)=determ;
    data(n,2)=tracem;
    data(n,3)=count;
    % data(n,3)=e_value;
    [e_value, e_vector, count2] = power_method(A_inverse(:,:,n),[1;0],0.00005,100);
    data(n,4)=count2;
    % eterm=(A_inverse(1,1,n)*A_inverse(2,2,n)-A_inverse(1,2,n)*A_inverse(2,1,n));
    % tracem=(A_inverse(1,1,n)+A_inverse(2,2,n));
    % data(n,5)=determ;
    % data(n,6)=tracem;
end
determinantOfA=data(:,1);
traceOfA=data(:,2);
countOfA=data(:,3);
countAinv=data(:,4);
% eigenvalue=data(:,3);
% detAinv=data(:,5);
% traceAinv=data(:,6);

% % create table and scatter plots
% disp('writing results to results.txt');
% T = table(determinantOfA,traceOfA,eigenvalue,countOfA,detAinv,traceAinv,countAinv);
% filename='results.csv';
% writetable(T,filename);
disp('drawing scatter plot for A...');
createfigure(determinantOfA,traceOfA,[],countOfA)
disp('drawing scatter plot for A colored by A^-1...');
createfigure2(determinantOfA,traceOfA,[],countAinv)
