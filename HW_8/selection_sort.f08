program selection_sort
    implicit none

    real, dimension(4) :: array
    real :: placeholder
    integer :: min_pos
    integer :: i, j

    array = [-9.0, 1.0, 0.5, -9.0]

    write(*,*) 'UNSORTED'
    write(*,*) array

    placeholder = 0
    do i = 1,size(array)-1,1
        min_pos = i
        do j = i+1,size(array),1
            if (array(j) < array(min_pos)) then
                min_pos = j
            end if
         end do

         if (i /= min_pos) then
             placeholder = array(i)
             array(i) = array(min_pos)
             array(min_pos) = placeholder
         end if
     end do

     write(*,*) 'SORTED'
     write(*,*) array

end program selection_sort
