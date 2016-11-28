console.log("Running npm redis tests...");

let redis = require( 'redis' );
let client = redis.createClient();

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
