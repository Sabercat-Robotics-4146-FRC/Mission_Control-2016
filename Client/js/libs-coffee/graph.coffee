# Provides an updating Chart.js interface
# Written by GowanR
$ = require("jquery")

redis = require( 'redis' )
client = redis.createClient(db="0")
bluebird = require('bluebird')
Chart = require('chart.js')
bluebird.promisifyAll(redis.RedisClient.prototype)
bluebird.promisifyAll(redis.Multi.prototype)

log = console.log

trim_push = ( array, value, size ) ->
  while ( array.length >= size )
    array.shift()
  array.push( value )

`
get_value = function( key ) {
  client.getAsync( key ).then(function(res) {
    console.log( "res: " + res  )
    return res;
  });
}
`
# get_value = ( key ) ->
#   client.getAsync( key ).then( ( res ) ->
#     return res
#   )

class Graph
  constructor: ( @id ) ->
    @init_dom_element()
    stats = {
      type: 'line',
      data: {
        labels: ['70ms', '60ms', '50ms', '40ms', '30ms', '20ms', '10ms'],
        datasets: [{
          label: 'apples',
          data: [12, 19, 3, 17, 6, 3, 7],
          backgroundColor: "rgba(153,255,51,0.4)"
        }, {
          label: 'oranges',
          data: [2, 29, 5, 5, 2, 3, 10],
          backgroundColor: "rgba(255,153,0,0.4)"
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
    $( @element ).attr( "id", @id ).attr( "width", "500px" ).attr( "height", "500px" ).appendTo('.contents')
    @ctx = @element.getContext('2d')

  init_update_iteration: ( time ) ->
    #data = @
    #log "DATA: " + data
    chart = @chart
    window.setInterval( () ->
      # update values from redis
      # update DOM
      log "NFN: " + get_value
      next = get_value( 'graph-test' )
      log "New Val: " + next


      client.getAsync( 'graph-test' ).then( (res) ->
        console.log( "res: " + res  )
        trim_push( chart.data.datasets[0].data, res, 7 )
        chart.update()
      )
      #get_value( )
    , time )
example = new Graph( "testgraphid", "Test" )
