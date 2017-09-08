module mex_interface

  use will_be_marbl, only : my_class

  implicit none
  public
  save

  type(my_class), private :: marbl_instance

contains

  ! =========================

  function mem_alloc()

    integer :: mem_alloc

    mem_alloc = marbl_instance%alloc()

  end function mem_alloc

  ! =========================

  function mem_check(out_val)

    real*8, intent(out) :: out_val
    integer             :: mem_check

    if (.not. marbl_instance%is_alloc()) then
      mem_check = -1
      return
    end if

    mem_check = 0
    call marbl_instance%change_arg()
    out_val = marbl_instance%data(1)

  end function mem_check

  ! =========================

  function mem_dealloc()

    integer :: mem_dealloc

    mem_dealloc = marbl_instance%dealloc()

  end function mem_dealloc

  ! =========================

end module mex_interface
