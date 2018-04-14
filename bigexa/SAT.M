
%___________________________________________________________________________
%
%				SAT.M
%
% Solution of  the  application example SAT described in the SPACELIB user's
% manual (page 113). This  program   evaluate   the   parameters   of   the 
% rototraslation  necessary  to  orientate  an  antenna  mounted  on a space 
% satellite.
%
% (c) G.Legnani 1998 adapted from (c) G.Legnani and R.Faglia 1990
%___________________________________________________________________________


spheader

% Values of initial configuration 
P1=[ 0.875 2.1 1.5 1]';
P2=[ 1.75  2.1 3.2 1]';
mi=[ 1  0  0  0.875; 0  0  1  2.1; 0 -1 0 1.5; 0 0 0 1];

alpha=atan2( P2(Z)-P1(Z) , P2(X)/2 );
beta= atan2( P2(Y),P2(X) );

sb=sin(beta);		cb=cos(beta);
sb_a=sin(beta-alpha);   cb_a=cos(beta-alpha);

d=distp(P1,P2);

m4(X,X)=-cb_a;	m4(X,Y)=-sb_a;	m4(X,Z)=0;	m4(X,U)=P2(X)+d*cb;
m4(Y,X)=-sb_a;	m4(Y,Y)= cb_a;	m4(Y,Z)=0;	m4(Y,U)=P2(Y)+d*sb;
m4(Z,X)=0;	m4(Z,Y)=0;	m4(Z,Z)=-1;	m4(Z,U)=P2(Z);
m4(U,X)=0;	m4(U,Y)=0;	m4(U,Z)=0;	m4(U,U)=1;

% STEP 5

u5=[sb -cb 0]';

Q5=screwtom(u5,rad(26),P2,0);

% Final Configuration
mf=Q5*m4;

% Rototraslation 
miinv=invers(mi);
Qtot=mf*miinv;
[utot,fi,P,h]=mtoscrew(Qtot);

clc

% ----- PRINT OUTPUT RESULTS
fprintf(1,'\n\n--------------------------      Results      ------------------------------\n');
printm('The rototraslation axis u is :       ',utot);
fprintf(1,'\n The rotation angle along axis u is:    %3.3f° [deg]    %2.3f [rad]',deg(fi),fi)
fprintf(1,'\n\n The traslation along the axis u is :   %3.3f\n', h)
printm('The point P of the axis is:       ',P)  
