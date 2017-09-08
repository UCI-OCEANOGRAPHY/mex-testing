module will_be_marbl

  type,public::my_class
    real*8, allocatable :: data(:)
  contains
    procedure, public :: alloc
    procedure, public :: change_arg
    procedure, public :: dealloc
    procedure, public :: is_alloc
  end type my_class

contains

  ! =========================

  function alloc(self)

    class(my_class) :: self
    integer :: alloc

    allocate(self%data(1), stat=alloc)
    if (alloc .eq. 0) self%data = 0

  end function alloc

  ! =========================

  subroutine change_arg(self)

    class(my_class),intent(inout) :: self

    self%data = self%data+1

  end subroutine change_arg

  ! =========================

  function dealloc(self)

    class(my_class) :: self
    integer :: dealloc

    deallocate(self%data, stat=dealloc)

  end function dealloc

  ! =========================

  function is_alloc(self)

    class(my_class) :: self
    logical :: is_alloc

    is_alloc = allocated(self%data)

  end function is_alloc

end module will_be_marbl
