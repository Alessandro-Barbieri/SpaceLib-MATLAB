
% Sample program e_crd_om.m

spheader

q=[10 5 12];
qp=[0 2 1];
omega=cardtoom(q,qp,Z,Y,X);
printm('The angular velocity omega obtained with  function CARDTOOM is:',omega)