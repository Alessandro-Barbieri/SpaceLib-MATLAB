
spheader

% Sample program: e_wtol_p.m

W=[0 0 0 0;
   0 0 0  1.4142;  
   0 0 0  1.4142; 
   0 0 0  0 ];

L= wtol( W );
printm('the W matrix is:',W)
printm('the L matrix is:',L)
