# Detect operating system
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
    # macOS configuration
    ### Compiler #####################
    FC = gfortran-15

    ### Library locations ############
    NC_CROOT = /opt/homebrew/opt/netcdf
    NC_FROOT = /opt/homebrew/opt/netcdf-fortran
    INC_NC  = -I$(NC_FROOT)/include -I$(NC_CROOT)/include
    LIB_NC  = -L$(NC_FROOT)/lib -lnetcdff -L$(NC_CROOT)/lib -lnetcdf
else
    # Linux configuration
    ### Compiler #####################
    FC = gfortran

    ### Library locations ############
    NC_CROOT = /usr
    NC_FROOT = /usr
    INC_NC  = -I$(NC_FROOT)/include
    LIB_NC  = -L$(NC_FROOT)/lib -lnetcdff -L$(NC_CROOT)/lib -lnetcdf
endif

FFLAGS  = -ffree-line-length-none -I$(objdir) -J$(objdir)

ifeq ($(openmp), 1)
    FFLAGS  = -I$(objdir) -J$(objdir) -ffree-line-length-none -fomit-frame-pointer -fopenmp
endif

LFLAGS  = $(LIB_NC)

DFLAGS_NODEBUG = -O2 -march=native
DFLAGS_DEBUG   = -w -g -ggdb -ffpe-trap=invalid,zero,overflow,underflow -fbacktrace -fcheck=all
DFLAGS_PROFILE = -O2 -pg