# amd-cpu-data

A very small application to talk to the "AMDRyzenCPUPowerManagement" kext for getting CPU wattage, temperature and frequency. Is more or less a copy of some of the code from [SMCAMDProcessor](https://github.com/trulyspinach/SMCAMDProcessor) 


The data will be outputtet as JSON

``` json
{
  "power": 42.80278396606445,
  "temperature": 50.66667175292969,
  "max-frequencie": 4199.59033203125,
  "mean-frequencie": 4188.42919921875
}
```

Usage:

``` sh
swift run # in the directory
# or
swift build -c release --arch x86_64 # in the directory

# "install" with something like
ln -s $(pwd)/.build/release/amd-cpu-data /usr/local/bin/amd-cpu-data
or 
export PATH=$PATH:$(pwd)/.build/release/
```
