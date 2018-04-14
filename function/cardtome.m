
function omega=cardtome(q,qp,i,j,k)

%CARDTOME (Spacelib): Cardan angles to velocity matrix.
%
% Evaluates the angular velocity OMEGA.
% Equivalent  to  CARDTOOM(q,qp,i,j,k), but stores  the angular velocity in 
% a matrix A. 
% Usage:
%
%                       A= cardtome(q,qp,i,j,k)
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Adamini 1993  
%___________________________________________________________________________


mat=cardatol(q,i,j,k);  

OMEGA=mat*qp';   

omega=vtom(OMEGA);



