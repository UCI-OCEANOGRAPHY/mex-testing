module mex_interface

  implicit none
  public
  save

  real*8, private, allocatable :: x(:)

contains

  subroutine mem_alloc()
    if (.NOT. allocated(x)) then
      allocate(x(1))
    endif

    x = 5.0
  end subroutine mem_alloc

  subroutine mem_check(y)

    use will_be_marbl

    real*8 :: y
    type(my_class) :: yy

    yy%z=x(1)
    call yy%change_arg()
    call yy%change_arg()
    y = yy%z
  end subroutine mem_check

  subroutine mem_dealloc()
    deallocate(x)
  end subroutine mem_dealloc

end module mex_interface
