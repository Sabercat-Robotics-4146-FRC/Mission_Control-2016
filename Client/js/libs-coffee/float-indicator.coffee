# Module for displaying binary indicators in mission control.
# For example, this could be used for displaying weather the camera is tracking an image.
# Written by GowanR

$ = require("jquery")
log = console.log

class Float
    constructor: ( @id, @key, @client ) ->
        @init_dom_element()
        @init_update_iteration( 500 )
    init_dom_element: () ->
        @element = document.createElement('div')
        $( @element ).attr( "id", @id ).appendTo('.floats').text( @id ).addClass( 'float-wrapper' )

    init_update_iteration: ( time ) ->
        element = $( @indicator )
        key = @key
        client = @client
        name = @id
        element = $( @element )
        window.setInterval( () ->
            # update values from redis
            # update DOM
            client.getAsync( key ).then( ( res ) ->
              element.text( name + ":  " + res )
            )
        , time )

exports.Float = Float
