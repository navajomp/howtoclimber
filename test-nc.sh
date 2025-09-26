#!/usr/bin/env bash
set -e

echo "Compiling NetCDF test program..."

# Write the Fortran source
cat > test_netcdf.f90 <<'EOF'
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
EOF

if [[ $(uname)=="Darwin"* ]]; then
	echo $(uname)
	gfortran test_netcdf.f90 -I/opt/homebrew/Cellar/netcdf-fortran/4.6.2/include -I/opt/homebrew/Cellar/netcdf/4.9.3/include -L/opt/homebrew/Cellar/netcdf-fortran/4.6.2/lib -L/opt/homebrew/Cellar/netcdf/4.9.3/lib -lnetcdff -lnetcdf -o test_netcdf

else
	 gfortran test_netcdf.f90 -I/usr/include -L/usr/lib -lnetcdff -lnetcdf -o test_netcdf
fi

# Run the test
./test_netcdf

# Clean up
rm -f test_netcdf.f90 test_netcdf test.nc

