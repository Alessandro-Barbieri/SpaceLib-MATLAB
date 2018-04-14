
% Samlpe program: e_makel0.m

spheader

P=[0 1.2 1.2 1]';
pitch=0.;
u=Xaxis_n;
Lk=makel(Rev,u,pitch,P);
printm('The L matrix obtained with function makel is:',Lk)
