
function [q1,q2]=mtocarda(M,i,j,k)

%MTOCARDA (Spacelib): Position matrix to Cardan angles.
%
% Builds the  Euler/Cardan  angles  which  specify  the  position of a frame 
% whose position matrix is M. 
% The  parameters  i,j,k  specify  the  sequence of the rotation axes (their 
% value must be X, Y  or Z.
% j must be different from i and k, k could be equal to i.
% q1,q2 : 3-element  vector  containing  the 1st, 2nd and 3rd rotation angle
% 	  the two configurations.
% Usage:
%
%			[q1,q2]=mtocarda(M,i,j,k)
%
% © G.Legnani, C. Moiola 1998; adapted from: D.Amadori, P.Ghislotti and G.Pugliese 1997
%___________________________________________________________________________ 

spheader

if ( i<X | i>Z | j<X | j>Z | k<X | k>Z | i==j | j==k )
	error('	 Error in MTOCARDA: Illegal rotation axis');
end

for t=X:1:Z
	for p=X:1:Z
		R(t,p)=M(t,p);
	end
end

[q1,q2]=rtocarda(R,i,j,k);
