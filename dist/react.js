/* ===========================================================
# React - v0.1.0
# ==============================================================
# Copyright (c) 2014 Catalin Ilinca
# Licensed MIT.
*/
(function($) {
  $.fn.react = function() {
    return this.each(function(i) {
      var context;
      context = $(this);
      $(this).hover((function() {
        $('.reactable-content', context).addClass('v');
      }), function() {
        $('.reactable-content', context).removeClass('v');
      });
      return $(this).addClass('react');
    });
  };
  $.react = function(options) {
    options = $.extend({}, $.react.options, options);
    return options;
  };
  return $.react.options = {
    fx_type: "slide",
    direction: "right"
  };
})(jQuery);
