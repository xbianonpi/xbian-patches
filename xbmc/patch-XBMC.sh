#
#Copyright 2012 Koen Kanters
#This file is part of XBian - XBMC on the Raspberry Pi.
#
#XBian is free software: you can redistribute it and/or modify it under the 
#terms of the GNU General Public License as published by the Free Software 
#Foundation, either version 3 of the License, or (at your option) any later 
#version.
#
#XBian is distributed in the hope that it will be useful, but WITHOUT ANY 
#WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
#FOR A PARTICULAR PURPOSE. See the GNU General Public License for more 
#details.
#
#You should have received a copy of the GNU General Public License along 
#with XBian. If not, see <http://www.gnu.org/licenses/>
#
# Patches that are currently not working (need an upgrade) :
# XBMC13: eGalaxTouchScreen.patch, DualAudioOutput13.patch, RemoveGUISoundSettings.patch, WOL13.patch
# XBMC12: 

PATCHES=""
if [ "$1" = "12" ]; then
PATCHES="TPNno.patch
        eGalaxTouchScreen.patch
        NetworkCachingRedux12.patch
        EGLRes.patch
        DualAudioOutput12.patch
        XBianSysSum.patch
        RemoveGUISoundSettings.patch
        Wiimote.patch
        WOL12.patch
        Splash.patch
        XBianConfluence.patch
        Hotplug.patch
        PowerManager.patch"
elif [ "$1" = "13" ]; then
PATCHES="TPNno.patch
        NetworkCachingRedux13.patch
        EGLRes.patch
        XBianSysSum.patch
        Wiimote.patch
        Splash.patch
        XBianConfluence.patch
        PowerManager.patch"
fi

for patch in $PATCHES
do
    wget https://raw.github.com/xbianonpi/xbian-patches/master/xbmc/$patch -O $patch
    patch -p1 < $patch
    rm $patch
done

wget https://raw.github.com/xbianonpi/xbian/master/usr/local/share/xbmc/media/Splash.png
mv Splash.png media/

wget https://raw.github.com/xbianonpi/xbian-patches/master/xbmc/Lircmap.xml
mv Lircmap.xml system

wget https://raw.github.com/xbianonpi/xbian-patches/master/xbmc/remote.xml
mv remote.xml system/keymaps


