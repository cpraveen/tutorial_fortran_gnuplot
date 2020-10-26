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
