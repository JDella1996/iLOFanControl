#!/bin/bash

# Make sure IPMI over LAN is enabled on the iLO interface

# echo "# At every 2nd minute" >> mycron

# */2 * * * * /bin/bash /scripts/ILOFanControl.sh 

DATE=$(date +%Y-%m-%d-%H%M%S)

echo "" && echo "" && echo "" && echo "" && echo ""

echo "$DATE"

#
SENSORNAME="Ambient"

TEMPTHRESHOLD="25"

ILOIP="x.x.x.x"

ILOUSER="user"

ILOPASS="pass"

HIGHDUTYCYCLE=225

LOWDUTYCYCLE=80
#

T=$(ipmitool -I lanplus -H $ILOIP -U $ILOUSER -P $ILOPASS sdr type temperature | grep $SENSORNAME | cut -d"|" -f5 | cut -d" " -f2 | grep '[^A-Za-z]')
echo " -- current temperature for $SENSORNAME C --"

echo "$T"

#

if [[ $T > $TEMPTHRESHOLD ]]

then

echo "--> Setting fans to low PWM duty of $HIGHDUTYCYCLE"

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 0 max '$HIGHDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 1 max '$HIGHDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 2 max '$HIGHDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 3 max '$HIGHDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 4 max '$HIGHDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 5 max '$HIGHDUTYCYCLE' && exit'

else

echo "--> Setting fans to low PWM duty of $LOWDUTYCYCLE"

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 0 max '$LOWDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 1 max '$LOWDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 2 max '$LOWDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 3 max '$LOWDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 4 max '$LOWDUTYCYCLE' && exit'

sshpass -p "$ILOPASS" ssh -o StrictHostKeyChecking=no -o KexAlgorithms=diffie-hellman-group1-sha1 $ILOUSER@$ILOIP 'fan p 5 max '$LOWDUTYCYCLE' && exit'

fi



