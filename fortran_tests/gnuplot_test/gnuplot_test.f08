! Author: James W. Cross
! COPIED FROM NOTES do not copy for other programs
! Objective of the program: plot a function with gnuplot

program test
        implicit none
        real, allocatable, dimension(:) :: x
        real :: read_test
        real :: x_0
        real :: f
        integer :: size

        ! Allocate memory for x
        write(*,*) 'How big is x?'
        read(*,*) size
        read(*,*) read_test
        write(*,*) read_test
        allocate(x(size))

        ! Get the initial value for x
        write(*,*) 'Initial value (x_0)'
        read(*,*) x_0
        x(0) = x_0
        write(*,*) 'x_0 set to ', x(0)

        write(*,*) 'f(x_0) ', f(x_0)


        end program test
! defining the function
real function f(s)
        implicit none
        real :: s
        f = s**3 + s**2 + s + 1 
        return
        end function f
