
function omegapto=gtomgapt(G)

%GTOMGAPT : Extracts the angular velocity vector from the acceleration matrix
%
% Function that extracts the angular velocity vector from the 3x3 upper-left
% submatrix G of the acceleration matrix H
%
% Input parameters:
%      G        : 3x3 upper-left submatrix of the acceleration matrix H
%
% Output parameters
%      omegapto : angular acceleration vector
% 
% Usage:
%				omegapto=gtomgapt(G)
%
% © G.Legnani, C. Moiola 1998; adapted from: D.Amadori, G.Pugliese 1997
%_____________________________________________________________________________

Gt=G';
OMEGAPTO=0.5*(G-Gt);
omegapto=mtov(OMEGAPTO);
