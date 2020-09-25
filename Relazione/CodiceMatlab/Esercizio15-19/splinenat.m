function y = splinenat( xi, fi, x )
%
% y = splinenat( xi, fi,x ) Calcola il vettore degli mi per il calcolo di una
% spline cubica naturale interpolante i punti (xi,fi).
% 
%
    m = length(xi);
    if m~=length(fi), error("dati errati"); end
    for i = 1:m-1
        if any( find(xi(i+1:m)==xi(i)) ), error("ascisse non distinte"), end
    end
    xi = xi(:); fi = fi(:);
    [xi,ind] = sort(xi);
    fi = fi(ind); % ordino le ascisse in modo crescente
    hi = diff(xi);
    n = m-1;
    df = diff(fi)./hi;
    hh = hi(1:n-1)+hi(2:n);
    rhs = 6*diff(df)./hh;
    phi = hi(1:n-1)./hh;
    csi = hi(2:n)./hh; % = 1-phi;
    d = 2*ones(n-1,1);
    phi = phi(2:n-1);
    csi = csi(1:n-2);
    mi = trisolve( phi, d, csi, rhs );
    mi = [0;mi;0];
    
    r=fi(1:n)-((hi(1:n).^2)/6).*mi(1:n);
    q=df(1:n)-((hi(1:n)/6).*(mi(2:m)-mi(1:n)));
    
    len = length(x);
    y = zeros(len,1);
    
    for i = 1 : len   
        index=find(x(i)>=xi(1:n),1,'last');
        if x(i) < xi(1)
            index = 1;
        end
        if x(i) > xi(m)
            index = n;
        end
        num = (((x(i)-xi(index)).^3).*mi(index+1)+((xi(index+1)-x(i)).^3).*mi(index));   
        den = (6*hi(index));    
        pq = q(index).*(x(i)-xi(index));    
        y(i) = num/den + pq +r(index);
    end
    return
    
end

