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
```

**master**

```
omxplayer-sync -muv movie1.mp4 movie2.mp4 /movies/*
```

**slave**

```
omxplayer-sync -luv movie1.mp4 movie2.mp4 /movies/*
```


Requirements
------------
A recent version of Python3 or Python2.
A recent version of the [python bindings for D-Bus](http://www.freedesktop.org/wiki/Software/DBusBindings).  
A recent build of omxplayer from [Sergio Conde](http://omxplayer.sconde.net).


Installation on Raspbian
------------------------
```
su -
apt-get remove omxplayer
rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
apt-get install libpcre3 fonts-freefont-ttf fbset libssh-4 python3-dbus
wget http://omxplayer.sconde.net/builds/omxplayer_0.3.7~git20160713~66f9076_armhf.deb
dpkg -i omxplayer_0.3.7~git20160713~66f9076_armhf.deb
wget -O /usr/bin/omxplayer-sync https://github.com/turingmachine/omxplayer-sync/raw/master/omxplayer-sync
chmod 0755 /usr/bin/omxplayer-sync
wget https://github.com/turingmachine/omxplayer-sync/raw/master/synctest.mp4

# start on master
omxplayer-sync -muv synctest.mp4

# start on slave
omxplayer-sync -luv synctest.mp4
```

Usage notes
-----------
 * The filename on the master and the slave must be exactly the same.
 * More testfiles with timecodes can be found on [pocketvj.com][http://pocketvj.com/video/small_testfile.mp4].
 * Make sure there are no other files than movie files (e.g. no pictures, no textfiles) in the folder where the movie is, otherwise you may get sync errors.
 * A RJ45 cable must be connected before you start the master, otherwise it will not send sync data to slave.
 * If you dont know how to create a h264 mp4 file, visit http://www.online-convert.com.
