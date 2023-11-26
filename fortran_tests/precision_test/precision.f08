! Program:  Intention to print
!           the precision of various
!           various types of reals
! Author :  James Cross
! Date   :  September 27, 2023

program precision_test
    implicit none

    write(*,*) 'Arithmetic precision of'
    write(*,*) ' Single precision', precision(1.0e0)
    write(*,*) ' Double precision', precision(1.0d0) 
    write(*,*) ' Quadruple precision', precision(1.0q0)

    stop 0
end program precision_test
