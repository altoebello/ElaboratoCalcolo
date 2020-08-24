function c = pesiNewtonCotes(n)
%
%function c = pesiNewtonCotes(n)
% funzione che calcola i pesi di quadratura di newton cotes di grado n.
%
    
    % format rat; 
    %questo comando serve per visualizzare in formato
    %razionale, poichè questa funziona è usata successivamente da
    %newtonCotes, è stato commentato per poter avere valori decimali.
    
    c = zeros(n,1);
    for i = 1 : n
        j = (0:n);
        j(i)=[];
        f = @(t)(prod(t-j) /prod(i-1-j));
        c(i) = integral(f, 0, n, 'ArrayValued', true);  
    end
    c = [c;c(1)];
    return 
end




