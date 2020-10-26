      subroutine TimeStep(u, dt)
      implicit none
      include 'param.h'
      real :: u(*), dt

      integer :: i
      real    :: dti

      dt = 1.0e10

      do i=1,N
         dti = dx/( abs(u(i)) + 1.0e-10) ! beware of division by zero
         dt  = min(dt, dti)
      enddo

      dt = CFL * dt

      print*
      print*,'Time step =',dt
      print*

      end
