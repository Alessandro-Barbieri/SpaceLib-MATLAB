function M=traslat24(a,h,P)

%traslat (Spacelib): translation of 'h' in direction of axis 'a' of a frame
%                    whose initial position was 'P'
%
%   translate a frame parallel to the reference frame whose origin was initially in point P
%   translation of distance 'h' in the direction of the frame axis 'a'
%
%   'a' must be the constant X, Y, or Z
%
% see also traslat, traslat2
%
% Usage:
%			M=traslat24(a,h,P)
%
% (c) G.Legnani, D.Manara 2005
%___________________________________________________________________________

spheader

M=eye(4,4);
if (a>=X & a<=Z)
    M(X:Z,U)=P(X:Z);
    M(a,U)=M(a,U)+h;
else
    fprintf(1,'SPACELIB(traslat24) error illegal axis %d',a);
end