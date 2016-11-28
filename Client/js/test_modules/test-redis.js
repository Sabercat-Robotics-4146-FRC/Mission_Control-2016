console.log("Running npm redis tests...");

let redis = require( 'redis' );
let client = redis.createClient(db="0");
/*
client.set("foo", "bar", function () {
  client.get("foo", function(err, reply) {
    // reply is null when the key is missing
    if ( err == null ) {
      console.log("Redis works.");
    } else {
      console.log("error: " + err );
    }
  });
});
*/

client.get("test", function(err, reply) {
  // reply is null when the key is missing
  if ( err == null ) {
    console.log("Redis works.");
    console.log(reply);
  } else {
    console.log("error: " + err );
  }
});
