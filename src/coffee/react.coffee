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
    return @.each (i)->
      # Do something reactable to each selected element.
      $(@).addClass('react')

  # Static method.
  $.react = (options)->
    # Override default options with passed-in options.
    options = $.extend({}, $.react.options, options)
    # Return something reactable.
    return options

  # Static method default options.
  $.react.options =
    fx_type:   "slide"
    direction: "right"

  # Custom selector.
  $.expr[":"].react = (elem)->
    # Is this element reactable?
    return $(elem).hasClass('react')

)(jQuery)
