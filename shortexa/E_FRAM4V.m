
% Sample program e_fram4v.m

spheader

P1=[5 4 3 1]';
v1=[0 2 1]';
v2=[0 1 2]';

m01=frame4v(P1,v1,v2,X,Y);
printm('The position matrix is:',m01)