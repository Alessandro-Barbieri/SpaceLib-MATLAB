
function R=cardtowp(q,i,j,k)

%CARDTOWP (Spacelib): Builds a matrix for cardan acceleration
%                     (internally called by CARDATOG and CARDOMPT)
%
%___________________________________________________________________________

spheader

alfa= q(1);
beta= q(2);

sa=sin(alfa);	sb=sin(beta);	
ca=cos(alfa);	cb=cos(beta);	

if ( i<X | i>Z | j<X | j>Z | k<X | k>Z | i==j | j==k )
	error('**** Error in CARDTOWP: Illegal rotation axis ****');
end

if ( rem(j-i+3,3)==1 ) 
	sig=1;
else sig=-1;
end

% Cardanic Convention 
if (i~=k)
	R(i,X)=sig*cb;
		R(i,Y)=0;
			R(i,Z)=0;

	R(j,X)=sig*sa*sb;
		R(j,Y)=-sig*ca*cb;
			R(j,Z)=-sa;

	R(k,X)=-ca*sb;
		R(k,Y)=-sa*cb;
			R(k,Z)=sig*ca;

% Eulerian Convention
else
l=6-i-j;
R(i,X)=-sb;
	R(i,Y)=0;
		R(i,Z)=0;

R(j,X)=sa*cb;
	R(j,Y)=ca*sb;
		R(j,Z)=-sa;

R(l,X)=-sig*ca*cb;
	R(l,Y)=sig*sa*sb;
		R(l,Z)=sig*ca;

end


