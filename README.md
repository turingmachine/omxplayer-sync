OMXPlayer-Sync
==============

OMXPlayer-Sync facilitates synchronization of multiple OMXPlayer 
instances over the network in a master/slave fashion.

This is just a basic working version.

TODO:
 * send current movie id over the wire and don't sync if id's don't match
 * don't sync slave if master position is < 10% and slave position > 90% of movie length
 * add support for multicast groups
 * refactor to OO
 * don't do messy things with threads ;)
