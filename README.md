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

A recent version (>= 9c8bc1a) of [omxplayer](http://omxplayer.sconde.net).


Usage notes
-----------
To achive faster initial sync times, you need to encode your videos with
a smaller GOP size, e.g. 25 frames.

Known issues
-----------
Currently only syncing of one file without loop mode enabled works reliably. 
This is due to a bug in omxplayer that causes it not start on frequent 
starting and stopping of player instances. See omxplayer [Issue #184](https://github.com/popcornmix/omxplayer/issues/181)
