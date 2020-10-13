# How to setup enviroment and run code

*some disclamier*

## Overview
balbalbalbla
blabla

## Index
* SEGGER embedded studio
  * Download
  * Install
  * Configuration
* Toolchain
* SDKs
  * nRF
  * dwm1001
* Connecting PC to UWB-units
 * PUTTY
* Running Code


## SEGGER embedded studio
IDE used for compiling and running code. Comes with integrated debugger J-Link, which is also used to flash devices.
*Free-of-charge for non-commerial use*

#### Download
SEGGER is available for download at: https://www.segger.com/downloads/embedded-studio
Select: Embedded Studio for ARM 
At current writing newest version is V5.10b.

#### Install
For install run downloaded file and follow steps.
During install make sure to select: *Install J_Link Device Drivers*



#### Configuration

**Installing Packages**
Tools->package manager
* CMSIS 5 CMSIS-CORE Support Package (version 5.02)
* CMSIS-CORE Support Package (version 4.05)
* Nordic Semiconductor nRF CPU Support Package (version 1.06)

**Installing CMSIS Configuration Wizard**

**Setting up compiler**
Project->options


hvordan dette gøres
setting toolchain and other shit like CMSIS



## Toolchain
The GNU Arm Embedded Toolchain is used for compiling code. 
It is important to note it is not the newest version, this is to ensure compatibility, but a newer version can be downloaded and used
at own disgression.
Download: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads/5-2016-q3-update
Follow instuctions from site.



## SDKs
nRF5 SDK


## Connecting PC and UWB-units



## Running Code

