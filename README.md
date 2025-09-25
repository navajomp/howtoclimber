# howtoclimber

A set of instructions to compile and run a light version of climber-x for Numerical Modeling of the Climate System, Department of Climate Science, Pusan National University. 

Note: to be used only as a course-aid, not associated with climber-x development.

## Getting started

Clone the `howtoclimber` gihub for instructions and compilation files.
```shell
https://github.com/navajomp/howtoclimber.git
```

Make not of the location of the `howtoclimber` directory.

**INSTALLING COMPILERS**

**1. On mac**

Install Homebrew if not already installed
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Install GNU compilers (gfortran comes with gcc)
```shell
brew install gcc
# export path (important)
export PATH="/opt/homebrew/opt/gcc/bin:$PATH"
```
Install NetCDF (C + Fortran)
```shell
brew install netcdf netcdf-fortran
```
**2. On Ubuntu (WSL if you have Windows)**
```shell
# Update package lists
sudo apt update

# Install GNU compilers
sudo apt install -y gfortran build-essential

# Install NetCDF (C + Fortran)
sudo apt install -y libnetcdf-dev libnetcdff-dev
```
**Verify the installations**
```shell
# Fortran
gfortran --version

# NetCDF

pkg-config --modversion netcdf
pkg-config --cflags netcdf
pkg-config --libs netcdf
pkg-config --modversion netcdf-fortran
pkg-config --cflags netcdf-fortran
pkg-config --libs netcdf-fortran

```

A test program to check if NetCDF is properly installed:
```shell
cd howtoclimber
./test-nc.sh
```
You should get a PASSED message.

---

## Model files

Now we obtain the model source code and input files.\
\
Create a directory for the coursework.
```shell
mkdir nmcs
cd nmcs
```
Obtain the source code.
```shell
git clone --depth 1 --branch v1.4.0 https://github.com/cxesmc/climber-x.git climber-x-lite
```
Go into the directory.
```shell
cd climber-x-lite
```
Obtain the input files.
```shell
git clone https://gitlab.pik-potsdam.de/cxesmc/climber-x-input.git input
```
This might take a while!

---

## Installing dependencies

**Install `utils`**\
\
Compiling the libraries needed for `utils` first.\
\
Install `fesm-utils` and go into the directory.
```shell
cd src/utils

# obtain the files
git clone https://github.com/fesmc/fesm-utils.git

cd fesm-utils
```
\
Modify the config file for our needs. The file is already available here, copy it to the model directory.
```shell
cp howtoclimber/install_gfortran.sh install_gfortran.sh
```
Adjust your `howtoclimber` path as required. Also, the line 12 of this installation file reads `COMPILER_OPTS="CC=gcc-15 CXX=g++-15 FC=gfortran-15 F77=gfortran-15"`. You may probably have to modify the version number of your compilers here before proceeding.
\
Now, run the python script.
```shell
./install_gfortran.sh gfortran
```
If you see 4 different paths listed in the end, the libraries are compiled!\
\
On to compiling `utils`
```shell
# go to the utils directory
cd utils

# copy the makefile
cp howtoclimber/config1 config/myconfig

# make and compile
python3 config.py config/myconfig
make clean
make fesmutils-static openmp=1
```
Adjust your `howtoclimber` path as required.\
\
If everything goes well, you will get `include-omp/libfesmutils.a is ready.`\
\
**Install `coordinates`**\
\
Installing the `coordinates` package.
```shell
git clone https://github.com/fesmc/coordinates.git
cd coordinates

# Copy the configuration file.
cp howtoclimber/config2 config/myconfig

# make and compile
python3 config.py config/myconfig
make clean
make coord-static openmp=1
```
Adjust your `howtoclimber` path as required.\
\
If you get `libcoordinates/include/libcoordinates.a is ready.`, the compilation is successful!

---

## Compile `climber-x-lite`

**MODEL COMPILATION**

Get back to the model directory, and copy the configuration file.
```shell
# Go back to the model directory
cd ../../..

# Copy the makefile
cp howtoclimber/config3 config/myconfig
```
Final step!
```shell
# make and compile
python3 config.py config/myconfig 
make cleanall
make install climber-clim
```

Successful compilations will end with the message `climber.x is ready.`!

