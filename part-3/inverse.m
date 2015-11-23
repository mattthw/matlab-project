% get inverse of matrices in array
function [m_inverse] = inverse(matrices)
    disp('Obtaining inverses for entries in array...');
    m_inverse=zeros(2,2,30);
    for n=1:1000
        determ=(matrices(1,1,n)*matrices(2,2,n)-matrices(1,2,n)*matrices(2,1,n));
        den=1/determ;
        newa=matrices(2,2,n)*den;
        newb=-matrices(1,2,n)*den;
        newc=-matrices(2,1,n)*den;
        newd=matrices(1,1,n)*den;
        % disp('comparing inverses');
        % m_inverse(:,:,n)=[newa, newb; newc, newd]
        m_inverse(:,:,n)=inv(matrices(:,:,n));
    end
end