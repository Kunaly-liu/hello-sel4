# seL4 Hello World

To clone, build and run:
```
repo init https://github.com/Kunaly-liu/hello-sel4.git
repo sync
mkdir build
cd build
../init-build.sh -DPLATFORM=x86_64 -DSIMULATION=TRUE
ninja
./simulate
```
