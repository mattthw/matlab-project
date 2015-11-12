% A: n × n matrix A with floating-point real numbers as entries
% v: vector v of n floating-point real numbers that serves as
%      the initial guess for an eigenvector of A
% t: tolerance parameter ε (a positive floating-point real number)
%      that determines when the approximation is close enough
% int: positive integer N giving the maximum number of times to
%      iterate the power method before quitting.
function[A,v,t,int] = power_method(A)
