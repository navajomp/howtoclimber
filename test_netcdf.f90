program test_netcdf
  use netcdf
  implicit none

  integer :: ncid, status

  ! Try to create a small NetCDF file
  status = nf90_create("test.nc", NF90_CLOBBER, ncid)
  if (status /= nf90_noerr) then
     print *, "NetCDF test FAILED: ", trim(nf90_strerror(status))
     stop 1
  endif

  ! Close the file
  status = nf90_close(ncid)
  if (status /= nf90_noerr) then
     print *, "NetCDF test FAILED on close: ", trim(nf90_strerror(status))
     stop 1
  endif

  print *, "NetCDF test PASSED — Ready to climb!"
end program test_netcdf
