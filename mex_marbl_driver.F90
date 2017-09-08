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
  character(len=160) message
  integer status

  if (nrhs .eq. 0) then
    call mexPrintf('Need to include phase argument!\n')
    return
  end if

  size = 80
  status = mxGetString(prhs(1), marbl_phase, maxbuf)
  select case (trim(marbl_phase))
    case ('init')
      call mexPrintf('MEX-file note: calling init\n')
      ! Call the computational subroutine.
      if (init_marbl() .ne. 0) then
        call mexPrintf('MEX-file note: initialization failed!\n')
      end if
    case ('surface')
      if (compute_marbl_surface_fluxes(y_output) .ne. 0) then
        call mexPrintf('Mex-file note: error computing surface fluxes\n')
      else
        plhs(1) = mxCreateDoubleMatrix(1,1,0)
        y_ptr = mxGetPr(plhs(1))
        size = 1
        call mxCopyReal8ToPtr(y_output,y_ptr,size)
      end if
    case ('interior')
      if (compute_marbl_interior_tendencies(y_output) .ne. 0) then
        call mexPrintf('Mex-file note: error computing interior tendencies\n')
      else
        plhs(1) = mxCreateDoubleMatrix(1,1,0)
        y_ptr = mxGetPr(plhs(1))
        size = 1
        call mxCopyReal8ToPtr(y_output,y_ptr,size)
      end if
    case ('shutdown')
      call mexPrintf('MEX-file note: shutting down\n')
      if (shutdown_marbl() .ne. 0) then
        call mexPrintf('Mex-file note: error shutting down MARBL\n')
      end if
    case DEFAULT
      write(message, '(3A)') 'Unknown phase: ', trim(marbl_phase), '\n'
      call mexPrintf(message)
  end select

  return

end subroutine mexFunction


