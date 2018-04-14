
% Sample program e_intrlp.m

spheader

l=zeros(4,2);
pl = [0 0 1 -5];
dir= [Zaxis;0];
P =  [0 6 10 1]';

l(:,X)=P;
l(:,Y)=dir;

[P1,inttype]=interlpl(l,pl);
%P'
%P1'
%d=-dist(P,P1);
d=-distp(P,P1);   %patch by G.Legnani - January 2003
                  %for compatibility with new spacelib versions
v=vector(dir,d);
v(U)=0;

Ps=P1+v;
Ps(U)=1;
printm('The point P is :',Ps)
%ddd=dist(Ps,P)
ddd=distp(Ps,P);   %patch by G.Legnani - January 2003
                   %for compatibility with new spacelib versions
printm('The distance between P and Ps is',ddd); 
printm('The vector Ps-P is',vect(Ps,P));
