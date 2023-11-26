! Program:  This program prompts the user for a real time t in days 
!           and then outputs the apparent magnitude of a specific
!           binary star system.
! Author :  James Cross
! Date   :  October 11, 2023

program hw_5
    implicit none

    ! DECLARATION
    real :: t                       ! time in days
    real :: app_mag                 ! apparent magnitude (unitless)
    logical :: alignment_check    ! Whether the stars are aligned or not 
    real, parameter :: PI=3.14159265

    write(*,*) "This program calculates the apparent magnitude for a &
        particular binary star system given a real, non-negative time."
    write(*,*) "Enter a real, non-negative time (t) in units of days"
    read(*,*) t

    ! Re-prompt the user if an invalid t is entered
    do while (t<0.0)
        write(*,*) "You entered:"
        write(*,*) t
        write(*,*) "Please enter a real, non-negative number for the time (t) & 
            in units of days"
        read(*,*) t
    enddo

    ! Note: Apparent magnitude is periodic with period of 6.4. This means that
    ! any t's shifted by integer multiples of 6.4 are equal for all t, so the
    ! apparent magnitude is solely determined by the remainder of t/6.4
    t = MOD(t,6.4)

    ! Note: Three segments have identical apparent magnitudes, which represent 
    ! when the stars are unaligned with respect to the observer. 
    alignment_check = ((t>=0.9) .and. (t<2.3)) .or. ((t>=4.4) .and. (t<5.2))

    ! Evaluate the piecewise apparent magnitude according to t
    if (alignment_check .eqv. .false.) then
        app_mag = 2.5
    elseif ((t >= 0.9) .and. (t<2.3)) then
        app_mag = 3.335 - LOG(1.352+COS(PI * (t-0.9)/0.7))
    elseif ((t >= 4.4) .and. (t<5.2)) then
        app_mag = 3.598 - LOG(1.998+COS(PI * (t-4.4)/0.4))
    end if

    ! Write the apparent magnitude to the user's terminal
    write(*,*) "Below is the apparent magnitude at time", t
    write(*,*) app_mag

    stop 0
end program hw_5
