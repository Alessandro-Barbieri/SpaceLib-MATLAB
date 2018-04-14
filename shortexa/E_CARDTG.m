
% Sample program e_cardtg.m

spheader

q=  [0.1 0.5 0.9];
qp= [0.2 0.4 0.1];
qpp=[0.5 1.2 0.3];
A=cardatog(q,qp,qpp,Y,X,Z);

printm('The resulting matrix is:',A)
