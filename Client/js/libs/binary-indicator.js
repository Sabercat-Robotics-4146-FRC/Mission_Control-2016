// Generated by CoffeeScript 1.9.3
(function() {
  var $, Binary, bluebird, client, db, log, redis;

  $ = require("jquery");

  redis = require('redis');

  client = redis.createClient(db = "0");

  bluebird = require('bluebird');

  bluebird.promisifyAll(redis.RedisClient.prototype);

  bluebird.promisifyAll(redis.Multi.prototype);

  log = console.log;

  Binary = (function() {
    function Binary(id, key1) {
      this.id = id;
      this.key = key1;
      this.init_dom_element();
      this.init_update_iteration(500);
    }

    Binary.prototype.init_dom_element = function() {
      this.element = $(".binary").append().attr("id", this.id);
      this.element.text("\n" + this.id);
      this.indicator = this.element.add();
      this.indicator.attr("id", this.id + "_ind");
      return this.indicator.addClass("false");
    };

    Binary.prototype.init_update_iteration = function(time) {
      var element, key;
      element = this.indicator;
      key = this.key;
      return window.setInterval(function() {
        return client.getAsync(key).then(function(res) {
          if (res === "true") {
            return element.removeClass("false").addClass("true");
          } else {
            return element.removeClass("true").addClass("false");
          }
        });
      }, time);
    };

    return Binary;

  })();

  exports.Binary = Binary;

}).call(this);
