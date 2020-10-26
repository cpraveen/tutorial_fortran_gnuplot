      program main
      implicit none
      include 'common.h'

      pi   = 4.0*atan(1.0)
      nmax = 100
      smax = 200

      call sub()
      end

      subroutine sub()
      implicit none
      include 'common.h'

      print*,'pi   =',pi
      print*,'nmax = ',nmax
      print*,'smax = ',smax
      end
