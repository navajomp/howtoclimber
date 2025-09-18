# DEPENDENCIES

**Install `utils`**\
\
Compiling the libraries needed for `utils` first.\
\
Install `fesm-utils` and go into the directory.
```shell
cd src/utils
git clone https://github.com/fesmc/fesm-utils.git
cd fesm-utils
```
\
Modify the config file for our needs. The file is already available here, copy it to the model directory.
```shell
cp howtoclimber/install_gfortran.sh install_gfortran.sh
```
Adjust your `howtoclimber` path as required.\
\
Now, run the python script.
```shell
./install_gfortran.sh gfortran
```
If you see 4 different paths listed in the end, the libraries are compiled!\
\
On to compiling `utils`
```
cd utils
cp howtoclimber/config1.sh config/config1.sh
python3 config.py config/config1.sh
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
cp howtoclimber/config2.sh config/config2.sh

python3 config.py config/config2.sh
make clean
make coord-static openmp=1
```
Adjust your `howtoclimber` path as required.\
\
If you get `libcoordinates/include/libcoordinates.a is ready.`, the compilation is successful!
