# Module for displaying binary indicators in mission control.
# For example, this could be used for displaying weather the camera is tracking an image.
# Written by GowanR

$ = require("jquery")

log = console.log

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
      log "test"
    , time )
example = new Binary( "testid", "Test" )
