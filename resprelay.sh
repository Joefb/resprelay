#!/bin/bash

## Help Menu
help_menu () {
	echo ""
	cat << EOM
	** resprelay Help **

	Quickly set up Responder.conf for SMB relay attacks or back to default.
    
	Must be ran as sudo!
	
	Usage: resprelay -r

	Options:
	-h     Display this help
	-r     Set Responder.conf up for SMB relay attacks
	-d     Set Responder.conf back to default 
EOM
}

## Create var for conf
resp_conf="/etc/responder/Responder.conf"

## Set conf for SMB relay
set_smb_relay () {
	sed -i 's/^SMB = On$/SMB = Off/' ${resp_conf}
	sed -i 's/^HTTP = On$/HTTP = Off/' ${resp_conf}
	echo "Responder.conf set up for SMB relay attacks."
	echo "Happy hunting!"
}

## Set conf to default 
set_default () {
	sed -i 's/^SMB = Off$/SMB = On/' ${resp_conf}
	sed -i 's/^HTTP = Off$/HTTP = On/' ${resp_conf}
	echo "Responder.conf set back to default."
}

## Check for a Responder.conf backup
## TODO

## Check option
case "${1}" in
	"")         echo "** Invalid argument **"; help_menu; exit 1 ;;
	-h)         help_menu ;;
	-r)         echo "Setting up Responder.conf for SMB relay attacks!"; set_smb_relay ;;
	-d)         echo "Setting Responder.conf back to default."; set_default ;;
	*)          echo "** Invalid argument **"; help_menu; exit 1 ;;
esac

