!Program                : This program prompts the user for coefficients to a
!                         quadratic equation and returns the root(s)
!Name                   : James Cross
!Date                   : September 29, 2023

program hw_4
        implicit none
        ! coefficients 
        real :: a, b, c

        ! root components
        real :: x1, x2

        ! NOTE:
        ! x1 and x2 are context dependent
        ! In the case of complex roots x1 is used 
        ! to store the real component, and x2 stores the
        ! imaginary component. In the case of real roots, 
        ! x1 stores the first root and x2 stores the second
        ! root if it exists and is distinct from x1

        ! Inform the user
        write(*,*) 'This program solves for the roots &
                to the algebraic equation ax^2 + bx + c = 0'
        write(*,*) 'What is a?'
        read(*,*) a
        write(*,*) 'What is b?'
        read(*,*) b
        write(*,*) 'What is c?'
        read(*,*) c

        if (a==0.0) then
                ! horizontal line case
                if (b==0.0) then
                        ! 0 = 0 case
                        if (c==0.0) then
                                write(*,*) 'All complex x are roots'
                                    write(*,*) c, '=0 was entered'
                        ! floating line case
                        else
                                write(*,*) 'No roots exist'
                                write(*,*) c, '=0 was entered'
                        endif
                ! line equation case
                else
                        x1 = -c/b
                        write(*,*) 'Only 1 root'
                        write(*,*) 'Real root (x)'
                        write(*,*) x1
                end if
        else
                ! complex root case
                if ( (b**2) < (4.0*a*c) ) then
                        x1 = (-b) / (2.0*a)
                        x2 = (sqrt( 4.0*a*c-(b**2) )) / (2.0*a)

                        write(*,*) 'First complex root (x1)'
                        write(*,*) x1, '+', 'i', abs(x2)
                        write(*,*) 'Second complex root (x2)'
                        write(*,*) x1, '-', 'i', abs(x2)
                ! real root case
                elseif ( (b**2 > 4.0*a*c) ) then
                        x1 = (-b + sqrt((b**2)-4.0*a*c))/(2.0*a)
                        x2 = (-b - sqrt((b**2)-4.0*a*c))/(2.0*a)
                        ! x2 = sqrt( (b**2)-4.0*a*c  / (4.0 * (a**2)) )
                        ! x2 = sqrt( (b**2 / (4.0 * (a**2)) ) - c/a)
                        ! x2 = sqrt( (b/(2.0*a))**2 - c/a )

                        write(*,*) 'First real root (x1) ', x1
                        write(*,*) 'Second real root (x2)', x2
                ! rare, 0 discriminant case
                else
                        x1 = -b/(2.0*a)

                        write(*,*) 'Only 1 root'
                        write(*,*) 'Real root (x)'
                        write(*,*) x1
                end if
        end if

        ! TERMINATION
        stop 0
end program hw_4
