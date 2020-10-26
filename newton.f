      program newton
      implicit none
      integer          iter, maxiter
      double precision EPSILON
      parameter(EPSILON=1.0d-10, maxiter=100)
      double precision x, f, fd
      double precision fun_val, fun_der

      iter = 0
      x    = 3.0d0
      f    = fun_val(x)
      fd   = fun_der(x)
      do while(dabs(f).gt.EPSILON .and. iter.lt.maxiter)
         x    = x - f/fd
         f    = fun_val(x)
         fd   = fun_der(x)
         iter = iter + 1
         write(*,10) iter, x, f
10       format("iter =",i5,3x," x =",e20.12,3x," f =",e15.4)
      enddo

      end

      double precision function fun_val(x)
      implicit none
      double precision x

      fun_val = x*x - 2.0d0

      end

      double precision function fun_der(x)
      implicit none
      double precision x

      fun_der = 2.0d0*x

      end
