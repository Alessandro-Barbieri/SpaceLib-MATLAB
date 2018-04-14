
function prmat(grpout,string,M)

%FPRINTM (Spacelib): Prints in a file the text string 'string' and the 4×4 matrix M 
% using the format of GRP_MAN graphics post processor.
%
% grpot   file 
% string  comment written to file
% M       matrix
% 
% Calling list:
% 
% 			prmat(grpout,'string',M)
%
% © G.Legnani; adapted from: G.Legnani and R.Faglia 1990
% bug fixed - jan 2003 - g.legnani
%___________________________________________________________________________



fprintf(grpout,'\n %s \n\n',string);

for j=1:1:4
  if(j~=3)
    for i=1:1:3;
		fprintf(grpout,' %7.4f	',M(i,j));
    end
  fprintf(grpout,'\n');
  end
end

