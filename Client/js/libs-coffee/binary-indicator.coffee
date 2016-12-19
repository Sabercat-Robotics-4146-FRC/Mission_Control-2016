# Module for displaying binary indicators in mission control.
# For example, this could be used for displaying weather the camera is tracking an image.
# Written by GowanR

$ = require("jquery")
log = console.log

class Binary
    constructor: ( @id, @key, @client ) ->
        @init_dom_element()
        @init_update_iteration( 500 )
    init_dom_element: () ->
        @element = document.createElement('div')

        $( @element ).attr( "id", @id ).appendTo('.binary').text( @id )

        @indicator = document.createElement('div')

        $( @indicator ).attr("id", @id + "_ind" ).addClass( "false" ).appendTo( "##{@id}" )
    init_update_iteration: ( time ) ->
        element = $( @indicator )
        key = @key
        client = @client
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
