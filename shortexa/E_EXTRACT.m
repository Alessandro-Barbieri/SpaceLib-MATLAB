
% Sample program:	 e_extrac.m

Q=[0 1 0 2; -1 0 0 0; 0 0 1 0; 0 0 0 1];

[u,phi]=extract(Q);

printm(' The rotation axis  is',u)
printm(' The rotation angle is',phi)
