# Static page example

Two approaches here:

## Build the compiler then have the component code on the page
+ `rake build_compiler` will build `compiler.js`
+ Component in index.html (nothing renders)

## Build the Component and render `Document.ready?`

+ `rake build_hello_worldhello` will build a component
+ errors

Neither approach is working!
