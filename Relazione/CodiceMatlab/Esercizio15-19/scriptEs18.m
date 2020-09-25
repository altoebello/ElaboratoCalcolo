f = @(x)(cos((pi*(x.^2))/2));
x = linspace(-1,1, 1000);
x = x(:);
erroriEquidistanti= zeros(1, 40);
erroriChebyshev = zeros(1, 40);

for n = 4:100
    xlin = linspace(-1, 1, n+1);
    xcheby = chebyshev(-1,1,n+1);  
    fequi = splinenat(xlin,f(xlin),x);
    fchebyshev = splinenat(xcheby,f(xcheby),x);
    erroriEquidistanti(n) = max(abs(f(x) - fequi));
    erroriChebyshev(n) = max( abs(f(x) - fchebyshev));
end

semilogy(erroriEquidistanti);
hold on;
semilogy(erroriChebyshev);
xlabel('ascisse di interpolazione');
ylabel('errore commesso');
legend({'equidistanti', 'chebyshev'});  