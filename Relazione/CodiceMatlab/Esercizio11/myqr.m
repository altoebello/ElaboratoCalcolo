function QR = myqr(A)
%
%function QR = myqr(A)
%fattorizzazione di una matrice A mxn 
%Input:
%   -A matrice m x n con m >= n
%Output:
%   -QR Matrice che contiene informazioni riguardanti i fattori Q e R
% 
    [m,n] = size(A);
    if(n > m)
        error("Dimensioni della matrice A non sono appropriate");
    end
    QR = A;
    for i = 1 : n
        alfa = norm(QR(i : n ,i));
        if (alfa == 0)
            error("Matrice non ha rango massimo!");
        end
        if(QR(i,i) >= 0)
            alfa = -alfa;
        end
        v1 = QR(i,i) - alfa;
        QR(i+1 : m, i) = QR(i+1 : m,i)/v1;
        beta = -v1/alfa;
        v = [1 : QR(i+1 : m,i)];
        QR(i : m,i+1 : n) = QR(i : m,i+1 : n) - (beta * v) + (v' * QR(i : m,i+1 :n));
    end
    return
end