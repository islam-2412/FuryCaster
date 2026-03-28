#!/bin/bash
#
# Command: wget -q "--no-check-certificate" https://raw.githubusercontent.com/islam-2412/FuryCaster/refs/heads/main/fury/installer.sh -O - | /bin/sh #
echo "------------------------------------------------------------------------"
echo "                     Installing FuryCaster                           "
echo "------------------------------------------------------------------------"
echo "removing the previous version of FuryCaster... "
sleep 2;
if [ -d /usr/lib/enigma2/python/Plugins/Extensions/FuryCaster ] ; then
    opkg remove enigma2-plugin-extensions-furycaster
    rm -rf /usr/lib/enigma2/python/Plugins/Extensions/FuryCaster > /dev/null 2>&1
    echo 'Package removed.'
else
    echo "There are no previous versions of FuryCaster"
fi
echo ""
# Install curl if not already installed
echo "Install curl if not already installed "
opkg install curl
sleep 2

#
cd /tmp
echo "Downloading FuryCaster package..."
curl -s -k -L "https://raw.githubusercontent.com/islam-2412/FuryCaster/main/fury/furycaster.ipk" -o /tmp/furycaster.ipk
if [ $? -ne 0 ]; then
    echo "Error downloading FuryCaster"
    exit 1
fi
sleep 1

echo "Installing ...."
opkg install --force-overwrite /tmp/furycaster.ipk
if [ $? -ne 0 ]; then
    echo "Error installing FuryCaster"
    exit 1
fi

echo ""
echo ""
echo ""
sleep 1

echo "Clean up the temporary file"
if [ -f /tmp/furycaster.ipk ]; then
    rm -f /tmp/furycaster.ipk
fi

echo "Done"
#
echo "------------------------------------------------------------------------"
echo "        This work is exclusive to Islam Salama (( Skin Fury-FHD ))      "
echo "------------------------------------------------------------------------"
echo "                              Abou Yassin                               "
echo "                   FuryCaster Installed Successfully                    "
echo "------------------------------------------------------------------------"
echo "   "
exit 0
