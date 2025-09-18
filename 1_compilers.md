**INSTALLING COMPILERS**

Install mamba (a faster solver alternative to conda).\
You can use conda if you already have it, replace `mamba` with `conda` in all the commands.

If you don't have wget, you can install it using:\
\
`sudo apt install wget`         (linux)\
`brew install wget`             (mac)\
\
Now get mamba
```shell
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh -O mambaforge.sh
bash mambaforge.sh -b -p $HOME/mambaforge
```

Activate mamba
```shell
export PATH="$HOME/mambaforge/bin:$PATH"
```
Check if it's in place
```shell
mamba --version
```
---
Create a new environment for our model jobs
```shell
platform="$(uname)-$(uname -m)"
# copy and past the whole block of code below
if [[ "$platform" == "Darwin-arm64" ]]; then
    CONDA_SUBDIR=osx-arm64 mamba create -n climberx-env gfortran libnetcdf=4.9 netcdf-fortran=4.6 -c conda-forge
else
    mamba create -n climberx-env gfortran netcdf-c=4.9 netcdf-fortran=4.6 -c conda-forge
fi

```
Activate the environment
```shell
mamba activate climberx-env
```
Alway make sure you activate the environment before you use the `climber-x-lite` model from now on.\ 
**Verify the installations**\
\
Fortran
```shell
gfortran --version
```
NetCDF
```shell
ls $CONDA_PREFIX/lib | grep netcdf
```
Headers
```shell
ls $CONDA_PREFIX/include | grep netcdf
```
A test program to check if NetCDF is properly installed:
```shell
cd howtoclimber/compilers
./test-nc.sh
```
You should get a PASSED message.\
\
Done!
