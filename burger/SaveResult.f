      subroutine SaveResult(u)
      implicit none
      include 'param.h'
      real :: u(*)

      integer :: i, fid
      real    :: x


      fid = 20
      open(fid, file='fin.out')
      do i=1,N
         x = a + 0.5*dx + (i-1)*dx
         write(fid,*) x, u(i)
      enddo
      close(fid)

      end
