/* ===========================================================
# React - v0.1.0
# ==============================================================
# Copyright (c) 2014 Catalin Ilinca
# Licensed MIT.
*/
(function($) {
  $.fn.react = function() {
    return this.each(function(i) {
      return $(this).addClass('react');
    });
  };
  $.react = function(options) {
    options = $.extend({}, $.react.options, options);
    return options;
  };
  $.react.options = {
    fx_type: "slide",
    direction: "right"
  };
  return $.expr[":"].react = function(elem) {
    return $(elem).hasClass('react');
  };
})(jQuery);
