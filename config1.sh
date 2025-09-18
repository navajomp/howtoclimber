### Compiler #####################
FC = $(CONDA_PREFIX)/bin/gfortran

### Library locations ############
NC_CROOT=$(CONDA_PREFIX)
NC_FROOT=$(CONDA_PREFIX)
INC_NC  = -I$(NC_FROOT)/include
LIB_NC  = -L$(NC_FROOT)/lib -lnetcdff -L$(NC_CROOT)/lib -lnetcdf

### Fortran flags ################
FFLAGS  = -ffree-line-length-none -I$(objdir) -J$(objdir)

ifeq ($(openmp), 1)
    FFLAGS  = -I$(objdir) -J$(objdir) -ffree-line-length-none -fomit-frame-pointer -fopenmp
endif

### Linking flags ################
LFLAGS  = $(LIB_NC)

### Debug / optimization flags ###
DFLAGS_NODEBUG = -O2
DFLAGS_DEBUG   = -w -g -ggdb -ffpe-trap=invalid,zero,overflow,underflow -fbacktrace -fcheck=all
DFLAGS_PROFILE = -O2 -pg

