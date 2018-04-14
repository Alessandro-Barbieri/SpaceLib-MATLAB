
function M=screwtom(u,fi,p,h)

%___________________________________________________________________________
%
% SCREWTOM
%
% Screw to matrix. 
% Builds the rototraslation matrix Q from the axis of the screw displacement 
% u, the rotation angle fi, the traslation h along u and the coordinates  of 
% a point P of the axis.
% SCREWTOM performs the inverse operation than MTOSCREW.
% Usage:
%
%			M=screwtom(u,fi,p,h)
%
% Related functions: EXTRACT, ROTAT.
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

header

M=rotat(u,fi,4); 

u(U)=0;

for i=X:1:U
	t=0;
	for j=X:1:U;
		t=t-M(i,j)*p(j);
	end
M(i,U)=t+p(i)+u(i)*h;
end


M(U,X)=0;	M(U,Y)=0;	M(U,Z)=0;	M(U,U)=1;
