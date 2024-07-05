function[xvec, iter, scarti, asint1] = pfisso(x0, maxit, toll, phi)
%-----------------------------------------------------------------%
%  Metodo del punto fisso per la ricerca degli zeri di una funzione
%-----------------------------------------------------------------%
%[xvec, iter, scarti, asint1] = pfisso(z0, maxit, toll, phi)
%-----------------------------------------------------------------%
%INPUT:
% x0: approssimazione iniziale
% maxit: numero massimo di iterazioni
% toll: tolleranza
% phi: funzione di iterazione
%OUTPUT:
% xvec: vettore delle approssimazioni della radice
% iter: numero di iterazioni effettuate
% scarti: vettore degli scarti successivi
% asint1: stima costante asintotica 
%-----------------------------------------------------------------%
xvec = [x0];
scarti = [];
iter = 0;
dif = toll + 1;
xold = x0;
while (abs(dif) > toll) && (iter < maxit)
    xnew = phi(xold);
    dif = xnew - xold;
    xvec = [xvec; xnew];
    scarti = [scarti; dif];
    xold = xnew;
    iter = iter + 1;
end
asint1 = abs(scarti (2: iter)./ scarti (1:iter -1));
