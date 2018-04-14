function M=traslat(u,h)

%traslat (Spacelib): translation of 'h' in direction 'u'
%
%   create a frame parallel to the reference frame translated of
%   the distance 'h' in the direction of the unit vector 'u'
%
% see also traslat2, traslat24
%
% Usage:
%			M=traslat(u,h)
%
%
% © G.Legnani, D.Manara 2005
%___________________________________________________________________________

spheader
d=unitv(u)*h;
M=eye(4,4);
M(X:Z,U)=d;