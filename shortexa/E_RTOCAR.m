
% Sample program e_rtocar.m 

R=[0.840 -0.395 -0.371; -0.415 -0.029 -0.909;  0.348 0.918 -0.189];

% Find the two solutions q1 and q2 are
[q1,q2]=rtocarda(R,Y,X,Z);

fprintf(1,'\nThe two solutions, evaluated with function RTOCARDA are:\n\n')
printm('q1 : ',q1)
printm('q2 : ',q2)
