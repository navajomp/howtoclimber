### Compiler #####################
FC = $(CONDA_PREFIX)/bin/gfortran

### Library locations ############
NC_CROOT=$(CONDA_PREFIX)
NC_FROOT=$(CONDA_PREFIX)
INC_NC  = -I$(NC_FROOT)/include
LIB_NC  = -L$(NC_FROOT)/lib -lnetcdff -L$(NC_CROOT)/lib -lnetcdf

### Debug / optimization flags ###
DFLAGS_NODEBUG = -O3
DFLAGS_DEBUG   = -w -g -p -ggdb -ffpe-trap=invalid,zero,overflow,underflow -fbacktrace -fcheck=all
DFLAGS_PROFILE = -pg

### Fortran flags ################
FFLAGS_DEFAULT = -ffree-line-length-none -fbackslash -I$(objdir) -J$(objdir) $(INC_NC)
FFLAGS_OPENMP  = $(FFLAGS_DEFAULT) -fopenmp

### Linking flags ################
LFLAGS  = $(LIB_NC)

