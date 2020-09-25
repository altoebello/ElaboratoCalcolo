f = @(x) x^2 * tan(x);
f1 = @(x) 2 * x * tan(x)+ x^2 * sec(x)^2;
x0 = 1;
tol = 10^-6;
m = 3;

%[x, i] = newtonModificato(f,f1,x0,m,tol);
%[x, i] = aitken(f,f1,x0,tol);

[x, i] = newton(f,f1,x0,tol);


disp(x);
disp(i);