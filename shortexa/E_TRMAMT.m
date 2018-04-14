
% Sample program e_trmamt.m (see page 30 user's manual)


GAMMA1=[0 19 -2.5 9; -19 0 -38.5 0.5;...
	 2.5 38.5 0 13.5; -9 -0.5 -13.5  0];

m=[0 1 0 1.2;-1 0 0 -0.5; 0 0 1 4; 0 0 0 1];

GAMMA0=mamt(GAMMA1,m);
printm('The matrix GAMMA0 is :',GAMMA0)

GAMMA01=miamit(GAMMA0,m);
printm('The matrix GAMMA1 is :',GAMMA1)
