module will_be_marbl

  type,public::my_class
    logical, private              :: linit = .false.
    real*8,  public,  allocatable :: data(:)
  contains
    procedure, public :: initialize
    procedure, public :: decrement_by_one_half
    procedure, public :: increment_by_one
    procedure, public :: shutdown
    procedure, public :: lis_init
  end type my_class

contains

  ! =========================

  function initialize(self)

    class(my_class) :: self
    integer :: initialize

    allocate(self%data(1), stat=initialize)
    if (initialize .eq. 0) then
      self%data = 0
      self%linit = .true.
    end if

  end function initialize

  ! =========================

  function decrement_by_one_half(self)

    class(my_class),intent(inout) :: self
    integer :: decrement_by_one_half

    if (self%linit) then
      self%data = self%data - 0.5
      decrement_by_one_half = 0
    else
      decrement_by_one_half = -1
    end if

  end function decrement_by_one_half

  ! =========================

  function increment_by_one(self)

    class(my_class),intent(inout) :: self
    integer :: increment_by_one

    if (self%linit) then
      self%data = self%data+1.
      increment_by_one = 0
    else
      increment_by_one = -1
    end if

  end function increment_by_one

  ! =========================

  function shutdown(self)

    class(my_class) :: self
    integer :: shutdown

    shutdown = 0
    if (allocated(self%data)) deallocate(self%data, stat=shutdown)
    self%linit = .false.

  end function shutdown

  ! =========================

  function lis_init(self)

    class(my_class) :: self
    logical         :: lis_init

    lis_init = self%linit

  end function lis_init

  ! =========================

end module will_be_marbl
