"""
This file is now used as a Robot facad -- it pretends to be the robot.
"""
import redis
import random
import time
rnd = random.random
def rand_range( l, u ):
    return (rnd()*(u-l)) + l
r = redis.StrictRedis(host='localhost', port=6379, db=0)
r.set( "test", "bar" )
#print r.get("test")
shoot = False
while True:
    val = str( rand_range( 0, 30 ) )
    # print "val: ", val
    r.set( "graph-test", val )
    val = str( rand_range( 0, 100 ) )
    r.set( "voltage", val )

    if rand_range(0, 2) >= 1:
        r.set( "shoot", "true" )
    else:
        r.set( "shoot", "false" )
    time.sleep(1)
