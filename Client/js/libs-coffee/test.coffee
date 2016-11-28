# This is a Demonstration template for how to make a real-time robot analytics 'widget' if you will.
# Written by GowanR
$ = require("jquery")

log = console.log

class ExampleElement
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
example = new ExampleElement( "testid", "Test" )
