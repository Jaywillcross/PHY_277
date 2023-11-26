! Program:  testing tiny and huge implicit
!           functions
! Name:     James Cross
! Date:     September 22, 2023

program tiny_huge
    implicit none

    integer, parameter :: quad_kind = kind(1.q0)
    integer, parameter :: doub_kind = kind(1.d0)

    real(kind=quad_kind) :: quad_precision_real 
    real(kind=doub_kind) :: doub_precision_real 
    real                 :: sing_precision_real

    write(*,*) tiny(sing_precision_real), huge(sing_precision_real)
    write(*,*) tiny(doub_precision_real), huge(doub_precision_real)
    write(*,*) tiny(quad_precision_real), huge(quad_precision_real)

    stop 0
end program tiny_huge
