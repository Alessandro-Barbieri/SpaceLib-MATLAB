
function A=normskew(M,ssign)

%NORMSKEW (Spacelib) : Makes symmetric/antisymmetric(normalize) a matrix.
%
% Makes symmetric/antisymmetric(normalize) a matrix
% sign must have one of the following values
%
%		SYMM=1=symmetric 	SKEW=-1=antisymmetric
%
% Usage:
% 
%                       M=normskew(A,sign)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

spheader

if ( (ssign~=SYMM_) && (ssign~=SKEW_) )
	error(' Error in NORMSKEW: Illegal value of ssign ')
end
% Makes simmetric/antisimmetric a matrix

%A=M;
%A(1:3,1:3)=0.5*(M(1:3,1:3)+ssign*M(1:3,1:3)');
A=0.5*(M+ssign*M');

