function x = secanti5(f,x0,x1,tolx)
%
% x = secanti5(f,xprec,xi,tolx) metodo delle secanti per approssimazione
% della radice
% f funzione continua in input
% x0 valore della x in posizione i-1
% x1 valore della x in posizione i
% tolx tolleranza
% x il valore in output che rappresenza l'approssimazione cercata
%

    fx0 = feval(f,x0); %f(xi-1)
    %x = x0-fx0/f1x0; 
    imax = 1000;
    for i=1:imax
        fx1 = feval(f,x1);%f(xi)
        dfx1 = (fx1-fx0)/(x1-x0); %f'(xi)
        x = x1 -fx1/dfx1;       %xi+1 = xi - f(xi)/f'(xi)
        if(abs(x-x1)<= tolx*(1+abs(x1)))    %xi+1-xi
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
