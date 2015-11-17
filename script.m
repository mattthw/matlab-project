% TEMPORARILY HARDCODED
% TODO: Get use input
A = [1 1 1 1;1 2 3 4;1 3 6 10;1 4 10 20]
B = [1;1/2;1/3;1/4]

[L,U,error] = lu_fact(A)

A = [3 4;3 1]
v = [1 0]
t = 1/5;
s = 10;
[e_value, e_vector] = power_method(A,v,t,s)