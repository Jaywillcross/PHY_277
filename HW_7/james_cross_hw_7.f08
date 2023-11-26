! Program:  This program evaluates a definite integral of a function
!           f(x) using Simpson's Rule
! Author :  James Cross
! Date   :  October 26, 2023

! I believe that the most accurate value the definite integral is 993.631. 
! I think that this is the most accurate value because when taken to the proper
! precision, it is the value appoached graphically before the values began 
! diverging. When I plotted this data using gnuplot, the integral values 
! are clearly converging to a value up until n = 214 to 217. 
! At these values, it bounced around 993.632, 993.631, and 993.630 before 
! the data started to diverge and become noisy. The mean of these values is
! 993.631, so that is my believed value.

! Note: The code gave both IEE_UNDERFLOW_FLAG and IEEE_DENORMAL,
!       so the integral value can only be trusted to 6 digits or to 3 decimals
! number of subintervals (n)    integral value (partial_sum)
!                        180                      993.567871    
!                        181                      993.611206    
!                        182                      993.683411    
!                        183                      993.640442    
!                        184                      993.586365    
!                        185                      993.622559    
!                        186                      993.665466    
!                        187                      993.633850    
!                        188                      993.601624    
!                        189                      993.632935    
!                        190                      993.653625    
!                        191                      993.628479    
!                        192                      993.613586    
!                        193                      993.631348    
!                        194                      993.644958    
!                        195                      993.628845    
!                        196                      993.616760    
!                        197                      993.632202    
!                        198                      993.641235    
!                        199                      993.630615    
!                        200                      993.621765    
!                        201                      993.634766    
!                        202                      993.640381    
!                        203                      993.626465    
!                        204                      993.629517    
!                        205                      993.634399    
!                        206                      993.637207    
!                        207                      993.630005    
!                        208                      993.631104    
!                        209                      993.633850    
!                        210                      993.634705    
!                        211                      993.627136    
!                        212                      993.630493    
!                        213                      993.632629    
!                        214                      993.631958    
!                        215                      993.629578    
!                        216                      993.629761    
!                        217                      993.631287    
!                        218                      993.629883    
!                        219                      993.632812    
!                        220                      993.630188    
!                        221                      993.632568    
!                        222                      993.631836    
!                        223                      993.627869    
!                        224                      993.629333    
!                        225                      993.634644    
!                        226                      993.628784    
!                        227                      993.633179    
!                        228                      993.633667    
!                        229                      993.630493    
!                        230                      993.634766    
!                        231                      993.627930    
!                        232                      993.630127    
!                        233                      993.633118    
!                        234                      993.630127    
!                        235                      993.635010    
!                        236                      993.633606    
!                        237                      993.631775    
!                        238                      993.630737    
!                        239                      993.628906    
!                        240                      993.633423    
!                        241                      993.630371    
!                        242                      993.632874    
!                        243                      993.634521    
!                        244                      993.634583    
!                        245                      993.632202    
!                        246                      993.628418    
!                        247                      993.629517    
!                        248                      993.635071    
!                        249                      993.630066    
!                        250                      993.630127    
!                        251                      993.633850    
!                        252                      993.634033    
!                        253                      993.630371    
!                        254                      993.629944    
!                        255                      993.632935    
!                        256                      993.631592    
!                        257                      993.632751    
!                        258                      993.629150    
!                        259                      993.628052    
!                        260                      993.629211    
!                        261                      993.631958    
!                        262                      993.630005    
!                        263                      993.628723    
!                        264                      993.628845    
!                        265                      993.630920    
!                        266                      993.633850    
!                        267                      993.629761    
!                        268                      993.634399    
!                        269                      993.631531    
!                        270                      993.629028    
!                        271                      993.634766    
!                        272                      993.632202    
!                        273                      993.630249    
!                        274                      993.635498    
!                        275                      993.632080    
!                        276                      993.628052    
!                        277                      993.631409    
!                        278                      993.633972    
!                        279                      993.634644    
!                        280                      993.634888    
!                        281                      993.632751    
!                        282                      993.628723    
!                        283                      993.631775    
!                        284                      993.632874    
!                        285                      993.632263    
!                        286                      993.628052    
!                        287                      993.630920    
!                        288                      993.630554    
!                        289                      993.627625    
!                        290                      993.630005    
!                        291                      993.628967    
!                        292                      993.633911    
!                        293                      993.634949    
!                        294                      993.632263    
!                        295                      993.635498    
!                        296                      993.633118    
!                        297                      993.628052    
!                        298                      993.627319    
!                        299                      993.630981    
!                        300                      993.630310    
!                        301                      993.632812    
!                        302                      993.631897    
!                        303                      993.634155    
!                        304                      993.631348    
!                        305                      993.632568    
!                        306                      993.628235    
!                        307                      993.627686    
!                        308                      993.630676    
!                        309                      993.627319    
!                        310                      993.627380    
!                        311                      993.630920    
!                        312                      993.627808    
!                        313                      993.627625    
!                        314                      993.630493    
!                        315                      993.635925    
!                        316                      993.634155    
!                        317                      993.635254    
!                        318                      993.629761    
!                        319                      993.635010    
!                        320                      993.632935    
!                        321                      993.633484    
!                        322                      993.636108    
!                        323                      993.631104    
!                        324                      993.627258    
!                        325                      993.634827    
!                        326                      993.634644    
!                        327                      993.635864    
!                        328                      993.628113    
!                        329                      993.632141    
!                        330                      993.627319    
!                        331                      993.632812    
!                        332                      993.630249    
!                        333                      993.628296    
!                        334                      993.627136    
!                        335                      993.636108    
!                        336                      993.636108    
!                        337                      993.626648    
!                        338                      993.627563    
!                        339                      993.628723    
!                        340                      993.630554    
!                        341                      993.631653    
!                        342                      993.633301    
!                        343                      993.636047    
!                        344                      993.627075    
!                        345                      993.627991    
!                        346                      993.629395    
!                        347                      993.630066    
!                        348                      993.630066    
!                        349                      993.629822    
!                        350                      993.628174    
!                        351                      993.626343    
!                        352                      993.634583    
!                        353                      993.630432    
!                        354                      993.625916    
!                        355                      993.631409    
!                        356                      993.634888    
!                        357                      993.626831    
!                        358                      993.627991    
!                        359                      993.628113    
!                        360                      993.626404    
!                        361                      993.633789    
!                        362                      993.628967    
!                        363                      993.632751    
!                        364                      993.635376    
!                        365                      993.635803    
!                        366                      993.634644    
!                        367                      993.630981    
!                        368                      993.636353    
!                        369                      993.627930    
!                        370                      993.629456    
!                        371                      993.627808    
!                        372                      993.635010    
!                        373                      993.628296    
!                        374                      993.630554    
!                        375                      993.629700    
!                        376                      993.626587    
!                        377                      993.631592    
!                        378                      993.633423    
!                        379                      993.632874    

