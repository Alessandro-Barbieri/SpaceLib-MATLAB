function n=jnorm(m)
% JNORM (Spacelib) : the max absolute element of a matrix
[imax jmax]=size(m);
n=0;
for i=1:imax
 for j=1:jmax
   a=abs(m(i,j));
   if a>n
     n=a;
   end
 end
end


