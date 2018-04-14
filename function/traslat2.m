function M=traslat2(a,h)

%traslat (Spacelib): translation of 'h' in direction of axis 'a'
%
%   create a frame parallel to the reference frame translated of
%   the distance 'h' in the direction of the frame axis 'a'
%
%   'a' must be the constant X, Y, or Z
%
% see also traslat, traslat24
%
% Usage:
%			M=traslat2(a,h)
%
%
% (c) G.Legnani, D.Manara 2005
%___________________________________________________________________________

spheader

M=eye(4,4);
if (a>=X & a<=Z)
    M(a,U)=h;
else
    fprintf(1,'SPACELIB(traslat2) error illegal axis %d',a);
end
