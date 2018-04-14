function a = PseDot(L,F)

%PseDot (Spacelib):  Pseudo scalar product for matrices.
%
% Evaluates the pseudo dot product between matrices
% useful to evaluate:
%
% PseDot(W,F) % power of forces
% PseDot(L,F) % project forces on motion
%
% Usage:
%
% 			a=PseDot(L,F)
%
% (c) G.Legnani, 2003
%_________________________________________________________________________


spheader

a= L(X,U)*F(X,U)+L(Y,U)*F(Y,U)+L(Z,U)*F(Z,U)+ L(Z,Y)*F(Z,Y)+L(X,Z)*F(X,Z)+L(Y,X)*F(Y,X);