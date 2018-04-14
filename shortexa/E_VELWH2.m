
% Sample program: e_velwh2.m

qp=1.5;
qpp=0.9;
[W1,H1]=vactowh2(Rev,Z,qp,qpp);

printm('The velocity matrix is:',    W1)
printm('The acceleration matrix is:',H1)
