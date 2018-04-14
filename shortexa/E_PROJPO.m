
% Sample program e_projpo.m
disp ('---');
l=[3	 0.7;
   7.2	 4;
   2.05  9;
   1     0];

P=[5 1 3 1]';

[P1,dist]=projponl(l,P)
l2=line2p(P,P1)
printm('The origin    of the new line is:',l2(:,1)')
printm('The direction of the new line is:',l2(X:Z,2)')
