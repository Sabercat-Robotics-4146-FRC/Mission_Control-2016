let toml = require('toml');
let fs = require('fs');

fs.readFile('./traffic.toml', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  console.log("returning");
  return toml.parse( data );
});
