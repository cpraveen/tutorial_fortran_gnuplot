      program array_sum
      implicit none
      integer i, nmax, n
      parameter(nmax=100)
      real    val(nmax), sum

c Read how many number to add
      print*,'How many numbers to add ?'
      read*,n

c Check that n is a valid input
      if(n.gt.nmax)then
         print*,'Array size nmax is not sufficient'
         print*,'Increase nmax and then run'
         stop
      endif

      if(n.lt.0)then
         print*,'Error: give a positive integer'
         stop
      endif

c Initialize the numbers to add
      do i=1,n
         val(i) = i
      enddo

c Add the numbers
      sum = 0.0
      do i=1,n
         sum = sum + val(i)
      enddo

      print*,'sum =', sum

      end program array_sum
