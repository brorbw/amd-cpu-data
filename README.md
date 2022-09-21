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

## Run (from source):

``` sh
git clone https://github.com/brorbw/amd-cpu-data
cd amd-cpu-data
swift run
```

## Build and install:
``` sh
git clone https://github.com/brorbw/amd-cpu-data
cd amd-cpu-data
swift build -c release --arch x86_64
ln -s $(pwd)/.build/release/amd-cpu-data /usr/local/bin/amd-cpu-data
# or much more ugly 
export PATH=$PATH:$(pwd)/.build/release/
```

## Usage:

``` sh
$ amd-cpu-data
{"max-frequencie":4187.861328125,"power":34.066860198974609,"temperature":46.000007629394531,"mean-frequencie":4146.97216796875}
$ amd-cpu-data | jq
{
  "max-frequencie": 4187.861328125,
  "power": 34.06686019897461,
  "temperature": 46.00000762939453,
  "mean-frequencie": 4146.97216796875
}
```
