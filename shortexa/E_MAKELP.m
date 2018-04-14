
% Sample program: e_makelp.m

spheader

O=ORIGIN
u=Xaxis;
pitch=0;
Lk=makel(Pri,u,pitch,O);
printm('The L matrix obtained with function MAKEL is :',Lk)
