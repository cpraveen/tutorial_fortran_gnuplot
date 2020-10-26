subroutine InitCond(nx,ny,dx,dy,f,u)
   implicit none
   integer :: nx, ny
   real    :: dx, dy, f(nx,ny), u(nx,ny)

   integer :: i, j
   real    :: x, y, PI

   PI = 4.0*atan(1.0)

   do i=1,nx
      do j=1,ny
         x      = (i-1)*dx
         y      = (j-1)*dy
         u(i,j) = 0.0
         f(i,j) = sin(2.0*PI*x) * cos(2.0*PI*y)
      enddo
   enddo

end
