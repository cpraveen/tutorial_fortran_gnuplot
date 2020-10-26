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
