// Generated by CoffeeScript 1.9.3
(function() {
  var $, Binary, bluebird, client, db, example, get_value, log, redis;

  $ = require("jquery");

  redis = require('redis');

  client = redis.createClient(db = "0");

  bluebird = require('bluebird');

  bluebird.promisifyAll(redis.RedisClient.prototype);

  bluebird.promisifyAll(redis.Multi.prototype);

  log = console.log;

  get_value = function(key) {
    return client.getAsync(key).then(function(res) {
      return res;
    });
  };

  Binary = (function() {
    function Binary(id, contents) {
      this.id = id;
      this.contents = contents;
      this.init_dom_element();
      this.init_update_iteration(500);
    }

    Binary.prototype.init_dom_element = function() {
      this.element = $(".contents").append("div").attr("id", this.id);
      return this.element.text(this.contents);
    };

    Binary.prototype.init_update_iteration = function(time) {
      return window.setInterval(function() {
        return log(get_value("test"));
      }, time);
    };

    return Binary;

  })();

  example = new Binary("testid", "Test");

}).call(this);
