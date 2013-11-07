OMXPlayer-Sync
==============

OMXPlayer-Sync facilitates synchronization of multiple OMXPlayer 
instances over the network in a master/slave fashion.

https://vimeo.com/65737409

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
Veersion [c0dd950](omxplayer_0.3.2~git20131105~c0dd950_armhf.deb) of omxplayer.


Usage notes
-----------
To achive faster initial sync times, one should use a build of omxplayer with 
forward and backward seek times set to 5 seconds instead of 30 seconds.
