# Example 1: Components compiled by Rake task

This is the simplest example, the Components are built with a Rake task and loaded by a static HTML page

## Build the Component

+ `rake build` will build the `hello_world.rb` Component

## Open the webpage

+ Open `index.html` in your browser
+ Any changes to `hello_world.rb` need `rake build` and a page refresh as there is no server to rebuild for us.

## What's the stub?

+ Hyperstack requires `ReactRailsUJS` which is the JavaScript helpers to create a Component in react-rails. We do not need them as we are creating the Component when the document is loaded:

```ruby
Document.ready? do
  include Hyperstack::Component # for ReactAPI
  mount_point = Element['#top_level_component']
  ReactAPI.render(ReactAPI.create_element(TopLevelComponent, {}), mount_point)
end
```
