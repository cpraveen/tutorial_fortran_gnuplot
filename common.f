      program main
      implicit none
      integer nmax, smax
      real    pi
      common/math/pi
      common/dim/nmax, smax

      pi   = 4.0*atan(1.0)
      nmax = 100
      smax = 200

      call sub()
      end

      subroutine sub()
      implicit none
      integer nmax, smax
      real    pi
      common/math/pi
      common/dim/nmax, smax

      print*,'pi   =',pi
      print*,'nmax = ',nmax
      print*,'smax = ',smax
      end
