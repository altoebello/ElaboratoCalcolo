function [LU,p] = palu(A)
%
%function [LU,p] = paly(A)
%Fattorizzazione LU con pivoting parziale di una matrice
%A non singolare data in input
% Input:
%   -A: matrice non singolare da fattorizzare
%Output:
%   -LU matrice che contiene informazioni dei fattori L e U
%   -p : vettore di permutazione
%
    [m,n] = size(A);
    if(n ~= m)
        error("la matrice A non è quadrata");
    end
    p=[1:n];
    LU = A;
    for i = 1 : (n-1)
       [mi, ki] = max(abs(LU(i:n, i))); 
       if (mi == 0)
           error("La matrice non è singolare");
       end
       ki = ki+i-1;
       if(ki>i)
           LU([i,ki],:) = LU([ki,i], :);
           p([i,ki]) = p([ki,i]);
       end
       LU(i+1:n,i)=LU(i+1:n,i)/LU(i,i);
       LU(i+1:n,i+1:n)=LU(i+1:n,i+1:n)-LU(i+1:n,i)*LU(i,i+1:n);
    end
    %return
end