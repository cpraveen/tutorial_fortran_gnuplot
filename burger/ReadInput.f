      subroutine ReadInput()
      implicit none
      include 'param.h'

      integer :: fid

      fid = 10

      open(fid, file='data.in', status='old')
      read(fid,*) a, b
      read(fid,*) ua, ub
      read(fid,*) tf
      read(fid,*) cfl
      read(fid,*) N
      read(fid,*) ictyp
      read(fid,*) inftyp
      close(fid)

      dx = (b - a)/N

c     Echo data to screen
      print*
      print*,'Domain        =',a,b
      print*,'Bound cond    =',ua,ub
      print*,'Final time    =',tf
      print*,'CFL no.       =',cfl
      print*,'No. of cells  =',N
      print*,'Init cond     =',ictyp
      print*,'Num flux func =',inftyp
      print*,'dx            =',dx
      print*

      end
