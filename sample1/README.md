# Hyperstack via Rake task

This is the simplest sample, the Components are built with a simple Rake task and loaded by a staic HTML page

## Build the Component and render `Document.ready?`

+ `rake build` will build the `hello_world.rb` component
+ Open `index.html`in your browser
+ Any changes to `hello_world.rb` need `rake build` again as there is no server
