/* ===========================================================
# React - v0.5.0
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
      fx_type: 'default',
      amination_speed_in: 300,
      amination_speed_out: 50
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
          reactableElem.stop(false, false);
          reactableElem.animate({
            marginLeft: '-' + reactableElem.outerWidth() + 'px'
          }, options.amination_speed_in);
        }, function() {
          reactableElem.stop(false, false);
          reactableElem.animate({
            marginLeft: 0
          }, options.amination_speed_out);
        });
      } else if (options.origin === 'left') {
        reactableElem.css({
          marginLeft: '-' + reactableElem.outerWidth() + 'px',
          left: 0,
          display: 'block'
        });
        elem.hover(function() {
          reactableElem.stop(false, false);
          reactableElem.animate({
            marginLeft: 0
          }, options.amination_speed_in);
        }, function() {
          reactableElem.stop(false, false);
          reactableElem.animate({
            marginLeft: '-' + reactableElem.outerWidth() + 'px'
          }, options.amination_speed_out);
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
    fx_type: 'default',
    amination_speed_in: 300,
    amination_speed_out: 50
  };
})(jQuery);
