# ======== A Handy Little Jasmine Reference ========
# http://pivotal.github.io/jasmine/

# Test methods:
#   describe "name", ()->

describe "jQuery#react", ->

  beforeEach ->
    fixtures =
      """
      <div id="qunit-fixture">
        <div class="reactable">
          <div class="reactable-content">
            First reactable content.
          </div>
          Content for first reactable content.
        </div>
        <div class="reactable">
          <div class="reactable-content">
            Second reactable content.
          </div>
          Content for second reactable content.
        </div>
      </div>
      """
    $("body").append(fixtures)
    @elems = $('.reactable', $(fixtures))

  afterEach ->
    $("body").empty()

  it "should be chainable", ->
    expect(@elems.react()).toEqual @elems

  it "should be reactable", ->
    $('.reactable').react()
    expect($('.reactable').length).toBe $('.react').length

  it "should display .reactable-content", ->
    $('.reactable').react()
    reactEl = $('.reactable:first')
    reactEl.trigger('mouseover')
    expect($('.reactable-content', reactEl).is(':visible')).toBe true

  it "should hide .reactable-content", ->
    $('.reactable').react()
    reactEl = $('.reactable:first')
    reactEl.trigger('mouseover')
    reactEl.trigger('mouseout')
    expect($('.reactable-content', reactEl).is(':visible')).toBe false

describe "jQuery.react", ->
  it "should have default options", ->
    reacted = $.react()
    expect(reacted.fx_type).toBe 'default'
    expect(reacted.origin).toBe undefined
    expect(reacted.amination_speed_in).toBe 300
    expect(reacted.amination_speed_out).toBe 50

  it "should have options:origin overriden", ->
    reacted = $.react(fx_type: 'slide', origin: 'left')
    expect(reacted.fx_type).toBe 'slide'
    expect(reacted.origin).toBe 'left'

  it "should have options:fx_type overriden", ->
    reacted = $.react(fx_type: 'fade')
    expect(reacted.fx_type).toBe 'fade'
    expect(reacted.origin).toBe undefined

  it "should have options:amination_speed_in overriden", ->
    reacted = $.react(amination_speed_in: 500)
    expect(reacted.amination_speed_in).toBe 500

  it "should have options:amination_speed_out overriden", ->
    reacted = $.react(amination_speed_out: 100)
    expect(reacted.amination_speed_out).toBe 100
