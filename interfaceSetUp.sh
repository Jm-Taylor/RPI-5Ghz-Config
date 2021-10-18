#!/bin/bash

set +x

USETEXT="
**********
Please provide a Robot Name and Team Number 
The Robot Name should be unique to this robot 
The Team Number can be used on multiple robots

A passphrase can also be optionally added for connecting to this access point

This script should be run using:
$0 robotName teamNumber (optional)passphrase

The SSID for this robot will be set to RobotName-TeamNumber
such as: Johnny-5432

The Wireless IP Address of this robot will be set to 10.TE.AM.2
such as: 10.54.32.2

The Ethernet IP Address will remain at 172.22.11.2

**********
"

#Arg 1 should be the Robot Name, Arg 2 should be the Team Number, Arg 3 should be the passphrase, ARG 4 should be the country code, and Arg 5 should be the channel
TEAMNUM=$2

function changeSSID {
	pushd /etc/hostapd

	OLDSSID="$(grep -m 1 'ssid=' hostapd.conf)"
	NEWSSID="ssid=$1-$((10#$TEAMNUM))"
	#Leading zeros are removed from the ssid

	sudo sed -i "s/$OLDSSID/$NEWSSID/g" hostapd.conf
	
	popd
}

function changePASS {
	pushd /etc/hostapd

	OLDPASS="$(grep 'wpa_passphrase' hostapd.conf)"
	NEWPASS="wpa_passphrase=$1"

	sudo sed -i "s/$OLDPASS/$NEWPASS/g" hostapd.conf

	popd
}

function changeCHANNEL {
   pushd /etc/hostapd

	OLDCHAN="$(grep 'channel' hostapd.conf)"
	NEWCHAN="channel=$1"

	sudo sed -i "s/$OLDCHAN/$NEWCHAN/g" hostapd.conf

	popd
}

function changeINDEX {
   pushd /etc/hostapd

	OLDIDX="$(grep 'vht_oper_centr_freq_seg0_idx' hostapd.conf)"
	NEWIDX="vht_oper_centr_freq_seg0_idx=$1"

	sudo sed -i "s/$OLDIDX/$NEWIDX/g" hostapd.conf

	popd
}

function changeCODE {
   pushd /etc/hostapd

	OLDCODE="$(grep 'country_code' hostapd.conf)"
	NEWCODE="country_code=$1"

	sudo sed -i "s/$OLDCODE/$NEWCODE/g" hostapd.conf

	popd
}
 
function changeWlanIP {
	pushd /etc

	OLDIP="$(grep 'static ip_address=10.' dhcpcd.conf)"

	OCT2="${TEAMNUM:0:2}"
	OCT3="${TEAMNUM:2:4}"

	#The seperate OCTs and the command used when setting the IP below remove any leading Zeros
	NEWIP="    static ip_address=10.${OCT2#0}.${OCT3#0}.2/24"
	
	sudo sed -i "s|$OLDIP|$NEWIP|g" dhcpcd.conf

	popd	
}


	
if [ $# -ge 2 ]
then
	
	ROBOTNAME=$1
	TEAMNUMBER=$2
	PASSPHRASE=$3 
   COUNTRY=$4
   UCHANNEL=$5

	changeSSID $ROBOTNAME $TEAMNUMBER

	if [ $# -eq 3 ] || [ $# -eq 5 ]
	then
		#Confirms that the password is within length requirements. Exits script if not within requirements
		if ( [ ${#PASSPHRASE} -lt 8 ] || [ ${#PASSPHRASE} -gt 63 ] ) && [ ${#PASSPHRASE} -ne 0 ] ; then
			echo -e "*****************\n\nProvided passphrase is either too short or too long\nThe passphrase should be a minimum of 8 characters and less than 64 characters\nProvided passphrase is ${#PASSPHRASE} characters long\n\n"
			exit
		else
		changePASS $PASSPHRASE
		fi
	fi
   
   if [ $# -eq 5 ]
   then
      while read code channel index junk; do
         if [[ $code == $COUNTRY ]]; then
            if [[ $channel == $UCHANNEL ]]; then
               echo -e "Valid Channel: $UCHANNEL with and index of $index"
               changeCHANNEL $UCHANNEL
               changeCODE $COUNTRY
               changeINDEX $index 
               break;
            fi
         fi
      done <5G-WIFI-LIST.txt
   fi

	changeWlanIP $TEAMNUMBER

else
	echo "$USETEXT"

fi