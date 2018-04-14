

function Ai=minvers(A)

%MINVERS (Spacelib): Function that builds the inverse of a matrix A.
% not really useful in MATLAB.
% Supported only for compatility with the c-language version
%
% Input parameters
%      A      : initial square matrix whose inverse must be found
%      dim    : dimension of matrix A
%
% Output parameters
%      A      : matrix where the inverse is stored
%
%_________________________________________________________________________

Ai=eye(dim)/A;

