
% Sample program e_cardaw.m

spheader

O=[50 10 100 1]';
q=[0.1 0.5 0.9];
qp=[0.2 0.4 0.1];

%q=[0. 0. 0.];
%qp=[1 0 0];

W=cardatow(q,qp,X,Z,Y,O);
printm('The velocity matrix obtained with function CARDATOW is:',W)
M=cardatom(q,X,Z,Y,O);
[q1,qp1,q2,qp2]=wtocarda(M,W,X,Z,Y)