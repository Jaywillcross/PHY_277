! Program:  This program evaluates a definite integral of a function
!           f(x) using Simpson's Rule and Kahan's Summation Algorithm
! Author :  James Cross
! Date   :  November 14, 2023

! The integral is determined to converge to 993.631477864812

! A sample of the value from the convergence test with comments over
! different ranges of n and at different spacings

! The integral asymptotically approaches this value at lower n
!       n value     integral value
!           500   993.63147788943570                                             
!          1000   993.63147786635045                                             
!          1500   993.63147786511524                                             
!          2000   993.63147786490856
!          2500   993.63147786485160
!          3000   993.63147786482955
!          3500   993.63147786482091
!          4000   993.63147786481909
!          4500   993.63147786481477
!          5000   993.63147786481511
!          5500   993.63147786481272
!          6000   993.63147786481397
! The integral demonstrates some noise around the determined value but is still
! stable unlike the noise encountered in Assignment 7. In Assignment 7, the 
! noise grew to much larger than the precision of the value.
!          6001   993.63147786481102                                             
!          6002   993.63147786480977                                             
!          6003   993.63147786481250                                             
!          6004   993.63147786481284
!          6005   993.63147786481329
!          6006   993.63147786481045
!          6007   993.63147786481363
!          6008   993.63147786481500
!          6009   993.63147786481454
!          6010   993.63147786481045
!          6011   993.63147786481193
!          6012   993.63147786481295
!          6013   993.63147786481204
!          6014   993.63147786481193
!          6015   993.63147786481420
!          6016   993.63147786481306
!          6017   993.63147786480999
!          6018   993.63147786481454
!          6019   993.63147786481181
!          6020   993.63147786481227
!                    15-th digit ^

! MODULE
module functions
    implicit none
    integer, parameter :: DK=kind(1.0d0)

    ! Bounds of integration
    real(kind=DK), parameter    :: UPPER_BOUND = 2.0d1   
    real(kind=DK), parameter    :: LOWER_BOUND= 1.0d0   

    contains
        ! Bounds subprogram
        subroutine bounds(x_low, x_up)
            real(kind=DK), intent(out)  :: x_low
            real(kind=DK), intent(out)  :: x_up

            x_low = LOWER_BOUND 
            x_up = UPPER_BOUND 
        end subroutine bounds

        ! Function evaluation subprogram
        function function_evaluate(x) result(eval)
            implicit none
            ! Equation parameters
            real(kind=DK), parameter    :: A = 4.0d3              
            real(kind=DK), parameter    :: B = 1.515d1
            real(kind=DK), parameter    :: C = 1.0d-2          

            ! Variables
            real(kind=DK), intent(in) :: x
            real(kind=DK) :: eval

            eval = (x + cos(x)) * exp(cos(x)) + A*exp(-(x-B)**2 /C)
        end function function_evaluate            
end module functions

! PROGRAM
program hw_10
    use functions, only : bounds, function_evaluate, DK
    implicit none

    integer :: i                                ! Iteration variable
    integer :: n                                ! Number of iterations

    real(kind=DK)   :: x_lower              ! the lower integral bound
    real(kind=DK)   :: x_upper              ! the upper integral bound

    real(kind=DK)   :: x_i                  ! The i-th x-value
    real(kind=DK)   :: f_of_x_i             ! f(x_i)
    real(kind=DK)   :: f_of_x_i_plus_half   ! f(x_{i+1/2})
    real(kind=DK)   :: f_of_x_i_plus_one    ! f(x_{i+1})
    real(kind=DK)   :: delta_x              ! The subinterval size
    real(kind=DK)   :: area_i               ! The i-th area calculated
    real(kind=DK)   :: partial_sum          ! The running total for the sum
    
    ! Error tracking
    real(kind=DK)   :: accum_error          ! Accumulated error
    real(kind=DK)   :: temp_partial_sum     ! Used to determine ^
    real(kind=DK)   :: temp_area_i          ! Used to determine ^^
    

    ! Explain the program and prompt the user for an n
    write(*,*) 'This program calculates the definite integral of &
        (x + cos(x)) * exp(cos(x)) + a*exp(- (x-b)**2 / c) from  &
        1 to 20 using Simpsons Rule with n subintervals where a = 4000, &
        b = 15.15 and c = 0.01'
    write(*,*) 'Please provide an n'
    read(*,*) n

    ! Get the upper and lower bounds of integration
    call bounds(x_lower, x_upper)

    ! Calculate the subinterval size
    delta_x = (x_upper - x_lower) / real(n, DK)

    ! Initialize the x_i term and the corresponding f(x's)
    x_i = x_lower 
    f_of_x_i = function_evaluate(x_i)
    f_of_x_i_plus_half = function_evaluate(x_i + 0.5d0 * delta_x)
    f_of_x_i_plus_one = function_evaluate(x_i + delta_x)

    ! Initialize the i-th area term, the running sum, and error tracking terms
    area_i = 0.0d0
    partial_sum = 0.0d0

    temp_partial_sum = 0.0d0
    accum_error = 0.0d0

    ! Calculate the sum
    do i = 1,n
        ! Calculate the area of the i-th partition
        area_i = (1.0d0/6.0d0) * (f_of_x_i &
            + 4.0d0 * f_of_x_i_plus_half &
            + f_of_x_i_plus_one) * delta_x 
        
        ! Add the accumulated error from the previous calculation to the
        ! calculated current area
        temp_area_i = area_i + accum_error

        ! Naively add the i-th area term (including the accumulated error)
        ! to the total area and store that in a naive/temp variable for the 
        ! total area
        temp_partial_sum = partial_sum + area_i

        ! Calculate the error from this calculation by subtracting off 
        ! all the past operations until the error is left hence why its called 
        ! accumulated. Equivalent to 
        ! accum_error = (area_i + accum_error) &
        !               - ((partial_sum + area_i) - partial_sum)
        accum_error = temp_area_i - (temp_partial_sum - partial_sum)

        ! Equate the naive/temp partial sum to the real partial sum, knowing
        ! that the error gets amended in the following calculation
        partial_sum = temp_partial_sum

        ! Calculate the variables needed for the next area calculation
        x_i = x_lower + i*delta_x
        f_of_x_i = function_evaluate(x_i)
        f_of_x_i_plus_half = function_evaluate(x_i + 0.5d0 * delta_x)
        f_of_x_i_plus_one = function_evaluate(x_i + delta_x)
    end do

    ! Return the sum to the user with the inputs given
    write(*,*) 'When n is equal to'
    write(*,*) n
    write(*,*) 'and delta_x is equal to'
    write(*,*) delta_x
    write(*,*) 'The integral evaluates to'
    write(*,*) partial_sum

    stop 0
end program hw_10
