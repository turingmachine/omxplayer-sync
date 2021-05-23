OMXPlayer-Sync
==============

OMXPlayer-Sync facilitates synchronization of multiple OMXPlayer
instances over the network in a master/slave fashion.

https://vimeo.com/137133716


Usage
-----

```
$ ./omxplayer-sync -h
Usage: omxplayer-sync [options] filename

Options:
  -h, --help            show this help message and exit
  -m, --master          
  -l, --slave           
  -x DESTINATION, --destination=DESTINATION
  -u, --loop            
  -v, --verbose         
  -o ADEV, --adev=ADEV  
  -a ASPECT, --aspect=ASPECT  Aspect Mode - fill, letterbox, stretch
```

**Master**

```
omxplayer-sync -m movie1.mp4
```

**Slave**

```
omxplayer-sync -l movie1.mp4
```


Requirements
------------
A recent version of Python3 or Python2.
A recent version of the [python bindings for D-Bus](http://www.freedesktop.org/wiki/Software/DBusBindings).  
A recent build of omxplayer for [Jesse](http://steinerdatenbank.de/software/omxplayer_0.3.7~git20180910~7f3faf6~jessie_armhf.deb) or [Stretch](http://steinerdatenbank.de/software/omxplayer_20180910~7f3faf6~stretch_armhf.deb).


Installation on Raspbian
------------------------
Perform on both master and slave.
```
sudo su
apt-get remove omxplayer
rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
apt-get install libpcre3 fonts-freefont-ttf fbset libssh-4 python3-dbus
wget https://github.com/magdesign/PocketVJ-CP-v3/raw/master/sync/omxplayer_0.3.7-git20170130-62fb580_armhf.deb
dpkg -i omxplayer_0.3.7~git20170130~62fb580_armhf.deb
wget -O /usr/bin/omxplayer-sync https://github.com/turingmachine/omxplayer-sync/raw/master/omxplayer-sync
chmod 0755 /usr/bin/omxplayer-sync
wget https://github.com/turingmachine/omxplayer-sync/raw/master/synctest.mp4
```

Start on Master (-u loop, -v verbose)
```
omxplayer-sync -muv synctest.mp4
```
Start on Slave (-u loop, -v verbose)
```
omxplayer-sync -luv synctest.mp4
```

Usage notes
-----------
 * The filename on the master and the slave must be exactly the same.
 * More testfiles with timecodes can be found on [pocketvj.com][http://pocketvj.com/video/small_testfile.mp4].
 * Make sure there are no other files than movie files (e.g. no pictures, no textfiles) in the folder where the movie is, otherwise you may get sync errors.
 * A RJ45 cable must be connected before you start the master, otherwise it will not send sync data to slave.
 * Do not send audio output flags with omxplayer-sync on the slave e.g. /usr/bin/omxplayer-sync -lu -o both /media/internal/video/* 
 * Use videos which are min. 60 seconds or longer
 * If you dont know how to create a h264 mp4 file, visit http://www.online-convert.com.


Example usage
--------------
see this link: https://www.youtube.com/watch?v=Xp6GKFaw0io&feature=youtu.be
by DSPeelJ
