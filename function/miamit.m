
function A2=miamit(A1,M)

%MIAMIT (Spacelib): Transforms by the rule M2=M(i)*M1*M(i)(t) (i=inverse t=transposed)
%  		
%
% Performs   the   matrix  operations    A2=inv(M)*A1*(inv(M))'    for   4*4 
% contra-variant matrices. 
% MIAMIT performs the inverse operation then MAMT.
% See examples of  MAMT.
% Usage:
%
%                       A2=miamit(A1,M)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________


A2= ( invers(M)*A1 * (invers(M))') ;

