module mex_interface

  use will_be_marbl, only : my_class

  implicit none
  public
  save

  type(my_class), private :: marbl_instance

contains

  ! =========================

  function init_marbl()

    integer :: init_marbl

    if (marbl_instance%lis_init()) then
      init_marbl = marbl_instance%shutdown()
    else
      init_marbl = 0
    end if
    if (init_marbl .eq. 0) init_marbl = marbl_instance%initialize()

  end function init_marbl

  ! =========================

  function compute_marbl_surface_fluxes(out_val)

    real*8, intent(out) :: out_val
    integer :: compute_marbl_surface_fluxes

    compute_marbl_surface_fluxes = marbl_instance%decrement_by_one_half()
    if (compute_marbl_surface_fluxes .eq. 0) &
      out_val = marbl_instance%data(1)

  end function compute_marbl_surface_fluxes

  ! =========================

  function compute_marbl_interior_tendencies(out_val)

    real*8, intent(out) :: out_val
    integer :: compute_marbl_interior_tendencies

    compute_marbl_interior_tendencies = marbl_instance%increment_by_one()
    if (compute_marbl_interior_tendencies .eq. 0) &
      out_val = marbl_instance%data(1)

  end function compute_marbl_interior_tendencies

  ! =========================

  function shutdown_marbl()

    integer :: shutdown_marbl

    shutdown_marbl = marbl_instance%shutdown()

  end function shutdown_marbl

  ! =========================

end module mex_interface
