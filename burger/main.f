C Solution of scalar conservation law using finite-volume method
C     (a,b) = domain of the problem
C     ua, ub= boundary condition
C     tf    = final time
C     N     = number of finite volumes
C     ictyp = type of initial condition
C     inftyp= numerical flux function
C     cfl   = Courant-Friedrich-Levy number
C
      program main
      implicit none
      include 'param.h'
      real, allocatable :: u(:)

c     Read data from file
      call ReadInput()

c     Allocate memory for solution
      allocate( u(N) )

c     Set initial condition
      call InitCond(u)

c     Solve the PDE
      call Solve(u)

c     Save final solution into file
      call SaveResult(u)

      deallocate( u )
      end
