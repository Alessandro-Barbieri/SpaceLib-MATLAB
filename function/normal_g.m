function rn=normal_s(r1)

%NORMAL_S (Spacelib): normalize (orthogonalize) any square matrix.
%
% Transforms any square matrix A in the orthogonal matrix An most similar to the original one 
%
% 			An=normal_g(A)
%
% NOTE: a  square  matrix  is  orthogonal  if  its transpose and its inverse coincide
%
% © G.Legnani 2004
%___________________________________________________________________________

%NORMAL_G (Spacelib): transform a N*N matrix into the 'most similar' orthogonal matrix.

s=size(r1);
n=s(1);
if(s(1)~=s(2))
   fprintf(1,'NORMAL_G: bad matrix size (should be a square matrix, but it is [%d %d])',s(1),s(2));
end
i=0; imax=30;
d=det(r1);
d=sign(d)*abs(d)^(1/n);
rn=0.5*(r1/d+pinv(r1')*d);
while (jnorm(r1-rn)>0.000001 & (i<imax))
  d=det(rn);
  d=sign(d)*abs(d)^(1/n);
  r1=rn;
  rn=0.5*(r1/d+pinv(r1')*d);
  i=i+1;
end
if (i>=imax)
  disp('too many iterations:'); i
end
