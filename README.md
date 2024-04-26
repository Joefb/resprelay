<div align="center">

# RespRelay
###### Quickly set up Responder.conf for SMB relay attacks or swap back to default
</div>

## - TOC
* [The Issue](#The-Issue)
* [The Fix](#The-Fix)
* [Info](#Info)
* [Usage](#Usage)

## The Issue
After using Responder on quite a few pentests you are tired of haveing to manually edit the Responder.conf for SMB relay attacks. You just want a quick way to swap the config file
back and forth between the default config and SMB relay config.

## The Fix
Create a handy bash file that swaps the config file back and forth for you! 

## Info
In order to set up Responder for SMB relay attacks you must edit the Responder.conf and set:
```bash
SMB = Off
HTTP = Off
```
This script will auto configure the Responder.conf file for you and swap back to the default config just as easily.

## Usage
```bash
resprelay.sh -OPTION

Options:
   -h     Display this help
   -r     Set up Responder.conf for SMB relay attacks
   -d     Set Responder.conf back to default
```

