a = -1;
b = 1;
f = @(x)1/(1+10^2*x^2);
n = 5; 
trapezi = zeros(1,n);
simpson = zeros(1,n);
pointsTrap = zeros(1,n);
pointsSim = zeros(1,n);

for i = 1 : n
    [trapezi(i),pointsT] = adaptrap(f,a,b,10^-(i+1));
    [simpson(i),pointsS] = adapsim(f,a,b,10^-(i+1));
    pointsTrap(i) = length(pointsT);
    pointsSim(i) = length(pointsS);
end

trapezi = trapezi(:);
disp("Trapezi: ");
disp(trapezi);
disp("Punti: ");
disp(pointsTrap);
disp("Simpson Composite:");
simpson = simpson(:);
disp(simpson);
disp("Punti: ");
disp(pointsSim);