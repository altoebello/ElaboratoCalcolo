function x = chebyshev(a,b,n)
% function x = chebyshev(a,b,n);
%

x = (a+b)/2 +((b-a)/2)*cos((2*(0:n)+1)*(pi/(2*n+2)));

end