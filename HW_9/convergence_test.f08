! Program:  Use a finite-difference method to solve for solution to the 
!           steady-state Poisson equation in a 10cm x 10cm box in CGS units.
!           Writes output to 'potential.dat' which can be graphed in Gnuplot
! Author:   James Cross
! Date:     November 11, 2023

!           The potential at 25, 50 is 2.98510160e-4


program hw_9
    implicit none

    ! ALL VARIABLES ARE IN CGS UNITS
    integer, parameter :: N=100         ! Number of cells per box side
    integer :: i,j                      ! x and y loop index variables 
    integer :: k                        ! number of iterations
    real, parameter :: PI=3.141592654   ! Mathematical constant pi
    real            :: cell_length        ! Area of a single cell
    real            :: max_dif          ! Maximum difference between last and 
                                        ! current iteration
    real            :: cutoff           ! Stop the loop when max_dif =< cutoff

    real    :: x,y              ! Center cell coordinates
    integer :: lun1             ! Logical unit to write output to

    integer :: d

    ! Area charge density array
    real, dimension(0:N+1,0:N+1) :: sigma
    ! Electric potential array
    real, dimension(0:N+1,0:N+1) :: old_u
    ! New electric potential array
    real, dimension(0:N+1,0:N+1) :: new_u

    ! Initialize cell_length and cutoff
    cell_length = (10.0/real(N))**2
    cutoff = 1.0e-10

    ! Initialize the potentials
    old_u = 0.0
    new_u = 0.0

    ! Set the initial conditions
    sigma = 0.0
    sigma(25,25) = -4.0
    sigma(75,75) = 4.0

    open(newunit=lun1, file='conv.dat', status='REPLACE')

    ! Initialize variables relevant to the loop
    do d=1,10
        cutoff = (1.0e-7)*2.0**(-d)
        k = 0
        max_dif = cutoff + 0.1
        do while (max_dif > cutoff)
            do i=1,N
                do j=1,N
                    new_u(i,j) = (old_u(i+1,j) + old_u(i-1,j) + old_u(i,j+1) &
                        + old_u(i,j-1) - 4.0 * PI*cell_length**2 * sigma(i,j))/4.0
                end do
            end do

            k = k + 1
            max_dif = maxval(abs(new_u - old_u))
            old_u = new_u
        end do

        write(lun1,*) d, new_u(25,50)
        write(*,*) cutoff
    end do

    close(unit=lun1)

    
    stop 0
end program hw_9
