

function B=invers(A)

%INVERS (Spacelib) : Inverse of a 4x4 position (transformation) matrix.
%
% This function should be more efficient than the 'standard' MATLAB version,
% but it works only for 4×4 transofrmation matrices.
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani 1990
%___________________________________________________________

spheader



% Metodo NUOVO
B=NULL4;
B(1:3,1:3)=A(1:3,1:3)';
B(1:3,U)  =-B(1:3,1:3)*A(1:3,U);
B(U,:)=[ 0 0 0 1];

