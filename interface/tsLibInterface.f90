!!
!> Perform Time-Spectral Approximate Factorization Update
!!
subroutine afts_update(q,rhs,vol,rank,ninstances,h,freq,tcomp_ts,tcomm_ts,jmax,kmax,lmax)
  implicit none
!  include 'mpif.h'
 
  integer, intent(in)   :: jmax,kmax,lmax
  real*8, intent(in)    :: q(5,jmax,kmax,lmax)
  real*8, intent(in)    :: vol,freq
  real*8, intent(inout) :: rhs(5,jmax,kmax,lmax)
  integer, intent(in)   :: rank
  integer, intent(in)   :: ninstances
  real*8, intent(in)    :: h
  real*8, intent(inout) :: tcomp_ts,tcomm_ts
  ! 
  integer :: nq,ndof

  nq = 5 ! read this in later but harcoded for now
  ndof = nq*jmax*kmax*lmax
  call afts(q,rhs,vol,rank,ninstances,h,freq,tcomp_ts,tcomm_ts,jmax,kmax,lmax)
  !call afts_buffer(q,rhs,vol,rank,ninstances,h,freq,tcomp_ts,tcomm_ts,jmax,kmax,lmax,ndof)
  !call afts_uns(q,rhs,vol,rank,ninstances,h,freq,npts)
  return
end subroutine afts_update
!!
!> clean up all the arrays
!> and exit gracefully
!!
subroutine ts_cleanup
  implicit none
  !
  integer :: ierr

  !call mpi_finalize(ierr)
  !
end subroutine ts_cleanup
