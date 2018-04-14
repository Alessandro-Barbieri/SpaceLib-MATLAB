
function c=dot3(a,b)

%DOT (Spacelib): scalar product between two three-element column (or row) vectors.
%___________________________________________________________________________
% usage
%
%			c=dot3(a,b)
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________

spheader 

c = a(X)*b(X) + a(Y)*b(Y) + a(Z)*b(Z);



