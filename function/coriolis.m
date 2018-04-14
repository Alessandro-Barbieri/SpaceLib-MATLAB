

function H=coriolis(H0,H1,W0,W1)

%CORIOLIS (Spacelib): Function that performs the Coriolis' theorem.
%
% Performs the Coriolis' theorem:
%
%			H = H0 + H1 + 2*W0*W1
% 
% Usage:
%
%			H=coriolis(H0,H1,W0,W1)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

H=H0+H1+2*W0*W1;
