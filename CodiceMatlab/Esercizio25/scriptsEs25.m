a = -1;
b = 1;
f = @(x)1/(1+10^2*x^2);
n = 5; % scelto un valore a caso.
trapezi = zeros(1,n);
simpson = zeros(1,n);


for i = 1 : n
    [trapezi(i),points] = adaptrap(f,a,b,10^-(i+1)); 
    [simpson(i),points] = adapsim(f,a,b,10^-(i+1));
end

trapezi = trapezi(:);
disp("Trapezi: ");
disp(trapezi);
disp("Simpson Composite:");
simpson = simpson(:);
disp(simpson);