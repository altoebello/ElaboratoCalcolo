function [x,i] = corde(f,f1,x0,tolx,maxit)
%
% function [x,i] = corde(f,f1,x0,tolx,maxit)
% Calcolo della radice di un numero utilizzando
% il metodo delle corde
%
    format long e
    if(tolx < eps)
        error("tolleranza non idonea");
    end
    
    f1x = feval(f1,x0);
    x=x0;
    
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
    
    
            
    
      