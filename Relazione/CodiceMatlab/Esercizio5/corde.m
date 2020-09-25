function [x,i] = corde(f,f1,x0,tolx)
%
% function [x,i] = corde(f,f1,x0,tolx)
% Calcolo della radice di un numero utilizzando
% il metodo delle corde
% f funzione continua input
% f1 derivata prima della funzione f
% x0 ascissa di partenza
% tolx tolleranza
% x approssimazione della radice
% i iterazioni
%
    format long e;
    if(tolx < eps)
        error("tolleranza non idonea");
    end
    
    f1x = feval(f1,x0);
    x=x0;
    maxit = 1000;
    for i = 1:maxit
           fx = feval(f,x);
           if fx==0 
                  break; 
           end
           x = x - fx/f1x;
           if abs(x-x0)<=tolx*(1+abs(x0))
                  break;
           else 
                  x0 = x;
           end
    end
    
    if abs(x-x0) > tolx*(1+abs(x0))
       error('metodo non converge'); 
    end
end
    
    
            
    
      