
function [u,t]=unitv(V)

%UNITV (Spacelib): Function that extracts the unit vector u of a vector V.
%
% Unit vector
% This function extracts the unit vector 'u' of a vector V (u=v/mod(v) ) and
% returns the module of the vector.
% If the vector is v=[ 0 0 0 ], the unit vector is u=[0 0 0];
% Usage: 
%			[u,t] = unitv(V)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
% patched by G. Legnani nomember 2001
%___________________________________________________________________________


t=modulus(V);   %patch by g. legnani november 2001

if (t~=0)
	u=V/t;
else 
    u=[0 0 0 ];
end
