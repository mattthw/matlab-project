% assign nxn matrix to A
A=importdata('testa.dat');
% assign nx1 vector to e_vector
e_vector=importdata('testb.dat');
% assign tolerance to t
t=0.00005;
% assign max iterations before failure
% **IF FAILURE: COUNT WILL BE 0**
s=100;
% call power method
disp('printing results. count 0 = failure');
[eigenvalue, eigenvector, count] = power_method(A,e_vector,t,s)


% create table and scatter plots

% T = table(eigenvalue,eigenvector,count)
% filename='results.csv';
% writetable(T,filename);