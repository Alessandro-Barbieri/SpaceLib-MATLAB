
function fprintm(out,string,M)

%FPRINTM (Spacelib): Prints in a file the text string 'string' and the matrix M.
%
% This function prints in a file the text string 'string' and the matrix 
% (or a vector) M.
% 
% Calling list:
% 
% 			fprintm(out,'string',M)
%
% Related functions: PRINTM
%
% © G.Legnani, C. Moiola 1998; adapted from: G.Legnani and R.Faglia 1990
%___________________________________________________________________________



fprintf(out,'\n %s \n\n',string);

[m,n]=size(M);

for i=1:1:m
	j=1:1:n;
		fprintf(out,' %7.4f	',M(i,j));
fprintf(out,'\n');
end

