% A: n × n matrix A with floating-point real numbers as entries
% v: vector v of n floating-point real numbers that serves as
%      the initial guess for an eigenvector of A
%      !!NUMBER OF ROWS SHOULD == # OF COLUMNS IN A!!
%       ex: A=[1 2 5;3 1 4] v=[1;4;6]
% t: tolerance parameter ε (a positive floating-point real number)
%      that determines when the approximation is close enough
% s: positive integer N giving the maximum number of times to
%      iterate the power method before quitting.
% e_value
function [e_value, e_vector, count] = power_method(A,e_vector,t,s)
    disp('Starting power_method');
    e_value = 0;
    x = [0 3 65 2 6];
    prev_u = e_vector;
    prev_val = e_value;
    count = 0;
    while(true)
        prev_u=e_vector;
        prev_val=e_value;
        e_vector=A*prev_u;
        numerator=max(e_vector);
        denominator=max(prev_u);
        digits(1/(t));
        e_value=vpa(numerator/denominator);
        if (abs(e_value - prev_val)<t || count==s)
            if (count==s)
                disp('Stopped at max count')
                e_value=0;
            end
            if (le(abs(e_value - prev_val), t))
                disp('Stopped at tolerance condition')
            end
            % e_vector <-- this not needed, will return values
            % e_value
            return;
        else
            count=count+1;
        end
    end
end