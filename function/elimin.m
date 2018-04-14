
function mat=elimin(mat,idim,jdim,imax,j2max,k)

%___________________________________________________________________________ 
%
% ELIMIN
%
% internally called by function LINEAR.
%___________________________________________________________________________


r=mat(k,k);
if r==0
	fprintf('Warning in ELIMIN.M, division by zero !')
end 

for i=1:1:imax 
	if (i~=k)
		t=mat(i,k)/r;
		for j=k:1:j2max
			mat(i,j)=mat(i,j)-mat(k,j)*t;
		end
	end
end

