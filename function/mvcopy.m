
function v=mvcopy(A,rows,cols,val,type)

%MVCOPY : Extracts a row or a column from a matrix A
% not really necessary in MATLAB
% supported only for compatibility with C-language varsion
%
% Function that extracts a row or a column from a matrix A. A is a rows*cols
% matrix while v is the vector where column or row is stored.
% Input parameters
%   A         : matrix where the selected row or column is initially  stored
%   rows,cols : dimensions of matrix A
%   val       : defines which row or column must be extracted
%		  (range from 1 to rows/cols)
%   type      : defines which kind of element must be extracted (Row or Col)
%
% Output parameters
%   v         : the vector where the extracted row/column is stored
%___________________________________________________________________________

spheader

% check on input parameters:

if (type<Row)|(type>Col)| (val<1) | (type==Col & val>cols) ...
						     |(type==Row & val>rows)
	error('Error in MVCOPY: Illegal value of input parameters');

end

if (type==Col)				% extracts a column
	for i=1:1:rows
		v(i)=A(i,val);
	end
else 					% extracts a row
	for i=1:1:cols
		v(i)=A(val,i);
	end
end

