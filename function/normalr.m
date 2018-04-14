
function mat=normalr(mat,idim,jdim,j2max,k,rm)

if rm==0
	fprintf(1,'Warning in NORMALR.M, division by zero!')
end

for j=1:1:j2max
	mat(k,j)=mat(k,j)/rm;
end


