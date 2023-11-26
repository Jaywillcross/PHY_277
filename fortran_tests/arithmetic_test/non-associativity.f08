! Program : Non-associativity of arithmetic
! Name : James Cross
! Date : September 15, 2023

program non_associative
        implicit none

        ! Declaration of arbitrary variables
        integer, parameter :: double_kind = kind(1.d0)

        real(kind=double_kind) :: a
        real(kind=double_kind) :: b
        real(kind=double_kind) :: c

        a = 1.d0
        b = -1.d30
        c = 1.d30

        write(*,*) 'a = ', a
        write(*,*) 'b = ', b
        write(*,*) 'c = ', c
        write(*,*) 'a + (b + c) = ', a + (b + c)
        write(*,*) '(a + b) + c = ', (a + b) + c
        write(*,*) 'Layman explanation: These do not agree because &
                when a very large number and a very small number &
                are added the small number gets absorbed into &
                the error of the large number. '

        end program non_associative
