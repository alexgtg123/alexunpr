#!/bin/bash

if [ -f /etc/profile.d/welcome.sh ]; then
    rm -f /etc/profile.d/welcome.sh
    echo -e "🗑️ \e[1;32mWelcome banner berhasil dihapus dari sistem VPS!\e[0m"
else
    echo -e "⚠️ \e[1;33mWelcome banner memang tidak terpasang di VPS ini.\e[0m"
fi
