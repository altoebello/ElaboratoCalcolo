function I = trapecomp(f, a, b, n)
%
%
% I = trapecomp(f, a, b)
%
% Approssimazione dell'integrale definito di f(x) con estremi a e b, 
% mediante la formula composita dei trapezi su n+1 ascisse equidistanti
%	f	funzione
%	a,b	estremi dell'intervallo
%	I	approssimazione integrale definito di f(x)
%
    format long e;
    if a==b
        I=0;
    elseif n < 1 || n~=fix(n)
        error('numero di ascisse non valido');
    else
        h=(b-a)/n;
        x=linspace(a, b, n+1);
        f = feval(f, x);
        I = h*(f(1)/2 + sum(f(2:n)) + f(n+1)/2);
    end
    return
end
