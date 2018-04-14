
% Sample program e_cardam.m

spheader

O=[100 200 300 1]';
q=[1 2 1.5];
m=cardatom(q,X,Z,Y,O);

printm('The position matrix build with function CARDATOM is:',m)