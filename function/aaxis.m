function u=aaxis(a)

%aaxis (Spacelib): create a unit vector parallel to an axis frame
%
%   'a' must be the constant X, Y, or Z
%
% Usage:
%			u=aaxis(a)
%
%
% © G.Legnani, D.Manara 2005
%___________________________________________________________________________

spheader;
u=zeros(3,1);
if (a>=X & a<=Z)
    u(a)=1;
else
    fprintf(1,'SPACELIB(aaxis) error illegal axis %d',a);
end