% A: n × n matrix A with floating-point real numbers as entries
% v: vector v of n floating-point real numbers that serves as
%      the initial guess for an eigenvector of A
% t: tolerance parameter ε (a positive floating-point real number)
%      that determines when the approximation is close enough
% s: positive integer N giving the maximum number of times to
%      iterate the power method before quitting.
function [e_value, e_vector] = power_method(A,v,t,s)
e_value = 0;
n = length(v);
u_vector = v;
prev_u = u_vector;
prev_val = e_value;
count = 0;
% while( (((e_value - prev_val) > t) && ((u_vector - prev_u) > t) && (count < s)) || (prev_u==u_vector) )
while(true)
    count=count+1;
    prev_u=u_vector
    prev_val=e_value;

    u_vector=A*prev_u.';
    numerator=max(u_vector);
    denominator=max(prev_u);
    e_value=numerator/denominator
end
end



