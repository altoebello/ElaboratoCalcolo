function [ptx] = ascisseEquidistanti(a, b, n)
    h = (b-a)/n;
    ptx = zeros(n, 1);
    for i=1:n
        ptx(i) = a +(i-1)*h;
    end
    semilogy(ptx);
end
