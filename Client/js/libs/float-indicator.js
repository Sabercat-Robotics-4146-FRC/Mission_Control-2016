// Generated by CoffeeScript 1.9.3
(function() {
  var $, Float, log;

  $ = require("jquery");

  log = console.log;

  Float = (function() {
    function Float(id, key1, client1) {
      this.id = id;
      this.key = key1;
      this.client = client1;
      this.init_dom_element();
      this.init_update_iteration(500);
    }

    Float.prototype.init_dom_element = function() {
      this.element = document.createElement('div');
      return $(this.element).attr("id", this.id).appendTo('.floats').text(this.id).addClass('float-wrapper');
    };

    Float.prototype.init_update_iteration = function(time) {
      var client, element, key, name;
      element = $(this.indicator);
      key = this.key;
      client = this.client;
      name = this.id;
      element = $(this.element);
      return window.setInterval(function() {
        return client.getAsync(key).then(function(res) {
          return element.text(name + ":  " + res);
        });
      }, time);
    };

    return Float;

  })();

  exports.Float = Float;

}).call(this);
