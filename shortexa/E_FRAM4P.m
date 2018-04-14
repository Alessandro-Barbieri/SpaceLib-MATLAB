
% Sample program e_fram4p.m

spheader

P1=[5 4 3 1]';
P2=[5 6 4 1]';
P3=[5 5 5 1]';
m01=frame4p(P1,P2,P3,X,Y);

printm('The position matrix is :',m01)
