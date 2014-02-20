/* ===========================================================
# React - v0.1.0
# ==============================================================
# Copyright (c) 2014 Catalin Ilinca
# Licensed MIT.
*/
(function($) {
  var ReactableElement;
  ReactableElement = function(element, options) {
    var elem, obj;
    elem = $(element);
    obj = this;
    options = $.extend({
      fx_type: 'default'
    }, options);
    this.setupSizeAndPosition = function() {
      var reactableElem;
      reactableElem = $('.reactable-content', elem);
      elem.css({
        position: 'relative'
      });
      reactableElem.css({
        left: '100%',
        marginTop: '-' + elem.css('paddingTop'),
        marginLeft: '-' + reactableElem.outerWidth() + 'px',
        width: 'auto',
        height: elem.height(),
        overflow: 'hidden',
        whiteSpace: 'nowrap'
      });
    };
    this.reactWithShowHide = function() {
      elem.hover((function() {
        $('.reactable-content', elem).show();
      }), function() {
        $('.reactable-content', elem).hide();
      });
    };
    this.reactWithSlide = function() {
      elem.hover((function() {
        console.log('slide in');
      }), function() {
        console.log('slide out');
      });
    };
    obj.setupSizeAndPosition();
    if (options.fx_type === 'default') {
      obj.reactWithShowHide();
    } else if (options.fx_type === 'slide') {
      obj.reactWithSlide();
    }
    elem.addClass('react');
  };
  $.fn.react = function() {
    return this.each(function(i) {
      var element;
      element = $(this);
      return $('.reactable').each(function() {
        return new ReactableElement(this, $.react.options);
      });
    });
  };
  $.react = function(options) {
    options = $.extend({}, $.react.options, options);
    return options;
  };
  return $.react.options = {
    fx_type: 'default'
  };
})(jQuery);

$(function() {
  return $('.reactable').react();
});
