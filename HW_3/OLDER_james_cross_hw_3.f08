!Name : James Cross
!Date : September 1, 2023
!Purpose : The purpose of this program is to find the relativistic 
!       and non-relativistic kinetic energy of a mass m moving
!       with velocity v, all in MKS units (kg, m/s, and J)

program james_cross_hw_3
        implicit none

        ! DECLARATION 
        ! ~~All units are MKS~~

        ! Parameter to specifiy the precision of 
        ! the reals used in this program
        integer, parameter :: quad_kind = kind(1.q0)

        ! Non-relativistic kinetic energy (T_NR) and 
        ! relativistic kinetic energy (T_R)
        real(kind=quad_kind) :: T_NR, T_R
        ! Mass (m) and velocity (v)
        real(kind=quad_kind) :: m, v
        ! Speed of light
        real(kind=quad_kind), parameter :: c = 299792458
        ! Relativistic factor 
        real(kind=quad_kind) :: relativistic_factor

        ! EXECUTION

        ! Ask the user for the real values of m and v
        ! in kg and m/s respectively in the terminal
        write(*,*) 'What mass (in kg)?'
        read(*,*) m
        write(*,*) 'What velocity (in m/s)?'
        read(*,*) v

        ! Evaluate non-relativistic and relativistic 
        ! kinetic energies in J
        T_NR = 5.q-1*m*v**2
        relativistic_factor = (1.q0-(v/c)**2)**(-5.q-1)
        T_R = (m*c**2) * (relativistic_factor - 1.q0)

        ! Write the evaluated energies to the terminal
        write(*,*) 'Quantities'
        write(*,*) 'Non-relativistic energy in J', T_NR
        write(*,*) 'Relativistic energy in J    ', T_R

        ! TERMINATION

        stop 0
        end program james_cross_hw_3
