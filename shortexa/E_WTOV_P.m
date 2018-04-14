
spheader

% Sample program: e_wtov_p.m

W=[0 0 0  2.5;
   0 0 0  1.7;  
   0 0 0  3.2; 
   0 0 0  0 ];

[u,omega,vel,P]= wtovel( W );
printm('the rotation axis u is:',u)
printm('the linear velocity along axis u is:',vel)
printm('the angular speed around axis  u is:',omega)
printm('the point of the rotation axis is:',P)
