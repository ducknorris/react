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
    @react = $('.reac', $(fixtures)).first()

  afterEach ->
    $("body").empty()

  it "should be chainable", ->
    expect(@elems.react()).toEqual @elems

  it "should be reactable", ->
    expect(@elems.react().hasClass('react')).toBeTrue

  it "should display .reactable-content", ->
    @react.trigger('mouseover')
    expect(@react.hasClass('v')).toBeTrue

describe "jQuery.react", ->

  it "should have default options", ->
    expect($.react().fx_type).toBe 'slide'
    expect($.react().direction).toBe 'right'

  it "should have options:direction overriden", ->
    expect($.react(fx_type: 'slide', direction: 'left').fx_type).toBe 'slide'
    expect($.react(fx_type: 'slide', direction: 'left').direction).toBe 'left'

  it "should have options:fx_type overriden", ->
    expect($.react(fx_type: 'fade').fx_type).toBe 'fade'
    expect($.react(fx_type: 'fade').direction).toBe 'right'
