#!/usr/bin/env bash
set -e

# ==================================================
#  Climate Model Library Installer (gfortran)
# ==================================================

# Check that Conda environment is active
if [[ -z "$CONDA_PREFIX" ]]; then
    echo "Please activate your Conda environment first:"
    echo "   mamba activate climberx-env"
    exit 1
fi

# =========================
#  Compiler setup
# =========================
echo "Setting up compiler environment..."
export F77=$CONDA_PREFIX/bin/gfortran
export CC=$CONDA_PREFIX/bin/gcc

FFLAGS="-O2 -g"
CFLAGS="-O2 -g"

arch=$(uname -m)
if [[ "$arch" == "x86_64" ]]; then
    FFLAGS="$FFLAGS -march=native -mtune=native"
    CFLAGS="$CFLAGS -march=native -mtune=native"
fi

# =========================
#  NetCDF setup
# =========================
export NETCDF_C=$CONDA_PREFIX
export NETCDF_F=$CONDA_PREFIX

export CFLAGS="$CFLAGS -I$NETCDF_C/include"
export FFLAGS="$FFLAGS -I$NETCDF_F/include"
export LDFLAGS="-L$NETCDF_C/lib -lnetcdf -L$NETCDF_F/lib -lnetcdff"

echo "Compiler and NetCDF environment configured:"
echo "   F77 = $F77"
echo "   CC  = $CC"
echo "   NETCDF prefix = $CONDA_PREFIX"
echo ""

# =========================
#  FFTW build
# =========================
SRCDIR=$PWD
FFTWSRC=fftw-3.3.10

for BUILD in "fftw-omp --enable-openmp" "fftw-serial"; do
    TARGET=$(echo $BUILD | awk '{print $1}')
    FLAGS=$(echo $BUILD | cut -d' ' -f2-)
    echo "Building FFTW: $TARGET"
    cd $FFTWSRC
    ./configure --disable-doc --prefix=$SRCDIR/$TARGET $FLAGS CC=$CC F77=$F77 CFLAGS="$CFLAGS" FFLAGS="$FFLAGS"
    make clean
    make -j
    make install
    cd $SRCDIR
done

# =========================
#  LIS build
# =========================
LISSRC=lis-2.1.6

for BUILD in "lis-omp --enable-omp" "lis-serial"; do
    TARGET=$(echo $BUILD | awk '{print $1}')
    FLAGS=$(echo $BUILD | cut -d' ' -f2-)
    echo "Building LIS: $TARGET"
    cd $LISSRC
    ./configure --prefix=$SRCDIR/$TARGET --enable-f90 $FLAGS CC=$CC F77=$F77 CFLAGS="$CFLAGS" FFLAGS="$FFLAGS" LDFLAGS="$LDFLAGS"
    make clean
    make -j
    make install
    cd $SRCDIR
done

# =========================
#  Check
# =========================
echo ""
echo "All libraries compiled."
echo "Running check script..."
./check.sh
echo ""

