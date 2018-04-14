
function  m=rotat34(a,q,P)

%ROTAT34 (Spacelib): Builds a position matrix of a frame whose origin is in P.
%
% This function  builds  a  position  matrix  of  a  frame  whose  origin is
% initially  stored  in  point  P and rotated of angle q about axis a.
%
% Input parameters:
%     q: rotation angle		
%     P : starting homogeneous coordinates of the rotating frame origin
%     a : rotation axis (it must be either the constant X=1,Y=2, Z=3, U=4)
%
% If a=U the rotation is assumed null 
% Usage:
%
%				m=rotat34(a,q,P)
%____________________________________________________________________________


spheader

m=rotat24(a,q,P);

R=m(1:3,1:3);
Or=R*P(X:Z);
m(X:Z,U)=Or;
m(U,X:U)=[0 0 0 1];
%m=vmcopy(O,3,4,Col,m,4,4);

