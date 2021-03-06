format short e;
f =@(x)tan(x);
expectedY = log(cos(1)/cos(1.1));
a = -1;
b = 1.1;
actualY = zeros(9,1);
errore = zeros(9,1);
for i = 1 : 9
   
    actualY(i) = round(newtonCotes(f,a,b,i),3,'significant');
    errore(i) = round(abs(expectedY - actualY(i)),3,'significant');
end

disp(actualY);
disp(errore);