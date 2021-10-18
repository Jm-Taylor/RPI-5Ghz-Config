#!/bin/bash

set +x

pushd /usr/local/vmxpi-frc/networking > /dev/null


#Prepends zeros to team numbers if less than 4 digits long
RAWNUM=$((10#$2))

ZERONUM="000${RAWNUM}"
NUMSIZE=${#ZERONUM}
FOURNUM=${ZERONUM:$NUMSIZE-4:NUMSIZE}

#If there are no arguments given, restore previous SSID and IP settings if existed. Otherwise use default (Serial Number)
#SETSTATE of 0 = Serial Number IP Address, 1 = Previously set Address, 2 = New Address, 3 = Not enough Args, 4 = New Address and Password 5 = New Address Password Country code and Channel
if [ $# -ne 5 ] && [ $# -ne 3 ] && [ $# -ne 2 ]
then
	if [ -f prevSsidInfo.txt ] #Grabs previous name/number
	then
		PREVNAME="$(grep 'DEVICE_NAME=' prevSsidInfo.txt)"
		DEVICE_NAME=${PREVNAME:12:${#PREVNAME}}

		PREVNUMBER="$(grep 'TEAMNUMBER=' prevSsidInfo.txt)"
		TEAMNUMBER=${PREVNUMBER:11:15}
		RAWNUM=$((10#$TEAMNUMBER))
		
		PREVPASS="$(grep 'SSID_PASSPHRASE=' prevSsidInfo.txt)"
		PASSPHRASE=${PREVPASS#'SSID_PASSPHRASE='}
      
      PREVCODE="$(grep 'COUNTRYCODE=' prevSsidInfo.txt)"
		COUNTRY=${PREVCODE#'COUNTRYCODE='}
      
      PREVCHANNEL="$(grep 'CHANNEL=' prevSsidInfo.txt)"
		UCHANNEL=${PREVCHANNEL#'CHANNEL='}
		
		if [ $# -eq 0 ]; then
			SETSTATE=1
		else
			SETSTATE=3
		fi
	else
		TEAMNUMBER=`./getDecimalSerialNumber.sh`
		DEVICE_NAME=VMXPI
		PASSPHRASE=""

		if [ $# -eq 0 ]; then
			SETSTATE=0
		else
			SETSTATE=3
		fi

	fi
else
   if [ $# -eq 5 ]
   then
      DEVICE_NAME=$1
		TEAMNUMBER=$FOURNUM
		PASSPHRASE=$3
      COUNTRY=$4
      UCHANNEL=$5
      
      SETSTATE=5
	elif [ $# -eq 3 ]
	then
		DEVICE_NAME=$1
		TEAMNUMBER=$FOURNUM
		PASSPHRASE=$3
      COUNTRY=""
      UCHANNEL=""
		
		SETSTATE=4
	elif [ $# -eq 2 ]
	then
		DEVICE_NAME=$1
		TEAMNUMBER=$FOURNUM
		PASSPHRASE=""
      COUNTRY=""
      UCHANNEL=""

		SETSTATE=2
	elif [ $# -eq 1 ] || [ $# -gt 4 ]; then
		TEAMNUMBER=`./getDecimalSerialNumber.sh`
		DEVICE_NAME=VMXPI
		PASSPHRASE=""
      COUNTRY=""
      UCHANNEL=""

		SETSTATE=3
	fi
fi

#Confirms that the password is within length requirements, if a password exists. Exits script if not within requirements
if ( [ ${#PASSPHRASE} -lt 8 ] || [ ${#PASSPHRASE} -gt 63 ] ) && [ ${#PASSPHRASE} -ne 0 ] ; then
	echo -e "*****************\n\nProvided passphrase is either too short or too long\nThe passphrase should be a minimum of 8 characters and less than 64 characters\nProvided passphrase is ${#PASSPHRASE} characters long\n\n"
	exit
fi


echo -e "\nDevice name = $DEVICE_NAME\nTeam Number = $RAWNUM\n"
if [ "$PASSPHRASE" != "" ]; then
	echo -e "SSID Password = $PASSPHRASE\n"
fi
if [ "$COUNTRY" != "" ]; then
	echo -e "Country Code = $COUNTRY\n"
fi
if [ "$UCHANNEL" != "" ]; then
	echo -e "Channel = $UCHANNEL\n"
fi


sudo rm -f prevSsidInfo.txt > /dev/null
echo -e "If modifying this file, do not add any spaces after the name or number, the number must be 4 digits long,\n	and do not modify anything left of the =\nDEVICE_NAME=$DEVICE_NAME\nTEAMNUMBER=$TEAMNUMBER\nPASSPHRASE=$PASSPHRASE\nCOUNTRYCODE=$COUNTRY\nCHANNEL=$UCHANNEL\n" | sudo tee -a prevSsidInfo.txt > /dev/null

#Finding the octets of the IP from the team number, allows for removal of leading zeros
OCT2=${TEAMNUMBER:0:2}
OCT3=${TEAMNUMBER:2:4}

#Actual setting of AP details

sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

sudo rm /etc/dnsmasq.conf > /dev/null

sudo echo -e "interface=wlan0" | sudo tee -a /etc/dnsmasq.conf > /dev/null
sudo echo -e "  dhcp-range=10.${OCT2#0}.${OCT3#0}.3,10.${OCT2#0}.${OCT3#0}.20,255.255.255.0,24h" | sudo tee -a /etc/dnsmasq.conf > /dev/null

sudo echo -e "interface=eth0" | sudo tee -a /etc/dnsmasq.conf > /dev/null
sudo echo -e "  dhcp-range=172.22.11.3,172.22.11.20,255.255.255.0,24h" | sudo tee -a /etc/dnsmasq.conf > /dev/null

#Setup Access Point
sudo cp hostapd5G.conf /etc/hostapd/hostapd.conf > /dev/null
sudo echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' | sudo tee /etc/default/hostapd > /dev/null

#Remove Password related hostapd settings if no password present
if [ "$PASSPHRASE" == "" ]; then
	sudo sed -i '6,14d' /etc/hostapd/hostapd.conf > /dev/null
fi


# Copy in dhcp settings
sudo rm /etc/dhcpcd.conf > /dev/null
sudo cp dhcpcd.conf_AP /etc/dhcpcd.conf > /dev/null


./interfaceSetUp.sh $DEVICE_NAME $TEAMNUMBER $PASSPHRASE $COUNTRY $UCHANNEL > /dev/null

sudo systemctl start dnsmasq
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

sudo ip addr flush dev wlan0
sudo systemctl daemon-reload
sudo systemctl restart dhcpcd

sudo systemctl restart dnsmasq
sudo systemctl restart hostapd

popd > /dev/null

	echo -e "\n****************\nThe SSID of this device is set to $DEVICE_NAME-$RAWNUM \nThe IP address has been set to 10.${OCT2#0}.${OCT3#0}.2\n"
if [ "$PASSPHRASE" != "" ]; then
	echo -e "The SSID Password has been set to $PASSPHRASE\n"
fi

if [ $SETSTATE -eq 0 ]; then
	echo -e "\nThis command was run for the first time without any arguments, so the device name has been set to VMXPI and the team number to the last 4 digits of this Pi's serial number"
	echo -e "\nTo change the SSID and IP, simply run again with the device name and team number as given arguments, such as"
	echo -e "\n	setupWifiAP.sh Johnny 5432\n"
	echo -e "This would set the SSID to Johnny-5432 and the IP address to 10.54.32.2\n"
	echo -e "\nA third argument can be used to set a passphrase on the WiFi, as is required in WorldSkills"
elif [ $SETSTATE -eq 1 ]; then
	echo -e "\nThis command was run without arguments and was run before, so the SSID and IP (and passphrase if previously set) have been restored to the previous settings"
	echo -e "\nTo change the SSID and IP, simply run again with the device name and team number as given arguments, such as"	echo -e "\n	setupWifiAP.sh Johnny 5432\n"
	echo -e "This would set the SSID to Johnny-5432 and the IP address to 10.54.32.2\n"
	echo -e "A third argument can be used to set a passphrase on the WiFi, as is required in Worldskills"
elif [ $SETSTATE -eq 2 ]; then
	echo -e "\nThe settings given now will be remembered for the next run of this program, making it unneccessary to give arguments again"
	echo -e "If you need a passphrase set on the WiFi (as required in WorldSkills), run this command again with the passphrase as the third argument"
elif [ $SETSTATE -eq 3 ]; then
	echo -e "\nYou have either entered too many or too little arguments."
	echo -e "\nThe IP Address has been set to the default listed above."
	echo -e "\nTo change the SSID and IP, simply run again with the device name and team number as given arguments, such as"
	echo -e "\n	setupWifiAP.sh Johnny 5432\n"	
	echo -e "This would set the SSID to Johnny-5432 and the IP address to 10.54.32.2"	
	echo -e "A third argument can be used to set a passphrase on the WiFi, as is required in Worldskills"
elif [ $SETSTATE -eq 4 ]; then
	echo -e "\nThe settings given now will be remembered for the next run of this program, making it unneccessary to give arguments again"
	echo -e "\nTo remove the passphrase you must run this command again without a third argument"
elif [ $SETSTATE -eq 5 ]; then
   echo -e "\nThe settings given now will be remembered for the next run of this program, making it unneccessary to give arguments again" 
fi	