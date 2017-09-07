#include "fintrf.h"
C======================================================================
#if 0
C     
C     mod_77.F
C     .F file needs to be preprocessed to generate .for equivalent
C     
#endif
C     
C     mod_77.f
C
C     Computational function that takes a scalar and doubles it.
C     This is a MEX-file for MATLAB.
C     Copyright 1984-2011 The MathWorks, Inc.
C     
C======================================================================
C     Gateway routine
      subroutine mexFunction(nlhs, plhs, nrhs, prhs)
      use mod_77_03

C     Declarations
      implicit none

C     mexFunction arguments:
      mwPointer plhs(*), prhs(*)
      integer nlhs, nrhs

C     Function declarations:
      mwPointer mxGetPr
      mwPointer mxCreateDoubleMatrix
      integer mxIsNumeric
      mwPointer mxGetM, mxGetN

C     Pointers to input/output mxArrays:
      mwPointer x_ptr, y_ptr

C     Array information:
      mwPointer mrows, ncols
      mwSize size

C     Arguments for computational routine:
      real*8  x_input, y_output
      character*80 message
      call mexPrintf('MEX-file Hello World \n')
      y_output = 6.0
      write (message,1001) y_output
 1001 format ('WTF ',F9.3,'\n')
      call mexPrintf(message)
C     Call the computational subroutine.
      call mem_alloc()
C     Load the data into y_ptr, which is the output to MATLAB.
C     Create matrix for the return argument.
      call mem_check(y_output)
      plhs(1) = mxCreateDoubleMatrix(1,1,0)
      y_ptr = mxGetPr(plhs(1))
      size = 1
      call mxCopyReal8ToPtr(y_output,y_ptr,size)     
C      call mem_dealloc()


      return
      end


