      subroutine Solve(u)
      implicit none
      include 'param.h'
      real :: u(*)

      real, allocatable :: res(:)
      real              :: dt, t
      real              :: flux
      integer           :: i

      allocate( res(N) )
      
c     Compute time step using CFL condition
      call TimeStep(u, dt)

      t = 0.0 ! Set time counter
      do while(t < tf)
         t = t + dt
         print*,'Time =',t

         res(:) = 0.0

c        flux at left boundary
         flux = 0.5*ua**2
         res(1) = res(1) - flux

c        flux for interior faces
         do i=1,N-1
            call NumFlux( u(i), u(i+1), flux)
            res(i)   = res(i)   + flux
            res(i+1) = res(i+1) - flux
         enddo

c        flux at right boundary
         flux = 0.5*ub**2
         res(N) = res(N) + flux

c        Update solution to new time level
         do i=1,N
            u(i) = u(i) - (dt/dx) * res(i)
         enddo

      enddo

c     Free allocated memory
      deallocate( res )

      end
