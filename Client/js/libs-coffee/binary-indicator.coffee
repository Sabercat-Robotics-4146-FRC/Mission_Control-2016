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

class Binary
  constructor: ( @id, @key ) ->
    @init_dom_element()
    @init_update_iteration( 500 )
  init_dom_element: () ->
    @element = $( ".binary" ).append().attr( "id", @id )
    @element.text( "\n" + @id )
    @indicator = @element.add()
    @indicator.attr("id", @id + "_ind" )
    @indicator.addClass( "false" )
  init_update_iteration: ( time ) ->
    element = @indicator
    key = @key
    window.setInterval( () ->
      # update values from redis
      # update DOM
      client.getAsync( key ).then( ( res ) ->
        if res == "true"
          element.removeClass( "false" ).addClass( "true" )
        else
          element.removeClass( "true" ).addClass( "false" )
      )

    , time )

exports.Binary = Binary
