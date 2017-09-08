#include "fintrf.h"

subroutine mexFunction(nlhs, plhs, nrhs, prhs)

  use mex_interface

  implicit none

  ! mexFunction arguments:
  mwPointer plhs(*), prhs(*)
  integer nlhs, nrhs

  ! Function declarations:
  integer*4 mxGetString
  mwPointer mxGetPr
  mwPointer mxCreateDoubleMatrix
  integer mxIsNumeric
  mwPointer mxGetM, mxGetN

  ! Pointers to input/output mxArrays:
  mwPointer x_ptr, y_ptr

  ! Array information:
  mwPointer mrows, ncols
  mwSize size, maxbuf
  parameter(maxbuf=80)

  ! Arguments for computational routine:
  real*8  x_input, y_output
  character(len=80) marbl_phase
  integer status

  if (nrhs .eq. 0) then
    call mexPrintf('Need to include phase argument!')
    return
  end if

  size = 80
  status = mxGetString(prhs(1), marbl_phase, maxbuf)
  select case (trim(marbl_phase))
    case ('init')
      call mexPrintf('MEX-file note: allocating memory\n')
      ! Call the computational subroutine.
      if (mem_alloc() .ne. 0) then
        call mexPrintf('MEX-file note: already allocated!\n')
      end if
    case ('shutdown')
      call mexPrintf('MEX-file note: shutting down\n')
      if (mem_dealloc() .ne. 0) then
        call mexPrintf('Mex-file note: memory is not allocated\n')
      end if
  end select

  return

end subroutine mexFunction


