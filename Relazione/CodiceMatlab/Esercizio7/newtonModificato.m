function [x,i]= newtonModificato(f,f1,x0,m,tolx)
%
% x = newtonModificato(f,a,b,tolx) metodo per approssimazione tramite newton
% f funziona continua passata come parametro in input
% f1 derivata prima di f1
% m molteplicita' della radice
% x0 punto di parteza
% tolx tolleranza
% x valore in uscita che rappresenta l'approssimazione della radice
% i numero di iterazioni
%
    format long e;
    imax = 1000;
    x = x0;
    for i=1:imax
        fx = feval(f,x);
        if(fx == 0)
            break;
        end
        f1x = feval(f1,x);
        x0 = x;
        x = x0-m*(fx/f1x);
        if(abs(x-x0)<= tolx*(1+abs(x0)))
                break
        end
    end
    if(abs(x-x0)>tolx*(1+abs(x0)))
        error('il metodo non converge');
    end
end