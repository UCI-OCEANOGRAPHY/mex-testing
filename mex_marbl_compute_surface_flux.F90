#include "fintrf.h"

subroutine mexFunction(nlhs, plhs, nrhs, prhs)

  use mex_interface

  implicit none

  ! mexFunction arguments:
  mwPointer plhs(*), prhs(*)
  integer nlhs, nrhs

  ! Function declarations:
  mwPointer mxGetPr
  mwPointer mxCreateDoubleMatrix
  integer mxIsNumeric
  mwPointer mxGetM, mxGetN

  ! Pointers to input/output mxArrays:
  mwPointer x_ptr, y_ptr

  ! Array information:
  mwPointer mrows, ncols
  mwSize size

  ! Arguments for computational routine:
  real*8  x_input, y_output
  character*80 message
  call mexPrintf('MEX-file Hello World \n')
  y_output = 5.0
  write (message,"('Starting with ',F9.3,'\n')") y_output
  write (message,1001) y_output
  1001 format ('WTF ',F9.3,'\n')
  call mexPrintf(message)
  ! Call the computational subroutine.
  call mem_alloc()
  ! Load the data into y_ptr, which is the output to MATLAB.
  ! Create matrix for the return argument.
  call mem_check(y_output)
  plhs(1) = mxCreateDoubleMatrix(1,1,0)
  y_ptr = mxGetPr(plhs(1))
  size = 1
  call mxCopyReal8ToPtr(y_output,y_ptr,size)
  !  call mem_dealloc()

  return

end subroutine mexFunction


