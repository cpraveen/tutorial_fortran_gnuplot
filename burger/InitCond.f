      subroutine InitCond(u)
      implicit none
      include 'param.h'
      real :: u(*)

      integer :: i, fid
      real    :: x

      fid = 20
      open(fid, file='init.out')

      do i=1,N
         x = a + 0.5*dx + (i-1)*dx

         select case(ictyp)
         case(1)
            u(i) = exp(-100.0*(x-0.5)**2)
         case default
            print*,'Unknown initial condition'
            stop
         end select

         write(fid,*) x, u(i)

      enddo

      close(fid)


      end
