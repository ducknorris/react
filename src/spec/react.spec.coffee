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

    @addMatchers toBeReactable: (el) ->
      return el.hasClass('react')

  afterEach ->
    $("body").empty()

  it "should be chainable", ->
    expect(@elems.react()).toEqual @elems

  # it "should be reactable", ->
  #   expect(@elems.react()).toBeReactable()

# describe "jQuery.react", ->

  # it "should be reactable", ->
    # expect($.react()).toBe "reactable."
    # expect($.react(fx_type: "slide")).toBe "slide"

describe ":react selector", ->

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

  it "should be reactable", ->
    expect(@elems.filter(":react").get()).toEqual @elems.get()
