
function [H,ivet,irank,arm]=linears(H,idim,jdim,imax,jmax,nsol,vpr)

%LINEARS (Spacelib): Function that allows the solution of a linear system.
% 
% This function  allows  the  solution  of a linear system by using a double 
% pivoting elimination method. 
% The system must be in the form:
%
% 				A x = b
% Input parameters
%	H	  : matrix containing matrix A and vectors b
%	idim,jdim : the physical dimensions of H 
%	imax,jmax : the logical dimensions of A.
%	nsol      : the number of the right-hand vectors.
%
% Output parameters
%	ivet	  : vector  of m integer that gives information necessary to
% 		    reorder the elements of x.
%	irank     : an estimation of rank of matrix A.
%	arm	  : the absolute  value  of  the greater element of A during 
%	            the last pass of elimination.
%
% Additional Input
% 	vpr       : vector specifying which variables must  be considered as
%		    main variables. That  means  that they will be forced in
%		    the first  postion  of  vector ivet and so of vectors x.
%		    The list  of the  variables  must terminated with a by a 
% 		    value -1.
%
% Usage:
%
%               [H,ivet,irank,arm]=linears(H,idim,jdim,imax,jmax,nsol,vpr)
%
%
% (c) G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%
% other native MATLAB functions are also available
%___________________________________________________________________________

spheader

toll=5;

epsil=toll*2*eps;

irank=0;

for j=1:1:jmax
	ivet(j)=j-1;
end

j2max=jmax+nsol;
jmax1=jmax;

i=1;
while (vpr(i)~=-1)  
	[H,ivet]=swabc(H,idim,jdim,imax,jmax1-1,vpr(i),ivet);        
	jmax1=jmax1-1;
	i=i+1;
end

k=min(imax,jmax);

for i=1:1:k
	[rm,im,jm]=rmax(H,idim,jdim,i,imax,i,jmax1);
	arm=abs(rm);   
	if (i==1) 
		rmin=epsil*arm*imax;
	end
	if (rm==0 | arm<rmin ) 
		return
	end
	irank=i;
	H =swabr(H,idim,jdim,j2max,i,im);  
	[H,ivet]=swabc(H,idim,jdim,imax,i,jm,ivet);
	H=elimin (H,idim,jdim,imax,j2max,i);
	H=normalr(H,idim,jdim,j2max,i,rm);
end

