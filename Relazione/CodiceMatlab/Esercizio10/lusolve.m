function x = lusolve(LU,p,b)
%
%function x = lusolve(LU,p,b)
%risoluzione sistema lineare lux=b(p)
%Input:
%   -LU matrice ottenuta tramite function palu
%   -p: vettore di permutazione ottenuta tramite function palu
%   -b: vettore termini noti del sistema Ax = b
%Output:
%   -x: soluzione del sistema lineare lux = b(p)
    
    [m,n] = size(LU);
    if(m~=n || n~=length(b))
        error("dati inconsistenti");
    elseif ( min(abs(diag(LU))) == 0 )
        error("fattorizzazione errata");
    end
    x = b(p);
    for i = 1 : (n-1)
        x(i+1 : n) = x(i+1 : n) - LU(i+1 : n , i)* x(i);
    end
    x(n) = x(n)/LU(n , n);
    for i = n-1 : -1 : 1
        x(1 : i) = x(1 : i) - LU(1 : i , i+1)* x(i+1);
        x(i) = x(i) / LU(i , i);
    end
    return
end