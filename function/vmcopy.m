
function A=vmcopy(v,dim,val,type,A,rows,cols)

%VMCOPY : Function that copy a vector into a row or a column of a matrix A.
%
% Function that copy a vector into a row or a column of a matrix A. A is a
% rows*cols matrix while v is the vector where column or row is initially
% stored.
%
% Input parameters
%   v         : the vector where the row/column is initially stored
%   dim       : the number of elements of v that must be copied into the 
%		matrix A
%   rows,cols : dimensions of matrix A
%   val       : defines into which row or column v must be copied
%		(range from 1 to rows/cols)
%   type      : defines which kind of element must be extracted (Row or Col)
%
% Output parameters
%   A         : matrix where the selected row or column is finally stored
%
% Usage:
%
%		A=vmcopy(v,dim,val,type,A,rows,cols)
%
%___________________________________________________________________________


spheader

if (type<Row)|(type>Col)| (val<1) | (type==Col & val>cols) | (type==Row & val>rows)
	error('Error in VMCOPY: Illegal value of input parameters');
end

if (type==Col)				% extracts a column
		A(1:dim,val)=v(1:dim)';
else 					% extracts a row
		A(val,1:dim)=v(1:dim);
end
