function c = pesiNewtonCotes(n)
%
%function c = pesiNewtonCotes(n)
% funzione che calcola i pesi di quadratura di newton cotes di grado n.
%
    
    format rat;  
    c = zeros(1,n);
    for i = 1 : n+1
        j = (0:n);
        j(i)=[]; 
        f = @(t)(prod(t-j) /prod(i-1-j));
        c(i) = integral(f, 0, n, 'ArrayValued', true);  
    end 
    
    return   
end




