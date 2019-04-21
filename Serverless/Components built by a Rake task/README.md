# Components built by a Rake task

In this example, the Components are pre-built by a rake task and the results loaded into the page as JS file

## Usage

### Build the Component

+ `rake build` will build the `hello_world.rb` Component

### Open the webpage

+ Open `index.html`in your browser
+ Any changes to `hello_world.rb` need `rake build` and a page refresh as there is no server.

## Advantages

+ This approach could be adapted for a large SPA application (using `require_tree` to build a folder of components)
+ The output files can be minimized and compressed
+ Errors can be reported during the build process

## Disadvantages

+ Constantly running `rake build` is a pain - the Components should be rebuilt on page refresh or HotLoaded - (see Example 3)
