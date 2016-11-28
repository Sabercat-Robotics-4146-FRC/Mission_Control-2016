let Chart = require('chart.js');

let ctx = document.getElementById('canvas').getContext('2d');
let test_chart = new Chart(ctx, {
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
});
let trim_push = function( array, value, size ) {
  while ( array.length >= size ) {
    array.shift();
  }
  array.push( value );
}
let interval = window.setInterval( function() {
  trim_push( test_chart.data.datasets[0].data, 10, 7 );
  //test_chart.data.datasets[0].data.push(10); // Would update the first dataset's value of 'March' to be 50
  test_chart.update();
  console.log("Hello World");
}, 2000);
