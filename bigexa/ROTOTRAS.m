

%___________________________________________________________________________
%
%				ROTOTRASLATION
%
% In this  example  we  show  how  to  calculate  the  rototranslation of the 
% triangle  which  passes  from  the  position (1)  to the position (2), see
% SPACELIB user's manual for more information.
%___________________________________________________________________________

spheader

clc 

P1=[0 1 2 1 ]';
P2=[0 6 2 1 ]';
P3=[0 1 6 1 ]';
P4=[3 0 2 1 ]';
P5=[8 0 2 1 ]';
P6=[3 0 6 1 ]';

% Builds position matrix of a frame passing from three points 

m01=frame4p(P1,P2,P3,Y,Z);
m02=frame4p(P4,P5,P6,Y,Z);

m10=invers(m01);

% Builds rototranslation matrix 

Q=m02*m10;


% Extract screw parameters
[u,phi,P,h]=mtoscrew(Q);


%-------- Print Output results:

fprintm(1,'Position matrix M10:',m10)
fprintm(1,'Position matrix M02:',m02)
fprintm(1,'Rototranslation matrix Q:',Q)
disp('The screw parameters are:')
fprintm(1,'Axis direction u:',u)
fprintm(1,'Rotation angle phi [rad]',phi)
fprintm(1,'Point of the axis P:',P')
fprintm(1,'Traslation along the axis h:',h)



