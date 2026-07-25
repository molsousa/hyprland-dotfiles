#!/bin/bash

nmcli connection add \
connection.id eduroam \
connection.type 802-11-wireless \
802-11-wireless.ssid eduroam \
802-11-wireless-security.key-mgmt wpa-eap \
802-1x.eap peap \
802-1x.phase2-auth mschapv2 \
802-1x.identity 'usuario@dominio' \
802-1x.password 'senha'
