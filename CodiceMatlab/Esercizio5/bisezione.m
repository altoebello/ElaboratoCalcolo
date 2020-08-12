function [x,i]= bisezione(f,a,b,tolx)
%
%   [x,i] bisezione(f,a,b,tolx)
%   metodo di bisezione per calcolare gli zeri di una funzione f (continua)
%   [a,b] è l'intervallo interessato
%   x valore in uscita, x è l'approssimazione della radice
%   
%
    format long e
    fa = feval(f,a);
    fb = feval(f,b);
    if(fa*fb>0)
        error('dati in input invalidi');
    end
    imax = ceil(log2(b-a)-log2(tolx));
    %x0= a;
    for i= 1:imax
        x = (a+b)/2;
        fx = feval(f,x);
        %f1x = abs((fb-fa)/(b-a));
        if(abs(x-a)<= tolx*(1+abs(a)))
            break
        end
        %x0 = a;
        if fa*fx<0
            b = x;
            fb = fx;
        else
            a = x;
            fa = fx;
        end
    end
    
end
        