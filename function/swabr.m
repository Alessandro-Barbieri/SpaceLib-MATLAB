
function mat=swabr(mat,idim,jdim,j2max,k,im)


if (k==im)
	return
end

for j=1:1:j2max
	t=mat(k,j);
	mat(k,j)=mat(im,j);
	mat(im,j)=t;
end
