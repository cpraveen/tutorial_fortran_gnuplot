      subroutine NumFlux(ul, ur, flux)
      implicit none
      include 'param.h'
      real :: ul, ur, flux

      real :: as, fl, fr

      fl = 0.5*ul**2
      fr = 0.5*ur**2

      select case(inftyp)

      case(1)
         if( ul /= ur)then
            as = (fr - fl)/(ur - ul)
         else
            as = ul
         endif
         flux = 0.5*(fl + fr) - 0.5*abs(as)*(ur - ul)

      case default
         print*,'Unknown numerical flux function'
         stop

      end select

      end

