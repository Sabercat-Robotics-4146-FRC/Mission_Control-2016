# Used for displaying floating point numbers to Mission Control dashboard.
# Written by GowanR

$ = require("jquery")
log = console.log

class Range
    constructor: ( @id, @key, @lower, @upper,@client ) ->
        @init_dom_element()
        @init_update_iteration( 500 )
    init_dom_element: () ->
        @element = document.createElement('div')
        $( @element ).attr( "id", @id ).appendTo('.range')
        @obj = radialIndicator('#' + @id, {
            barColor: '#87CEEB',
            barWidth: 10,
            minValue: @lower,
            maxValue: @upper,
            initValue: @lower,
            displayNumber: false
        })

    init_update_iteration: ( time ) ->
        element = $( @indicator )
        key = @key
        client = @client
        name = @id
        element = $( @element )
        obj = @obj
        window.setInterval( () ->
            # update values from redis
            # update DOM
            client.getAsync( key ).then( ( res ) ->
              obj.animate( parseInt(res) )
            )
        , time )

exports.Range = Range
