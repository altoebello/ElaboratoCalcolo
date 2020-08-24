function y = newtonCotes(f,a, b, n)
%
% y= newtoncotes(f,a,b, n)
% calcola l'approssimazione dell'integrale definito per la funzione f sull'intervallo [a,b]
% con la formula di newton cotes
 %

    if a > b || n < 0
        error('dati inconsistenti');
    end
     
     x = linspace(a, b, n+1);
     
     fx = feval(f, x);
     
     h = (b-a)/ n;
     
     c = pesiNewtonCotes(n);
     
     y = h*sum(fx*c);
     
     return
 end
