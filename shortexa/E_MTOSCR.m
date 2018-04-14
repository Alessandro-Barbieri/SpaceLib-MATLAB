
% Sample program:  e_mtoscr.m

Q=[0 1 0 2; -1 0 0 0; 0 0 1 0; 0 0 0 1];

[u,fi,P,h]=mtoscrew(Q);

printm(' u=',u)
printm(' fi=',fi)
printm(' P=',P)
printm(' h=',h)