program laplace
   implicit none
   real, allocatable :: u(:,:), f(:,:)
   integer :: nx, ny, iter, MAXITER,fid
   real :: dx, dy, res, TOL
   parameter(MAXITER=1000, TOL=1.0e-7)

   print*,'Enter grid size nx, ny'
   read*,nx,ny
   allocate( u(nx,ny) )
   allocate( f(nx,ny) )
   dx = 1.0/(nx-1)
   dy = 1.0/(ny-1)
   call InitCond(nx,ny,dx,dy,f,u)
   res  = TOL+1.0 ! Residue to measure convergence
   iter = 0       ! Iteration counter
   fid  = 15      ! File to save residue
   open(unit=fid, file='res.dat')
   do while(res > TOL .and. iter < MAXITER)
      call Iterate(nx, ny, dx, dy, f, u)
      call Residue(nx, ny, dx, dy, f, u, res)
      iter = iter + 1
      write(*,'(i6,e12.4)') iter,res
      write(fid,'(i6,e12.4)') iter,res
   enddo
   close(fid)
   call SaveResult(nx,ny,dx,dy,u)
   deallocate(u)
   deallocate(f)

end

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

subroutine Residue(nx, ny, dx, dy, f, u, res)
   implicit none
   integer :: nx, ny
   real    :: dx, dy, f(nx,ny), u(nx,ny), res

   integer :: i, j

   res = 0.0
   do i=2,nx-1
      do j=2,ny-1
         res = res + ( (u(i-1,j  ) - 2.0*u(i,j) + u(i+1,j  ))/dx**2 + &
                       (u(i  ,j-1) - 2.0*u(i,j) + u(i  ,j+1))/dy**2 - &
                       f(i,j) )**2
      enddo
   enddo
   res = res/(nx-2)/(ny-2)
end

subroutine SaveResult(nx, ny, dx, dy, u)
   implicit none
   integer :: nx, ny
   real    :: dx, dy, u(nx,ny)

   integer :: fid, i, j
   real    :: x, y

   fid = 10
   open(unit=fid, file='u.dat')
   do i=1,nx
      do j=1,ny
         x = (i-1)*dx
         y = (j-1)*dy
         write(fid,*) x, y, u(i,j)
      enddo
      write(fid,*)
   enddo
   close(fid)
end
