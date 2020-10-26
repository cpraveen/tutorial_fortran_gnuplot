program euler
real :: to, tf, uo
integer :: N, i
real :: dt
real, allocatable :: u(:), t(:)
real :: fun

call readinput(to, tf, uo, N)

allocate( u(N) )
allocate( t(N) )

dt = (tf - to)/(N-1)
print*,'time step =', dt

u(1) = uo
t(1) = to

open(20, file='result.dat')
do i=2,N
   t(i) = t(i-1) + dt
   u(i) = u(i-1) + dt * fun( t(i-1) )
   write(* ,*) t(i), u(i), sin(t(i))
   write(20,*) t(i), u(i), sin(t(i))
enddo
close(20)

end

! Read input from file
subroutine readinput(to, tf, uo, N)
real :: to, tf, uo
integer :: N

open(10, file='data.in', status='old')
read(10,*) uo
read(10,*) to
read(10,*) tf
read(10,*) N
close(10)

if(tf <= to)then
   print*,'error: tf < to'
   stop
endif

print*,'init cond =', uo
print*,'init time =', to
print*,'init time =', tf
print*,'no of time steps =', N

end

! right hand side
real function fun(t)
real :: t

fun = cos(t)

end
