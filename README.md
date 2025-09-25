# howtoclimber

A set of instructions to compile and run a light version of climber-x for Numerical Modeling of the Climate System, Department of Climate Science, Pusan National University. 

Note: to be used only as a course-aid, not associated with climber-x development.

# Getting started

**INSTALLING COMPILERS**

On mac

# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install GNU compilers (gfortran comes with gcc)
brew install gcc

# Install NetCDF (C + Fortran)
brew install netcdf netcdf-fortran

On Ubuntu (WSL if you have Windows)

# Update package lists
sudo apt update

# Install GNU compilers
sudo apt install -y gfortran build-essential

# Install NetCDF (C + Fortran)
sudo apt install -y libnetcdf-dev libnetcdff-dev

**Verify the installations**\
\
Fortran
```shell
gfortran --version
```
NetCDF
```shell
ls $CONDA_PREFIX/lib | grep netcdf
ls $CONDA_PREFIX/include | grep netcdf
```
A test program to check if NetCDF is properly installed:
```shell
cd howtoclimber
./test-nc.sh
```
You should get a PASSED message.\
\
Done!


