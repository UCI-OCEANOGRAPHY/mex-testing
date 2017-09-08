module mex_interface

  implicit none
  public
  save

  real*8, private, allocatable :: x(:)

contains

  function mem_alloc()

    integer :: mem_alloc

    if (allocated(x)) then
      mem_alloc = -1
      return
    end if

    allocate(x(1))
    x = 0.0
    mem_alloc = 0

  end function mem_alloc

  subroutine mem_check(y)

    use will_be_marbl

    real*8, intent(out) :: y
    type(my_class)      :: yy

    yy%z=x(1)
    call yy%change_arg()
    y = yy%z
    x(1) = yy%z

  end subroutine mem_check

  function mem_dealloc()

    integer :: mem_dealloc

    if (.not. allocated(x)) then
      mem_dealloc = -1
      return
    end if

    deallocate(x)
    mem_dealloc = 0

  end function mem_dealloc

end module mex_interface
