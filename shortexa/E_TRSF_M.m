
% Sample program e_trsf_m.m 

W1=[0 -1.5 0 0; 1.5 0 0 0; 0 0 0 0; 0 0 0 0];
H1=[ -2.25 -0.9 0 0; 0.9 -2.25 0 0 ;0 0 0 0; 0 0 0 0];
m01=[1 0 0 0.4; 0 1 0 0.1; 0 0 1 0; 0 0 0 1];

W0=mami(W1,m01);
H0=mami(H1,m01);

printm('The velocity     matrix in reference (0) is:',W0)
printm('The acceleration matrix in reference (0) is:',H0)


