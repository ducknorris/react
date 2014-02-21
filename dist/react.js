/* ===========================================================
# React - v0.4.0
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
        position: 'relative',
        overflow: 'hidden'
      });
      reactableElem.css({
        left: '100%',
        marginTop: '-' + elem.css('paddingTop'),
        marginLeft: '-' + reactableElem.outerWidth() + 'px',
        height: elem.height(),
        overflow: 'hidden',
        whiteSpace: 'nowrap',
        display: 'none'
      });
    };
    this.reactWithShowHide = function() {
      elem.hover(function() {
        $('.reactable-content', elem).show();
      }, function() {
        $('.reactable-content', elem).hide();
      });
    };
    this.reactWithSlide = function() {
      var reactableElem;
      reactableElem = $('.reactable-content', elem);
      if (options.origin === 'right') {
        reactableElem.css({
          marginLeft: 0,
          display: 'block'
        });
        elem.hover(function() {
          reactableElem.animate({
            marginLeft: '-' + reactableElem.outerWidth() + 'px'
          }, 300);
        }, function() {
          reactableElem.animate({
            marginLeft: 0
          }, 50);
        });
      } else if (options.origin === 'left') {
        reactableElem.css({
          marginLeft: '-' + reactableElem.outerWidth() + 'px',
          left: 0,
          display: 'block'
        });
        elem.hover(function() {
          reactableElem.animate({
            marginLeft: 0
          }, 300);
        }, function() {
          reactableElem.animate({
            marginLeft: '-' + reactableElem.outerWidth() + 'px'
          }, 50);
        });
      }
    };
    obj.setupSizeAndPosition();
    if (options.fx_type === 'default') {
      obj.reactWithShowHide();
    } else if (options.fx_type === 'slide') {
      obj.reactWithSlide();
    }
    elem.addClass('react');
  };
  $.fn.react = function(options) {
    return this.each(function(i) {
      return new ReactableElement(this, $.react(options));
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
