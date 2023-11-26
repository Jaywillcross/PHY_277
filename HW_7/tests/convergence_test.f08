! Program:  This program evaluates a definite integral of a function
!           f(x) using Simpson's Rule
! Author :  James Cross
! Date   :  October 26, 2023

program hw_7
    implicit none

    integer :: lun1
    integer :: i                                ! Inner iteration variable
    integer :: j                                ! Outer iteration variable
    integer, parameter    :: m = 100             ! How many tests 
    integer :: n                                ! Number of iterations
    real    :: x_i                              ! The i-th x-value
    real    :: f_of_x_i                         ! f(x_i)
    real    :: f_of_x_i_plus_half               ! f(x_{i+1/2})
    real    :: f_of_x_i_plus_one                ! f(x_{i+1})
    real    :: delta_x                          ! The subinterval size
    real    :: area_i                           ! The i-th area calculated
    real    :: partial_sum                      ! The running total for the sum
    real, parameter    :: upper_bound = 20.0    ! Upper bound of integration
    real, parameter    :: lower_bound = 1.0     ! Lower bound of integration 
    real, parameter    :: a = 4.0e3             ! Equation parameters 
    real, parameter    :: b = 15.15
    real, parameter    :: c = 0.01          

    write(*,*) 'This program calculates the definite integral of &
        (x + COS(x)) * EXP(COS(x)) + a*EXP(- (x-b)**2 / c) from  &
        1 to 20 using Simpsons Rule with n subintervals where a = 4000, &
        b = 15.15 and c = 0.01'

    open(newunit=lun1, file='output.dat',status='REPLACE')

    ! Calculate the sum for several n
    do j = 1, m
        n = j
        delta_x = (upper_bound - lower_bound) / REAL(n)

        x_i = lower_bound
        f_of_x_i = COS(x_i)
        f_of_x_i_plus_half = COS(x_i + 0.5*delta_x)
        f_of_x_i_plus_one = COS(x_i + delta_x)

        area_i = 0.0
        partial_sum = 0.0

        ! Calculate the sum  for a given n
        do i = 1,n
            area_i = (1.0/6.0) * (f_of_x_i &
                + 4.0 * f_of_x_i_plus_half &
                + f_of_x_i_plus_one) * delta_x 
            partial_sum = partial_sum + area_i

            x_i = x_i + delta_x
            f_of_x_i = f_of_x_i_plus_one
            f_of_x_i_plus_half = COS(x_i + 0.5*delta_x)
            f_of_x_i_plus_one = COS(x_i + delta_x)
        end do

        write(*,*) 'When n is equal to'
        write(*,*) n
        write(*,*) 'When delta_x is equal to'
        write(*,*) delta_x
        write(*,*) 'The integral evaluates to'
        write(*,*) partial_sum
        write(*,*) ' '
        write(lun1,*) n, partial_sum
    end do
    
    close(unit=lun1)

    stop 0
end program hw_7
