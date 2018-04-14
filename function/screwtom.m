
function M=screwtom(u,phi,p,h)

%SCREWTOM (Spacelib): Builds the rototranslation matrix Q.
%
% Screw to matrix. 
% Builds the rototranslation matrix Q from the axis of the screw displacement 
% , the rotation angle phi, the translation h along u and the coordinates  of 
% a point P of the axis.
% Input parameters:
% u  : 3-element vector which defines the rototranslation axis
% phi :  rotation angle
% P  : a POINT  of the axis
% h  : is the translation along the axis.
%
% Output:
% Q  : 4×4 rototranslation matrix.
%
% SCREWTOM performs the inverse operation than MTOSCREW.
% Usage:
%
%			M=screwtom(u,phi,p,h)
%
% Related functions: EXTRACT, ROTAT, ROTAT2,ROTAT24.
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

spheader

u=unitv(u);
M(1:3,1:3)=rotat(u,phi);
M(1:3,4)=(eye(3,3)-M(1:3,1:3))*p(1:3)+h*u;
M(4,1:4)=[0 0 0 1];

%u=unitv(u);
%M=rotat(u,phi); 

%M(1:3;1:3)=rotat(u,phi);
%for i=X:1:Z
%	for j=X:1:Z
%		M1(i,j)=M(i,j);
%	end
%end

%for i=X:1:Z
%	t=0;
%	for j=X:1:Z;
%		t=t-M1(i,j)*p(j);
%	end
%M1(i,U)=t+p(i)+u(i)*h;
%end

%M1(U,X)=0;	M1(U,Y)=0;	M1(U,Z)=0;	M1(U,U)=1;

