
function pl=plane2(P1,v)

%PLANE2 (Spacelib): builds a plane containing a point and being normal to a vector
%
% Usage: 
%
%			 pl=plane2(P1,v)
%___________________________________________________________________________

spheader

% Check if the vector v is a row vector
[m,n]=size(v);
if (n~=1)
        disp('PLANE2 : vector must be a column (not a row)'); %verificare
        v=v'
end
pl=unitv(v)'; % a plane is a row vector (not a column) 
pl(U)=0;
% Evaluate the distance from the origin
pl(U)=-dot3(P1,pl);

