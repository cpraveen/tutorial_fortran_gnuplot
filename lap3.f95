subroutine Iterate(nx, ny, dx, dy, f, u)
   implicit none
   integer :: nx, ny
   real    :: dx, dy, f(nx,ny), u(nx,ny)

   integer :: i, j
   real    :: fact

   fact = 0.5/( 1.0/dx**2 + 1.0/dy**2 )

   do i=2,nx-1
      do j=2,ny-1
         u(i,j) = fact*( (u(i-1,j  ) + u(i+1,j  ))/dx**2 + &
                         (u(i  ,j-1) + u(i  ,j+1))/dy**2 - &
                         f(i,j) )
      enddo
   enddo
end
