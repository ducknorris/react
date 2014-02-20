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
      reactableElem.css
        left: '100%'
        marginTop: '-' + elem.css('paddingTop')
        marginLeft: '-' + reactableElem.outerWidth() + 'px'
        width: 'auto'
        height: elem.height()
        overflow: 'hidden'
        whiteSpace: 'nowrap'
      return

    @reactWithShowHide = () ->
      elem.hover (->
        $('.reactable-content', elem).show()
        return
      ), ->
        $('.reactable-content', elem).hide()
        return
      return

    @reactWithSlide = () ->
      elem.hover (->
        console.log 'slide in'
        return
      ), ->
        console.log 'slide out'
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
  $.fn.react = ->
    return @.each (i) ->
      # Do something reactable to each selected element.
      element = $(@)
      $('.reactable').each ->
        new ReactableElement(@, $.react.options)

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

# Activate reac();
$ ->
  $('.reactable').react()
