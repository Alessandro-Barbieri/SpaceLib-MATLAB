
function [x,irank]=solve_l(A,b)


%SOLVE_L (Spacelib): Function for the solution of a "standard" linear system.
% not really necessary in MATLAB.
% supported only for compatibility with C-language version
%
% Function for the solution of a "standard" linear system in the form
%			  A*x=b
% Input paremeters
%      A 	: square matrix containing the system coefficients
%      b 	: array of the right hand coefficients
%
% Output parameters
%      x	: column array where the solution is stored
%      irank 	: The rank of the matrix A
%
% Note :this function is used in order to solve a "standard" linear system.
%       The function also returns the rank of matrix A
% 
% Usage:
%		[x,irank]=solve_l(A,b)
%
%_____________________________________________________________________________


% Solution of the linear  system
x=A\b;

% Rank of the matrix
irank=rank(A);

