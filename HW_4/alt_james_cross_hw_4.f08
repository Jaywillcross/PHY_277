!Name: James Cross
!Date: September 2, 2023

program hw_4
        implicit none
        ! kind parameter for double precision
        integer, parameter :: double_kind = kind(1.d0)
        ! coefficients 
        real(kind=double_kind) :: a, b, c
        ! real root components
        real(kind=double_kind) :: x1, x2
        ! imaginary root component
        real(kind=double_kind) :: xi

        ! timer variable
        real(kind=double_kind) :: t2, t1
        
        call cpu_time(t1)
        write(*,*) 'This program solves for the solution &
                to the algebraic equation ax^2 + bx + c = 0'
        write(*,*) 'What is a?'
        read(*,*) a
        write(*,*) 'What is b?'
        read(*,*) b
        write(*,*) 'What is c?'
        read(*,*) c

        if (a==0) then
                if (b==0) then
                        write(*,*) 'Not an algebraic equation'
                        write(*,*) c, '=0 was entered'
                        call cpu_time(t2)
                        write(*,*) 'cpu time: ', t2-t1
                        stop 0
                end if
                write(*,*) 'Only 1 root'
                x1 = -(c/b)
                write(*,*) 'Real root (x)'
                write(*,*) x1
                call cpu_time(t2)
                write(*,*) 'cpu time: ', t2-t1
                stop 0
        else
                if (((b**2)-4.q0*a*c)<0) then
                        x1 = -(b/(2.q0*a))
                        xi = (sqrt(4.q0*a*c-(b**2)))/(2.q0*a)
                        write(*,*) 'First complex root (x1)'
                        write(*,*) x1, '+', abs(xi)
                        write(*,*) 'Second complex root (x2)'
                        write(*,*) x1, '-', abs(xi)
                        call cpu_time(t2)
                        write(*,*) 'cpu time: ', t2-t1
                        stop 0
                else
                        x1 = (-b + sqrt((b**2)-4.q0*a*c))/(2.q0*a)
                        x2 = (-b - sqrt((b**2)-4.q0*a*c))/(2.q0*a)
                end if
        end if
        write(*,*) 'First real root (x1)'
        write(*,*) x1
        write(*,*) 'Second real root (x2)'
        write(*,*) x2

        call cpu_time(t2)
        write(*,*) 'cpu time: ', t2-t1
        stop 0
        end program hw_4
