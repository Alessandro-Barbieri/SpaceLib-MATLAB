function rn=normal3(r1)

%NORMAL3 (Spacelib): normalize (orthogonalise) a 3*3 matrix.
%
% Makes ortogonal  a 3*3 matrix  
%
% 			Rn=normal(R)
%
% NOTE: a  square  matrix  is  ortogonal  if  its transpose and its inverse coincide
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

%NORMAL3 (Spacelib): transform a 3*3 matrix into the 'most similar' orthogonal matrix.
s=size(r1);
if(s(1)~=3 | s(2)~=3)
   fprintf(1,'NORMAL3: bad matrix size (should be [3 3] but it is [%d %d])',s(1),s(2));
end
i=0; imax=30;
d=det(r1);
d=sign(d)*abs(d)^(1/3);
rn=0.5*(r1+adj3(r1)/d)/d;
while (jnorm(r1-rn)>0.00001 & (i<imax))
  d=det(rn);
  d=sign(d)*abs(d)^(1/3);
  r1=rn;
  rn=0.5*(r1+adj3(r1)/d)/d;
  i=i+1;
end
if (i>=imax)
  disp('NORMAL3: too many iterations:'); i
end

