
function A2=miam(A1,M)

%MIAM (Spacelib): Transforms by the rule inv(M)*A*M.
%
% Performs the matrix operation  A2 = M(i) * A1 * M   ( i= inverse)  for 4×4
% matrices  which  are  contra-variant  with  respect  to  the row index and 
% co-variant with respect to the column index.
% MIAM performs the ionverse operation then MAMI.
% Usage:
%
%			A2 = miam(A1,M)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________
 

A2=(invers(M)*A1*M);

