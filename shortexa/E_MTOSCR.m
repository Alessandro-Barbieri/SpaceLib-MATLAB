
% Sample program:  e_mtoscr.m

Q=[0 1 0 2; -1 0 0 0; 0 0 1 0; 0 0 0 1];

[u,phi,P,h]=mtoscrew(Q);

printm(' u=',u)
printm(' phi=',phi)
printm(' P=',P)
printm(' h=',h)