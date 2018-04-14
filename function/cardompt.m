
function OMEGAPTO=cardompt(q,qp,qpp,i,j,k)

%CARDOMPT (Spacelib): Cardan angles to angular acceleration.
%
%
% Evaluates the angular acceleration of a moving frame from three Cardan (or 
% Euler) angles q and their first and second time derivatives qp and qpp.
% The parameters i, j, k  specify  the sequences of the rotation axes (their
% value must be the constant X,Y or Z). 
% j must be different from i and k, k could be equal to i.
%
% Input parameters
% q:        3-element vector containing the 1st, 2nd and 3rd angle.
% qp : 	    3-element vector containing the time derivative of q.
% qpp: 	    3-element vector containing the 2nd time derivative of q.
% 
% Output parameters:
% OMEGAPTO: 3-element column vector containing the angular acceleration.
% Usage:
%
%			OMEGAPTO=cardompt(q,qp,qpp,i,j,k)
%
% © G.Legnani, C. Moiola 1998; adapted from:  G.Legnani and R.Adamini 1993
%___________________________________________________________________________


spheader

mat=cardatol(q,i,j,k);
mat1=cardtowp(q,i,j,k);

wprod(X) = qp(Y)*qp(Z);
wprod(Y) = qp(X)*qp(Z);
wprod(Z) = qp(X)*qp(Y);

buffer = mat*qpp';
buffer1 =mat1*wprod';

OMEGAPTO=buffer+buffer1; 

