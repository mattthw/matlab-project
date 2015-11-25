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
    e_value = 0;
    count = 0;
    w=zeros(1,length(e_vector));
    w(1,1)=1;
    while(true)
        prev_u=e_vector;
        prev_val=e_value;
        e_vector=mult(A,prev_u);
        numerator=abs(mult(w,e_vector));
        denominator=abs(mult(w,prev_u));
        e_value=numerator/denominator;
        e_value = (round((e_value*100000))/100000);
        if ((abs(e_value - prev_val)<t && count > 1) || count==s)
            if (count==s)
                e_vector=[0;0];
                count=101;
                e_value=0;
            end
            if (le(abs(e_value - prev_val),t))
                % disp('Stopped at tolerance condition')
            end
            return;
        else
            count=count+1;
        end
    end
end

% matrix multiplication
function res = mult(A,B)
    % get dimmensions
    row_a=size(A,1);
    col_a=size(A,2);
    row_b=size(B,1);
    col_b=size(B,2);
    % create new matrix from old two
    if (col_a==row_b)
        res=zeros(row_a,col_b);
        for i=1:row_a
            for j=1:col_b
                res(i,j)=res(i,j)+(A(i,:)*B(:,j));
            end
        end
    end
    % res is returned
    % disp(sprintf('DEBUG A:%g B:%g res:%g',A,B,res));
end