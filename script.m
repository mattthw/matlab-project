% TEMPORARILY HARDCODED
% TODO: Get use input
A = [1 1 1 1;1 2 3 4;1 3 6 10;1 4 10 20]
B = [1;1/2;1/3;1/4]
cd('./part-1');
% disp('starting lu_fact.');
[L,U,error] = lu_fact(A)
cd('../')
cd('./part-3')
A = [3 4;3 1];
v = [1;0];
t = 1/5;
s = 10;
[e_value, e_vector, count] = power_method(A,v,t,s)


% END OF SCRIPT
cd('../');