module mod_03
!$gfortran -fPIC -c mod_03.F90
type,public::my_class
real*8 :: z
contains 
procedure,public :: change_arg
end type my_class
contains 
subroutine change_arg(y)
class(my_class),intent(inout) :: y
y%z = y%z+1
end subroutine change_arg
end module mod_03
