! Author: James Cross
! Created on : August 31, 2023
! Last edited : August 31, 2023
program floating_test
        implicit none
        integer, parameter:: double_kind = kind(1.d0)
        real(kind=double_kind) :: x
        integer :: p1
        real :: p2

        x = 2.0
        p1 = 100
        p2 = 100.0

        write(*,*) x**p1
        write(*,*) x**p2
end program floating_test
