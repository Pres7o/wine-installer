#!/bin/bash

# Wine Installer, an esay way to install wine on any distro!
# Copyright (C) 2025  Pres7o

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Install instructions gotten from https://gitlab.winehq.org/wine/wine/-/wikis/Download


echo "Wine Installer v1.0.0"
echo "Copyright (C) 2025  Pres7o"
echo "This program comes with ABSOLUTELY NO WARRANTY; for details type 'show w'."
echo "This is free software, and you are welcome to redistribute it"
echo "under certain conditions; type 'show c' for details."

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

source /etc/os-release
release=$VERSION_CODENAME
id=$ID
echo "Detected release: $release"
echo


echo 'What do you want to do?'
echo '1. Install wine'

read -p "> " choice

if [ "$choice" = "1" ]; then
    echo "Installing wine for OS release $release"

    sudo mkdir -pm755 /etc/apt/keyrings
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -

    if [ "$id" = "debian" ]
        sudo dpkg --add-architecture i386 # Only for debian & Ubuntu >= 25.04

    fi


else
    echo "Not a valid choice"
fi