program hw_7
    implicit none

    integer :: i                                ! Iteration variable
    integer :: n                                ! Number of iterations
    real    :: x_i                              ! The i-th x-value
    real    :: f_of_x_i                         ! f(x_i)
    real    :: f_of_x_i_plus_half               ! f(x_{i+1/2})
    real    :: f_of_x_i_plus_one                ! f(x_{i+1})
    real    :: delta_x                          ! The subinterval size
    real    :: area_i                           ! The i-th area calculated
    real    :: partial_sum                      ! The running total for the sum
    real, parameter    :: upper_bound = 20.0    ! Upper bound of integration
    real, parameter    :: lower_bound = 1.0     ! Lower bound of integration 
    real, parameter    :: a = 4.0e3             ! Equation parameters 
    real, parameter    :: b = 15.15
    real, parameter    :: c = 0.01          

    ! Explain the program and prompt the user for an n
    write(*,*) 'This program calculates the definite integral of &
        (x + COS(x)) * EXP(COS(x)) + a*EXP(- (x-b)**2 / c) from  &
        1 to 20 using Simpsons Rule with n subintervals where a = 4000, &
        b = 15.15 and c = 0.01'
    write(*,*) 'Please provide an n'
    read(*,*) n

    ! Calculate the subinterval size
    delta_x = (upper_bound - lower_bound) / REAL(n)

    ! Initialize the x_i term and the corresponding f(x's)
    x_i = lower_bound
    f_of_x_i = (x_i + COS(x_i)) * EXP(COS(x_i)) + a*EXP(-(x_i-b)**2 / c)
    f_of_x_i_plus_half = (x_i+0.5*delta_x + COS(x_i+0.5*delta_x)) &
        * EXP(COS(x_i+0.5*delta_x)) &
        + a*EXP(-(x_i+0.5*delta_x-b)**2 / c)
    f_of_x_i_plus_one = (x_i+delta_x + COS(x_i+delta_x)) &
        * EXP(COS(x_i+delta_x)) &
        + a*EXP(-(x_i+delta_x-b)**2 / c)

    ! Initialize the i-th area term and the running sum
    area_i = 0.0
    partial_sum = 0.0

    ! Calculate the sum
    do i = 1,n
        area_i = (1.0/6.0) * (f_of_x_i &
            + 4.0 * f_of_x_i_plus_half &
            + f_of_x_i_plus_one) * delta_x 
        partial_sum = partial_sum + area_i

        x_i = x_i + delta_x
        f_of_x_i = (x_i + COS(x_i)) * EXP(COS(x_i)) + a*EXP(-(x_i-b)**2 /c)
        f_of_x_i_plus_half = (x_i+0.5*delta_x + COS(x_i+0.5*delta_x)) &
            * EXP(COS(x_i+0.5*delta_x)) &
            + a*EXP(-(x_i+0.5*delta_x-b)**2 / c)
        f_of_x_i_plus_one = (x_i+delta_x + COS(x_i+delta_x)) &
            * EXP(COS(x_i+delta_x)) &
            + a*EXP(-(x_i+delta_x-b)**2 / c)
    end do

    ! Return the sum to the user with the inputs given
    write(*,*) 'When n is equal to'
    write(*,*) n
    write(*,*) 'and delta_x is equal to'
    write(*,*) delta_x
    write(*,*) 'The integral evaluates to'
    write(*,*) partial_sum

    stop 0
end program hw_7
