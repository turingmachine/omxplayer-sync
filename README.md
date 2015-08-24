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
A recent version of [pyexpect](http://www.noah.org/wiki/pexpect).  
A recent version of the [python bindings for D-Bus](http://www.freedesktop.org/wiki/Software/DBusBindings).  
A custom [build](https://github.com/turingmachine/omxplayer/commits/omxplayer-sync) of omxplayer with a higher stats output resolution.  
You can find a compiled version at [yokto.net/0/omxplayer](http://yokto.net/0/omxplayer/omxplayer-3176db4.tar.bz2).


Installation on Raspbian
------------------------
```
su -
apt-get remove omxplayer
rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
wget -O- http://yokto.net/0/omxplayer/omxplayer-3176db4.tar.bz2 | tar -C / -xjvf -
ln -sf /lib/arm-linux-gnueabihf/libpcre.so.3 /lib/arm-linux-gnueabihf/libpcre.so.1
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
The filename on master and slave must be exactly the same.
No other files than movie files in the folder where the movie is, otherwise you may get a sync error (e.g. no pictures, no textfiles). RJ45 cable must be connected before you start the master, otherwise it will not send sync data to slave.
If you dont know how to create a h264 mp4 file, visit  http://www.online-convert.com

