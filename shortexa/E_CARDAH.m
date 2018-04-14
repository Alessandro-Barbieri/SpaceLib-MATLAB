
% Sample program e_cardah.m

spheader

O=  [50 10 100 1]';
q=  [0.1 0.5 0.9];
qp= [0.2 0.4 0.1];
qpp=[0.5 1.2 0.3];
H=cardatoh(q,qp,qpp,X,Z,Y,O);

printm('The acceleration matrix obtained with function cardatoh is:',H)
M=cardatom(q,X,Z,Y,O);
W=cardatow(q,qp,X,Z,Y,O);
[q1,q2,qp1,qp2,qpp1,qpp2]=htocarda(M,W,H,X,Z,Y)