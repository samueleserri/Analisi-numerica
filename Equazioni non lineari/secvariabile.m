function[iter, x, step]  = secvariabile(x0, x1, itmax, tol, f)

%----------------------------------------------------------------
% SECVARIABILE:  calcola una radice della funzione f definita
% usando il metodo delle secanti.
% test di arresto sullo scarto (step = residuo pesato).
%----------------------------------------------------------------
% [iter, x, step] = secvariabile(x0, x1, itmax, tol, f)
%----------------------------------------------------------------
% INPUT:
% x0, x1: approssimazioni iniziali
% itmax: numero massimo di iterazioni
% tol: tolleranza
% f: funzione della quale si cerca una radice
% OUTPUT:
% iter: numero di iterazioni effettuate 
% x: vettore delle approssimazioni della radice
% step: vettore degli scarti successivi
%----------------------------------------------------------------

x = [x0, x1];
iter = 0;
step = [];
xoldold = x0;
xold  = x1;
dif = tol + 1;
while(abs(dif) > tol) && (iter < itmax)
    fx = feval(f, xold);
    h_k =  (feval(f, xold) - feval(f, xoldold))/(xold - xoldold);
    if h_k == 0
        disp('ERRORE: h_k = 0');
        return;
    end
    iter = iter + 1;
    dif = -fx/h_k;
    xnew = xold + dif;
    xoldold = xold;
    xold = xnew;
    x = [x, xnew];
    step = [step, dif];
end