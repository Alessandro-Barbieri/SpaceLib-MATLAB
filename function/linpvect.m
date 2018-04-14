
function l=linpvect(P1,v)

%LINPVECT (Spacelib): Builds a line passing through a point and directed as a vector
%
% Function that builds a line passing through point P1. The direction of its
% unit vector is given by vector v
%
% Input parameters
%     P1 : point that defines the origin of line
%     v  : vector that defines the unit vector associated with the
%	   direction of l
%
% Output parameters
%      l     : line structure (see users manual) which contains the point that lies
%		on the line and the director cosines that expresss the direction of the line.
% Usage:
%
%				l=linpvect(P1,v)
%_________________________________________________________________________

spheader

l=zeros(4,2);

l(:,X)=P1;

% unit vector of line 
u=unitv(v);
l(1:3,Y)=u;
