# Provides an updating Chart.js interface
# Written by GowanR
log = console.log

$ = require("jquery")
Chart = require('chart.js')

trim_push = ( array, value, size ) ->
    while ( array.length >= size )
        array.shift()
    array.push( value )

class Graph
    constructor: ( @id, @key, @color, @client ) ->
        @init_dom_element()
        stats = {
            type: 'line',
            data: {
                labels: ['3.5', '3.0', '2.5', '2.0', '1.5', '1.0', '0.5'],
                datasets: [{
                    label: @id,
                    data: [0, 0, 0, 0, 0, 0, 0],
                    backgroundColor: @color
                }]
            },
            options: {
                responsive: false
            }
        }
        `this.chart = new Chart( this.ctx, stats );`
        @chart_data = @chart.data.datasets[0].data
        @init_update_iteration( 500 )
    init_dom_element: () ->
        @element = document.createElement('canvas')
        $( @element ).attr( "id", @id ).attr( "width", "500px" ).attr( "height", "500px" ).appendTo('.graphs')
        @ctx = @element.getContext('2d')

    init_update_iteration: ( time ) ->
        chart = @chart
        key = @key
        client = @client
        window.setInterval( () ->
            client.getAsync( key ).then( (res) -> # update values from redis
                trim_push( chart.data.datasets[0].data, res, 7 )
                chart.update()# update DOM
            )
        , time )
exports.Graph = Graph
