program difusion
    use iso_fortran_env
    implicit none
    integer, parameter :: N = 1000
    real, parameter :: pi = 3.141592653589793
    real :: s, time, r, tau, percent, a, b, p, D, m
    real :: finish, start
    integer, dimension(N) :: num
    real, dimension(N) :: t, mfpt, er
    integer :: i, j, w, w0, datu, x, xf, x0
    character(len= 18) :: dat_file
    call random_number(r)
    call cpu_time(start)

    t= 0 ; mfpt= 0; er= 0
    xf = 5
    x0 = -5
    x = 0
    
    D = 0.5
    call random_seed()
    !Parte Analítica
    
    s = 0
    w0 = 100.0
    do i=0, w0
        a = 1 + 2*i
        s = s + 16*(xf**2)*((-1)**i)*cos(pi*a*x0/(2*xf))/((a**3)*(pi**3)*D)
    end do
    tau = s
    !write(*,*) tau
    !stop
    percent = 0
    b = 0.01
    m=1
    !w= 0
    a=1
    !do w=1, w0
    do w=1, 200
        !w=1
        !m = 1
        m = m - b
        p = m*m/(D*2)
        !percent = w
        do j=1, N
            a = j
            percent = ( a + 1 ) / N               
            x = x0
            time = 0
            call random_seed()
            do while(x < xf)
                call random_number(r)
                num(j) = nint(r) !número aleatório 0 ou 1            
                if(num(j) == 0) then
                    x = x - m
                    if (x < 0) then
                        x = x + m
                    endif
                endif
                if(num(j) == 1) then
                    x = x + m
                endif
                time =  time + p
                if(time > w0) then
                    print*, "Loop atingiu o limite."
                    exit
                endif
                if (x <= 0.0 .or. x >= xf) then
                    exit
                endif
                !print*, num
            end do
            t(j) = time
            
        end do
        s = 0

        do i=1, N
            s = s + t(i)
        end do
        mfpt(w) = s/N
        !print*, w, m, mfpt(w)
        !w = w + 1
        percent = percent + 1
        print*, percent
    end do
    
    do j=1, N
        er(j) = abs((mfpt(j)-tau))/tau
    end do
    call cpu_time(finish)
    print*, finish-start, " segundos"
    open(newunit= datu, file= 'mfpt.dat', status= 'unknown')
    do j=1, w0
        write(datu, fmt= "(f6.4,1x,f8.5)") 1-b*j, mfpt(j)
		!write(1, *) "(f6.4,1x,f8.5/)", 1-b*j, mfpt(j)
	end do
    close(datu)
    open(newunit= datu, file= 'tau.dat', status= 'unknown')
	
    !write(1, *)"e/"
	do j=1, w0
        write(datu, fmt= '(i6,1x,f8.5)') j, tau
	 	!write(1, *) "(i7,1x,f8.5)", j, tau
	end do
    close(datu)
	open(newunit= datu, file= 'erro.dat', status= 'unknown')
    do j=1, w0
	    !write(1,*) "(f6.4,1x,f8.5)", 1-b*j, er(j)
        write(datu, fmt= '(f8.5,1x,f8.5)') 1-b*j, er(j)
	end do
    close(datu)
	
end program difusion


