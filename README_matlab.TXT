--------------------------------------------------------------------
version 2.2a October 2009 tested with matlab matlab 7.6.0.324 R2008a
--------------------------------------------------------------------
Information on the last patches at the end of this file
--------------------------------------------------------------------
What is SPACELIB(c)?
SPACELIB is a software library useful 
for the realization of programs for the kinematic and dynamic 
analysis of systems of rigid bodies. 
This library is currently used in ROBOTICS and BIOMECHANICS. 
It has been developed at the Mechanical Engineering Department 
of the University of Brescia.

Two versions of the library are currently available
(see http://bsing.ing.unibs/~glegnani for code, description and user's manual):

	* c language (numerical computetion)
	* matlab     (numerical computation)
	* MAPLEV     (symbolic manipulation)

The library is offered with:

	* full source code
	* a full reference manual
	* commented application examples
	* papers describing the mathematic theory which 
          is at the base of spacelib

The functions contained in the library are devoted to:

* basis operations on matrices 
    sum, product, (pseudo)inversion, ...
* basic operation on points, lines and planes
    line between two points
    plane defined by three points
    intersection / projection of point, lines on planes
    ...
* basic operation on vectors
    module, dot product, cross product, ...
* tranformation matrices (rototranslations)
* velocity and acceleration matrices
* Cardan/Euler angles
    tranformation of angles to/from rotation matrices
    derivative of angles to/from angular velocity and acceleration
* linear systems

The library is intended as an aid in writing programs for the 
analysis of systems of rigid bodies following a particular 
methodology based on 4*4 matrices. This approach can be 
considered a powerful generalization of the Transformation 
Matrix Approach  proposed by Denavit and Hartenberg.
Shortly: the position and the orientation of each body is 
represented by 4*4 transformation matrices.
Two others matrices called W and H are utilized for the velocity 
and the acceleration (linear and angular).
Additional matrices are used for the momentum, forces, torques, 
inertia.

The main feature of this methodology is that it allows the 
development of the analysis of systems of rigid bodies in a 
systematic way simplifying the symbolic manipulation of equations 
as well as the realization of efficient numerical programs.

--------------------------------------------------------------------
patch NOVEMBER 2001

the function mod() has been renamed modulus() to avoid conflict with the
function mod() contained in the new MATLAB versions
--------------------------------------------------------------------
patch FEBRUARY 2003

Some bugs fixed.

And also improved compatibility with release 12.
Some functions worked well with previous versions but failed with version 12 (e.g. functions dist() and mod() had to be renamed to avoid conflics, some vector converted to row to column, logical operator precedence checked, etc...)

Some minor bugs have been also corrected.
--------------------------------------------------------------------
patch OCTOBER 2003

Some bugs fixed.
Improved documentation
--------------------------------------------------------------------
patch JANUARY 2004

Manual improved and supplied in PDF format.

Some bugs fixed.
Functions normal, normal_g and psedot added.
Functions solve renamed to ovid conflicts with Matlab version 12.
          
--------------------------------------------------------------------
patch november 2005

manual restyled and extended
minor bugs fixed
few new funtions added (dhtomstd, psedot, crosstom, translat, translat2, translat24)
          
--------------------------------------------------------------------
patch October 2009

minor bugs fixed
eliminated problems with lower/upper case mismatching
simplified installation
--------------------------------------------------------------------

The library is free avalailable for non-profit activities including 
scientific and educational purposes.
See also the "disclaimer warranties" statment in the manual.

For commercial activities please contact:
Giovanni Legnani
Universita di Brescia
Dip. Ing. Meccanica
Via Branze 38
25123 Brescia, Italy.

phone +39/030 3715425
fax   +39/030 3702448

e-mail: giovanni.legnani @ ing.unibs.it
www:    http://bsing.ing.unibs/~glegnani
www:    http://spacelib.ing.unibs.it