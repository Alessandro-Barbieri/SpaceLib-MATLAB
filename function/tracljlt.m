

function T=tracljlt(L1,J,L2)

%TRACLJLT (Spacelib): Return the trace of a matrix.
%
% Return the trace (sum of the elements on the diagonal of the matrix) of 
% the product: 
%
%			L1*J*trasp(L2)
% Usage:
% 			T=tracljlt(L1,J,L2)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

T=trace(L1*J*L2');
