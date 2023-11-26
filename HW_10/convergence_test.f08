! Program:  This program evaluates a definite integral of a function
!           f(x) using Simpson's Rule
! Author :  James Cross
! Date   :  November 14, 2023

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

    integer :: j
    integer :: lun1
    integer :: m
    integer :: starting_point

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
    real(kind=DK)   :: temp_area_i          ! Used to determine ^
    

    ! Explain the program and prompt the user for an n
    write(*,*) 'Convergence test with m iterations given a starting point'
    write(*,*) 'Please provide an m'
    read(*,*) m
    write(*,*) 'Please provide a starting point'
    read(*,*) starting_point

    ! Get the upper and lower bounds of integration
    call bounds(x_lower, x_upper)

    open(newunit=lun1, file='output.dat', status='REPLACE')
    do j=1,m
        n = starting_point + 500*j
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
        write(lun1,*) n, partial_sum

    end do
    close(unit=lun1)

    stop 0
end program hw_10
