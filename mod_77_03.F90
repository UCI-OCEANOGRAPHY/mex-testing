module mod_77_03
  !$ gfortran -c mod_77_03.F90 -o mod_77_03.o -fPIC
  !>> mex mod_77_03.F90
  !>> mex mod_77.F mod_77_03.F90 
  !(Test with gfortran 4.9 for now)
  !To see contents of object file:
  !$nm mod_77_03.o
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
   use mod_03
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
end module mod_77_03