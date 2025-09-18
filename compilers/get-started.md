## INSTALLING COMPILERS

# install mamba (a faster solver alternative to conda)
# you can use conda if you already have it, replace 'mamba' with 'conda' in all the commands
# if you don't have wget, you can install it using:
# sudo apt install wget         (linux)
# brew install wget             (mac)

```shell
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh -O mambaforge.sh
bash mambaforge.sh -b -p $HOME/mambaforge
```

# activate mamba

```shell
export PATH="$HOME/mambaforge/bin:$PATH"
```

# check if it's in place

```shell
mamba --version
```

---

# Create a new environment for our model jobs

```shell
mamba create -n climber-env gfortran netcdf-c netcdf-fortran -c conda-forge
```

# activate the environment

```shell
mamba activate climber-env
```

# verify the installations

# fortran
```shell
gfortran --version
```
# netCDF
```shell
ls $CONDA_PREFIX/lib | grep netcdf
```
headers
```shell
ls $CONDA_PREFIX/include | grep netcdf
```
