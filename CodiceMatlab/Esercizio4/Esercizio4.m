function xn = radn(x,n)
 %
 % xn=radn(n.x)
 % funzione Matlab che implementa il metodo di newton per il calcolo della
 % radice n−esima di un numero positivo x
 % xn è il valore in output che rappresenta la radice n-esima
 %
 format long e
 imax = 1000;
 tolx = eps;
 if x<0
     error('non è possibile calcolare la radice di un numero negativo');
 end
 x0 = 1;
 xn = ((n-1)*x0+x/x0^(n-1))/n;
 
 i=1;
 while(i<imax) && (abs(xn-x0)>tolx)
     i=i+1;
     x0 = xn;
     xn = ((n-1)*x0+x/x0^(n-1))/n;
 end
 
 if abs(xn-x0)>tolx
     error('il metodo non converge');
 end
 
 
 