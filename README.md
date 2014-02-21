# React [![Build Status](https://travis-ci.org/ducknorris/react.png)](https://travis-ci.org/ducknorris/react)

[![Code Climate](https://codeclimate.com/github/ducknorris/react.png)](https://codeclimate.com/github/ducknorris/react)

jQuery plugin that will display custom HTML element on hover over an designated target.

## Getting Started
Download the [production version][min] or the [development version][max].

[min]: https://raw.github.com/ducknorris/react/master/dist/react.min.js
[max]: https://raw.github.com/ducknorris/react/master/dist/react.js

In your web page:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>jQuery.React Demo</title>
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="react.min.js"></script>
    <style type="text/css">
      body {
        font: 14px/20px Verdana, sans;
        padding: 0;
        margin: 0;
        background: #fbfff0;
      }

      a {
        color: #fff;
      }

      a:hover {
        text-decoration: none;
      }

      h4 {
        margin-left: 5px;
      }

      .wrapper {
        width: 600px;
        margin: 20px auto;
        padding: 20px;
        background: #f7ffe2;
        border: 3px double #a9b097;
      }

      .demo {
        width: 600px;
        padding: 1px;
        background: #fec7b1;
      }

      .demo.div .reactable {
        width: 588px;
        margin: 1px;
        padding: 5px;
        background: #f6ffbe;
      }

      .demo.div .reactable .reactable-content {
        position: absolute;
        z-index: 1;
        padding: 5px;
        background: #333;
        color: #f6ffbe;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <h1>jQuery.React Demo</h1>
      <p>React can work with any HTML tag that is displayed as "block".</p>
      <h3>DIV example:</h3>
      <div class="demo div">
        <h4>Default FX</h4>
        <div class="reactable default">
          <div class="reactable-content">
            <button>A Button</button>
            <button>A Button</button>
            <button>A Button</button>
          </div>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.
        </div>
        <div class="reactable default">
          <div class="reactable-content">Reactable content.</div>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.
        </div>
        <h4>Slide FX</h4>
        <div class="reactable slide">
          <div class="reactable-content">
            <a href="#">A Link</a> |
            <a href="#">A Link</a> |
            <a href="#">A Link</a>
          </div>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.
        </div>
        <div class="reactable slide">
          <div class="reactable-content">
            <button>A Button</button>
            <button>A Button</button>
            <button>A Button</button>
          </div>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.
        </div>
      </div>
    </div>
    <script type="text/javascript">
      $(function() {
        $('.reactable.default').react();
        $('.reactable.slide').react({
          fx_type: 'slide',
          origin:  'right'
        });
      });
    </script>
  </body>
</html>
```

[See demo at this link](http://ducknorris.github.io/react/)

## Contributing

Thanks to our [contributors](https://github.com/ducknorris/react/graphs/contributors).

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Release History

* 0.5.0 - February 21, 2014

* 0.4.1 - February 21, 2014

* 0.4.0 - February 21, 2014

* 0.3.0 - February 21, 2014

* 0.2.0 - February 21, 2014

* 0.1.1 - February 20, 2014

* 0.1.0 - February 20, 2014
