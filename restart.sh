#!/bin/bash

IP='8.8.8.8'
urlRouter=http://192.168.100.1
loginUsername='admin'
loginPassword='XXXXX'

regularExpresion='(?<=action=).*(?=method)'


fping -c1 -t3000 $IP 2>/dev/null 1>/dev/null
if [ "$?" = 0 ]
then
  echo "Host found"
  #senderbot -m "Router OK"
else
  echo "Host not found"
  echo "Rebooting router"


#Entramos
echo "[+] Come in"
loginUrl=$(curl -s $urlRouter)


loginUrl=$(curl -s $urlRouter)

loginSubmit=$(echo $loginUrl | grep -o -P $regularExpresion)
echo $loginSubmit


#Login
echo "[+] Authenticating"

curl -d "loginUsername="$loginUsername"&loginPassword="$loginPassword $urlRouter$loginSubmit

#Configuracion
echo "[+] Accessing the configuration"
configUrl=$(curl -s $urlRouter"/RgConfig.asp")
configSubmit=$(echo $configUrl | grep -o -P '(?<=action=).*(?=method)')
echo $configSubmit


#Reboot
echo "[+] Rebooting"
curl -d "ResetReq=1" $urlRouter$configSubmit


fi
