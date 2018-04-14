
function [H,vet]=swabc(H,idim,jdim,imax,k,jm,vet)


if (k==jm)
	return
end
for i=1:1:imax
	t=H(i,k);
	H(i,k)=H(i,jm); 
	H(i,jm)=t;
end

it=vet(k);	vet(k)=vet(jm);		vet(jm)=it;
