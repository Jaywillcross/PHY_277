! Program   : This program prompts the user for an integer 
!             value N and returns the finite sum
!             \sum_{i=0}^N (-1)^i * x^{2i} / {2i}!
!Name: James Cross
!Date: October 11, 2023

program hw_6
    implicit none
    real :: x, sum, neg             ! x is the point of interest
                                    ! sum is the summation value
                                    ! neg stores the sign of each term 
    integer :: N, i,two_factorial   ! N is the upper summation bound, 
                                    ! i is the loop variable
                                    ! two_factorial is the running product for 
                                    ! (2i)!

    ! Explain the program to the user
    ! Read in a real x and a positive integer N
    write(*,*) "This program calculates the finite sum &
            \sum_{i=0}^{N} (-1)^i * x^(2i) / (2i)!"
    write(*,*) "Enter a real x"
    read(*,*) x
    write(*,*) "Enter a positive integer N"
    read(*,*) N

    
    ! Initialize sum and factorial
    sum = 1.0
    two_factorial = 1

    do i = 1,N
        ! i - 2*(i/2) is integer arithmetic to get i mod 2
        ! If i = 0 mod 2, then neg is +1.0,
        ! If i = 1 mod 2, then neg is -1.0.
        neg = (-1.0)**(i - 2*(i/2))

        ! Calculate the value of (2i)!
        two_factorial = two_factorial*(2*i)*(2*i-1)

        ! Put the sum together
        sum = sum + (neg * x**(2*i)) / two_factorial
    enddo

    ! Print the sum to the user's terminal
    write(*,*) "The sum is"
    write(*,*) sum

    stop 0
end program hw_6
