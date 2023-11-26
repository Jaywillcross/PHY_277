! Program:  Uses a finite-difference method to solve for solution to the 
!           steady-state Poisson equation in a 10cm x 10cm box in CGS units.
!           Writes output to 'potential.dat' which can be graphed in Gnuplot
! Author:   James Cross
! Date:     November 12, 2023

!           The potential at (25, 50) is 2.98454E-02 in the appropriate CGS
!           units.


program hw_9
    implicit none

    ! ALL QUANTITIES ARE IN CGS UNITS
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

    ! Area charge density array
    real, dimension(0:N+1,0:N+1) :: sigma
    ! Electric potential array
    real, dimension(0:N+1,0:N+1) :: old_u
    ! New electric potential array
    real, dimension(0:N+1,0:N+1) :: new_u

    ! Initialize cell_length and cutoff
    cell_length = (10.0/real(N))
    cutoff = 1.0e-5

    ! Initialize the potentials
    old_u = 0.0
    new_u = 0.0

    ! Initialize the charge distribution
    sigma = 0.0
    sigma(25,25) = -4.0
    sigma(75,75) = 4.0


    ! Initialize variables relevant to the loop
    k = 0
    max_dif = cutoff + 0.1
    do while (max_dif > cutoff)
        do i=1,N
            do j=1,N
                ! Update the estimate of the potential cell by cell
                new_u(i,j) = (old_u(i+1,j) + old_u(i-1,j) + old_u(i,j+1) &
                    + old_u(i,j-1) - 4.0 * PI*cell_length**2 * sigma(i,j))/4.0
            end do
        end do

        ! Compute the max difference
        max_dif = maxval(abs(new_u - old_u))

        ! Update the potential
        old_u = new_u

        ! Update the counter on number of iterations
        k = k + 1
    end do

    write(*,*) 'Converged in', k
    write(*,*) 'number of iterations'

    open(newunit=lun1, file='potential.dat', status='REPLACE')

    ! Write each row of data to the file with center cell coordinates x, y
    x = 0.5 * cell_length
    do i=0,N+1
        y = 0.5 * cell_length
        do j=0,N+1
            write(lun1,*) x, y, new_u(i,j)

            ! Increment row
            y = y + cell_length
        end do
        ! Increment column
        x = x + cell_length

        ! Separate columns
        write(lun1,*) ' '
    end do

    close(unit=lun1)

    write(*,*) new_u(25,50)
 
    stop 0
end program hw_9
