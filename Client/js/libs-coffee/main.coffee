# Main script that drives the Mission Control. Hopfully this will be nicly partitioned into seperate modules in the future.
# Written By GowanR

$ = require("jquery")
redis = require( 'redis' )
bluebird = require('bluebird')
bluebird.promisifyAll(redis.RedisClient.prototype)
bluebird.promisifyAll(redis.Multi.prototype)
Graph = (require './js/libs/graph.js').Graph
Binary = (require './js/libs/binary-indicator.js').Binary
toml = require('toml')
fs = require('fs')
log = console.log

init = ( config ) ->
  client = redis.createClient( db=config.redis.db, ip=config.redis.ip )
  graphs = []
  binaries = []
  log config.graph
  for k, v of config.graph
    graphs.push( new Graph( v[0], v[1], v[2], client ) )
  for k, v of config.binary
    binaries.push( new Binary( v[0], v[1], client ) )


fs.readFile('./traffic.toml', 'utf8', (err,data) ->
  if (err)
    return console.log(err)
  data = toml.parse( data )
  init( data )
)
