program test
    implicit none

    integer :: lun1

    real, dimension(4) :: a

    a = [1.0, 2.0, 3.0, 4.0]

    write(*,*) min(a(:))

end program test
