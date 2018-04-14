
%___________________________________________________________________________
%
%                       HEADER FILE     SPACELIB.M (November 2005)
%
% this M-file defines all the constants that are used by the
% SPACELIB functions. These constants are memorized in global variables.
%
% HEADER FILE USAGE:
%
% 1) If this M-file is invoked by the MATLAB command window or by the
% matlabrc.m file, all the global variables are automatically loaded
% in memory (see user's manual).
%
% Typing the instruction "who global", MATLAB displays the list of the global
% variables loaded in memory.
%
% 2) Every function that uses the global variables, must invoke the
% file 'spheader.m' in the first line of the code (see chapter 2.1 of the
% user manual).
%
% 3) The directories containing SPACELIB are assigned to global variables
%    and the default directory is set accordingly.
%
% WARNING 1: The global variables defined in this m-file
% have special meaning for many SPACELIB functions.
% Their value MUST NOT be changed for any reason.
%
% WARNING 2: there is a line similar to this
%
%    spc_lib_dir='c:\users\spacelib_m'  % spacelib directory
%
% that MUST be updated to match your installation!!!
%________________________________________________________________________________


clc

%___________________________________________________________________________
%
%   		   GLOBAL VARIABLES DECLARATION:
%___________________________________________________________________________

spheader % declare global variables

%___________________________________________________________________________
%
% 		GLOBAL VARIABLES INITIALIZATION:
%___________________________________________________________________________

X=1;	Y=2;	Z=3;	U=4;

Xaxis = [1 0 0]';
Yaxis = [0 1 0]';
Zaxis = [0 0 1]';

Xaxis_n = [-1 0 0]';
Yaxis_n = [0 -1 0]';
Zaxis_n = [0 0 -1]';

ORIGIN=[0 0 0 1]';

Rev   =0;  Pri   = 1;
Tor   =0;  For   = 1;
SYMM_ =1;  SKEW_ =-1;
Row   =0;  Col   = 1;

OK=1;	NOTOK=0;

PIG=pi;
PIG_2=pi/2;
PIG2=2*pi;

NULL3=zeros(3);
NULL4=zeros(4);
UNIT3=eye(3);
UNIT4=eye(4);

%___________________________________________________________________________
%
%                  GLOBAL DIRECTORIES DECLARATION:
%___________________________________________________________________________

% ***-----> the following line MUST be updated to match your installation!!!
%spc_lib_dir='C:\Users\Utente\Documents\Spacelib\SpaceLib_Matlab_v2.2'  % spacelib directory
% *** the update of the string is no longer necessary in this new version
% (October 2009)

%%%% patch October 2009 - the following two lines automatically set the correct value for spc_lib_dir
p = mfilename('fullpath'); % name of the m-file
[spc_lib_dir, name, ext] = fileparts(p);  %automatically update the string

%spc_lib_dir_f=[spc_lib_dir,'\function'];	   % functions
%spc_lib_dir_s=[spc_lib_dir,'\shortexa'];     % short examples
%spc_lib_dir_b=[spc_lib_dir,'\bigexa'];       % big examples
%                         ---using "filesep" it works on Windows and UNIX
spc_lib_dir_f=[spc_lib_dir,filesep,'function'];	   % functions
spc_lib_dir_s=[spc_lib_dir,filesep,'shortexa'];    % short examples
spc_lib_dir_b=[spc_lib_dir,filesep,'bigexa'];      % big examples

addpath(spc_lib_dir,spc_lib_dir_f,spc_lib_dir_s,spc_lib_dir_b);

%tmp= ['cd ',spc_lib_dir];  % patch November 2005
%eval(tmp);
%clear tmp;

%___________________________________________________________________________
%
%                  PRINT "HEADER":
%___________________________________________________________________________


fprintf('\n___________________________      SPACELIB      ___________________________\n')
fprintf('                                 VERSION 2.2a\n')
fprintf('                           A software library for\n')
fprintf('                     the kinematic and dynamic analysis\n')
fprintf('                         of systems of rigid bodies.\n\n')
fprintf('                  Includes general functions for vectors, matrices,\n')
fprintf('               kinematics, dynamics, Euler angles and linear systems\n\n')
fprintf('                  © G.LEGNANI  B.ZAPPA   R.ADAMINI 1990 - 2009\n\n')
fprintf('           MATLAB© version with the cooperation of C.MOIOLA and D.MANARA\n')
fprintf('            University of Brescia - Mechanical Engineering Department\n')
fprintf('                       Via Branze 38, 25123 BRESCIA, Italy\n')
fprintf('                     e-mail: giovanni. legnani @ unibs.it\n')
fprintf('                           http://robotics.unibs.it/SpaceLib/\n\n')
fprintf('                         SPACELIB© loaded in workspace\n')
fprintf('\n');
fprintf(' bug fixed Jan 2004, Nov 2005, Oct 2009   (tested with MATLAB 7.6.0.324 R2008a)\n');
fprintf(' see readme.txt and user''s manual for release notes\n');
fprintf('___________________________________________________________________________\n')

cd
who global
