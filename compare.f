      program compare
      implicit none
      real a, b
      print*,'Enter first number (a)'
      read*,a
      print*,'Enter second number (b)'
      read*,b
      if(a.lt.b)then
         print*,'a is less than b'
      else if(a.gt.b)then
         print*,'a is greater than b'
      else
         print*,'a is equal to b'
      endif
      end
