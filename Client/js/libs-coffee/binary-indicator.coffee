# Module for displaying binary indicators in mission control.
# For example, this could be used for displaying weather the camera is tracking an image.
# Written by GowanR

$ = require("jquery")
redis = require( 'redis' )
client = redis.createClient(db="0")
bluebird = require('bluebird')
bluebird.promisifyAll(redis.RedisClient.prototype)
bluebird.promisifyAll(redis.Multi.prototype)
log = console.log

get_value = ( key ) ->
  client.getAsync( key ).then( ( res ) ->
    return res
  )
class Binary
  constructor: ( @id, @contents ) ->
    @init_dom_element()
    @init_update_iteration( 500 )
  init_dom_element: () ->
    @element = $( ".contents" ).append( "div" ).attr( "id", @id )
    @element.text( @contents )
  init_update_iteration: ( time ) ->
    window.setInterval( () ->
      # update values from redis
      # update DOM
      log get_value "test"
    , time )
example = new Binary( "testid", "Test" )
