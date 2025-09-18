#!/usr/bin/env bash
set -e

echo "🔧 Compiling NetCDF test program..."

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

  print *, "🎉 NetCDF test PASSED — Ready to climb!"
end program test_netcdf
EOF

# Compile using gfortran from conda/mamba environment
gfortran test_netcdf.f90 -I${CONDA_PREFIX}/include -L${CONDA_PREFIX}/lib -lnetcdff -lnetcdf -o test_netcdf

# Run the test
./test_netcdf

# Clean up
rm -f test_netcdf.f90 test_netcdf test.nc

