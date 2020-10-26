subroutine Residue(nx, ny, dx, dy, f, u, res)
   implicit none
   integer :: nx, ny
   real    :: dx, dy, f(nx,ny), u(nx,ny), res

   integer :: i, j

   res = 0.0
   do i=2,nx-1
      do j=2,ny-1
         res = res &
             + ( (u(i-1,j  ) - 2.0*u(i,j) + u(i+1,j  ))/dx**2 &
             + (u(i  ,j-1) - 2.0*u(i,j) + u(i  ,j+1))/dy**2 &
             - f(i,j) )**2
      enddo
   enddo
   res = res/(nx-2)/(ny-2)
end
