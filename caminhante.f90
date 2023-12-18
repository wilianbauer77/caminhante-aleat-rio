program walker
use iso_fortran_env
implicit none
integer, parameter :: L = 1000

integer :: i, j, x, m, xf
real :: tempo, r
integer, dimension(L) :: num
!call random_number(r)
!print*, rand
!stop
x=0
m=1
xf=5
tempo=0

call random_seed()

print*, "set xrange [-6:6]"
print*, "set yrange [-0.5:0.5]"
print*, "set key off"
print*, "set style line 1 lc rgb 'blue' pt 7"
print*, "set style line 2 lc rgb 'red' pt 2"
!stop
loop1:  do i=1, L
            j=i
            call random_number(r)
            !print*, r
            num(i) = nint(r) !numero aleatório 0 ou 1        
            if (num(i)==0) then
                x = x - m
            else
                x = x + m
                if (x==xf) then
                    !j = L - 1
                    exit loop1
                end if
            
            end if
            tempo = tempo + 1
            print*, "set title 'Tempo = ", tempo
            print*, "plot '-' w p ls 1, '-' w p ls 2"
            print*, x, 0.0

            print*, "e"
            print*, 5, 0.0
            print*, "e"
            print*, "pause 0.2"

            if(x==-5) then
                x = x + m

                print*, "plot '-' w p ls 1, '-' w p ls 2"
                print*, x, 0.0

                print*, "e"
                print*, 5, 0.0
                print*, "e"
                print*, "pause 0.2"
            end if
            !i=j
end do loop1

end program walker
