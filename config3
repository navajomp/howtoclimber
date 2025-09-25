### Compiler #####################
FC  = $(CONDA_PREFIX)/bin/gfortran

### Library locations ############

# NetCDF (from Conda environment)
NC_CROOT = $(CONDA_PREFIX)
NC_FROOT = $(CONDA_PREFIX)
INC_NC  = -I$(NC_FROOT)/include
LIB_NC  = -L$(NC_FROOT)/lib -lnetcdff -L$(NC_CROOT)/lib -lnetcdf

# coordinates
COORDROOT = src/utils/coordinates
INC_COORD = -I$(COORDROOT)/libcoordinates/include
LIB_COORD = -L$(COORDROOT)/libcoordinates/include -lcoordinates

# FESM-UTILS
FESMUTILSROOT = src/utils/fesm-utils/utils
INC_FESMUTILS = -I$(FESMUTILSROOT)/include-serial
LIB_FESMUTILS = -L$(FESMUTILSROOT)/include-serial -lfesmutils

# FFTW
FFTWROOT = src/utils/fesm-utils/fftw-omp
INC_FFTW = -I$(FFTWROOT)/include
LIB_FFTW = -L$(FFTWROOT)/lib -lfftw3

# VILMA
VILMAROOT = src/vilma
INC_VILMA = -I$(VILMAROOT)/include
LIB_VILMA = $(VILMAROOT)/lib/vega_pism.a

### Compiler options #############
CPPFLAGS     = -cpp

DFLAGS_NODEBUG = -Ofast
DFLAGS_DEBUG   = -w -g -p -ggdb -ffpe-trap=invalid,zero,overflow,underflow -fbacktrace -fcheck=all
DFLAGS_PROFILE = -O3 -pg -g

FFLAGS_FULL = -I$(objdir) -J$(objdir) -L$(objdir) $(INC_NC) $(INC_FESMUTILS) $(INC_COORD) $(INC_FFTW) $(INC_VILMA)
FFLAGS_CLIM = -I$(objdir) -J$(objdir) -L$(objdir) $(INC_NC) $(INC_FESMUTILS) $(INC_COORD) $(INC_FFTW)
FFLAGS_OPENMP  = -Wopenmp

LFLAGS_FULL  = $(LIB_NC) $(LIB_COORD) $(LIB_FESMUTILS) $(LIB_VILMA) $(LIB_FFTW)
LFLAGS_CLIM  = $(LIB_NC) $(LIB_COORD) $(LIB_FESMUTILS) $(LIB_FFTW)

