
function pl=plane(P1,P2,P3)

%PLANE (Spacelib): Builds  the  plane  pl  containing  three points P1,P2,P3 
%
% Input parameters:
%       P1,P2,P3: points that we want to be on the plane
% 
% Output parameters:
%	pl      : plane that contains the three points
%
% Usage:
%		pl=plane(P1,P2,P3)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: AMADORI, GHISLOTTI,PUGLIESE 1997
%___________________________________________________________________________

spheader

v12=vect(P1,P2);
v32=vect(P3,P2);

pl=cross(v12,v32);

pl=unitv(pl)';  %% plane is a row
% Homogeneus Coordinates
pl(U)=-dot3(P2(1:3),pl);


