function [x,i]= Aitken(f,f1,x0,tolx)
%
% x = newton(f,a,b,tolx) metodo per approssimazione tramite newton
% f funziona continua passata come parametro in input
% f1 derivata prima di f1
% x0 punto di parteza
% tolx tolleranza
% x valore in uscita che rappresenta l'approssimazione della radice
%
%
    format long e;
    imax = 100;
    x = x0;
    for i=1:imax
        x0 = x;
        fx = feval(f,x0);
        f1x = feval(f1,x0);
        x1 = x0-fx/f1x;
        fx = feval(f,x1);
        f1x = feval(f1,x1);
        x = x1-fx/f1x;
        x = (x*x0-x1^2)/(x-2*x1+x0);
        if(abs(x-x0)<= tolx*(1+abs(x0)))
                break
        end
    end
    if(abs(x-x0)>tolx*(1+abs(x0)))
        error('il metodo non converge');
    end
end