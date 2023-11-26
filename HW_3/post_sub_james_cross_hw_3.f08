!Name : James Cross
!Date : September 20, 2023
!Purpose : The purpose of this program is to find the relativistic 
!   and non-relativistic kinetic energy of a mass m moving
!   with velocity v, all in MKS units (kg, m/s, and J)
!   The relativistic kinetic energy doesn't remotely match 
!   for v< ~5.2e4 m/s because of floating point error
!   in the calculation of relativistic factor

program james_cross_hw_3
    implicit none

    ! DECLARATION 
    ! ~~All units are MKS~~

    ! Non-relativistic kinetic energy in J (energy_nonrel) and 
    ! relativistic kinetic energy in J (energy_rel)
    real :: energy_nonrel, energy_rel
    ! Mass in kg (m) and velocity in m/s (v)
    real :: m, v
    ! Speed of light in m/s (c)
    real :: c = 299792458.0
    ! Relativistic factor 
    real :: relativistic_factor_1
    real :: relativistic_factor_2
    real :: relativistic_factor_3

    ! EXECUTION

    ! Ask the user for the real values of m and v
    ! in kg and m/s respectively in the terminal
    write(*,*) 'What mass (in kg)?'
    read(*,*) m
    write(*,*) 'What velocity (in m/s)?'
    read(*,*) v

    ! Evaluate non-relativistic and relativistic 
    ! kinetic energies in J
    energy_nonrel = 0.5*m*v**2
    relativistic_factor_1 = 1.0/sqrt(1.0-(v/c)**2)
    relativistic_factor_2 = sqrt(1.0/(1.0-(v/c)**2))
    relativistic_factor_3 = sqrt(1.0/( (1.0-(v/c))*(1.0+(v/c)) ))
    !energy_rel = (m*c**2) * (relativistic_factor - 1.0)

    ! Write the evaluated energies to the terminal
    write(*,*) 'Quantities'
    write(*,*) relativistic_factor_1
    write(*,*) relativistic_factor_2
    write(*,*) relativistic_factor_3
    !write(*,*) 'Non-relativistic energy in J', energy_nonrel
    !write(*,*) 'Relativistic energy in J    ', energy_rel

    ! TERMINATION

    stop 0
end program james_cross_hw_3

! Post-submission / September 25 tips
! You could have done difference of two squares
! with the relativistic factor and then something else?
! maybe it was : multiplying through?, or sqrting the whole 
! fraction?
