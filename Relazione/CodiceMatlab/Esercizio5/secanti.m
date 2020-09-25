function [x,i] = secanti(f,x0,x1,tolx)
%
% x = secanti5(f,xprec,xi,tolx) metodo delle secanti per approssimazione
% della radice
% f funzione continua input
% f1 derivata prima della funzione f
% x0 ascissa di partenza
% x1 ascissa successiva a x0
% tolx tolleranza
% x approssimazione della radice
% i iterazioni
%  
    format long e;
    fx0 = feval(f,x0);  
    imax = 1000;
    for i=1:imax
        fx1 = feval(f,x1);
        dfx1 = (fx1-fx0)/(x1-x0); 
        x = x1 -fx1/dfx1;       
        if(abs(x-x1)<= tolx*(1+abs(x1)))    
            break;
        end
        x0 = x1;
        x1 = x;
        fx0 = fx1;
    end
    if (abs(x-x1)>tolx*(1+abs(x1)))
        error('il metodo non converge');
    end
end
