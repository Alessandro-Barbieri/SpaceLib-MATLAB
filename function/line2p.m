function l=line2p(P1,P2)

%LINE2P (Spacelib): builds the line passing through point P1 and P2.
%
% The unit vector of l has the same direction of vector P1->P2. 
% The origin of line l is P1.
%
% Input parameters
%      P1,P2 : 4-element vector that define the direction of line. 
%
% Output parameters
%      l : LINE type. 
%          In the first column  are contained the point of the origin,
% 	   in the second column are contained the director cosines of the line. 
% Usage:
%
%			l=line2p(P1,P2)
%
%___________________________________________________________________________

spheader 

l=zeros(4,2);

l(:,X)=P1;
v=vect(P2,P1);
l(:,Y)=[v;0];

% evaluates the unit vector of the line
l(:,Y)=unitv(l(:,Y));
