
% Sample program e_framep.m

spheader

P1=[5 4 3]';
P2=[5 6 4]';
P3=[5 5 5]';

R01=framep(P1,P2,P3,X,Y);

printm('The rotation matrix is: ',R01);
