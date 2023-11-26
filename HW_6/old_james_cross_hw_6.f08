!Name: James Cross
!Date: September 2, 2023

program hw_6
        implicit none
        integer, parameter :: double_kind = kind(1.d0)

        integer :: i, two_factorial
        real(kind=double_kind) :: x, sum
        integer :: N

        write(*,*) 'This program calculates the finite sum &
                \sum_{i=0}^{N} (-1)^i * x^(2i) / (2i)!'
        write(*,*) 'Select an x>0'
        read(*,*) x
        write(*,*) 'Select an integer N'
        read(*,*) N

        ! The first term of the sum is 
        ! what x is initialized because 0 factorial
        ! is not defined nicely in-terms of repeated 
        ! multiplication
        sum = 1.d0
        two_factorial = 1
        do i=1,N
                two_factorial = two_factorial*(2*i)*(2*i-1)
                write(*,*) two_factorial
                sum = sum+(-1)**i*((x**(2*i))/(two_factorial))
        end do
        write(*,*) 'The sum is'
        write(*,*) sum

        stop 0
        end program hw_6
