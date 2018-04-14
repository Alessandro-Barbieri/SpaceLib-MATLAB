
% Sample program: e_makel.m

spheader

O=ORIGIN;
pitch=0;
u=Zaxis;
L0=makel(Rev,u,pitch,O);

printm('The L matrix obtained with function MAKEL is :',L0)

