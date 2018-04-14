
% Sample program: e_wtovel.m

W=[0 -2 2.5 2.5; 2 0 -4.5 1.7; -2.5 4.5 0 3.2; 0 0 0 0 ];
[u,omega,vel,P]= wtovel( W );

printm('the rotation axis u is:',u)
printm('the linear velocity along axis u is:',vel)
printm('the angular speed around axis  u is:',omega)
printm('the point of the rotation axis is:',P)

