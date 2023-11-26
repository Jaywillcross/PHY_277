!Name : James Cross
!Date : September 20, 2023
!Purpose : The purpose of this program is to find the relativistic 
!   and non-relativistic kinetic energy of a mass m moving
!   with velocity v, all in MKS units (kg, m/s, and J)
!   The relativistic kinetic energy doesn't remotely match 
!   for v< ~8.9641e4 m/s because of floating point error
!   in the subtraction of 1 - (v/c)**2

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
    real, parameter :: c = 299792458
    ! Relativistic factor 
    real :: relativistic_factor

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
    relativistic_factor = (1.0-(v/c)**2)**(-0.5)
    energy_rel = (m*c**2) * (relativistic_factor - 1.0)

    ! Write the evaluated energies to the terminal
    write(*,*) 'Quantities'
    write(*,*) 'Non-relativistic energy in J', energy_nonrel
    write(*,*) 'Relativistic energy in J    ', energy_rel

    ! TERMINATION

    stop 0
end program james_cross_hw_3
