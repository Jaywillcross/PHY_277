! Purpose:  Calculate the mean, median, and standard deviation of a file of 
!           real, line-separated values, and output those plus the number of 
!           values and a newly sorted array.
! Author :  James Cross
! Date   :  November 5, 2023

program hw_8
    implicit none

    ! I/O variables
    integer             :: lun1         ! Logical unit # for input and output
    integer             :: array_size   ! The size of the array
    integer             :: ioerror      ! I/O Error for reads and opens
    integer             :: i,j          ! Iterator variables
    character(len=100)  :: original_file_name ! Input file name
    character(len=100)  :: sorted_file_name   ! Output file name

    ! Storage array
    real, dimension(:), allocatable :: array    ! Stores reals from input file

    ! Calculation variables
    real :: sum         ! Holds the running sum for the average calculation
    real :: total_dev   ! Holds the running sum for the std dev calculation
    integer :: min_pos  ! Holds the minimum value index for the selection sort
    real :: placeholder ! Holds the array(j) for the swap in the selection sort

    ! Statistics variables
    real :: mean    ! Mean of the array
    real :: std_dev ! Std_dev of the array
    real :: median  ! Median of the sorted array

    ! ----------------------------INPUT----------------------------------------
    ! Explain the program
    write(*,*) 'For a specified file containing unsorted, line-separated reals&
        , this program calculates the mean, median, and standard deviation; &
        sorts and saves to disk the data; and reutrns the number of values.'

    ! Prompt the user for the input file
    write(*,*) 'Please enter the name of the file containing the data.'
    read(*,*) original_file_name

    ! Prompt the user for the output file
    write(*,*) 'Please enter the name of the file you would like to save the &
        sorted array to.'
    write(*,*) 'WARNING: Will overwrite existing files'
    read(*,*) sorted_file_name 

    ! Open the file and quit if it doesn't exist
    open(newunit=lun1, file=original_file_name,status='OLD',iostat=ioerror)
    if(ioerror /= 0) then
        write(*,*) 'Failure to read file'
        write(*,*) 'Check file name and file permissions'
        STOP 1
    end if

    ! Find the number of lines in the file
    array_size = 0
    do while (ioerror == 0)
        read(lun1,*,iostat=ioerror) placeholder
        if (ioerror == 0) then
            array_size = array_size + 1
        else
            exit
        end if
    end do
    
    ! Allocate memory for the array
    ! Read the input file entries into the array
    ! Close the input file
    allocate(array(array_size))
    rewind(lun1)
    do i=1,array_size
        read(lun1,*) array(i)
    end do
    close(unit=lun1)

    ! CALCULATION
    ! Find the mean
    sum = 0.0
    do i=1,array_size
        sum = sum + array(i)
    end do
    mean = sum / real(array_size)

    ! Find the standard deviation
    total_dev = 0.0
    do i=1,array_size
        total_dev  = total_dev + (array(i) - mean)**2
    end do
    std_dev = sqrt(total_dev / real(array_size))

    ! Sort the array with a selection sort
    do i=1,array_size-1
        min_pos = i
        do j=i+1,array_size
            if (array(j) < array(min_pos)) then
                min_pos = j
            end if
        end do
        placeholder = array(i)
        array(i) = array(min_pos)
        array(min_pos) = placeholder
    end do

    ! Find median
    if (array_size-2*array_size/2 == 0) then
        median = 0.5 * (array(array_size/2) + array(array_size/2+1))
    else
        median = array(array_size/2+1) 
    end if

    ! Write statistics to user
    write(*,*) 'Mean of the data set'
    write(*,*) mean
    write(*,*) 'Standard deviation of the data set'
    write(*,*) std_dev
    write(*,*) 'Median of the data set'
    write(*,*) median 
    write(*,*) 'Size of the data set'
    write(*,*) array_size 

    ! Open the output file
    open(newunit=lun1, file=sorted_file_name,status='REPLACE',iostat=ioerror)

    ! Stop if there is an error making or rewriting the output file
    if (ioerror /= 0) then
        write(*,*) 'Failure to open output file'
        write(*,*) 'Check file name and file permissions'
        STOP 2
    end if
    
    ! Save sorted array entries to output file
    do i=1,array_size
        write(lun1,*) array(i)
    end do

    ! Deallocate array and close output file
    deallocate(array)
    close(lun1)
    
    STOP 0
end program hw_8
