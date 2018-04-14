
% Sample program e_cardpt.m

spheader

q  =[1 1.2 3];
qp =[0 1 0];
qpp=[3 2.5 4.01];
omegapto=cardompt(q,qp,qpp,Y,X,Z);

printm('The resulting vector is:',omegapto)

