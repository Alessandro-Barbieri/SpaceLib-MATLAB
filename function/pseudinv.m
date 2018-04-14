
function Api=pseudinv(A)

%PSEUDINV (Spacelib): Builds the pseudo-inverse matrix Api of a given matrix A.
%                     not really useful in MATLAB.
% Supported only for compatility with the C-language version
%
%  Input parameters
%     A         : initial matrix whose pseudo-inverse must be found
%
% Output parameters
%     Api       : matrix where the pseudo-inverse is stored
%
%     Api = 	pseudinv(A) produces a matrix X of the same dimensions
% 		as A' so that A*X*A = A,  X*A*X = X and AX and XA
% 		are Hermitian. The computation is based on SVD(A) and any
% 		singular values less than a tolerance are treated as zero.
%
% Usage:
%
%			Api=pseudinv(A)
%
%_________________________________________________________________________ 


Api=pinv(A); 

