      program sine
      implicit none
      integer i, n, fid
      parameter(n=101)
      real x(n), y(n), z(n), dx, PI

      PI = 4.0*atan(1.0)

      dx = 1.0/(n-1)
      do i=1,n
         x(i) = (i-1)*dx
         y(i) = sin(2.0*PI*x(i))
         z(i) = cos(2.0*PI*x(i))
      enddo

      fid = 10
      open(unit=fid, file='cossin.dat')
      do i=1,n
         write(fid,*) i, x(i), y(i), z(i)
      enddo
      close(fid)

      end
