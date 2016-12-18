# Main script that drives the Mission Control. Hopfully this will be nicly partitioned into seperate modules in the future.
# Written By GowanR

$ = require("jquery")
Graph = (require './js/libs/graph.js').Graph
Binary = (require './js/libs/binary-indicator.js').Binary
log = console.log

example = new Graph( "testgraphid", "graph-test", "rgba(15, 86, 198, 0.4)" )
example2 = new Graph( "Voltage", "voltage", "rgba(232, 42, 32, 0.6)" )

bin_example = new Binary( "Ready_To_Shoot", "shoot")
