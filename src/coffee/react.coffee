#
# react
# https://github.com/ducknorris/react
#
# Copyright (c) 2014 Catalin Ilinca
# Licensed under the MIT license.
#

(($)->

  # Collection method.
  $.fn.react = ->
    return @.each (i) ->
      # Do something reactable to each selected element.
      context = $(@)
      $(@).hover (->
        $('.reactable-content', context).addClass('v')
        return
      ), ->
        $('.reactable-content', context).removeClass('v')
        return
      $(@).addClass('react')

  # Static method.
  $.react = (options) ->
    # Override default options with passed-in options.
    options = $.extend({}, $.react.options, options)
    # Return something reactable.
    return options

  # Static method default options.
  $.react.options =
    fx_type:   "slide"
    direction: "right"

)(jQuery)
