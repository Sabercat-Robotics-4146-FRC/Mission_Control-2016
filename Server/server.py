"""
This file is now used as a Robot facad - it
"""
import redis
import random
import time
rnd = random.random
def rand_range( l, u ):
    return (rnd()*(u-l)) + l
r = redis.StrictRedis(host='localhost', port=6379, db=0)
r.set( "test", "bar" )
print r.get("test")
while True:
    val = str( rand_range( 0, 13 ) )
    print "val: ", val
    r.set( "graph-test", val )
    time.sleep(1)
