#
# react
# https://github.com/ducknorris/react
#
# Copyright (c) 2014 Catalin Ilinca
# Licensed under the MIT license.
#

(($)->
  ReactableElement = (element, options) ->
    elem    = $(element)
    obj     = @
    options = $.extend
      fx_type: 'default'
    , options

    @setupSizeAndPosition = () ->
      reactableElem = $('.reactable-content', elem)
      elem.css
        position: 'relative'
        overflow: 'hidden'
      reactableElem.css
        left: '100%'
        marginTop: '-' + elem.css('paddingTop')
        marginLeft: '-' + reactableElem.outerWidth() + 'px'
        height: elem.height()
        overflow: 'hidden'
        whiteSpace: 'nowrap'
        display: 'none'
      return

    @reactWithShowHide = () ->
      elem.hover ->
        $('.reactable-content', elem).show()
        return
      , ->
        $('.reactable-content', elem).hide()
        return
      return

    @reactWithSlide = () ->
      reactableElem = $('.reactable-content', elem)
      if options.origin == 'right'
        reactableElem.css
          marginLeft: 0
          display: 'block'
        elem.hover ->
          reactableElem.stop false, false
          reactableElem.animate
            marginLeft: '-' + reactableElem.outerWidth() + 'px'
          , 300
          return
        , ->
          reactableElem.stop false, false
          reactableElem.animate
            marginLeft: 0
          , 50
          return
      else if options.origin == 'left'
        reactableElem.css
          marginLeft: '-' + reactableElem.outerWidth() + 'px'
          left: 0
          display: 'block'
        elem.hover ->
          reactableElem.stop false, false
          reactableElem.animate
            marginLeft: 0
          , 300
          return
        , ->
          reactableElem.stop false, false
          reactableElem.animate
            marginLeft: '-' + reactableElem.outerWidth() + 'px'
          , 50
          return
      return

    obj.setupSizeAndPosition()

    if options.fx_type == 'default'
      obj.reactWithShowHide()
    else if options.fx_type == 'slide'
      obj.reactWithSlide()

    # Mark element as "reactable done"
    elem.addClass('react')

    return

  # Collection method.
  $.fn.react = (options) ->
    return @.each (i) ->
      # Do something reactable to each selected element.
      new ReactableElement(@, $.react(options))

  # Static method.
  $.react = (options) ->
    # Override default options with passed-in options.
    options = $.extend({}, $.react.options, options)

    # Return options
    return options

  # Static method default options.
  $.react.options =
    fx_type: 'default'

)(jQuery)
