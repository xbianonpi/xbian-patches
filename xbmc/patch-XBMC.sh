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
PATCHES=""
if [ "$1" = "12" ]; then
    PATCHES="TPNno.patch      
    EGLRes.patch
    XBianSysSum.patch
    NetworkCachingRedux.patch
    RemoveGUISoundSettings.patch
    WOL12.patch
    Splash.patch
    omxcodecs.patch
    DualAudioOutput.patch
    remote.xml.patch
    XBianConfluence.patch
    Lircmap.xml.patch
    HandleResolutionChanges.patch
    Wiimote.patch
    ReduceMenuFontSize.patch
    eGalaxTouchScreen.patch
    SeekBeforeZero.patch
    ToggleDigitalAnalogue.patch
    PowerManager.patch"
elif [ "$1" = "13" ]; then
    PATCHES="TPNno.patch
    EGLRes.patch
    XBianSysSum.patch
    NetworkCachingRedux.patch
    RemoveGUISoundSettings.patch
    Wiimote.patch
    WOL13.patch
    Splash.patch
    DualAudioOutput.patch
    remote.xml.patch
    XBianConfluence.patch
    eGalaxTouchScreen.patch
    Lircmap.xml.patch
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
