log = console.log
test_function = () ->
  log "Hello from chart-utils"
make_chart = ( ctx, label, unit, interval, n ) ->
  labels = new Array()
  for i in [0..n]
    labels.unshift( (i*interval) + unit.toString() )
  stats = {
    type: 'line',
    data: {
      labels: labels,
      datasets: [{
        label: label,
        data: [ 0, 0, 0, 0, 0, 0, ],
        backgroundColor: "rgba(153,255,51,0.4)"
      }]
    },
    options: {
          responsive: false
    }
  }
  `chart = new Chart( ctx, stats );`
  return chart
