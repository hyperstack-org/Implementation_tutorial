# Components built in the browser

This is the simplest example, Hyperstack Components are compiled in your browser using a compiled version of Opal.Compiler

Notice that the example Component is in a script block in the index.html file

```ruby
<script type="text/ruby">
  class TopLevelComponent
    include Hyperstack::Component
    render(DIV) do
      H1 { "Hello World from a Hyperstack Component" }
      BUTTON { 'Click me' }.on(:click) { alert 'hello' }
    end
  end
</script>
```

## Usage

+ Simply load `index.html` into your browser
+ Make changes to the `text/ruby` script block and refresh

### Advantages

+ Absolutely no server required

### Disadvantages

+ Code is compiled on load, so this would only work for a small application
+ `compiler.js` is the whole Opal Compiler, which is a large file
