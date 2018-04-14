function m=jrand(imax,jmax,min,max)

%JRAND (Spacelib): creates a random matrix whith elements in the range min..max
%
% Input Parameters:
%
% imax	 : number of rows    of the random matrix
% jmax	 : number of columns of the random matrix
% min,max: lower and upper bound range of the random elelments
%
% Output Parameters:
%
% m : matrix filled with random elements.
%
% Usage:
%		m=jrand(imax,jmax,min,max)
%______________________________________________________________________
m=rand(imax,jmax)*(max-min) + min;


