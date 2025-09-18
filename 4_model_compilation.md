# MODEL COMPILATION

Get back to the model directory, and copy the configuration file.
```shell
cd ../../..
cp howtoclimber/config3.sh config/config3.sh
python3 config.py config/config3.sh
```
Final step! 
```shell
make cleanall
make install climber-clim
```

Successfule compilations will end with the message `climber.x is ready.`!\
