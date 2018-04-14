
function L=wtol(W)

%WTOL (Spacelib): Extracts L matrix from the corresponding W matrix.
%
% Input paerameters:
% 	W: 4×4 velocity matrix.
%
% Usage: 
%
% 			L=wtol(W)
%			
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990 
% patched by G. Legnani November 2001
%___________________________________________________________________________

spheader

v=mtov(W);

m=modulus(v);

if (m < eps)
	m = sqrt ( W(X,U)^2 + W(Y,U)^2 + W(Z,U)^2);  
end

if (m < eps)	
	L=NULL4; 
else
    L=W/m;
end
